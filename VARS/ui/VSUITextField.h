/**
 *  VARSobjc
 *  (c) VARIANTE <http://variante.io>
 *
 *  This software is released under the MIT License:
 *  http://www.opensource.org/licenses/mit-license.php
 */

#import <UIKit/UIKit.h>

#import "VSUIViewUpdate.h"

#pragma mark - INTERFACE

/**
 *  VARS UITextField wrapper class.
 */
@interface VSUITextField : UITextField <VSUIViewUpdateDelegate>

#pragma mark - PROPERTIES
#pragma mark - Identifier

/**
 *  Unique ID of this VSUIViewing protocol instance, defaults to -1 if unset.
 */
@property (nonatomic, readonly) int UUID;

#pragma mark - Data

/**
 *  Current selected range.
 */
@property (nonatomic) NSRange selectedRange;

#pragma mark - Styles

/**
 *  Indicates whether the keyboard should be hidden.
 */
@property (nonatomic) BOOL shouldHideKeyboard;

#pragma mark - INSTANCE METHODS
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
 *  Automatically invoked on init, do not call this manually. If overridden, invoke the predecessor's didInit
 *  method at the end.
 */
- (void)didInit;

/**
 *  Automatically invoked on dealloc, do not call this manually. If overridden, invoke the predecessor's willDealloc
 *  method at the end.
 */
- (void)willDealloc;

@end
