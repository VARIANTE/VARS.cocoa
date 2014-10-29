/**
 *  VARSobjc
 *  (c) VARIANTE <http://variante.io>
 *
 *  This software is released under the MIT License:
 *  http://www.opensource.org/licenses/mit-license.php
 */

#import "VSUIModel.h"

#pragma mark - IMPLEMENTATION

/*
 *  @inheritdoc
 */
@implementation VSUIModel

#pragma mark - INSTANCE METHODS
#pragma mark - Lifecycle

/*
 *  @inheritdoc
 */
- (id)init
{
    self = [super init];

    if (self)
    {
        [self didInit];
    }

    return self;
}

/*
 *  @inheritdoc
 */
- (void)dealloc
{
    [self willDealloc];

#if !__has_feature(objc_arc)
    [super dealloc];
#endif
}

/*
 *  @inheritdoc
 */
- (void)didInit
{

}

/*
 *  @inheritdoc
 */
- (void)willDealloc
{

}

@end
