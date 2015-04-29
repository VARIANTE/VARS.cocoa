/**
 *  VARSobjc
 *  (c) VARIANTE <http://variante.io>
 *
 *  This software is released under the MIT License:
 *  http://www.opensource.org/licenses/mit-license.php
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  Enums of all numeral system types.
 */
typedef NS_ENUM(int, VSViewportAspectRatioType)
{
    VSViewportAspectRatioTypeUnknown = -1,
    VSViewportAspectRatioType5_4,
    VSViewportAspectRatioType4_3,
    VSViewportAspectRatioType16_10,
    VSViewportAspectRatioType16_9,
    VSViewportAspectRatioTypeMaxTypes
};

/**
 *  Translates VSViewportAspectRatioType to string.
 *
 *  @param type
 *
 *  @return NSString equivalent of the specified VSViewportAspectRatioType.
 */
NSString *NSStringFromVSViewportAspectRatioType(VSViewportAspectRatioType type);

#pragma mark - --------------------------------------------------------------------------

NS_ROOT_CLASS @interface VSViewportUtil

/**
 *  Gets the frame of the viewport at the current interface orientation.
 *
 *  @return CGRect object.
 */
+ (CGRect)frameOfViewport;

/**
 *  Gets the frame of the viewport at the current interface orientation with the option to account for the status bar.
 *
 *  @param withStatusBar
 *
 *  @return CGRect object.
 */
+ (CGRect)frameOfViewportWithStatusBar:(BOOL)withStatusBar;

/**
 *  Gets the frame of the viewport for the specified interface orientation.
 *
 *  @param interfaceOrientation
 *
 *  @return CGRect object.
 */
+ (CGRect)frameOfViewportForInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation;

/**
 *  Gets the frame of the viewport for the specified interface orientation with the option to account for the status bar.
 *
 *  @param interfaceOrientation
 *  @param withStatusBar
 *
 *  @return CGRect object.
 */
+ (CGRect)frameOfViewportForInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation withStatusBar:(BOOL)withStatusBar;

/**
 *  Gets the frame of the status bar for the specified interface orientation.
 *
 *  @param interfaceOrientation
 *
 *  @return CGRect object.
 */
+ (CGRect)frameOfStatusBarForInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation;

/**
 *  Gets the aspect ratio of the viewport.
 *
 *  @return CGFloat value.
 */
+ (CGFloat)aspectRatioOfViewport;

/**
 *  Gets the aspect ratio of the specified VSViewportAspectRatioType.
 *
 *  @param type
 *
 *  @return CGFloat value.
 */
+ (CGFloat)aspectRatioOfType:(VSViewportAspectRatioType)type;

/**
 *  Gets the current interface orientation of the viewport.
 *
 *  @return UIInterfaceOrientation value.
 */
+ (UIInterfaceOrientation)orientationOfViewport;

/**
 *  Converts a UIInterfaceOrientationMask enum to a UIInterfaceOrientation enum.
 *
 *  @param interfaceOrientationMask
 *
 *  @return The UIInterfaceOrientation equivalent.
 */
+ (UIInterfaceOrientation)interfaceOrientationFromInterfaceOrientationMask:(UIInterfaceOrientationMask)interfaceOrientationMask;

/**
 *  Converts a UIInterfaceOrientation enum to a UIInterfaceOrientationMask enum.
 *
 *  @param interfaceOrientation
 *
 *  @return The UIInterfaceOrientationMask equivalent.
 */
+ (UIInterfaceOrientationMask)interfaceOrientationMaskFromInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation;

@end
