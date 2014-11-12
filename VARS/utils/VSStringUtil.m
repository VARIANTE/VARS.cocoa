/**
 *  VARSobjc
 *  (c) VARIANTE <http://variante.io>
 *
 *  This software is released under the MIT License:
 *  http://www.opensource.org/licenses/mit-license.php
 */

#import <math.h>

#import "vsmem.h"
#import "vsmath.h"

#import "VSMathUtil.h"
#import "VSStringUtil.h"

#pragma mark - ENUMS

/*
 *  @inheritdoc
 */
NSString *NSStringFromVSCharacterEncodingType(VSCharacterEncodingType type)
{
    switch (type)
    {
        case VSCharacterEncodingTypeUnknown:  return @"VSCharacterEncodingTypeUnknown";
        case VSCharacterEncodingTypeAscii:    return @"VSCharacterEncodingTypeAscii";
        case VSCharacterEncodingTypeUTF16:    return @"VSCharacterEncodingTypeUTF16";
        case VSCharacterEncodingTypeMaxTypes: return @"VSCharacterEncodingTypeMaxTypes";
        default:                              return @(type).stringValue;
    }
}

#pragma mark - IMPLEMENTATION

/*
 *  @inheritdoc
 */
@implementation VSStringUtil

#pragma mark - CLASS METHODS

/*
 *  @inheritdoc
 */
+ (BOOL)stringIsNilOrBlank:(NSString *)aString
{
    return ((aString == nil) || [aString isEqualToString:@""]);
}

/*
 *  @inheritdoc
 */
+ (unsigned long)occurancesOfString:(NSString *)aSubstring inString:(NSString *)aString
{
    if ([VSStringUtil stringIsNilOrBlank:aSubstring]) return 0;
    if ([VSStringUtil stringIsNilOrBlank:aString]) return 0;

    return (aString.length - [aString stringByReplacingOccurrencesOfString:aSubstring withString:@""].length);
}

#pragma mark - Type Conversion

/*
 *  @inheritdoc
 */
+ (NSString *)binaryFromUnsignedLongLong:(unsigned long long)anUnsignedLongLong
{
    return [VSStringUtil binaryFromUnsignedLongLong:anUnsignedLongLong groupingSize:4 groupingSeparator:@"|"];
}

/*
 *  @inheritdoc
 */
+ (NSString *)binaryFromUnsignedLongLong:(unsigned long long)anUnsignedLongLong groupingSize:(unsigned int)groupingSize groupingSeparator:(NSString *)groupingSeparator
{
    NSMutableString *binary = [[NSMutableString alloc] init];
    int binaryDigit = 0;

    if (groupingSize == 0) groupingSize = 8;
    if (groupingSeparator == nil) groupingSeparator = @"";

    while (binaryDigit < 64)
    {
        binaryDigit++;

        [binary insertString:((anUnsignedLongLong & 1) ? @"1 " : @"0 ") atIndex:0];

        if (binaryDigit % groupingSize == 0 && binaryDigit != 64)
        {
            [binary insertString:groupingSeparator atIndex:0];
        }

        anUnsignedLongLong = anUnsignedLongLong >> 1;
    }

#if !__has_feature(objc_arc)
    return [binary autorelease];
#else
    return binary;
#endif
}

/*
 *  @inheritdoc
 */
+ (NSString *)stringFromDouble:(double)aDouble
{
    return [VSStringUtil stringFromDouble:aDouble numericFormatSpecifier:nil exponentSymbol:nil NANSymbol:nil];
}

/*
 *  @inheritdoc
 */
+ (NSString *)stringFromDouble:(double)aDouble numericFormatSpecifier:(NSString *)numericFormatSpecifier exponentSymbol:(NSString *)exponentSymbol NANSymbol:(NSString *)NANSymbol
{
    if (numericFormatSpecifier == nil) numericFormatSpecifier = VS_N_NUMERIC_FORMAT_DOUBLE;
    if (exponentSymbol == nil) exponentSymbol = VS_M_SYMBOL_SCIENTIFIC_NOTATION;
    if (NANSymbol == nil) NANSymbol = VS_M_SYMBOL_NAN;

    if (isnan(aDouble))
    {
        return NANSymbol;
    }
    else
    {
        return [[NSString stringWithFormat:numericFormatSpecifier, aDouble] stringByReplacingOccurrencesOfString:@"e" withString:exponentSymbol];
    }
}

