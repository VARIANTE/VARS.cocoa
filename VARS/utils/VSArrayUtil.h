/**
 * VARS
 * (c) VARIANTE <http://variante.io>
 *
 * Utility for processing arrays.
 *
 * This software is released under the MIT License:
 * http://www.opensource.org/licenses/mit-license.php
 */

#import <Foundation/Foundation.h>

NS_ROOT_CLASS @interface VSArrayUtil

#pragma mark Manipulation

/**
 * Verifies whether an array is nil or contains no elements.
 *
 * @param anArray
 *
 * @return YES if nil or contains no elements, NO otherwise.
 */
+ (BOOL)arrayIsNilOrBlank:(NSArray *)anArray;

/**
 * Returns a copy of the specified array after it is shifted.
 *
 * @param anArray
 *
 * @return NSArray copy of the shifted array.
 */
+ (NSArray *)arrayByShiftingArray:(NSArray *)anArray;

/**
 * Shifts the elements in the specified array to the right.
 *
 * @param aMutableArray
 */
+ (void)shiftArray:(NSMutableArray *)aMutableArray;

/**
 * Returns a copy of the specified array after it is unshifted.
 *
 * @param anArray
 *
 * @return NSArray copy of the unshifted array.
 */
+ (NSArray *)arrayByUnshiftingArray:(NSArray *)anArray;

/**
 * Unshifts the elements in the specified array to the left.
 *
 * @param aMutableArray
 */
+ (void)unshiftArray:(NSMutableArray *)aMutableArray;

/**
 * Returns a copy of the specified array after the specified elements are swapped.
 *
 * @param anArray
 * @param index1
 * @param index2
 *
 * @return NSArray copy of the array with swapped elements.
 */
+ (NSArray *)arrayBySwappingElementsInArray:(NSArray *)anArray index1:(unsigned long)index1 index2:(unsigned long)index2;

/**
 * Swaps two elemnts in the specified array.
 *
 * @param aMutableArray
 * @param index1
 * @param index2
 */
+ (void)swapElementsInArray:(NSMutableArray *)aMutableArray index1:(unsigned long)index1 index2:(unsigned long)index2;

/**
 * Uses binary search to look for the index of the specified key in a sorted integer array. If none is found, the next closest index with
 * value less than the specified key will be returned.
 *
 * @param aSortedArray
 * @param key
 * @param min
 * @param max
 *
 * @return The desired index.
 */
+ (unsigned long)binarySearch:(NSArray *)aSortedArray key:(int)key min:(unsigned long)min max:(unsigned long)max;

@end
