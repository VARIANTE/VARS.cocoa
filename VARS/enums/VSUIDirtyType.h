/**
 *  VARSobjc
 *  (c) VARIANTE <http://variante.io>
 *
 *  This software is released under the MIT License:
 *  http://www.opensource.org/licenses/mit-license.php
 */

#import <Foundation/Foundation.h>

#pragma mark - ENUMS

/**
 *  All dirty invalidation types.
 *
 *  @see VSUIViewUpdate
 */
typedef NS_ENUM(unsigned int, VSUIDirtyType)
{
    VSUIDirtyTypeNone        = 0x00000000,
    VSUIDirtyTypeLayout      = 1 << 0,
    VSUIDirtyTypeOrientation = 1 << 1,
    VSUIDirtyTypeState       = 1 << 2,
    VSUIDirtyTypeData        = 1 << 3,
    VSUIDirtyTypeLocale      = 1 << 4,
    VSUIDirtyTypeDepth       = 1 << 5,
    VSUIDirtyTypeConfig      = 1 << 6,
    VSUIDirtyTypeStyle       = 1 << 7,
    VSUIDirtyTypeCustom      = 1 << 8,
    VSUIDirtyTypeMaxTypes    = 0xFFFFFFFF
};

/**
 *  Translates VSUIDirtyType to string.
 *
 *  @param type
 *
 *  @return NSString equivalent of the specified VSUIDirtyType.
 */
NSString *NSStringFromVSUIDirtyType(VSUIDirtyType type);
