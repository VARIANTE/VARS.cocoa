/**
 *  VARSobjc
 *  (c) VARIANTE <http://variante.io>
 *
 *  This software is released under the MIT License:
 *  http://www.opensource.org/licenses/mit-license.php
 */

#import "VSArrayUtil.h"

/*
 *  @inheritdoc
 */
@implementation VSArrayUtil

#pragma mark - CLASS METHODS
#pragma mark - Manipulation

/*
 *  @inheritdoc
 */
+ (BOOL)arrayIsNilOrBlank:(NSArray *)anArray
{
    if (anArray == nil) return YES;
    if (anArray.count == 0) return YES;

    return NO;
}

/*
 *  @inheritdoc
 */
+ (NSArray *)arrayByShiftingArray:(NSArray *)anArray
{
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

/*
 *  @inheritdoc
 */
+ (void)shiftArray:(NSMutableArray *)aMutableArray
{
    if ([VSArrayUtil arrayIsNilOrBlank:aMutableArray]) return;

    id lastObject = aMutableArray.lastObject;

    [aMutableArray removeLastObject];
    [aMutableArray insertObject:lastObject atIndex:0];
}

/*
 *  @inheritdoc
 */
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

/*
 *  @inheritdoc
 */
+ (void)unshiftArray:(NSMutableArray *)aMutableArray
{
    if ([VSArrayUtil arrayIsNilOrBlank:aMutableArray]) return;

    id firstObject = aMutableArray.firstObject;

    [aMutableArray removeObjectAtIndex:0];
    [aMutableArray addObject:firstObject];
}

/*
 *  @inheritdoc
 */
+ (NSArray *)arrayBySwappingElementsInArray:(NSArray *)anArray index1:(unsigned long)index1 index2:(unsigned long)index2
{
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

/*
 *  @inheritdoc
 */
+ (void)swapElementsInArray:(NSMutableArray *)aMutableArray index1:(unsigned long)index1 index2:(unsigned long)index2
{
    if ([VSArrayUtil arrayIsNilOrBlank:aMutableArray]) return;
    if (index1 >= aMutableArray.count || index2 >= aMutableArray.count || index1 == index2) return;

    id object1 = aMutableArray[index1];
    id object2 = aMutableArray[index2];

    [aMutableArray removeObjectAtIndex:index1];
    [aMutableArray insertObject:object2 atIndex:index1];

    [aMutableArray removeObjectAtIndex:index2];
    [aMutableArray insertObject:object1 atIndex:index2];
}

@end
