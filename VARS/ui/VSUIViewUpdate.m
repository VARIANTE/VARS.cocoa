/**
 *  VARSobjc
 *  (c) VARIANTE <http://variante.io>
 *
 *  This software is released under the MIT License:
 *  http://www.opensource.org/licenses/mit-license.php
 */

#import "vsmem.h"

#import "VSUIViewUpdate.h"
#import "VSViewportUtil.h"

#pragma mark - INTERFACE

/*
 *  @inheritdoc
 */
@interface VSUIViewUpdate()
{
@private
    BOOL _viewDidInit;
}

#pragma mark - PROPERTIES

/**
 *  Dictionary that maps a property to a dirty type.
 */
@property (nonatomic, strong, readonly) NSMutableDictionary *dirtyPropertyMap;

/**
 *  Binary table that indicates what flags are dirty.
 */
@property (nonatomic) VSUIDirtyType dirtyTable;

/**
 *  Indicates whether the view delegate is pending update (needs update when it is not hidden).
 */
@property (nonatomic) BOOL pendingUpdate;

@end

#pragma mark - IMPLEMENTATION
#pragma GCC diagnostic ignored "-Wundeclared-selector"

/*
 *  @inheritdoc
 */
@implementation VSUIViewUpdate

#pragma mark - PROPERTIES
#pragma mark - Protocol

/*
 *  @inheritdoc
 */
@synthesize delegate = _viewDelegate;

/*
 *  @inheritdoc
 */
- (void)setDelegate:(UIView<VSUIViewUpdateDelegate> *)delegate
{
    vs_dealloc(_viewDelegate);
    _viewDelegate = delegate;
#if !__has_feature(objc_arc)
    [_viewDelegate retain];
#endif

    // Add observer to view delegate immediately - see observeValueForKeyPath:ofObject:change:context: for details.
    [(UIView *)_viewDelegate addObserver:self forKeyPath:@"hidden" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
}

#pragma mark - Drawing

/*
 *  @inheritdoc
 */
@synthesize dirtyPropertyMap = _dirtyPropertyMap;

/*
 *  @inheritdoc
 */
- (NSMutableDictionary *)dirtyPropertyMap
{
    if (_dirtyPropertyMap != nil) return _dirtyPropertyMap;

    _dirtyPropertyMap = [[NSMutableDictionary alloc] init];

    return _dirtyPropertyMap;
}

/*
 *  @inheritdoc
 */
@synthesize dirtyTable = _dirtyTable;

/*
 *  @inheritdoc
 */
@synthesize pendingUpdate = _pendingUpdate;

/*
 *  @inheritdoc
 */
@synthesize interfaceOrientation = _interfaceOrientation;

/*
 *  @inheritdoc
 */
- (void)setInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if (_interfaceOrientation != interfaceOrientation)
    {
        _interfaceOrientation = interfaceOrientation;
        [self setDirty:VSUIDirtyTypeOrientation];
    }

    // Propagate invalidations to subviews of the view delegate instance if specified.
    if ((self.shouldAutomaticallyForwardUpdateMethods & VSUIDirtyTypeOrientation) != 0)
    {
        for (UIView *subview in self.delegate.subviews)
        {
            if ([subview conformsToProtocol:@protocol(VSUIViewUpdateDelegate)])
            {
                VSUIViewUpdate *viewUpdateDelegate = ((id<VSUIViewUpdateDelegate>)subview).updateDelegate;

                if ((viewUpdateDelegate.shouldAutomaticallyBlockForwardedUpdateMethods & VSUIDirtyTypeOrientation) != VSUIDirtyTypeOrientation)
                {
                    [viewUpdateDelegate setInterfaceOrientation:interfaceOrientation];
                }
            }
        }
    }
}

/*
 *  @inheritdoc
 */
@synthesize shouldAutomaticallyForwardUpdateMethods = _automaticallyForwardedDirtyTypes;

/*
 *  @inheritdoc
 */
@synthesize shouldAutomaticallyBlockForwardedUpdateMethods = _automaticallyBlockedForwardedDirtyTypes;

#pragma mark - PROTOCOL METHODS
#pragma mark - Event Handling

/*
 *  @inheritdoc NSKeyValueObserving
 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (object == self.delegate)
    {
        if ([keyPath isEqualToString:@"hidden"] && object == self.delegate)
        {
            BOOL oldValue = [[change objectForKey:@"old"] boolValue];
            BOOL newValue = [[change objectForKey:@"new"] boolValue];

            if (oldValue != newValue)
            {
                if (!self.delegate.hidden && self.pendingUpdate)
                {
                    self.pendingUpdate = NO;

                    [self.delegate setNeedsUpdate];
                }
            }
        }

        // Validate key path with dirty property map and mark associated dirty flags.
        if (self.dirtyPropertyMap != nil)
        {
            NSDictionary *value = [self.dirtyPropertyMap objectForKey:keyPath];

            if (value != nil)
            {
                VSUIDirtyType dirtyType = [(NSNumber *)[value objectForKey:@"dirtyType"] intValue];
                BOOL willUpdateImmediately = [(NSNumber *)[value objectForKey:@"willUpdateImmediately"] boolValue];
                
                [self setDirty:dirtyType willUpdateImmediately:willUpdateImmediately];
            }
        }
    }
}

#pragma mark - INSTANCE METHODS
#pragma mark - Lifetime

/*
 *  @inheritdoc NSObject
 */
