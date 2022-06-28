/**
 * @file mm.c
 * @brief A 64-bit struct-based implicit free list memory allocator
 *
 * 15-213: Introduction to Computer Systems
 *
 * TODO: insert your documentation here. :)
 *
 *************************************************************************
 *
 * ADVICE FOR STUDENTS.
 * - Step 0: Please read the writeup!
 * - Step 1: Write your heap checker.
 * - Step 2: Write contracts / debugging assert statements.
 * - Good luck, and have fun!
 *
 *************************************************************************
 *
 * @author Peizhao Li <peizhaol@andrew.cmu.edu>
 */

#include <assert.h>
#include <inttypes.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "memlib.h"
#include "mm.h"

/* Do not change the following! */

#ifdef DRIVER
/* create aliases for driver tests */
#define malloc mm_malloc
#define free mm_free
#define realloc mm_realloc
#define calloc mm_calloc
#define memset mem_memset
#define memcpy mem_memcpy
#endif /* def DRIVER */

/* You can change anything from here onward */

/*
 *****************************************************************************
 * If DEBUG is defined (such as when running mdriver-dbg), these macros      *
 * are enabled. You can use them to print debugging output and to check      *
 * contracts only in debug mode.                                             *
 *                                                                           *
 * Only debugging macros with names beginning "dbg_" are allowed.            *
 * You may not define any other macros having arguments.                     *
 *****************************************************************************
 */
#ifdef DEBUG
/* When DEBUG is defined, these form aliases to useful functions */
#define dbg_printf(...) printf(__VA_ARGS__)
#define dbg_requires(expr) assert(expr)
#define dbg_assert(expr) assert(expr)
#define dbg_ensures(expr) assert(expr)
#define dbg_printheap(...) print_heap(__VA_ARGS__)
#else
/* When DEBUG is not defined, no code gets generated for these */
/* The sizeof() hack is used to avoid "unused variable" warnings */
#define dbg_printf(...) (sizeof(__VA_ARGS__), -1)
#define dbg_requires(expr) (sizeof(expr), 1)
#define dbg_assert(expr) (sizeof(expr), 1)
#define dbg_ensures(expr) (sizeof(expr), 1)
#define dbg_printheap(...) ((void)sizeof(__VA_ARGS__))
#endif

/* Basic constants */

typedef uint64_t word_t;

/** @brief Word and header size (bytes) */
static const size_t wsize = sizeof(word_t);

/** @brief Double word size (bytes) */
static const size_t dsize = 2 * wsize;

/** @brief Minimum block size (bytes) */
static const size_t min_block_size = dsize;

/**
 * TODO: explain what chunksize is
 * (Must be divisible by dsize)
 */
static const size_t chunksize = (1 << 12);

/**
 * TODO: explain what alloc_mask is
 */
static const word_t alloc_mask = 0x1;

/**
 * Store allocation status of previous block in the second to last bit.
 * Free blocks still need footer because if no footer, when it comes to
 * coalesce, current block cannot know the allocation status of previous block
 * (and starter of the big new block)
 */
static const word_t alloc_mask_prev = 0x2;

/**
 * Store is-a-mini status of previous block in the third to last bit.
 */
static const word_t mask_mini = 0x4;

/**
 * TODO: explain what size_mask is
 */
static const word_t size_mask = ~(word_t)0xF;

/** @brief Represents the header and payload of one block in the heap */
typedef struct block {
    /** @brief Header contains size + allocation flag */
    word_t header;

    /**
     * @brief A pointer to the block payload.
     *
     * WARNING: A zero-length array must be the last element in a struct, so
     * there should not be any struct fields after it. For this lab, we will
     * allow you to include a zero-length array in a union, as long as the
     * union is the last field in its containing struct. However, this is
     * compiler-specific behavior and should be avoided in general.
     *
     * WARNING: DO NOT cast this pointer to/from other types! Instead, you
     * should use a union to alias this zero-length array with another struct,
     * in order to store additional types of data in the payload memory.
     */

    union {
        struct {
            struct block *next;
            struct block *prev;
        };
        char payload[0];
    };

} block_t;