/*
 *  @inheritdoc
 */
+ (NSString *)stringFromDouble:(double)aDouble numberFormatter:(NSNumberFormatter *)aNumberFormatter
{
    if (aNumberFormatter == nil)
    {
        return [VSStringUtil stringFromDouble:aDouble];
    }
    else
    {
        return [aNumberFormatter stringFromNumber:[NSNumber numberWithDouble:aDouble]];
    }
}

/*
 *  @inheritdoc
 */
+ (NSString *)stringFromDouble:(double)aDouble inMultiplesOfConstant:(NSString *)symbol
{
    return [VSStringUtil stringFromDouble:aDouble inMultiplesOfConstant:symbol numericFormatSpecifier:nil];
}

/*
 *  @inheritdoc
 */
+ (NSString *)stringFromDouble:(double)aDouble inMultiplesOfConstant:(NSString *)symbol numericFormatSpecifier:(NSString *)numericFormatSpecifier
{
    if (numericFormatSpecifier == nil) numericFormatSpecifier = VS_N_NUMERIC_FORMAT_DOUBLE;

    VSMathSymbolType symbolType = [VSMathUtil typeOfSymbol:symbol];
    VSMathTokenType tokenType = [VSMathUtil typeOfToken:symbol];

    if (tokenType != VSMathTokenTypeConstant)
    {
        return [VSStringUtil stringFromDouble:aDouble numericFormatSpecifier:numericFormatSpecifier exponentSymbol:nil NANSymbol:nil];
    }

    double multiplier = NAN;

    switch (symbolType)
    {
        case VSMathSymbolTypePi:
        {
            multiplier = aDouble/M_PI;
            break;
        }
        case VSMathSymbolTypeEuler:
        {
            multiplier = aDouble/M_E;
            break;
        }
        default:
        {
            return [VSStringUtil stringFromDouble:aDouble numericFormatSpecifier:numericFormatSpecifier exponentSymbol:nil NANSymbol:nil];
        }
    }

    NSString *prefix = [VSStringUtil stringFromDouble:multiplier numericFormatSpecifier:numericFormatSpecifier exponentSymbol:nil NANSymbol:nil];

    if ([prefix isEqualToString:@"1"])
    {
        prefix = @"";
    }
    else if ([prefix isEqualToString:@"-1"])
    {
        prefix = VS_M_SYMBOL_NEGATIVE;
    }

    if ([prefix isEqualToString:@"0"])
    {
        return @"0";
    }
    else
    {
        return [prefix stringByAppendingString:symbol];
    }
}

/*
 *  @inheritdoc
 */
+ (NSString *)stringFromDouble:(double)aDouble inMultiplesOfConstant:(NSString *)symbol numberFormatter:(NSNumberFormatter *)aNumberFormatter
{
    if (aNumberFormatter == nil)
    {
        return [VSStringUtil stringFromDouble:aDouble inMultiplesOfConstant:symbol];
    }
    else
    {
        VSMathSymbolType symbolType = [VSMathUtil typeOfSymbol:symbol];
        VSMathTokenType tokenType = [VSMathUtil typeOfToken:symbol];

        if (tokenType != VSMathTokenTypeConstant)
        {
            return [VSStringUtil stringFromDouble:aDouble numberFormatter:aNumberFormatter];
        }

        double multiplier = NAN;

        switch (symbolType)
        {
            case VSMathSymbolTypePi:
            {
                multiplier = aDouble/M_PI;
                break;
            }
            case VSMathSymbolTypeEuler:
            {
                multiplier = aDouble/M_E;
                break;
            }
            default:
            {
                return [VSStringUtil stringFromDouble:aDouble numberFormatter:aNumberFormatter];
            }
        }

        NSString *prefix = [VSStringUtil stringFromDouble:multiplier numberFormatter:aNumberFormatter];

        if ([prefix isEqualToString:@"1"])
        {
            prefix = @"";
        }
        else if ([prefix isEqualToString:@"-1"])
        {
            prefix = VS_M_SYMBOL_NEGATIVE;
        }

        if ([prefix isEqualToString:@"0"])
        {
            return @"0";
        }
        else
        {
            return [prefix stringByAppendingString:symbol];
        }
    }
}

