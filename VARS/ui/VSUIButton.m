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
#pragma mark - Updating

/**
 *  @private
 *
 *  Applies state-specific update.
 */
- (void)_updateState;

/**
 *  @private
 *
 *  Applies data-specific update.
 */
- (void)_updateData;

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

    if (!enabled)
    {
        [self setHighlighted:NO];
    }

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
        if (((self.state & UIControlStateHighlighted) != 0) || ((self.state & UIControlStateSelected) != 0))
        {
            [VSUIButton animateWithDuration:0.0 delay:0 options:UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionBeginFromCurrentState animations:^{
                [super setBackgroundColor:backgroundColor];
            } completion:NULL];
        }
        else
        {
            [VSUIButton animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionAllowUserInteraction|UIViewAnimationOptionBeginFromCurrentState animations:^{
                [super setBackgroundColor:backgroundColor];
            } completion:NULL];
        }
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

/*
 *  @inheritdoc
 */
@synthesize shouldRedirectTouchesToNextResponder = _shouldRedirectTouchesToNextResponder;

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
        [self _updateState];
    }

    if ([self isDirty:VSUIDirtyTypeState|VSUIDirtyTypeData])
    {
        [self _updateData];
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
    [self setShouldRedirectTouchesToNextResponder:NO];

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

#pragma mark - Updating

/*
 *  @inheritdoc
 */
- (void)_updateState
{
    [self setBackgroundColor:[self _getBackgroundColorForState:self.state]];
}

/*
 *  @inheritdoc
 */
- (void)_updateData
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

#pragma mark - Event Handling

/*
 *  @inheritdoc UIResponder
 */
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (self.shouldRedirectTouchesToNextResponder)
    {
        [self.nextResponder touchesBegan:touches withEvent:event];
    }
    else
    {
        [super touchesBegan:touches withEvent:event];
    }
}

/*
 *  @inheritdoc UIResponder
 */
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (self.shouldRedirectTouchesToNextResponder)
    {
        [self.nextResponder touchesMoved:touches withEvent:event];
    }
    else
    {
        [super touchesMoved:touches withEvent:event];
    }
}

/*
 *  @inheritdoc UIResponder
 */
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (self.shouldRedirectTouchesToNextResponder)
    {
        [self.nextResponder touchesEnded:touches withEvent:event];
    }
    else
    {
        [super touchesEnded:touches withEvent:event];
    }
}

/*
 *  @inheritdoc UIResponder
 */
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (self.shouldRedirectTouchesToNextResponder)
    {
        [self.nextResponder touchesCancelled:touches withEvent:event];
    }
    else
    {
        [super touchesCancelled:touches withEvent:event];
    }
}

#pragma mark - Styling

/*
 *  @inheritdoc
 */
- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state
{
    NSNumber *key = @(state);

    if (backgroundColor == nil)
    {
        [_backgroundColorTable removeObjectForKey:key];
    }
    else
    {
        [_backgroundColorTable setObject:backgroundColor forKey:key];
    }

    [self.updateDelegate setDirty:VSUIDirtyTypeStyle];
}

/*
 *  @inheritdoc
 */
- (UIColor *)_getBackgroundColorForState:(UIControlState)state
{
    NSNumber *key = @(state);

    UIColor *targetColor = (UIColor *)[_backgroundColorTable objectForKey:key];

    // Determine fallback color.
    if (!targetColor)
    {
        switch (state)
        {
            case UIControlStateNormal:
            {
                return self.backgroundColor;
            }

            case UIControlStateHighlighted:
            {
                UIColor *fallbackColor = [self _getBackgroundColorForState:UIControlStateNormal];

                if (self.shouldDimWhenHighlighted)
                {
                    CGFloat delta = [VSColorUtil verifyRGBOfColor:fallbackColor hasRoomForDeltaUniformValue:-20.0f] ? -20.0f : 20.0f;
                    return [VSColorUtil modifyRGBOfColor:fallbackColor byUniformValue:delta];
                }
                else
                {
                    return fallbackColor;
                }
            }

            case UIControlStateSelected:
            {
                UIColor *fallbackColor = [self _getBackgroundColorForState:UIControlStateNormal];

                if (self.shouldDimWhenSelected)
                {
                    CGFloat delta = [VSColorUtil verifyRGBOfColor:fallbackColor hasRoomForDeltaUniformValue:-20.0f] ? -20.0f : 20.0f;
                    return [VSColorUtil modifyRGBOfColor:fallbackColor byUniformValue:delta];
                }
                else
                {
                    return fallbackColor;
                }
            }

            case UIControlStateDisabled:
            {
                UIColor *fallbackColor = [self _getBackgroundColorForState:UIControlStateNormal];

                if (self.shouldDimWhenDisabled)
                {
                    return [fallbackColor colorWithAlphaComponent:0.2f];
                }
                else
                {
                    return fallbackColor;
                }
            }

            default:
            {
                if ((state & UIControlStateDisabled) != 0)
                {
                    return [self _getBackgroundColorForState:UIControlStateDisabled];
                }
                else if ((state & UIControlStateSelected) != 0)
                {
                    return [self _getBackgroundColorForState:UIControlStateSelected];
                }
                else if ((state & UIControlStateHighlighted) != 0)
                {
                    return [self _getBackgroundColorForState:UIControlStateHighlighted];
                }
                else
                {
                    return [self _getBackgroundColorForState:UIControlStateNormal];
                }
            }
        }
    }
    else
    {
        return targetColor;
    }

    return nil;
}

@end
