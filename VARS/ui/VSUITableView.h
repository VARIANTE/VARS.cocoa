/**
 *  VARSobjc
 *  (c) VARIANTE <http://variante.io>
 *
 *  VARS UITextView.
 *
 *  This software is released under the MIT License:
 *  http://www.opensource.org/licenses/mit-license.php
 */

#import <UIKit/UIKit.h>
#import "VSUIViewUpdate.h"

@interface VSUITableView : UITableView <VSUIViewUpdateDelegate>

#pragma mark - Behaviors

/**
 *  Speicifies whether this button ignores touch events so they can be passed to the next object in the
 *  responder chain.
 */
@property (nonatomic) BOOL shouldRedirectTouchesToNextResponder;

#pragma mark - Lifecycle

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

#pragma mark - Positioning

/**
 *  Scrolls the view to the bottom.
 */
- (void)scrollToBottom;

@end
