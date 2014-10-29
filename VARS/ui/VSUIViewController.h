/**
 *  VARSobjc
 *  (c) VARIANTE <http://variante.io>
 *
 *  This software is released under the MIT License:
 *  http://www.opensource.org/licenses/mit-license.php
 */

#import <UIKit/UIKit.h>

#import "VSUIModel.h"

#pragma mark - INTERFACE

/**
 *  VARS UIViewController wrapper class. This view controller subscribes to NSNotificationCenter
 *  of NSCurrentLocaleDidChangeNotification, UIApplicationDidBecomeActiveNotification, VSUIConfigDidChangeNotification,
 *  and VSUIStyleDidChangeNotification notifications, to notify the view (if it conforms to the VSUIViewUpdateDelegate
 *  protocol). Additional conditions apply, such as the conforming view's redraw method forwarding and blocking rules.
 *
 *  @see VSUIViewUpdate.h
 */
@interface VSUIViewController : UIViewController

#pragma mark - PROPERTIES

/**
 *  Model of this view controller.
 */
@property (nonatomic, strong) VSUIModel *model;

#pragma mark - INSTANCE METHODS
#pragma mark - Lifecycle

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