/* Global variables */

/** @brief Pointer to first block in the heap */
static block_t *heap_start = NULL;

/** @brief Number of free lists classes */
static const int NUMCLASS = 10;

/** @brief Pointers to first free block in the free lists */
static block_t *head[NUMCLASS];

/** @brief Pointer to last free block in the mini block free list */
static block_t *tail;

/*
 *****************************************************************************
 * The functions below are short wrapper functions to perform                *
 * bit manipulation, pointer arithmetic, and other helper operations.        *
 *                                                                           *
 * We've given you the function header comments for the functions below      *
 * to help you understand how this baseline code works.                      *
 *                                                                           *
 * Note that these function header comments are short since the functions    *
 * they are describing are short as well; you will need to provide           *
 * adequate details for the functions that you write yourself!               *
 *****************************************************************************
 */

/*
 * ---------------------------------------------------------------------------
 *                        BEGIN SHORT HELPER FUNCTIONS
 * ---------------------------------------------------------------------------
 */

/**
 * @brief Returns the maximum of two integers.
 * @param[in] x
 * @param[in] y
 * @return `x` if `x > y`, and `y` otherwise.
 */
static size_t max(size_t x, size_t y) {
    return (x > y) ? x : y;
}

/**
 * @brief Rounds `size` up to next multiple of n
 * @param[in] size
 * @param[in] n
 * @return The size after rounding up
 */
static size_t round_up(size_t size, size_t n) {
    size_t tmp = n * ((size + (n - 1)) / n);
    // if (tmp < min_block_size) {
    //     return min_block_size;
    // }
    return tmp;
}

/**
 * @brief Packs the `size` and `alloc` of a block into a word suitable for
 *        use as a packed value.
 *
 * Packed values are used for both headers and footers.
 *
 * The allocation status is packed into the lowest bit of the word.
 *
 * @param[in] size The size of the block being represented
 * @param[in] alloc True if the block is allocated
 * @return The packed value
 */
static word_t pack(size_t size, bool alloc, bool prevAlloc) {
    word_t word = size;
    if (alloc) {
        word |= alloc_mask;
    }
    if (prevAlloc) {
        word |= alloc_mask_prev;
    }
    return word;
}

/**
 * @brief Extracts the size represented in a packed word.
 *
 * This function simply clears the lowest 4 bits of the word, as the heap
 * is 16-byte aligned.
 *
 * @param[in] word
 * @return The size of the block represented by the word
 */
static size_t extract_size(word_t word) {
    return (word & size_mask);
}

/**
 * @brief Extracts the size of a block from its header.
 * @param[in] block
 * @return The size of the block
 */
static size_t get_size(block_t *block) {
    return extract_size(block->header);
}

/**
 * @brief Given a payload pointer, returns a pointer to the corresponding
 *        block.
 * @param[in] bp A pointer to a block's payload
 * @return The corresponding block
 */
static block_t *payload_to_header(void *bp) {
    return (block_t *)((char *)bp - offsetof(block_t, payload));
}

/**
 * @brief Given a block pointer, returns a pointer to the corresponding
 *        payload.
 * @param[in] block
 * @return A pointer to the block's payload
 * @pre The block must be a valid block, not a boundary tag.
 */
static void *header_to_payload(block_t *block) {
    dbg_requires(get_size(block) != 0);
    return (void *)(block->payload);
}

/**
 * @brief Given a block pointer, returns a pointer to the corresponding
 *        footer.
 * @param[in] block
 * @return A pointer to the block's footer
 * @pre The block must be a valid block, not a boundary tag.
 */
static word_t *header_to_footer(block_t *block) {
    dbg_requires(get_size(block) != 0 &&
                 "Called header_to_footer on the epilogue block");
    return (word_t *)(block->payload + get_size(block) - dsize);
}