/*
 *  @inheritdoc
 */
+ (NSString *)stringFromUnsignedLong:(unsigned long)anUnsignedLong
{
    return [VSStringUtil stringFromUnsignedLong:anUnsignedLong numericFormatSpecifier:nil];
}

/*
 *  @inheritdoc
 */
+ (NSString *)stringFromUnsignedLong:(unsigned long)anUnsignedLong numericFormatSpecifier:(NSString *)numericFormatSpecifier
{
    if (numericFormatSpecifier == nil) numericFormatSpecifier = VS_N_NUMERIC_FORMAT_UNSIGNED_LONG_DECIMAL;

    return [NSString stringWithFormat:numericFormatSpecifier, anUnsignedLong];
}

/*
 *  @inheritdoc
 */
+ (NSString *)stringFromUnsignedLong:(unsigned long)anUnsignedLong numberFormatter:(NSNumberFormatter *)aNumberFormatter
{
    if (aNumberFormatter == nil)
    {
        return [VSStringUtil stringFromUnsignedLong:anUnsignedLong];
    }
    else
    {
        return [aNumberFormatter stringFromNumber:[NSNumber numberWithUnsignedLong:anUnsignedLong]];
    }
}

/*
 *  @inheritdoc
 */
+ (NSString *)stringFromUnsignedLong:(unsigned long)anUnsignedLong numberSystem:(VSNumberSystemType)numberSystemType
{
    switch (numberSystemType)
    {
        case VSNumberSystemTypeHexadecimal:
        {
            return [NSString stringWithFormat:@"%@%@", VS_N_HEXADECIMAL_PREFIX, [NSString stringWithFormat:VS_N_NUMERIC_FORMAT_UNSIGNED_LONG_HEXADECIMAL, anUnsignedLong]];
        }

        case VSNumberSystemTypeOctal:
        {
            return [NSString stringWithFormat:VS_N_NUMERIC_FORMAT_UNSIGNED_LONG_OCTAL, anUnsignedLong];
        }

        case VSNumberSystemTypeDecimal:
        default:
        {
            return [VSStringUtil stringFromUnsignedLongLong:anUnsignedLong];
        }
    }
}

/*
 *  @inheritdoc
 */
+ (NSString *)stringFromUnsignedLongLong:(unsigned long long)anUnsignedLongLong
{
    return [VSStringUtil stringFromUnsignedLongLong:anUnsignedLongLong numericFormatSpecifier:nil];
}

/*
 *  @inheritdoc
 */
+ (NSString *)stringFromUnsignedLongLong:(unsigned long long)anUnsignedLongLong numericFormatSpecifier:(NSString *)numericFormatSpecifier
{
    if (numericFormatSpecifier == nil) numericFormatSpecifier = VS_N_NUMERIC_FORMAT_UNSIGNED_LONG_LONG_DECIMAL;

    return [NSString stringWithFormat:numericFormatSpecifier, anUnsignedLongLong];
}

/*
 *  @inheritdoc
 */
+ (NSString *)stringFromUnsignedLongLong:(unsigned long long)anUnsignedLongLong numberFormatter:(NSNumberFormatter *)aNumberFormatter
{
    if (aNumberFormatter == nil)
    {
        return [VSStringUtil stringFromUnsignedLongLong:anUnsignedLongLong];
    }
    else
    {
        return [aNumberFormatter stringFromNumber:[NSNumber numberWithUnsignedLongLong:anUnsignedLongLong]];
    }
}

/*
 *  @inheritdoc
 */
