/**
 *  VARS
 *  (c) VARIANTE <http://variante.io>
 *
 *  VARS UILabel.
 *
 *  This software is released under the MIT License:
 *  http://www.opensource.org/licenses/mit-license.php
 */

#import "VSUIViewUpdate.h"

@interface VSUILabel : UILabel <VSUIViewUpdateDelegate>

#pragma mark - Identifiers

/**
 *  Unique ID of this VSUIViewing protocol instance, defaults to -1 if unset.
 */
@property (nonatomic) int UUID;

#pragma mark - Behaviors

/**
 *  Speicifies whether this button ignores touch events so they can be passed to the next object in the
 *  responder chain.
 */
@property (nonatomic) BOOL shouldRedirectTouchesToNextResponder;

#pragma mark - Context Menu

/**
 *  Speicifies whether action menu is enabled.
 */
@property (nonatomic) BOOL menuEnabled;

/**
 *  Specifies whether the menu can be revealed with default gestures.
 */
@property (nonatomic) BOOL menuGesturesEnabled;

#pragma mark - Styles

/**
 *  Edge insets of the inner text.
 */
@property (nonatomic) UIEdgeInsets textEdgeInsets;

#pragma mark - Lifecycle

/**
 *  Creates a new VSUILabel instance with a frame and UUID.
 *
 *  @param frame
 *  @param UUID
 *
 *  @return A new VSUILabel instance with a frame and UUID.
 */
- (id)initWithFrame:(CGRect)frame UUID:(int)UUID;

/**
 *  Creates a new VSUILabel instance with a UUID.
 *
 *  @param UUID
 *
 *  @return A new VSUILabel instance with a UUID.
 */
- (id)initWithUUID:(int)UUID;

/**
 *  Automatically invoked at the beginning of init, do not call this manually. If overridden, invoke [super willInit]
 *  at the beginning of the method.
 */
- (void)willInit;

/**
 *  Automatically invoked at the end of init, do not call this manually. If overridden, invoke [super didInit] at the
 *  end of the method.
 */
- (void)didInit;

/**
 *  Automatically invoked at the beginning of dealloc, do not call this manually. If overridden, invoke [super willDealloc]
 *  at the end of the method.
 */
- (void)willDealloc;

#pragma mark - Context Menu

/**
 *  Reveals the menu.
 */
- (void)revealMenu;

/**
 *  Hides the menu.
 */
- (void)hideMenu;

@end