/**
 * @brief Given a block footer, returns a pointer to the corresponding
 *        header.
 * @param[in] footer A pointer to the block's footer
 * @return A pointer to the start of the block
 * @pre The footer must be the footer of a valid block, not a boundary tag.
 */
static block_t *footer_to_header(word_t *footer) {
    size_t size = extract_size(*footer);
    dbg_assert(size != 0 && "Called footer_to_header on the prologue block");
    return (block_t *)((char *)footer + wsize - size);
}

/**
 * @brief Returns the payload size of a given block.
 *
 * The payload size is equal to the entire block size minus the sizes of the
 * block's header and footer.
 *
 * @param[in] block
 * @return The size of the block's payload
 */
static size_t get_payload_size(block_t *block) {
    size_t asize = get_size(block);
    return asize - wsize;
}

/**
 * @brief Returns the allocation status of a given header value.
 *
 * This is based on the lowest bit of the header value.
 *
 * @param[in] word
 * @return The allocation status correpsonding to the word
 */
static bool extract_alloc(word_t word) {
    return (bool)(word & alloc_mask);
}

/**
 * @brief Returns the allocation status of a block, based on its header.
 * @param[in] block
 * @return The allocation status of the block
 */
static bool get_alloc(block_t *block) {
    return extract_alloc(block->header);
}

/**
 * @brief Returns the allocation status of previous block, based on its header.
 * @param[in] block
 * @return The allocation status of the block
 */
static bool getPrevAlloc(block_t *block) {
    word_t word = block->header;
    return (bool)(word & alloc_mask_prev);
}

/**
 * @brief Returns the is-a-mini status of previous block, based on its header.
 * @param[in] block
 * @return The allocation status of the block
 */
static bool getPrevMiniStatus(block_t *block) {
    word_t word = block->header;
    return (bool)(word & mask_mini);
}

/**
 * @brief Writes an epilogue header at the given address.
 *
 * The epilogue header has size 0, and is marked as allocated.
 *
 * @param[out] block The location to write the epilogue header
 */
static void write_epilogue(block_t *block) {
    dbg_requires(block != NULL);
    dbg_requires((char *)block == mem_heap_hi() - 7);

    // the new epilogue should have prevAlloc as free
    block->header = pack(0, true, false);
}

/**
 * @brief Writes a block starting at the given address.
 *
 * This function writes both a header and footer, where the location of the
 * footer is computed in relation to the header.
 *
 * TODO: Are there any preconditions or postconditions?
 *
 * @param[out] block The location to begin writing the block header
 * @param[in] size The size of the new block
 * @param[in] alloc The allocation status of the new block
 */
static void write_block(block_t *block, size_t size, bool alloc, bool prevAlloc,
                        bool prevMini) {
    dbg_requires(block != NULL);
    // dbg_requires(size > 0);
    block->header = pack(size, alloc, prevAlloc);
    if (prevMini) {
        block->header |= mask_mini;
    } else {
        block->header &= (~mask_mini);
    }
    if ((!alloc) && (size != min_block_size)) {
        word_t *footerp = header_to_footer(block);
        *footerp = pack(size, alloc, prevAlloc);
    }
}

/**
 * @brief Finds the next consecutive block on the heap.
 *
 * This function accesses the next block in the "implicit list" of the heap
 * by adding the size of the block.
 *
 * @param[in] block A block in the heap
 * @return The next consecutive block on the heap
 * @pre The block is not the epilogue
 */
static block_t *find_next(block_t *block) {
    dbg_requires(block != NULL);
    dbg_requires(get_size(block) != 0 &&
                 "Called find_next on the last block in the heap");
    return (block_t *)((char *)block + get_size(block));
}

/**
 * @brief Finds the footer of the previous block on the heap.
 * @param[in] block A block in the heap
 * @return The location of the previous block's footer
 */
static word_t *find_prev_footer(block_t *block) {
    // Compute previous footer position as one word before the header
    return &(block->header) - 1;
}

