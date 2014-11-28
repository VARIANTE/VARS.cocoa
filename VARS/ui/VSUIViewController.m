/**
 *  VARSobjc
 *  (c) VARIANTE <http://variante.io>
 *
 *  This software is released under the MIT License:
 *  http://www.opensource.org/licenses/mit-license.php
 */

#import "vsmem.h"
#import "VSUIDirtyType.h"
#import "VSUINotifications.h"
#import "VSUIViewController.h"
#import "VSUIView.h"
#import "VSUIViewUpdate.h"

#pragma mark - INTERFACE

/*
 *  @inheritdoc
 */
@interface VSUIViewController ()
{
@private
    NSString *_cachedLocaleIdentifier;
}

#pragma mark - INSTANCE METHODS
#pragma mark - Event Handling

/**
 *  @private
 *
 *  NSNotificationCenter selector invoked when NSCurrentLocale did change.
 *
 *  @param note
 */
- (void)_onCurrentLocaleDidChange:(NSNotification *)note;

/**
 *  @private
 *
 *  NSNotificationCenter selector invoked when application did become active.
 *
 *  @param note
 */
- (void)_onApplicationDidBecomeActive:(NSNotification *)note;

/**
 *  @private
 *
 *  NSNotificationCenter selector invoked when UI config did change.
 *
 *  @param note
 */
- (void)_onViewConfigDidChange:(NSNotification *)note;

/**
 *  @private
 *
 *  NSNotificationCenter selector invoked when UI style did change.
 *
 *  @param note
 */
- (void)_onViewStyleDidChange:(NSNotification *)note;

@end

#pragma mark - IMPLEMENTATION

/*
 *  @inheritdoc
 */
@implementation VSUIViewController

#pragma mark - PROPERTIES

/*
 *  @inheritdoc
 */
@synthesize model = _model;

#pragma mark - INSTANCE METHODS
#pragma mark - Lifecycle

/*
 *  @inheritdoc
 */
- (id)init
{
    self = [super init];

    if (self)
    {
        [self loadModel];
        [self didInit];
    }

    return self;
}

/*
 *  @inheritdoc
 */
- (void)dealloc
{
    [self willDealloc];

#if !__has_feature(objc_arc)
    [super dealloc];
#endif
}

/*
 *  @inheritdoc
 */
- (void)didInit
{

}

/*
 *  @inheritdoc
 */
- (void)willDealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];

    vs_dealloc(_model);
}

/*
 *  @inheritdoc
 */
- (void)loadModel
{

}

#pragma mark - Event Handling

/*
 *  @inheritdoc
 */
- (void)viewDidLoad
{
    [super viewDidLoad];

    _cachedLocaleIdentifier = [NSLocale currentLocale].localeIdentifier;

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_onCurrentLocaleDidChange:) name:NSCurrentLocaleDidChangeNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_onApplicationDidBecomeActive:) name:UIApplicationDidBecomeActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_onViewConfigDidChange:) name:VSUIConfigDidChangeNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_onViewStyleDidChange:) name:VSUIStyleDidChangeNotification object:nil];
}

/*
 *  @inheritdoc
 */
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

/*
 *  @inheritdoc
 */
- (void)viewWillLayoutSubviews
{
    if ([self.view conformsToProtocol:@protocol(VSUIViewUpdateDelegate)])
    {
        VSUIViewUpdate *viewUpdateDelegate = ((id<VSUIViewUpdateDelegate>)self.view).updateDelegate;

        if (viewUpdateDelegate.interfaceOrientation != self.interfaceOrientation)
        {
            [viewUpdateDelegate setInterfaceOrientation:self.interfaceOrientation];
        }
    }

    [super viewWillLayoutSubviews];
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    if ([self.view conformsToProtocol:@protocol(VSUIViewUpdateDelegate)])
    {
        VSUIViewUpdate *viewUpdateDelegate = ((id<VSUIViewUpdateDelegate>)self.view).updateDelegate;

        if (viewUpdateDelegate.interfaceOrientation != toInterfaceOrientation)
        {
            [viewUpdateDelegate setInterfaceOrientation:toInterfaceOrientation];
        }
    }

    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
}

/*
 *  @inheritdoc
 */
- (void)currentLocaleDidChange:(NSDictionary *)context
{
    if ([self.view conformsToProtocol:@protocol(VSUIViewUpdateDelegate)])
    {
        VSUIViewUpdate *viewUpdateDelegate = ((id<VSUIViewUpdateDelegate>)self.view).updateDelegate;

        [viewUpdateDelegate setDirty:VSUIDirtyTypeLocale];
    }
}

/*
 *  @inheritdoc
 */
- (void)applicationDidBecomeActive:(NSDictionary *)context
{
    if ([self.view conformsToProtocol:@protocol(VSUIViewUpdateDelegate)])
    {
        VSUIViewUpdate *viewUpdateDelegate = ((id<VSUIViewUpdateDelegate>)self.view).updateDelegate;

        [viewUpdateDelegate setDirty:VSUIDirtyTypeDepth];
    }
}

/*
 *  @inheritdoc
 */
- (void)viewConfigDidChange:(NSDictionary *)context
{
    if ([self.view conformsToProtocol:@protocol(VSUIViewUpdateDelegate)])
    {
        VSUIViewUpdate *viewUpdateDelegate = ((id<VSUIViewUpdateDelegate>)self.view).updateDelegate;

        [viewUpdateDelegate setDirty:VSUIDirtyTypeConfig];
    }
}

/*
 *  @inheritdoc
 */
- (void)viewStyleDidChange:(NSDictionary *)context
{
    if ([self.view conformsToProtocol:@protocol(VSUIViewUpdateDelegate)])
    {
        VSUIViewUpdate *viewUpdateDelegate = ((id<VSUIViewUpdateDelegate>)self.view).updateDelegate;

        [viewUpdateDelegate setDirty:VSUIDirtyTypeStyle willUpdateImmediately:YES];
    }
}

/*
 *  @inheritdoc
 */
- (void)_onCurrentLocaleDidChange:(NSNotification *)note
{
    NSString *oldLocaleIdentifier = _cachedLocaleIdentifier;
    NSString *newLocaleIdentifier = [NSLocale currentLocale].localeIdentifier;
    NSDictionary *context = @{ @"oldLocaleIdentifier": oldLocaleIdentifier, @"newLocaleIdentifier": newLocaleIdentifier };

    _cachedLocaleIdentifier = newLocaleIdentifier;

    [self currentLocaleDidChange:context];
}

/*
 *  @inheritdoc
 */
- (void)_onApplicationDidBecomeActive:(NSNotification *)note
{
    [self applicationDidBecomeActive:note.userInfo];
}

/*
 *  @inheritdoc
 */
- (void)_onViewConfigDidChange:(NSNotification *)note
{
    [self viewConfigDidChange:note.userInfo];
}

/*
 *  @inheritdoc
 */
- (void)_onViewStyleDidChange:(NSNotification *)note
{
    [self viewStyleDidChange:note.userInfo];
}

@end