- (id)init
{
    self = [super init];

    if (self)
    {
        _viewDidInit = NO;

        [self setShouldAutomaticallyForwardUpdateMethods:VSUIDirtyTypeNone];
        [self setShouldAutomaticallyBlockForwardedUpdateMethods:VSUIDirtyTypeNone];
        [self setInterfaceOrientation:[VSViewportUtil orientationOfViewport]];

        self.dirtyTable = VSUIDirtyTypeNone;
        self.pendingUpdate = NO;
    }

    return self;
}

/*
 *  @inheritdoc NSObject
 */
- (void)dealloc
{
    [self.delegate removeObserver:self forKeyPath:@"hidden"];

    if (self.dirtyPropertyMap != nil)
    {
        for (NSString *key in self.dirtyPropertyMap)
        {
            [self.delegate removeObserver:self forKeyPath:key];
        }
    }

    vs_dealloc(_viewDelegate);
    vs_dealloc(_dirtyPropertyMap);

#if !__has_feature(objc_arc)
    [super dealloc];
#endif
}

#pragma mark - Event Handling

/*
 *  @inheritdoc
 */
- (void)viewDidInit
{
    _viewDidInit = YES;

    [self setDirty:VSUIDirtyTypeMaxTypes];
}

/*
 *  @inheritdoc
 */
- (void)viewDidUpdate
{
    [self setDirty:VSUIDirtyTypeNone];
}

#pragma mark - Updating

/*
 *  @inheritdoc
 */
- (BOOL)isDirty:(VSUIDirtyType)dirtyType
{
    switch (dirtyType)
    {
        case VSUIDirtyTypeNone:
        case VSUIDirtyTypeMaxTypes:
        {
            return (self.dirtyTable == dirtyType);
        }

        default:
        {
            return ((self.dirtyTable & dirtyType) != 0);
        }
    }
}

/*
 *  @inheritdoc
 */
- (void)setDirty:(VSUIDirtyType)dirtyType
{
    [self setDirty:dirtyType willUpdateImmediately:NO];
}

/*
 *  @inheritdoc
 */
- (void)setDirty:(VSUIDirtyType)dirtyType willUpdateImmediately:(BOOL)willUpdateImmediately
{
    // Propagate invalidations to subviews of the view delegate instance if specified.
    // If dirtyType is VSUIDirtyTypeNone, this expression will never pass, which is good, because
    // a view should never tell its subviews to clear its dirty flags (it should always be cleared internally
    // at the end of the associated view's redraw: method).
    if ((self.shouldAutomaticallyForwardUpdateMethods & dirtyType) != 0)
    {
        for (UIView *subview in self.delegate.subviews)
        {
            if ([subview conformsToProtocol:@protocol(VSUIViewUpdateDelegate)])
            {
                VSUIViewUpdate *viewUpdateDelegate = ((id<VSUIViewUpdateDelegate>)subview).updateDelegate;

                if ((viewUpdateDelegate.shouldAutomaticallyBlockForwardedUpdateMethods & dirtyType) != dirtyType)
                {
                    [viewUpdateDelegate setDirty:(self.shouldAutomaticallyForwardUpdateMethods & dirtyType) willUpdateImmediately:willUpdateImmediately];
                }
            }
        }
    }

    if ((dirtyType != VSUIDirtyTypeNone) && ((self.dirtyTable & dirtyType) == dirtyType) && !willUpdateImmediately)
    {
        return;
    }

    switch (dirtyType)
    {
        case VSUIDirtyTypeNone:
        {
            self.pendingUpdate = NO;
        }
        case VSUIDirtyTypeMaxTypes:
        {
            self.dirtyTable = dirtyType;
            break;
        }

        default:
        {
            self.dirtyTable |= dirtyType;
            break;
        }
    }

    if (dirtyType == VSUIDirtyTypeNone) return;

    if (!_viewDidInit) return;

    if (willUpdateImmediately)
    {
        [self.delegate update];
    }
    else if (self.delegate.hidden)
    {
        self.pendingUpdate = YES;
    }
    else
    {
        [self.delegate setNeedsUpdate];
    }
}

/*
 *  @inheritdoc
 */
- (void)setDirtyObject:(NSNumber *)dirtyObject
{
    [self setDirtyObject:dirtyObject willUpdateImmediately:NO];
}

/*
 *  @inheritdoc
 */
- (void)setDirtyObject:(NSNumber *)dirtyObject willUpdateImmediately:(BOOL)willUpdateImmediately
{
    [self setDirty:(VSUIDirtyType)dirtyObject.intValue willUpdateImmediately:willUpdateImmediately];
}

/*
 *  @inheritdoc
 */
- (void)mapKeyPath:(NSString *)keyPath toDirtyType:(VSUIDirtyType)dirtyType
{
    [self mapKeyPath:keyPath toDirtyType:dirtyType willUpdateImmediately:NO];
}

/*
 *  @inheritdoc
 */
- (void)mapKeyPath:(NSString *)keyPath toDirtyType:(VSUIDirtyType)dirtyType willUpdateImmediately:(BOOL)willUpdateImmediately
{
    if (self.delegate == nil) return;

    NSDictionary *value = @{ @"dirtyType": @(dirtyType), @"willUpdateImmediately": @(willUpdateImmediately) };

    [self.dirtyPropertyMap setObject:value forKey:keyPath];
    [self.delegate addObserver:self forKeyPath:keyPath options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
}

/*
 *  @inheritdoc
 */
- (void)unmapKeyPath:(NSString *)keyPath
{
    if (self.delegate == nil) return;
    
    if ([self.dirtyPropertyMap objectForKey:keyPath] == nil) return;
    
    [self.delegate removeObserver:self forKeyPath:keyPath];
    [self.dirtyPropertyMap removeObjectForKey:keyPath];
}

@end
