/**
 *  VARS
 *  (c) VARIANTE <http://variante.io>
 *
 *  This software is released under the MIT License:
 *  http://www.opensource.org/licenses/mit-license.php
 */

#import "VSViewportUtil.h"

/**
 *  @inheritDoc
 */
NSString *NSStringFromVSViewportAspectRatioType(VSViewportAspectRatioType type)
{
    switch (type)
    {
        case VSViewportAspectRatioTypeUnknown:  return @"VSViewportAspectRatioTypeUnknown";
        case VSViewportAspectRatioType5_4:      return @"VSViewportAspectRatioType5_4";
        case VSViewportAspectRatioType4_3:      return @"VSViewportAspectRatioType4_3";
        case VSViewportAspectRatioType16_10:    return @"VSViewportAspectRatioType16_10";
        case VSViewportAspectRatioType16_9:     return @"VSViewportAspectRatioType16_9";
        case VSViewportAspectRatioTypeMaxTypes: return @"VSViewportAspectRatioTypeMaxTypes";
        default:                                return @(type).stringValue;
    }
}

#pragma mark - --------------------------------------------------------------------------

@implementation VSViewportUtil

/**
 *  @inheritDoc
 */
+ (CGRect)frameOfViewport
{
    return [VSViewportUtil frameOfViewportWithStatusBar:NO];
}

/**
 *  @inheritDoc 
 */
+ (CGRect)frameOfViewportWithStatusBar:(BOOL)withStatusBar
{
    UIInterfaceOrientation orientation = [VSViewportUtil orientationOfViewport];

    return [VSViewportUtil frameOfViewportForInterfaceOrientation:orientation withStatusBar:withStatusBar];
}

/**
 *  @inheritDoc
 */
+ (CGRect)frameOfViewportForInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return [VSViewportUtil frameOfViewportForInterfaceOrientation:interfaceOrientation withStatusBar:NO];
}

/**
 *  @inheritDoc
 */
+ (CGRect)frameOfViewportForInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation withStatusBar:(BOOL)withStatusBar
{
    CGRect mainScreenBounds = [UIScreen mainScreen].bounds;
    CGSize statusBarSize = (withStatusBar) ? [VSViewportUtil frameOfStatusBarForInterfaceOrientation:interfaceOrientation].size : CGSizeZero;
    CGFloat statusBarOffset = statusBarSize.height;

    if (UIInterfaceOrientationIsPortrait(interfaceOrientation))
    {
        return CGRectMake(mainScreenBounds.origin.x, mainScreenBounds.origin.y + statusBarOffset, MIN(mainScreenBounds.size.width, mainScreenBounds.size.height), MAX(mainScreenBounds.size.width, mainScreenBounds.size.height) - statusBarOffset);
    }
    else
    {
        return CGRectMake(mainScreenBounds.origin.x, mainScreenBounds.origin.y + statusBarOffset, MAX(mainScreenBounds.size.width, mainScreenBounds.size.height), MIN(mainScreenBounds.size.width, mainScreenBounds.size.height) - statusBarOffset);
    }
}

/**
 *  @inheritDoc
 */
+ (CGRect)frameOfStatusBarForInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    CGRect mainScreenBounds = [[UIScreen mainScreen] bounds];
    CGRect statusBarFrame = [[UIApplication sharedApplication] statusBarFrame];

    if (UIInterfaceOrientationIsPortrait(interfaceOrientation))
    {
        return CGRectMake(statusBarFrame.origin.x, statusBarFrame.origin.y, MIN(mainScreenBounds.size.width, mainScreenBounds.size.height), MIN(statusBarFrame.size.width, statusBarFrame.size.height));
    }
    else
    {
        return CGRectMake(statusBarFrame.origin.x, statusBarFrame.origin.y, MAX(mainScreenBounds.size.width, mainScreenBounds.size.height), MIN(statusBarFrame.size.width, statusBarFrame.size.height));
    }
}

/**
 *  @inheritDoc
 */
+ (CGFloat)aspectRatioOfViewport
{
    CGSize viewportSize = [VSViewportUtil frameOfViewportForInterfaceOrientation:UIInterfaceOrientationPortrait].size;

    return MAX(viewportSize.width, viewportSize.height)/MIN(viewportSize.width, viewportSize.height);
}

/**
 *  @inheritDoc
 */
+ (CGFloat)aspectRatioOfType:(VSViewportAspectRatioType)type
{
    switch (type)
    {
        case VSViewportAspectRatioType5_4:
        {
            return 5.0/4.0;
        }

        case VSViewportAspectRatioType4_3:
        {
            return 4.0/3.0;
        }

        case VSViewportAspectRatioType16_10:
        {
            return 16.0/10.0;
        }

        case VSViewportAspectRatioType16_9:
        {
            return 16.0/9.0;
        }

        case VSViewportAspectRatioTypeUnknown:
        default:
        {
            return 0.0;
        }
    }
}

/**
 *  @inheritDoc
 */
+ (UIInterfaceOrientation)orientationOfViewport
{
    return [[UIApplication sharedApplication] statusBarOrientation];
}

/**
 *  @inheritDoc
 */
+ (UIInterfaceOrientation)interfaceOrientationFromInterfaceOrientationMask:(UIInterfaceOrientationMask)interfaceOrientationMask
{
    switch (interfaceOrientationMask)
    {
        case UIInterfaceOrientationMaskLandscapeLeft:
            return UIInterfaceOrientationLandscapeLeft;

        case UIInterfaceOrientationMaskLandscapeRight:
            return UIInterfaceOrientationLandscapeRight;

        case UIInterfaceOrientationMaskPortraitUpsideDown:
            return UIInterfaceOrientationPortraitUpsideDown;

        case UIInterfaceOrientationMaskPortrait:
            return UIInterfaceOrientationPortrait;

        case UIInterfaceOrientationMaskLandscape:
            return (UIInterfaceOrientationMaskLandscapeLeft|UIInterfaceOrientationMaskLandscapeRight);

        case UIInterfaceOrientationMaskAll:
            return (UIInterfaceOrientationMaskPortrait|UIInterfaceOrientationMaskLandscapeLeft|UIInterfaceOrientationMaskLandscapeRight|UIInterfaceOrientationMaskPortraitUpsideDown);

        case UIInterfaceOrientationMaskAllButUpsideDown:
            return (UIInterfaceOrientationMaskPortrait|UIInterfaceOrientationMaskLandscapeLeft|UIInterfaceOrientationMaskLandscapeRight);
    }
}

/**
 *  @inheritDoc
 */
+ (UIInterfaceOrientationMask)interfaceOrientationMaskFromInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (1 << interfaceOrientation);
}

@end
