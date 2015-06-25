/**
 *  VARS
 *  (c) VARIANTE <http://variante.io>
 *
 *  Utility for device-specific helper methods.
 *
 *  This software is released under the MIT License:
 *  http://www.opensource.org/licenses/mit-license.php
 */

#import <sys/utsname.h>

#import "VSDeviceUtil.h"

@implementation VSDeviceUtil

/**
 *  @inheritDoc
 */
+ (NSString *)deviceModel
{
    struct utsname systemInfo;
    uname(&systemInfo);

    return [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
}

/**
 *  @inheritDoc
 */
+ (NSString *)deviceModelName
{
    NSString *model = [VSDeviceUtil deviceModel];

    if ([model isEqualToString:@"i386"])            { return @"32-bit Simulator"; }
    else if ([model isEqualToString:@"x86_64"])     { return @"64-bit Simulator"; }
    else if ([model isEqualToString:@"iPod1,1"])    { return @"iPod Touch"; }
    else if ([model isEqualToString:@"iPod2,1"])    { return @"iPod Touch Second Generation"; }
    else if ([model isEqualToString:@"iPod3,1"])    { return @"iPod Touch Third Generation"; }
    else if ([model isEqualToString:@"iPod4,1"])    { return @"iPod Touch Fourth Generation"; }
    else if ([model isEqualToString:@"iPhone1,1"])  { return @"iPhone"; }
    else if ([model isEqualToString:@"iPhone1,2"])  { return @"iPhone 3G"; }
    else if ([model isEqualToString:@"iPhone2,1"])  { return @"iPhone 3GS"; }
    else if ([model isEqualToString:@"iPad1,1"])    { return @"iPad"; }
    else if ([model isEqualToString:@"iPad2,1"])    { return @"iPad 2"; }
    else if ([model isEqualToString:@"iPad3,1"])    { return @"3rd Generation iPad"; }
    else if ([model isEqualToString:@"iPhone3,1"])  { return @"iPhone 4 (GSM)"; }
    else if ([model isEqualToString:@"iPhone3,3"])  { return @"iPhone 4 (CDMA/Verizon/Sprint)"; }
    else if ([model isEqualToString:@"iPhone4,1"])  { return @"iPhone 4S"; }
    else if ([model isEqualToString:@"iPhone5,1"])  { return @"iPhone 5 (model A1428, AT&T/Canada)"; }
    else if ([model isEqualToString:@"iPhone5,2"])  { return @"iPhone 5 (model A1429, everything else)"; }
    else if ([model isEqualToString:@"iPad3,4"])    { return @"4th Generation iPad"; }
    else if ([model isEqualToString:@"iPad2,5"])    { return @"iPad Mini"; }
    else if ([model isEqualToString:@"iPhone5,3"])  { return @"iPhone 5c (model A1456, A1532 | GSM)"; }
    else if ([model isEqualToString:@"iPhone5,4"])  { return @"iPhone 5c (model A1507, A1516, A1526 (China), A1529 | Global)"; }
    else if ([model isEqualToString:@"iPhone6,1"])  { return @"iPhone 5s (model A1433, A1533 | GSM)"; }
    else if ([model isEqualToString:@"iPhone6,2"])  { return @"iPhone 5s (model A1457, A1518, A1528 (China), A1530 | Global)"; }
    else if ([model isEqualToString:@"iPad4,1"])    { return @"5th Generation iPad (iPad Air) - Wifi"; }
    else if ([model isEqualToString:@"iPad4,2"])    { return @"5th Generation iPad (iPad Air) - Cellular"; }
    else if ([model isEqualToString:@"iPad4,4"])    { return @"2nd Generation iPad Mini - Wifi"; }
    else if ([model isEqualToString:@"iPad4,5"])    { return @"2nd Generation iPad Mini - Cellular"; }
    else if ([model isEqualToString:@"iPhone7,1"])  { return @"iPhone 6 Plus"; }
    else if ([model isEqualToString:@"iPhone7,2"])  { return @"iPhone 6"; }
    else { return @"Unknown"; }
}


@end