/**
 * @brief Finds the previous consecutive block on the heap.
 *
 * This is the previous block in the "implicit list" of the heap.
 *
 * If the function is called on the first block in the heap, NULL will be
 * returned, since the first block in the heap has no previous block!
 *
 * The position of the previous block is found by reading the previous
 * block's footer to determine its size, then calculating the start of the
 * previous block based on its size.
 *
 * @param[in] block A block in the heap
 * @return The previous consecutive block in the heap.
 */
static block_t *find_prev(block_t *block) {
    dbg_requires(block != NULL);
    word_t *footerp = find_prev_footer(block);

    // Return NULL if called on first block in the heap
    if (extract_size(*footerp) == 0) {
        return NULL;
    }

    return footer_to_header(footerp);
}

/*
 * ---------------------------------------------------------------------------
 *                        END SHORT HELPER FUNCTIONS
 * ---------------------------------------------------------------------------
 */

/******** The remaining content below are helper and debug routines ********/
void printHeap(int __line__);

/**
 * @brief find a head corresponding to the asize.
 * @param[in] asize
 * @return
 */
static size_t getHead(size_t asize) {
    size_t i;
    if (asize < 32) {
        i = 0;
    } else if (asize <= 64) {
        i = 1;
    } else if (asize <= 128) {
        i = 2;
    } else if (asize <= 256) {
        i = 3;
    } else if (asize <= 512) {
        i = 4;
    } else if (asize <= 1024) {
        i = 5;
    } else if (asize <= 2048) {
        i = 6;
    } else if (asize <= 4096) {
        i = 7;
    } else if (asize <= 8192) {
        i = 8;
    } else {
        i = 9;
    }
    return i;
}

/**
 * @brief remove designated free block from free list
 * @param[in] block
 * @return
 */
static void removeFree(block_t *block) {
    size_t i = getHead(get_size(block));
    // mini block
    if (i == 0) {
        // when there is only one block in the mini free list
        if (block->next == block && block == tail && block == head[i]) {
            head[i] = NULL;
            tail = NULL;
            block->next = NULL;
            return;
        }
        if (block == head[i]) {
            head[i] = head[i]->next;
            // no need to consider block is head and tail, above case has
            // covered it
            tail->next = head[i];
            block->next = NULL;
            return;
        }
        if (block == tail) {
            block_t *cur = head[i];
            while (cur->next != tail) {
                cur = cur->next;
            }
            tail = cur;
            tail->next = head[i];
            return;
        }
        block_t *cur = head[i];
        while (cur->next != block) {
            cur = cur->next;
        }
        cur->next = block->next;
        block->next = NULL;
        return;
    }

    // if there is only 1 free block in the list.
    if (block->next == block->prev && block->next == block &&
        block->prev == block) {
        head[i] = NULL;
        block->next = NULL;
        block->prev = NULL;
        return;
    }

    // if block == root
    if (block == head[i]) {
        head[i] = head[i]->next;
        head[i]->prev = block->prev;
        block->prev->next = head[i];
        block->next = NULL;
        block->prev = NULL;
        return;
    }

    // normal cases
    block->prev->next = block->next;
    block->next->prev = block->prev;
    block->next = NULL;
    block->prev = NULL;
}

/**
 * @brief add designated free block to the first place in free list.
 * @param[in] block
 * @return
 */
static void addFree(block_t *block) {
    dbg_requires(block != NULL);
    size_t i = getHead(get_size(block));

    // mini block
    if (i == 0) {
        if (head[i] != NULL) {
            if (block != NULL) {
                block->next = head[i];
                // FIFO
                tail->next = block;
                tail = block;
                return;
            }
        } else {
            head[i] = block;
            block->next = block;
            tail = block;
            return;
        }
    }

    if (head[i] != NULL) {
        if (block != NULL) {
            block->next = head[i];
            block->prev = head[i]->prev;
            head[i]->prev = block;
            if (block->prev != NULL) {
                block->prev->next = block;
            } else {
                printf("NullPointerException at addFree function, block->prev "
                       "is NULL");
                return;
            }
        } else {
            printf("NullPointerException at addFree function, block is NULL");
            return;
        }

    } else {
        head[i] = block;
        head[i]->next = block;
        head[i]->prev = block;
    }
}

