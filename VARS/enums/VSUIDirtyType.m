/**
 *  VARSobjc
 *  (c) VARIANTE <http://variante.io>
 *
 *  This software is released under the MIT License:
 *  http://www.opensource.org/licenses/mit-license.php
 */

#import "VSUIDirtyType.h"

#pragma mark - ENUMS

/*
 *  @inheritdoc
 */
NSString *NSStringFromVSUIDirtyType(VSUIDirtyType type)
{
    switch (type)
    {
        case VSUIDirtyTypeNone:        return @"VSUIDirtyTypeNone";
        case VSUIDirtyTypeLayout:      return @"VSUIDirtyTypeLayout";
        case VSUIDirtyTypeOrientation: return @"VSUIDirtyTypeOrientation";
        case VSUIDirtyTypeState:       return @"VSUIDirtyTypeState";
        case VSUIDirtyTypeData:        return @"VSUIDirtyTypeData";
        case VSUIDirtyTypeLocale:      return @"VSUIDirtyTypeLocale";
        case VSUIDirtyTypeDepth:       return @"VSUIDirtyTypeDepth";
        case VSUIDirtyTypeConfig:      return @"VSUIDirtyTypeConfig";
        case VSUIDirtyTypeStyle:       return @"VSUIDirtyTypeStyle";
        case VSUIDirtyTypeCustom:      return @"VSUIDirtyTypeCustom";
        case VSUIDirtyTypeMaxTypes:    return @"VSUIDirtyTypeMaxTypes";
        default:                       return @(type).stringValue;
    }
}