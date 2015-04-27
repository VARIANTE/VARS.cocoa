/**
 *  VARSobjc
 *  (c) VARIANTE <http://variante.io>
 *
 *  This software is released under the MIT License:
 *  http://www.opensource.org/licenses/mit-license.php
 */

#import "VSUIModel.h"

#pragma mark - IMPLEMENTATION

/**
 *  @inheritDoc
 */
@implementation VSUIModel

#pragma mark - INSTANCE METHODS
#pragma mark - Lifecycle

/**
 *  @inheritDoc
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
