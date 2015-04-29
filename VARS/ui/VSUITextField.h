/**
 *  VARSobjc
 *  (c) VARIANTE <http://variante.io>
 *
 *  VARS UITextField.
 *
 *  This software is released under the MIT License:
 *  http://www.opensource.org/licenses/mit-license.php
 */

#import <UIKit/UIKit.h>

#import "VSUIViewUpdate.h"

@interface VSUITextField : UITextField <VSUIViewUpdateDelegate>

#pragma mark - Identifiers

/**
 *  Unique ID of this VSUIViewing protocol instance, defaults to -1 if unset.
 */
@property (nonatomic, readonly) int UUID;

#pragma mark - Characteristics

/**
 *  Current selected range.
 */
@property (nonatomic) NSRange selectedRange;

#pragma mark - Behaviors

/**
 *  Speicifies whether this button ignores touch events so they can be passed to the next object in the
 *  responder chain.
 */
@property (nonatomic) BOOL shouldRedirectTouchesToNextResponder;

#pragma mark - Styles

/**
 *  Indicates whether the keyboard should be hidden.
 */
@property (nonatomic) BOOL shouldHideKeyboard;

#pragma mark - Lifecycle

/**
 *  Creates a new VSUITextField instance with a frame and UUID.
 *
 *  @param frame
 *  @param UUID
 *
 *  @return A new VSUITextField instance with a frame and UUID.
 */
- (id)initWithFrame:(CGRect)frame UUID:(int)UUID;

/**
 *  Creates a new VSUITextField instance with a UUID.
 *
 *  @param UUID
 *
 *  @return A new VSUITextField instance with a UUID.
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

@end