/**
 * @brief find first fit block in the free list.
 * @param[in] asize
 * @return
 */
static block_t *find_first_free(size_t asize) {
    for (size_t i = getHead(asize); i < NUMCLASS; i++) {

        if (head[i] == NULL) {
            continue;
        }

        block_t *block = head[i];
        do {
            if (!(get_alloc(block)) && (asize <= get_size(block))) {
                return block;
            }
            block = block->next;
        } while (block != head[i]);
    }

    return NULL; // no fit found
}

/**
 * @brief
 *
 * <What does this function do?>
 * <What are the function's arguments?>
 * <What is the function's return value?>
 * <Are there any preconditions or postconditions?>
 *
 * @param[in] block
 * @return
 */
static block_t *coalesce_block(block_t *block) {

    block_t *prevBlock = NULL;
    block_t *nextBlock = find_next(block);
    size_t newSize = 0;
    bool prevAlloc = getPrevAlloc(block);
    bool nextAlloc = true;

    dbg_requires((!get_alloc(block)));

    if (!prevAlloc) {
        if (getPrevMiniStatus(block)) {
            prevBlock = (block_t *)((char *)block - dsize);
        } else {
            prevBlock = find_prev(block);
        }
    }

    if (nextBlock != NULL) {
        nextAlloc = get_alloc(nextBlock);
    }

    // case 1, next and previous are allocated
    if (prevAlloc && nextAlloc) {
        newSize = get_size(block);
        write_block(block, newSize, false, true, getPrevMiniStatus(block));
        addFree(block);

        // nextBlock should mark the block as free
        if (get_size(block) == min_block_size) {
            write_block(nextBlock, get_size(nextBlock), true, false, true);
        } else {
            write_block(nextBlock, get_size(nextBlock), true, false, false);
        }
        return block;
    }

    // case 2, next is free, prev is alloc
    else if (prevAlloc && (!nextAlloc)) {
        removeFree(nextBlock);
        newSize = get_size(block) + get_size(nextBlock);
        write_block(block, newSize, false, true, getPrevMiniStatus(block));
        // pack the true next block's mini bit as false
        block_t *true_next_block = find_next(block);
        write_block(true_next_block, get_size(true_next_block), true, false,
                    false);
        addFree(block);

        return block;
    }

    // case 3, next is alloc, prev is free
    else if ((!prevAlloc) && nextAlloc) {
        removeFree(prevBlock);
        newSize = get_size(block) + get_size(prevBlock);
        // the prev of prevBlock is allocated
        write_block(prevBlock, newSize, false, true,
                    getPrevMiniStatus(prevBlock));

        // mark the prev of nextBlock as free
        // mark the next block mini bit as false
        write_block(nextBlock, get_size(nextBlock), true, false, false);

        addFree(prevBlock);

        return prevBlock;
    }

    // case 4, both are free
    else {
        removeFree(prevBlock);
        removeFree(nextBlock);
        newSize = get_size(block) + get_size(prevBlock) + get_size(nextBlock);

        write_block(prevBlock, newSize, false, true,
                    getPrevMiniStatus(prevBlock));
        block_t *true_next_block = find_next(prevBlock);
        write_block(true_next_block, get_size(true_next_block), true, false,
                    false);
        addFree(prevBlock);

        return prevBlock;
    }
}

/**
 * @brief
 *
 * <What does this function do?>
 * <What are the function's arguments?>
 * <What is the function's return value?>
 * <Are there any preconditions or postconditions?>
 *
 * @param[in] size
 * @return
 */
