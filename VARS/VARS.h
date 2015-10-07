/**
 *  VARS
 *  (c) VARIANTE <http://variante.io>
 *
 *  This software is released under the MIT License:
 *  http://www.opensource.org/licenses/mit-license.php
 */

#if TARGET_OS_MAC
#import <Cocoa/Cocoa.h>
#elseif TARGET_OS_WATCH
#import <WatchKit/WatchKit.h>
#else
#import <UIKit/UIKit.h>
#endif

//! Project version number for VARS.
FOUNDATION_EXPORT double VARSVersionNumber;

//! Project version string for VARS.
FOUNDATION_EXPORT const unsigned char VARSVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <VARS/PublicHeader.h>

#import "VARS/vsdebug.h"
#import "VARS/vsmem.h"
#import "VARS/vsmath.h"

#import "VARS/VSArrayUtil.h"
#import "VARS/VSCalculusUtil.h"
#import "VARS/VSMathUtil.h"
#import "VARS/VSNumberUtil.h"
#import "VARS/VSStringUtil.h"