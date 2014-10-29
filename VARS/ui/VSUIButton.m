/**
 *  VARSobjc
 *  (c) VARIANTE <http://variante.io>
 *
 *  This software is released under the MIT License:
 *  http://www.opensource.org/licenses/mit-license.php
 */

#import "vsmem.h"

#import "VSColorUtil.h"
#import "VSUIButton.h"

/**
 *  Default properties.
 */
static const int DEFAULT_UUID = -1;

#pragma mark - INTERFACE

/*
 *  @inheritdoc
 */
@interface VSUIButton()
{
@private
    VSUIViewUpdate *_updateDelegate;
    NSMutableDictionary *_backgroundColorTable;
}

#pragma mark - PROPERTIES

/*
 *  @inheritdoc
 */
@property (nonatomic) int UUID;

#pragma mark - INSTANCE METHODS
#pragma mark - Styling

/**
 *  @private
 *
 *  Gets the background color for the specified UIControlState.
 *
 *  @param state
 *
 *  @return The corresponding background color if specified; the normal background color if
 *          unspecified; nil if even the normal background is unspecified.
 */
- (UIColor *)_getBackgroundColorForState:(UIControlState)state;

@end

#pragma mark - IMPLEMENTATION

/*
 *  @inheritdoc
 */
@implementation VSUIButton

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
    if ([self isDirty:VSUIDirtyTypeStyle|VSUIDirtyTypeState])
    {
        [self setBackgroundColor:[self _getBackgroundColorForState:self.state]];
    }

    if ([self isDirty:VSUIDirtyTypeState|VSUIDirtyTypeData])
    {
        if (self.shouldOverrideAccessibilityOption)
        {
            NSMutableAttributedString *mas = [[NSMutableAttributedString alloc] initWithAttributedString:[self.titleLabel attributedText]];
            NSRange range = NSMakeRange(0, mas.string.length);

            [mas removeAttribute:NSUnderlineStyleAttributeName range:range];
            [mas addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithUnsignedInteger:NSUnderlineStyleNone] range:range];
            [self.titleLabel setAttributedText:mas];

            vs_dealloc(mas);
        }
    }

    [self.updateDelegate setDirty:VSUIDirtyTypeNone];
}

/*
 *  @inheritdoc VSUIViewUpdateDelegate
 */
- (BOOL)isDirty:(VSUIDirtyType)dirtyType
{
    return [self.updateDelegate isDirty:dirtyType];
}

#pragma mark - PROPERTIES
#pragma mark - States

/*
 *  @inheritdoc UIControl
 */
- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];

    [self.updateDelegate setDirty:VSUIDirtyTypeState];
}

/*
 *  @inheritdoc UIControl
 */
- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    [self.updateDelegate setDirty:VSUIDirtyTypeState];
}

/*
 *  @inheritdoc
 */
- (void)setEnabled:(BOOL)enabled
{
    [super setEnabled:enabled];
    [self.updateDelegate setDirty:VSUIDirtyTypeState];
}

/*
 *  @inheritdoc UIView
 */
- (void)setHidden:(BOOL)hidden
{
    if (self.shouldAnimateVisibility)
    {
        [VSUIButton transitionWithView:self duration:0.3 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
            [super setHidden:hidden];
        } completion:NULL];
    }
    else
    {
        [super setHidden:hidden];
    }
}

#pragma mark - Identifier

/*
 *  @inheritdoc
 */
@synthesize UUID = _uuid;

#pragma mark - Styles

/*
 *  @inheritdoc UIView
 */
- (void)setBackgroundColor:(UIColor *)backgroundColor
{
    if (self.shouldAnimateBackgroundColor)
    {
        [VSUIButton animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionBeginFromCurrentState animations:^{
            [super setBackgroundColor:backgroundColor];
        } completion:NULL];
    }
    else
    {
        [super setBackgroundColor:backgroundColor];
    }
}

/*
 *  @inheritdoc UIButton
 */
- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
    [super setTitle:title forState:state];

    [self.updateDelegate setDirty:VSUIDirtyTypeData];
}

/*
 *  @inheritdoc UIButton
 */
- (void)setAttributedTitle:(NSAttributedString *)title forState:(UIControlState)state
{
    NSRange range = NSMakeRange(0, title.string.length);
    NSMutableAttributedString *mas = [[NSMutableAttributedString alloc] initWithAttributedString:title];
    [mas removeAttribute:NSForegroundColorAttributeName range:range];
    [mas addAttribute:NSForegroundColorAttributeName value:[self titleColorForState:state] range:range];
    [super setAttributedTitle:mas forState:state];
    vs_dealloc(mas);

    [self.updateDelegate setDirty:VSUIDirtyTypeData];
}