static block_t *extend_heap(size_t size) {
    void *bp;

    // Allocate an even number of words to maintain alignment
    size = round_up(size, dsize);
    if ((bp = mem_sbrk(size)) == (void *)-1) {
        return NULL;
    }

    // Initialize free block header/footer
    block_t *block = payload_to_header(bp);

    // when extending heap, keep the prevAlloc bit.
    write_block(block, size, false, getPrevAlloc(block),
                getPrevMiniStatus(block));

    // Create new epilogue header
    block_t *block_next = find_next(block);
    write_epilogue(block_next);

    // Coalesce in case the previous block was free
    block = coalesce_block(block);

    return block;
}

/**
 * @brief
 *
 * <What does this function do?>
 * <What are the function's arguments?>
 * <What is the function's return value?>
 * <Are there any preconditions or postconditions?>
 *
 * @param[in] block
 * @param[in] asize
 */
static void split_block(block_t *block, size_t asize) {
    dbg_requires(get_alloc(block));

    size_t block_size = get_size(block);

    if ((block_size - asize) >= min_block_size) {
        block_t *block_next;
        dbg_assert(getPrevAlloc(block) == true);
        // when splitting, the first allocated block should remain its prevMini
        // status
        write_block(block, asize, true, true, getPrevMiniStatus(block));
        block_next = find_next(block);

        // if the first allocated block is mini, next_block should indicate
        if (asize == min_block_size) {
            write_block(block_next, block_size - asize, false, true, true);
        } else {
            write_block(block_next, block_size - asize, false, true, false);
        }

        // if the second block is a mini, then the next block of second free
        // block should indicate
        if (block_size - asize == min_block_size) {
            block_t *next_next_block = find_next(block_next);
            write_block(next_next_block, get_size(next_next_block),
                        get_alloc(next_next_block), false, true);
        }

        addFree(block_next);
    } else {
        block_t *block_next = find_next(block);
        if (block_size == min_block_size) {
            write_block(block_next, get_size(block_next), true, true, true);
        } else {
            write_block(block_next, get_size(block_next), true, true, false);
        }
    }
    dbg_ensures(get_alloc(block));
}

/**
 * @brief
 *
 * find first suitable block
 *
 * @param[in] asize
 * @return
 */
static block_t *find_fit(size_t asize) {
    block_t *block;

    for (block = heap_start; get_size(block) > 0; block = find_next(block)) {

        if (!(get_alloc(block)) && (asize <= get_size(block))) {
            return block;
        }
    }
    return NULL; // no fit found
}

/**
 * @brief
 *
 * Print out current blocks of the heap
 *
 * @param[in] asize
 * @return
 */
void printHeap(int __line__) {
    printf("line num: %d current heap: \n", __line__);
    for (block_t *block = heap_start; get_size(block) > 0;
         block = find_next(block)) {
        printf("block is: %p size is: %lu curAlloc: %d prevAlloc: %d, "
               "prevMini: %d \n",
               block, extract_size(block->header), get_alloc(block),
               getPrevAlloc(block), getPrevMiniStatus(block));
    }
}

/**
 * @brief
 *
 * check the heap
 * @param[in] line
 * @return
 */
