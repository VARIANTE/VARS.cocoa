/**
 *  VARS
 *  (c) VARIANTE <http://variante.io>
 *
 *  Utility for device-specific helper methods.
 *
 *  This software is released under the MIT License:
 *  http://www.opensource.org/licenses/mit-license.php
 */

#import <Foundation/Foundation.h>

NS_ROOT_CLASS @interface VSDeviceUtil

/**
 *  Gets the device model (i.e. iPhone7,1).
 *
 *  @return Device model.
 */
+ (NSString *)deviceModel;

/**
 *  Gets the device model name (i.e. iPhone 6 Plus).
 *
 *  @return Device model name.
 */
+ (NSString *)deviceModelName;

@end
