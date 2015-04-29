/**
 *  VARSobjc
 *  (c) VARIANTE <http://variante.io>
 *
 *  This software is released under the MIT License:
 *  http://www.opensource.org/licenses/mit-license.php
 */

#import "VSUIModel.h"

@implementation VSUIModel

#pragma mark - Lifecycle

/**
 *  @inheritDoc
 */
- (id)init
{
    self = [super init];

    if (self)
    {
        [self willInit];
        [self didInit];
    }

    return self;
}

/**
 *  @inheritDoc
 */
- (void)dealloc
{
    [self willDealloc];

#if !__has_feature(objc_arc)
    [super dealloc];
#endif
}

/**
 *  @inheritDoc
 */
- (void)willInit
{

}

/**
 *  @inheritDoc
 */
- (void)didInit
{

}

/**
 *  @inheritDoc
 */
- (void)willDealloc
{

}

@end