/*
 *  @inheritdoc UIButton
 */
- (void)setTitleColor:(UIColor *)color forState:(UIControlState)state
{
    [super setTitleColor:color forState:state];

    NSAttributedString *as = [self attributedTitleForState:state];

    if (as != nil)
    {
        [self setAttributedTitle:as forState:state];
    }
}

/*
 *  @inheritdoc
 */
- (UIFont *)titleFont
{
    return self.titleLabel.font;
}

/*
 *  @inheritdoc
 */
- (void)setTitleFont:(UIFont *)titleFont
{
    [self.titleLabel setFont:titleFont];
}

#pragma mark - Behaviors

/*
 *  @inheritdoc
 */
@synthesize shouldDimWhenHighlighted = _shouldDimWhenHighlighted;

/*
 *  @inheritdoc
 */
@synthesize shouldDimWhenSelected = _shouldDimWhenSelected;

/*
 *  @inheritdoc
 */
@synthesize shouldDimWhenDisabled = _shouldDimWhenDisabled;

/*
 *  @inheritdoc
 */
@synthesize shouldAnimateBackgroundColor = _shouldAnimateBackgroundColor;

/*
 *  @inheritdoc
 */
@synthesize shouldAnimateVisibility = _shouldAnimateVisibility;

/*
 *  @inheritdoc
 */
@synthesize shouldOverrideAccessibilityOption = _shouldOverrideAccessibilityOption;

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
        [self setUUID:DEFAULT_UUID];
        [self didInit];
    }

    return self;
}

/*
 *  @inheritdoc
 */
- (id)initWithFrame:(CGRect)frame UUID:(int)UUID
{
    self = [super initWithFrame:frame];

    if (self)
    {
        [self setUUID:UUID];
        [self didInit];
    }

    return self;
}

/*
 *  @inheritdoc
 */
- (id)initWithUUID:(int)UUID
{
    self = [self initWithFrame:CGRectZero UUID:UUID];

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
    _backgroundColorTable = [[NSMutableDictionary alloc] init];

    [self setShouldDimWhenHighlighted:NO];
    [self setShouldDimWhenSelected:NO];
    [self setShouldDimWhenDisabled:NO];
    [self setShouldAnimateBackgroundColor:YES];
    [self setShouldAnimateVisibility:NO];
    [self setShouldOverrideAccessibilityOption:YES];

    [self.updateDelegate setDirty:VSUIDirtyTypeMaxTypes];
}

/*
 *  @inheritdoc
 */
- (void)willDealloc
{
    vs_dealloc(_updateDelegate);
    vs_dealloc(_backgroundColorTable);
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

#pragma mark - Styling

/*
 *  @inheritdoc
 */
- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state
{
    if (backgroundColor == nil)
    {
        [_backgroundColorTable setObject:[NSNull null] forKey:[NSNumber numberWithUnsignedInteger:state]];
    }
    else
    {
        [_backgroundColorTable setObject:backgroundColor forKey:[NSNumber numberWithUnsignedInteger:state]];
    }

    [self.updateDelegate setDirty:VSUIDirtyTypeStyle];
}

/*
 *  @inheritdoc
 */
- (UIColor *)_getBackgroundColorForState:(UIControlState)state
{
    if (_backgroundColorTable == nil) return nil;

    id targetColor = [_backgroundColorTable objectForKey:[NSNumber numberWithUnsignedInteger:state]];
    id normalColor = [_backgroundColorTable objectForKey:[NSNumber numberWithUnsignedInteger:UIControlStateNormal]];

    if ([targetColor isKindOfClass:[UIColor class]])
    {
        return targetColor;
    }
    else if ([normalColor isKindOfClass:[UIColor class]])
    {
        if (state == UIControlStateHighlighted)
        {
            if (self.shouldDimWhenHighlighted)
            {
                CGFloat delta = [VSColorUtil verifyRGBOfColor:normalColor hasRoomForDeltaUniformValue:-20.0f] ? -20.0f : 20.0f;
                return [VSColorUtil modifyRGBOfColor:normalColor byUniformValue:delta];
            }
        }
        else if (state == UIControlStateSelected)
        {
            if (self.shouldDimWhenSelected)
            {
                CGFloat delta = [VSColorUtil verifyRGBOfColor:normalColor hasRoomForDeltaUniformValue:-20.0f] ? -20.0f : 20.0f;
                return [VSColorUtil modifyRGBOfColor:normalColor byUniformValue:delta];
            }
        }
        else if (state == UIControlStateDisabled)
        {
            if (self.shouldDimWhenDisabled)
            {
                return [normalColor colorWithAlphaComponent:0.2f];
            }
        }
        
        return normalColor;
    }
    else
    {
        return nil;
    }
}

@end
