/**
 *  VARSobjc
 *  (c) VARIANTE <http://variante.io>
 *
 *  This software is released under the MIT License:
 *  http://www.opensource.org/licenses/mit-license.php
 */

#import "VSUIDirtyType.h"

#pragma mark - ENUMS

/**
 *  @inheritDoc
 */
NSString *NSStringFromVSUIDirtyType(VSUIDirtyType type)
{
    switch (type)
    {
        case VSUIDirtyTypeNone:     return @"VSUIDirtyTypeNone";
        case VSUIDirtyTypeMaxTypes: return @"VSUIDirtyTypeMaxTypes";
        default:
        {
            NSString *o = @"";

            for (unsigned int i = 0; i < sizeof(type)*CHAR_BIT; i++)
            {
                unsigned int bit = (type >> i) & 1;

                if (bit)
                {
                    switch (1<<i)
                    {
                        case VSUIDirtyTypeLayout:
                        {
                            o = [o stringByAppendingString:@"VSUIDirtyTypeLayout|"];
                            break;
                        }

                        case VSUIDirtyTypeOrientation:
                        {
                            o = [o stringByAppendingString:@"VSUIDirtyTypeOrientation|"];
                            break;
                        }

                        case VSUIDirtyTypeState:
                        {
                            o = [o stringByAppendingString:@"VSUIDirtyTypeState|"];
                            break;
                        }

                        case VSUIDirtyTypeData:
                        {
                            o = [o stringByAppendingString:@"VSUIDirtyTypeData|"];
                            break;
                        }

                        case VSUIDirtyTypeLocale:
                        {
                            o = [o stringByAppendingString:@"VSUIDirtyTypeLocale|"];
                            break;
                        }

                        case VSUIDirtyTypeDepth:
                        {
                            o = [o stringByAppendingString:@"VSUIDirtyTypeDepth|"];
                            break;
                        }

                        case VSUIDirtyTypeConfig:
                        {
                            o = [o stringByAppendingString:@"VSUIDirtyTypeConfig|"];
                            break;
                        }

                        case VSUIDirtyTypeStyle:
                        {
                            o = [o stringByAppendingString:@"VSUIDirtyTypeStyle|"];
                            break;
                        }

                        case VSUIDirtyTypeMode:
                        {
                            o = [o stringByAppendingString:@"VSUIDirtyTypeMode|"];
                            break;
                        }

                        case VSUIDirtyTypeCustom:
                        {
                            o = [o stringByAppendingString:@"VSUIDirtyTypeCustom|"];
                            break;
                        }

                        default:
                        {
                            o = [o stringByAppendingString:[NSString stringWithFormat:@"%@|", @(1<<i).stringValue]];
                            break;
                        }
                    }
                }
            }

            if ([o isEqualToString:@""])
            {
                return @(type).stringValue;
            }
            else
            {
                return [o substringToIndex:o.length - 1];
            }
        }
    }
}