bool mm_checkheap(int line) {

    // // Check each block specific features.
    size_t count = 0;

    for (block_t *block = heap_start; get_size(block) > 0;
         block = find_next(block)) {

        // check prologue and epilogue
        if (get_size(mem_heap_hi() - 7) != 0 &&
            get_alloc(mem_heap_hi() - 7) != true &&
            get_size(mem_heap_lo()) != 0 && get_alloc(mem_heap_lo()) != true) {
            return false;
        }

        // address alignment
        if ((size_t)header_to_payload(block) % dsize != 0) {
            return false;
        }

        // Check heap boundaries
        if (block < (block_t *)mem_heap_lo() &&
            block > (block_t *)mem_heap_hi()) {
            return false;
        }

        // Check consecutive free blocks
        block_t *prevBlock = find_prev(block);
        block_t *nextBlock = find_next(block);

        // check header and footer consistency
        if (extract_size(block->header) !=
            extract_size(*header_to_footer(block))) {
            return false;
        }

        if (extract_alloc(block->header) !=
            extract_alloc(*header_to_footer(block))) {
            return false;
        }

        // no consecutive free blocks1
        if (prevBlock) {
            if (get_alloc(prevBlock) == 0 && get_alloc(block) == 0) {
                return false;
            }
        }

        // // no consecutive free blocks2
        if (nextBlock) {
            if (get_alloc(nextBlock) == 0 && get_alloc(block) == 0) {
                return false;
            }
        }

        // block size check
        if (get_size(block) < min_block_size) {
            return false;
        }

        // count free block numbers
        if (!get_alloc(block)) {
            count += 1;
        }
    }

    // Seglist checker
    for (int i = 0; i < NUMCLASS; i++) {
        if (head[i] == NULL) {
            continue;
        }
        block_t *block = head[i];

        // current class size
        size_t curSize = (size_t)1 << (i + 6);
        do {

            // Check all next/prev pointers
            if (block->prev) {
                if (block->prev->next != block) {
                    return false;
                }
            }

            if (block->next) {
                if (block->next->prev != block) {
                    return false;
                }
            }

            // All free list pointers are between mem heap lo() and mem heap
            // high()
            if (block < (block_t *)mem_heap_lo() &&
                block > (block_t *)mem_heap_hi()) {
                return false;
            }

            // Count free blocks by iterating
            if (!get_alloc(block)) {
                count -= 1;
            }

            // All blocks in each list bucket fall within bucket size range
            if (get_size(block) > curSize && curSize != ((size_t)1 << 14)) {
                dbg_printf("get_size is: %lu, curSize is: %lu \n",
                           get_size(block), curSize);
                return false;
            }

            block = block->next;
        } while (block != head[i]);
    }

    if (count != 0) {
        return false;
    }

    return true;
}

/**
 * @brief
 *
 * <What does this function do?>
 * <What are the function's arguments?>
 * <What is the function's return value?>
 * <Are there any preconditions or postconditions?>
 *
 * @return
 */
bool mm_init(void) {
    // Create the initial empty heap
    word_t *start = (word_t *)(mem_sbrk(2 * wsize));
    for (int i = 0; i < NUMCLASS; i++) {
        head[i] = NULL;
    }
    tail = NULL;
    if (start == (void *)-1) {
        return false;
    }

    start[0] = pack(0, true, true); // Heap prologue (block footer)
    start[1] = pack(0, true, true); // Heap epilogue (block header)

    // Heap starts with first "block header", currently the epilogue
    heap_start = (block_t *)&(start[1]);

    // Extend the empty heap with a free block of chunksize bytes
    if (extend_heap(chunksize) == NULL) {
        return false;
    }

    // add the first free block to freelist?
    // addFree(heap_start);

    return true;
}

/**
 * @brief
 *
 * @param[in] size
 * @return
 */
void *malloc(size_t size) {
    dbg_requires(mm_checkheap(__LINE__));

    size_t asize;      // Adjusted block size
    size_t extendsize; // Amount to extend heap if no fit is found
    block_t *block;
    void *bp = NULL;

    // Initialize heap if it isn't initialized
    if (heap_start == NULL) {
        mm_init();
    }

    // Ignore spurious request
    if (size == 0) {
        dbg_ensures(mm_checkheap(__LINE__));
        return bp;
    }

    // Adjust block size to include overhead and to meet alignment requirements
    asize = round_up(size + wsize, dsize);

    // Search the free list for a fit
    // block = find_fit(asize);
    block = find_first_free(asize);

    // If no fit is found, request more memory, and then and place the block
    if (block == NULL) {
        // Always request at least chunksize
        extendsize = max(asize, chunksize);
        block = extend_heap(extendsize);
        // extend_heap returns an error
        if (block == NULL) {
            return bp;
        }
    }

    // The block should be marked as free
    dbg_assert(!get_alloc(block));

    // remove from current free list
    removeFree(block);

    // Mark block as allocated
    size_t block_size = get_size(block);
    write_block(block, block_size, true, true, getPrevMiniStatus(block));

    // Try to split the block if too large
    split_block(block, asize);

    bp = header_to_payload(block);

    dbg_ensures(mm_checkheap(__LINE__));
    return bp;
}

