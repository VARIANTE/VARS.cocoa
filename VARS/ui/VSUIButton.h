/**
 *  VARSobjc
 *  (c) VARIANTE <http://variante.io>
 *
 *  This software is released under the MIT License:
 *  http://www.opensource.org/licenses/mit-license.php
 */

#import "VSUIViewUpdate.h"

#pragma mark - INTERFACE

/**
 *  VARS UIButton wrapper class.
 */
@interface VSUIButton : UIButton <VSUIViewUpdateDelegate>

#pragma mark - PROPERTIES
#pragma mark - Identifier

/**
 *  Unique ID of this VSUIViewing protocol instance, defaults to -1 if unset.
 */
@property (nonatomic, readonly) int UUID;

#pragma mark - Styles

/**
 *  Specifies the font of the title.
 */
@property (weak, nonatomic) UIFont *titleFont;

#pragma mark - Behaviors

/**
 *  Specifies whether the buttun dims when it is highlighted (will be overridden if background color
 *  for UIControlStateHighlighted is specified).
 */
@property (nonatomic) BOOL shouldDimWhenHighlighted;

/**
 *  Specifies whether the buttun dims when it is selected (will be overridden if background color
 *  for UIControlStateSelected is specified).
 */
@property (nonatomic) BOOL shouldDimWhenSelected;

/**
 *  Specifies whether the button dims when it is disabled (will be overridden if background color
 *  for UIControlStateDisabled is specified).
 */
@property (nonatomic) BOOL shouldDimWhenDisabled;

/**
 *  Specifies whether the button animates background color change.
 */
@property (nonatomic) BOOL shouldAnimateBackgroundColor;

/**
 *  Specifies whether the button animates when hidden/shown.
 */
@property (nonatomic) BOOL shouldAnimateVisibility;

/**
 *  Specifies whether the button should override accessibility option.
 */
@property (nonatomic) BOOL shouldOverrideAccessibilityOption;

/**
 *  Speicifies whether this button ignores touch events so they can be passed to the next object in the
 *  responder chain.
 */
@property (nonatomic) BOOL shouldRedirectTouchesToNextResponder;

#pragma mark - INSTANCE METHODS
#pragma mark - Lifecycle

/**
 *  Creates a new VSUIButton instance with a frame and UUID.
 *
 *  @param frame
 *  @param UUID
 *
 *  @return A new VSUIButton instance with a frame and UUID.
 */
- (id)initWithFrame:(CGRect)frame UUID:(int)UUID;

/**
 *  Creates a new VSUIButton instance with a UUID.
 *
 *  @param UUID
 *
 *  @return A new VSUIButton instance with a UUID.
 */
- (id)initWithUUID:(int)UUID;

/**
 *  Automatically invoked on init, do not call this manually. If overridden, invoke the predecessor's didInit
 *  method at the end.
 */
- (void)didInit;

/**
 *  Automatically invoked on dealloc, do not call this manually. If overridden, invoke the predecessor's willDealloc
 *  method at the end.
 */
- (void)willDealloc;

#pragma mark - Styling

/**
 *  Sets the background color for the specified UIControlState.
 *
 *  @param backgroundColor
 *  @param state
 */
- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;

@end
