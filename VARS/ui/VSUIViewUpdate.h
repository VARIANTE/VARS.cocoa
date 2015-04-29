/**
 *  VARSobjc
 *  (c) VARIANTE <http://variante.io>
 *
 *  VARS UIView update protocol delegate. UIView instances that conform to this
 *  protocol will immediately become a view that requires dirty invalidation prior
 *  to updating (i.e. calling setNeedsUpdate). This protocol supports forwarding/blocking
 *  update methods to/fro subviews/superview respectively, both of which are disabled
 *  by default. Note that in order for update method forwarding/blocking to work properly,
 *  the corresponding subview/superview must also conform to this protocol.
 *
 *  This software is released under the MIT License:
 *  http://www.opensource.org/licenses/mit-license.php
 */

#import <UIKit/UIKit.h>

#import "VSUIDirtyType.h"

@protocol VSUIViewUpdateDelegate


#pragma mark - Delegation

@required
/**
 *  Read-only weak reference to update delegate instance.
 */
@property (nonatomic, weak, readonly) id updateDelegate;

#pragma mark - Updating

/**
 *  Current interface orientation.
 *  TODO: This will soon be deprecated.
 */
@optional
@property (nonatomic) UIInterfaceOrientation interfaceOrientation;

/**
 *  Schedules for UI update.
 */
@required
- (void)setNeedsUpdate;

/**
 *  Updates the delegate UIVIew instance. This needs to be scheduled by setNeedsUpdate, avoid invoking this directly.
 *  If overridden, invoke the predecessor's update method at the end.
 */
@required
- (void)update;

/**
 *  Checks to see if a given VSUIDirtyType is dirty.
 *
 *  @param dirtyType
 *
 *  @return YES if dirty, NO otherwise.
 */
@optional
- (BOOL)isDirty:(VSUIDirtyType)dirtyType;

@end

#pragma mark - --------------------------------------------------------------------------

@interface VSUIViewUpdate : NSObject

#pragma mark - Delegation

/**
 *  Delegate instance.
 */
@property (nonatomic, strong) UIView<VSUIViewUpdateDelegate> *delegate;

#pragma mark - Updating

/**
 *  Interface orientation.
 *  TODO: This will soon be deprecated.
 */
@property (nonatomic) UIInterfaceOrientation interfaceOrientation;

/**
 *  Indicates whether delegate view will forward update methods to its subviews of the specified VSUIDirtyType (necessary for subviews
 *  that do not have their own VSUIViewController).
 */
@property (nonatomic) VSUIDirtyType shouldAutomaticallyForwardUpdateMethods;

/**
 *  Indicates whether delegate view will block forwarded update methods from its parent view of the specified VSUIDirtyType (necessary for
 *  subviews that do not have their own VSUIViewController).
 */
@property (nonatomic) VSUIDirtyType shouldAutomaticallyBlockForwardedUpdateMethods;

#pragma mark - Event Handling

/**
 *  Handler invoked by the delegate view when it is done initializing.
 */
- (void)viewDidInit;

/**
 *  Handler invoked by the delegate view when it is done updating.
 */
- (void)viewDidUpdate;

#pragma mark - Updating

/**
 *  Checks to see if a given VSUIDirtyType is dirty.
 *
 *  @param dirtyType
 *
 *  @return YES if dirty, NO otherwise.
 */
- (BOOL)isDirty:(VSUIDirtyType)dirtyType;

/**
 *  Sets a VSUIDirtyType as dirty, invokes setNeedsUpdate.
 *
 *  @param dirtyType
 */
- (void)setDirty:(VSUIDirtyType)dirtyType;

/**
 *  Sets a VSUIDirtyType as dirty, option to force immediate update rather than wait to be scheduled.
 *
 *  @param dirtyType
 *  @param willUpdateImmediately
 */
- (void)setDirty:(VSUIDirtyType)dirtyType willUpdateImmediately:(BOOL)willUpdateImmediately;

/**
 *  Sets a VSUIDirtyType as dirty wrapped in an NSNumber, invokes setNeedsUpdate.
 *
 *  @param dirtyObject
 */
- (void)setDirtyObject:(NSNumber *)dirtyObject;

/**
 *  Sets a VSUIDirtyType as dirty wrapped in an NSNumber, option to force immediate update rather than wait to be scheduled.
 *
 *  @param dirtyObject
 */
- (void)setDirtyObject:(NSNumber *)dirtyObject willUpdateImmediately:(BOOL)willUpdateImmediately;

/**
 *  Maps a property key path of the delegate view to a dirty type so that whenever its value is changed, that type will be marked as dirty.
 *  This method will not trigger an immediate update.
 *
 *  @param keyPath
 *  @param dirtyType
 */
- (void)mapKeyPath:(NSString *)keyPath toDirtyType:(VSUIDirtyType)dirtyType;

/**
 *  Maps a property key path of the delegate view to a dirty type so that whenever its value is changed, that type will be marked as dirty.
 *  This method allows an option to specify whether or not to trigger an immediate update.
 *
 *  @param keyPath
 *  @param dirtyType
 *  @param willUpdateImmediately
 */
- (void)mapKeyPath:(NSString *)keyPath toDirtyType:(VSUIDirtyType)dirtyType willUpdateImmediately:(BOOL)willUpdateImmediately;

/**
 *  Unmaps all the dirty flags associated with property key path from the delegate view.
 *
 *  @param keyPath
 */
- (void)unmapKeyPath:(NSString *)keyPath;

@end

