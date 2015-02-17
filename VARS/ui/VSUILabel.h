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
 *  VARS UILabel wrapper class.
 */
@interface VSUILabel : UILabel <VSUIViewUpdateDelegate>

#pragma mark - PROPERTIES
#pragma mark - Identifier

/**
 *  Unique ID of this VSUIViewing protocol instance, defaults to -1 if unset.
 */
@property (nonatomic) int UUID;

#pragma mark - Behaviors

/**
 *  Speicifies whether action menu is enabled.
 */
@property (nonatomic) BOOL menuEnabled;

/**
 *  Speicifies whether this button ignores touch events so they can be passed to the next object in the
 *  responder chain.
 */
@property (nonatomic) BOOL shouldRedirectTouchesToNextResponder;

#pragma mark - Styles

/**
 *  Edge insets of the inner text.
 */
@property (nonatomic) UIEdgeInsets textEdgeInsets;

#pragma mark - INSTANCE METHODS
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
 *  Automatically invoked on init, do not call this manually. If overridden, invoke the predecessor's didInit
 *  method at the end.
 */
- (void)didInit;

/**
 *  Automatically invoked on dealloc, do not call this manually. If overridden, invoke the predecessor's willDealloc
 *  method at the end.
 */
- (void)willDealloc;

#pragma mark - Behaviors

/**
 *  Reveals the menu.
 */
- (void)revealMenu;

/**
 *  Hides the menu.
 */
- (void)hideMenu;

@end