/**
 * @brief
 *
 * <What does this function do?>
 * <What are the function's arguments?>
 * <What is the function's return value?>
 * <Are there any preconditions or postconditions?>
 *
 * @param[in] bp
 */
void free(void *bp) {

    if (bp == NULL) {
        return;
    }

    block_t *block = payload_to_header(bp);
    size_t size = get_size(block);

    // The block should be marked as allocated
    dbg_assert(get_alloc(block));

    // Mark the block as free
    write_block(block, size, false, getPrevAlloc(block),
                getPrevMiniStatus(block));

    // Try to coalesce the block with its neighbors
    block = coalesce_block(block);

    dbg_ensures(mm_checkheap(__LINE__));
}

/**
 * @brief
 *
 * <What does this function do?>
 * <What are the function's arguments?>
 * <What is the function's return value?>
 * <Are there any preconditions or postconditions?>
 *
 * @param[in] ptr
 * @param[in] size
 * @return
 */
void *realloc(void *ptr, size_t size) {
    block_t *block = payload_to_header(ptr);
    size_t copysize;
    void *newptr;

    // If size == 0, then free block and return NULL
    if (size == 0) {
        free(ptr);
        return NULL;
    }

    // If ptr is NULL, then equivalent to malloc
    if (ptr == NULL) {
        return malloc(size);
    }

    // Otherwise, proceed with reallocation
    newptr = malloc(size);

    // If malloc fails, the original block is left untouched
    if (newptr == NULL) {
        return NULL;
    }

    // Copy the old data
    copysize = get_payload_size(block); // gets size of old payload
    if (size < copysize) {
        copysize = size;
    }
    memcpy(newptr, ptr, copysize);

    // Free the old block
    free(ptr);

    return newptr;
}

/**
 * @brief
 *
 * <What does this function do?>
 * <What are the function's arguments?>
 * <What is the function's return value?>
 * <Are there any preconditions or postconditions?>
 *
 * @param[in] elements
 * @param[in] size
 * @return
 */
void *calloc(size_t elements, size_t size) {
    void *bp;
    size_t asize = elements * size;

    if (elements == 0) {
        return NULL;
    }
    if (asize / elements != size) {
        // Multiplication overflowed
        return NULL;
    }

    bp = malloc(asize);
    if (bp == NULL) {
        return NULL;
    }

    // Initialize all bits to 0
    memset(bp, 0, asize);

    return bp;
}

/*
 *****************************************************************************
 * Do not delete the following super-secret(tm) lines!                       *
 *                                                                           *
 * 53 6f 20 79 6f 75 27 72 65 20 74 72 79 69 6e 67 20 74 6f 20               *
 *                                                                           *
 * 66 69 67 75 72 65 20 6f 75 74 20 77 68 61 74 20 74 68 65 20               *
 * 68 65 78 61 64 65 63 69 6d 61 6c 20 64 69 67 69 74 73 20 64               *
 * 6f 2e 2e 2e 20 68 61 68 61 68 61 21 20 41 53 43 49 49 20 69               *
 *                                                                           *
 * 73 6e 27 74 20 74 68 65 20 72 69 67 68 74 20 65 6e 63 6f 64               *
 * 69 6e 67 21 20 4e 69 63 65 20 74 72 79 2c 20 74 68 6f 75 67               *
 * 68 21 20 2d 44 72 2e 20 45 76 69 6c 0a c5 7c fc 80 6e 57 0a               *
 *                                                                           *
 *****************************************************************************
 */