+ (NSString *)stringFromUnsignedLongLong:(unsigned long long)anUnsignedLongLong numberSystem:(VSNumberSystemType)numberSystemType
{
    switch (numberSystemType)
    {
        case VSNumberSystemTypeHexadecimal:
        {
            return [NSString stringWithFormat:@"%@%@", VS_N_HEXADECIMAL_PREFIX, [NSString stringWithFormat:VS_N_NUMERIC_FORMAT_UNSIGNED_LONG_LONG_HEXADECIMAL, anUnsignedLongLong]];
        }

        case VSNumberSystemTypeOctal:
        {
            return [NSString stringWithFormat:VS_N_NUMERIC_FORMAT_UNSIGNED_LONG_LONG_OCTAL, anUnsignedLongLong];
        }

        case VSNumberSystemTypeDecimal:
        default:
        {
            return [VSStringUtil stringFromUnsignedLongLong:anUnsignedLongLong];
        }
    }
}

#pragma mark - Character Encoding

/*
 *  @inheritdoc
 */
+ (unichar)subscriptUnicharFromUnsignedInt:(unsigned int)anUnsignedInteger
{
    if (anUnsignedInteger > 9)
    {
        return -1;
    }
    else
    {
        return 0x2080 + anUnsignedInteger;
    }
}

/*
 *  @inheritdoc
 */
+ (NSString *)encodedCharactersFromUnsignedLongLong:(unsigned long long)anUnsignedLongLong characterEncodingType:(VSCharacterEncodingType)characterEncodingType
{
    NSString *output = @"";

    switch (characterEncodingType)
    {
        case VSCharacterEncodingTypeAscii:
        {
            if ((anUnsignedLongLong >> 56) & 0xFF) output = [output stringByAppendingString:[NSString stringWithFormat:@"%C", (unsigned short)((anUnsignedLongLong >> 56) & 0xFF)]];
            if ((anUnsignedLongLong >> 48) & 0xFF) output = [output stringByAppendingString:[NSString stringWithFormat:@"%C", (unsigned short)((anUnsignedLongLong >> 48) & 0xFF)]];
            if ((anUnsignedLongLong >> 40) & 0xFF) output = [output stringByAppendingString:[NSString stringWithFormat:@"%C", (unsigned short)((anUnsignedLongLong >> 40) & 0xFF)]];
            if ((anUnsignedLongLong >> 32) & 0xFF) output = [output stringByAppendingString:[NSString stringWithFormat:@"%C", (unsigned short)((anUnsignedLongLong >> 32) & 0xFF)]];
            if ((anUnsignedLongLong >> 24) & 0xFF) output = [output stringByAppendingString:[NSString stringWithFormat:@"%C", (unsigned short)((anUnsignedLongLong >> 24) & 0xFF)]];
            if ((anUnsignedLongLong >> 16) & 0xFF) output = [output stringByAppendingString:[NSString stringWithFormat:@"%C", (unsigned short)((anUnsignedLongLong >> 16) & 0xFF)]];
            if ((anUnsignedLongLong >> 8)  & 0xFF) output = [output stringByAppendingString:[NSString stringWithFormat:@"%C", (unsigned short)((anUnsignedLongLong >> 8)  & 0xFF)]];
            if ((anUnsignedLongLong >> 0)  & 0xFF) output = [output stringByAppendingString:[NSString stringWithFormat:@"%C", (unsigned short)((anUnsignedLongLong >> 0)  & 0xFF)]];

            break;
        }

        case VSCharacterEncodingTypeUTF16:
        default:
        {
            if ((anUnsignedLongLong >> 48) & 0xFFFF) output = [output stringByAppendingString:[NSString stringWithFormat:@"%C", (unsigned short)((anUnsignedLongLong >> 48) & 0xFFFF)]];
            if ((anUnsignedLongLong >> 32) & 0xFFFF) output = [output stringByAppendingString:[NSString stringWithFormat:@"%C", (unsigned short)((anUnsignedLongLong >> 32) & 0xFFFF)]];
            if ((anUnsignedLongLong >> 16) & 0xFFFF) output = [output stringByAppendingString:[NSString stringWithFormat:@"%C", (unsigned short)((anUnsignedLongLong >> 16) & 0xFFFF)]];
            if ((anUnsignedLongLong >> 0)  & 0xFFFF) output = [output stringByAppendingString:[NSString stringWithFormat:@"%C", (unsigned short)((anUnsignedLongLong >> 0)  & 0xFFFF)]];

            break;
        }
    }

    return output;
}

@end
