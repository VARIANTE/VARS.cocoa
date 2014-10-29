/**
 *  VARSobjc
 *  (c) VARIANTE <http://variante.io>
 *
 *  This software is released under the MIT License:
 *  http://www.opensource.org/licenses/mit-license.php
 */

#import "vsmem.h"
#import "VSUIView.h"

#pragma mark - INTERFACE

/*
 *  @inheritdoc
 */
@interface VSUIView()
{
@private
    VSUIViewUpdate *_updateDelegate;
}

@end

#pragma mark - IMPLEMENTATION

/*
 *  @inheritdoc
 */
@implementation VSUIView

#pragma mark - PROTOCOL PROPERTIES
#pragma mark - Drawing

/*
 *  @inheritdoc VSUIViewUpdateDelegate
 */
- (VSUIViewUpdate *)updateDelegate
{
    if (_updateDelegate != nil) return _updateDelegate;

    _updateDelegate = [[VSUIViewUpdate alloc] init];
    [_updateDelegate setDelegate:self];

    return _updateDelegate;
}

/*
 *  @inheritdoc VSUIViewUpdateDelegate
 */
- (UIInterfaceOrientation)interfaceOrientation
{
    return [self.updateDelegate interfaceOrientation];
}

/*
 *  @inheritdoc VSUIViewUpdateDelegate
 */
- (void)setInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    [self.updateDelegate setInterfaceOrientation:interfaceOrientation];
}

#pragma mark - PROTOCOL METHODS
#pragma mark - Updating

/*
 *  @inheritdoc VSUIViewUpdateDelegate
 */
- (void)setNeedsUpdate
{
    [self update];
}

/*
 *  @inheritdoc VSUIViewUpdateDelegate
 */
- (void)update
{
    [self.updateDelegate setDirty:VSUIDirtyTypeNone];
}

/*
 *  @inheritdoc VSUIViewUpdateDelegate
 */
- (BOOL)isDirty:(VSUIDirtyType)dirtyType
{
    return [self.updateDelegate isDirty:dirtyType];
}

#pragma mark - INSTANCE METHODS
#pragma mark - Lifecycle

/*
 *  @inheritdoc UIView
 */
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];

    if (self)
    {
        [self didInit];
    }

    return self;
}

/*
 *  @inheritdoc NSObject
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
    [self.updateDelegate setDirty:VSUIDirtyTypeMaxTypes];
}

/*
 *  @inheritdoc
 */
- (void)willDealloc
{
    vs_dealloc(_updateDelegate);
}

#pragma mark - Layout

/*
 *  @inheritdoc
 */
- (void)layoutSubviews
{
    [super layoutSubviews];

    [self.updateDelegate setDirty:VSUIDirtyTypeLayout];
}

@end
