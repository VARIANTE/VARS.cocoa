/**
 *  VARS
 *  (c) VARIANTE <http://variante.io>
 *
 *  VARS UIViewController wrapper class. This view controller subscribes to NSNotificationCenter
 *  of NSCurrentLocaleDidChangeNotification, UIApplicationDidBecomeActiveNotification, VSUIConfigDidChangeNotification,
 *  and VSUIStyleDidChangeNotification notifications, to notify the view (if it conforms to the VSUIViewUpdateDelegate
 *  protocol). Additional conditions apply, such as the conforming view's redraw method forwarding and blocking rules.
 *
 *  @see VSUIViewUpdate.h
 *
 *  This software is released under the MIT License:
 *  http://www.opensource.org/licenses/mit-license.php
 */

#import <UIKit/UIKit.h>

#import "VSUIModel.h"

@interface VSUIViewController : UIViewController

#pragma mark - Models

/**
 *  Model of this view controller.
 */
@property (nonatomic, strong) VSUIModel *model;

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

/**
 *  Loads the model if specified.
 */
- (void)loadModel;

#pragma mark - Event Handling

/**
 *  Method invoked when NSCurrentLocale did change.
 *
 *  @param context
 */
- (void)currentLocaleDidChange:(NSDictionary *)context;

/**
 *  Method invoked when UIApplication did become active.
 *
 *  @param context
 */
- (void)applicationDidBecomeActive:(NSDictionary *)context;

/**
 *  Method invoked when view config did change.
 *
 *  @param context
 */
- (void)viewConfigDidChange:(NSDictionary *)context;

/**
 *  Method invoked when view style did change.
 *
 *  @param context
 */
- (void)viewStyleDidChange:(NSDictionary *)context;

@end
