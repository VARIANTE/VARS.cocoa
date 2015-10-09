/**
 * VARS
 * (c) VARIANTE <http://variante.io>
 *
 * This software is released under the MIT License:
 * http://www.opensource.org/licenses/mit-license.php
 */

#import "VSArrayUtil.h"

@implementation VSArrayUtil

#pragma mark Manipulation

+ (BOOL)arrayIsNilOrBlank:(NSArray *)anArray {
    if (anArray == nil) return YES;
    if (anArray.count == 0) return YES;

    return NO;
}

+ (NSArray *)arrayByShiftingArray:(NSArray *)anArray {
    if (anArray == nil) return nil;
    if (anArray.count <= 1) return [NSArray arrayWithArray:anArray];

    NSMutableArray *output = [[NSMutableArray alloc] initWithArray:anArray];

    [VSArrayUtil shiftArray:output];

#if !__has_feature(objc_arc)
    return [output autorelease];
#else
    return output;
#endif
}

+ (void)shiftArray:(NSMutableArray *)aMutableArray {
    if ([VSArrayUtil arrayIsNilOrBlank:aMutableArray]) return;

    id lastObject = aMutableArray.lastObject;

    [aMutableArray removeLastObject];
    [aMutableArray insertObject:lastObject atIndex:0];
}

+ (NSArray *)arrayByUnshiftingArray:(NSArray *)anArray
{
    if (anArray == nil) return nil;
    if (anArray.count <= 1) return [NSArray arrayWithArray:anArray];

    NSMutableArray *output = [[NSMutableArray alloc] initWithArray:anArray];

    [VSArrayUtil unshiftArray:output];

#if !__has_feature(objc_arc)
    return [output autorelease];
#else
    return output;
#endif
}

+ (void)unshiftArray:(NSMutableArray *)aMutableArray {
    if ([VSArrayUtil arrayIsNilOrBlank:aMutableArray]) return;

    id firstObject = aMutableArray.firstObject;

    [aMutableArray removeObjectAtIndex:0];
    [aMutableArray addObject:firstObject];
}

+ (NSArray *)arrayBySwappingElementsInArray:(NSArray *)anArray index1:(unsigned long)index1 index2:(unsigned long)index2 {
    if (anArray == nil) return nil;
    if (index1 >= anArray.count || index2 >= anArray.count || index1 == index2) return [NSArray arrayWithArray:anArray];

    NSMutableArray *output = [[NSMutableArray alloc] initWithArray:anArray];

    [VSArrayUtil swapElementsInArray:output index1:index1 index2:index2];

#if !__has_feature(objc_arc)
    return [output autorelease];
#else
    return output;
#endif
}

+ (void)swapElementsInArray:(NSMutableArray *)aMutableArray index1:(unsigned long)index1 index2:(unsigned long)index2 {
    if ([VSArrayUtil arrayIsNilOrBlank:aMutableArray]) return;
    if (index1 >= aMutableArray.count || index2 >= aMutableArray.count || index1 == index2) return;

    id object1 = aMutableArray[index1];
    id object2 = aMutableArray[index2];

    [aMutableArray removeObjectAtIndex:index1];
    [aMutableArray insertObject:object2 atIndex:index1];

    [aMutableArray removeObjectAtIndex:index2];
    [aMutableArray insertObject:object1 atIndex:index2];
}

+ (unsigned long)binarySearch:(NSArray *)aSortedArray key:(int)key min:(unsigned long)min max:(unsigned long)max {
    unsigned long m;
    int k;

    while (max >= min) {
        m = (min+max)/2;
        k = [(NSNumber *)aSortedArray[m] intValue];

        if (k == key) {
            return m;
        }
        else if (k < key) {
            min = min + 1;
        }
        else {
            max = max - 1;
        }
    }

    // Return the closest index where its value is less than the specified key.
    return max;
}

@end
