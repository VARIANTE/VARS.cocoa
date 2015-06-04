/**
 *  VARS
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

/**
 *  @inheritDoc
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

#pragma mark - --------------------------------------------------------------------------

@implementation VSStringUtil

#pragma mark - Validating

/**
 *  @inheritDoc
 */
+ (BOOL)stringIsNilOrBlank:(NSString *)aString
{
    return ((aString == nil) || [aString isEqualToString:@""]);
}

/**
 *  @inheritDoc
 */
+ (unsigned long)occurancesOfString:(NSString *)aSubstring inString:(NSString *)aString
{
    if ([VSStringUtil stringIsNilOrBlank:aSubstring]) return 0;
    if ([VSStringUtil stringIsNilOrBlank:aString]) return 0;

    return (aString.length - [aString stringByReplacingOccurrencesOfString:aSubstring withString:@""].length);
}

#pragma mark - Versioning

/**
 *  @inheritDoc
 */
+ (BOOL)stringIsVersionNumber:(NSString *)aString
{
    if ([VSStringUtil stringIsNilOrBlank:aString]) return NO;

    NSError *error = nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"^(\\d+)(?:\\.(\\d+))*$" options:NSRegularExpressionCaseInsensitive error:&error];

    return ([regex numberOfMatchesInString:aString options:0 range:NSMakeRange(0, aString.length)] > 0);
}

/**
 *  @inheritDoc
 */
+ (BOOL)version:(NSString *)version isEarlierThanVersion:(NSString *)targetVersion
{
    if (![VSStringUtil stringIsVersionNumber:version] || ![VSStringUtil stringIsVersionNumber:targetVersion]) return NO;

    NSArray *parts1 = [version componentsSeparatedByString:@"."];
    NSArray *parts2 = [targetVersion componentsSeparatedByString:@"."];

    NSUInteger count1 = parts1.count;
    NSUInteger count2 = parts2.count;

    for (uint i = 0; i < count1; i++)
    {
        int part1 = [(NSString *)parts1[i] intValue];

        if (i < count2)
        {
            int part2 = [(NSString *)parts2[i] intValue];

            if (part2 > part1)
            {
                return YES;
            }
            else if (part2 < part1)
            {
                return NO;
            }
        }
        else
        {
            return NO;
        }
    }

    return NO;
}

/**
 *  @inheritDoc
 */
+ (BOOL)version:(NSString *)version isEqualToVersion:(NSString *)targetVersion
{
    if (![VSStringUtil stringIsVersionNumber:version] || ![VSStringUtil stringIsVersionNumber:targetVersion]) return NO;

    NSArray *parts1 = [version componentsSeparatedByString:@"."];
    NSArray *parts2 = [targetVersion componentsSeparatedByString:@"."];

    NSUInteger count1 = parts1.count;
    NSUInteger count2 = parts2.count;

    for (uint i = 0; i < count1; i++)
    {
        int part1 = [(NSString *)parts1[i] intValue];

        if (i < count2)
        {
            int part2 = [(NSString *)parts2[i] intValue];

            if (part2 != part1)
            {
                return NO;
            }
        }
        else
        {
            NSArray *remainders = [parts1 subarrayWithRange:NSMakeRange(i, count1-i)];
            int sum = [[remainders valueForKeyPath:@"@sum.self"] intValue];

            if (sum != 0)
            {
                return NO;
            }
        }
    }

    if (count2 > count1)
    {
        NSArray *remainders = [parts2 subarrayWithRange:NSMakeRange(count1, count2-count1)];
        int sum = [[remainders valueForKeyPath:@"@sum.self"] intValue];

        if (sum != 0)
        {
            return NO;
        }
    }

    return YES;
}

/**
 *  @inheritDoc
 */
+ (BOOL)version:(NSString *)version isNewerThanVersion:(NSString *)targetVersion
{
    if (![VSStringUtil stringIsVersionNumber:version] || ![VSStringUtil stringIsVersionNumber:targetVersion]) return NO;

    NSArray *parts1 = [version componentsSeparatedByString:@"."];
    NSArray *parts2 = [targetVersion componentsSeparatedByString:@"."];

    NSUInteger count1 = parts1.count;
    NSUInteger count2 = parts2.count;

    for (uint i = 0; i < count1; i++)
    {
        int part1 = [(NSString *)parts1[i] intValue];

        if (i < count2)
        {
            int part2 = [(NSString *)parts2[i] intValue];

            if (part2 > part1)
            {
                return NO;
            }
            else if (part2 < part1)
            {
                return YES;
            }
        }
        else
        {
            return YES;
        }
    }

    return NO;
}

#pragma mark - Type Conversion

/**
 *  @inheritDoc
 */
+ (NSString *)stringFromDouble:(double)aDouble
{
    return [VSStringUtil stringFromDouble:aDouble numericFormatSpecifier:nil exponentSymbol:nil NANSymbol:nil];
}

/**
 *  @inheritDoc
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

/**
 *  @inheritDoc
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

/**
 *  @inheritDoc
 */
+ (NSString *)stringFromDouble:(double)aDouble inMultiplesOfConstant:(NSString *)symbol
{
    return [VSStringUtil stringFromDouble:aDouble inMultiplesOfConstant:symbol numericFormatSpecifier:nil];
}

/**
 *  @inheritDoc
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

/**
 *  @inheritDoc
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

/**
 *  @inheritDoc
 */
+ (NSString *)stringFromUnsignedChar:(unsigned char)anUnsignedChar
{
    return [VSStringUtil stringFromUnsignedShort:anUnsignedChar numericFormatSpecifier:nil];
}

/**
 *  @inheritDoc
 */
+ (NSString *)stringFromUnsignedChar:(unsigned char)anUnsignedChar numericFormatSpecifier:(NSString *)numericFormatSpecifier
{
    if (numericFormatSpecifier == nil) numericFormatSpecifier = VS_N_NUMERIC_FORMAT_UNSIGNED_CHAR_DECIMAL;

    return [NSString stringWithFormat:numericFormatSpecifier, anUnsignedChar];
}

/**
 *  @inheritDoc
 */
+ (NSString *)stringFromUnsignedChar:(unsigned char)anUnsignedChar numberFormatter:(NSNumberFormatter *)aNumberFormatter
{
    if (aNumberFormatter == nil)
    {
        return [VSStringUtil stringFromUnsignedChar:anUnsignedChar];
    }
    else
    {
        return [aNumberFormatter stringFromNumber:[NSNumber numberWithUnsignedChar:anUnsignedChar]];
    }
}

/**
 *  @inheritDoc
 */
+ (NSString *)stringFromUnsignedChar:(unsigned char)anUnsignedChar numberSystem:(VSNumberSystemType)numberSystemType
{
    switch (numberSystemType)
    {
        case VSNumberSystemTypeHexadecimal:
        {
            return [NSString stringWithFormat:@"%@%@", VS_N_HEXADECIMAL_PREFIX, [NSString stringWithFormat:VS_N_NUMERIC_FORMAT_UNSIGNED_LONG_HEXADECIMAL, (unsigned long)anUnsignedChar]];
        }

        case VSNumberSystemTypeOctal:
        {
            return [NSString stringWithFormat:VS_N_NUMERIC_FORMAT_UNSIGNED_LONG_OCTAL, (unsigned long)anUnsignedChar];
        }

        case VSNumberSystemTypeBinary:
        {
            NSString *output = @"";
            NSString *buffer = @"";

            unsigned long n = sizeof(unsigned int) * 8;

            for (unsigned long i = 0; i < n; i++)
            {
                unsigned int bit = (anUnsignedChar & 1);

                buffer = [((bit) ? @"1" : @"0") stringByAppendingString:buffer];

                if (bit)
                {
                    output = [buffer stringByAppendingString:output];
                    buffer = @"";
                }

                anUnsignedChar >>= 1;
            }

            if ([VSStringUtil stringIsNilOrBlank:output])
            {
                output = @"0";
            }

            return output;
        }

        case VSNumberSystemTypeDecimal:
        default:
        {
            return [VSStringUtil stringFromUnsignedChar:anUnsignedChar];
        }
    }
}

/**
 *  @inheritDoc
 */
+ (NSString *)stringFromUnsignedShort:(unsigned short)anUnsignedShort
{
    return [VSStringUtil stringFromUnsignedShort:anUnsignedShort numericFormatSpecifier:nil];
}

/**
 *  @inheritDoc
 */
+ (NSString *)stringFromUnsignedShort:(unsigned short)anUnsignedShort numericFormatSpecifier:(NSString *)numericFormatSpecifier
{
    if (numericFormatSpecifier == nil) numericFormatSpecifier = VS_N_NUMERIC_FORMAT_UNSIGNED_SHORT_DECIMAL;

    return [NSString stringWithFormat:numericFormatSpecifier, anUnsignedShort];
}

/**
 *  @inheritDoc
 */
+ (NSString *)stringFromUnsignedShort:(unsigned short)anUnsignedShort numberFormatter:(NSNumberFormatter *)aNumberFormatter
{
    if (aNumberFormatter == nil)
    {
        return [VSStringUtil stringFromUnsignedShort:anUnsignedShort];
    }
    else
    {
        return [aNumberFormatter stringFromNumber:[NSNumber numberWithUnsignedShort:anUnsignedShort]];
    }
}

/**
 *  @inheritDoc
 */
+ (NSString *)stringFromUnsignedShort:(unsigned short)anUnsignedShort numberSystem:(VSNumberSystemType)numberSystemType
{
    switch (numberSystemType)
    {
        case VSNumberSystemTypeHexadecimal:
        {
            return [NSString stringWithFormat:@"%@%@", VS_N_HEXADECIMAL_PREFIX, [NSString stringWithFormat:VS_N_NUMERIC_FORMAT_UNSIGNED_LONG_HEXADECIMAL, (unsigned long)anUnsignedShort]];
        }

        case VSNumberSystemTypeOctal:
        {
            return [NSString stringWithFormat:VS_N_NUMERIC_FORMAT_UNSIGNED_LONG_OCTAL, (unsigned long)anUnsignedShort];
        }

        case VSNumberSystemTypeBinary:
        {
            NSString *output = @"";
            NSString *buffer = @"";

            unsigned long n = sizeof(unsigned int) * 8;

            for (unsigned long i = 0; i < n; i++)
            {
                unsigned int bit = (anUnsignedShort & 1);

                buffer = [((bit) ? @"1" : @"0") stringByAppendingString:buffer];

                if (bit)
                {
                    output = [buffer stringByAppendingString:output];
                    buffer = @"";
                }

                anUnsignedShort >>= 1;
            }

            if ([VSStringUtil stringIsNilOrBlank:output])
            {
                output = @"0";
            }

            return output;
        }

        case VSNumberSystemTypeDecimal:
        default:
        {
            return [VSStringUtil stringFromUnsignedShort:anUnsignedShort];
        }
    }
}

/**
 *  @inheritDoc
 */
+ (NSString *)stringFromUnsignedInt:(unsigned int)anUnsignedInt
{
    return [VSStringUtil stringFromUnsignedInt:anUnsignedInt numericFormatSpecifier:nil];
}

/**
 *  @inheritDoc
 */
+ (NSString *)stringFromUnsignedInt:(unsigned int)anUnsignedInt numericFormatSpecifier:(NSString *)numericFormatSpecifier
{
    if (numericFormatSpecifier == nil) numericFormatSpecifier = VS_N_NUMERIC_FORMAT_UNSIGNED_INT_DECIMAL;

    return [NSString stringWithFormat:numericFormatSpecifier, anUnsignedInt];
}

/**
 *  @inheritDoc
 */
+ (NSString *)stringFromUnsignedInt:(unsigned int)anUnsignedInt numberFormatter:(NSNumberFormatter *)aNumberFormatter
{
    if (aNumberFormatter == nil)
    {
        return [VSStringUtil stringFromUnsignedInt:anUnsignedInt];
    }
    else
    {
        return [aNumberFormatter stringFromNumber:[NSNumber numberWithUnsignedInt:anUnsignedInt]];
    }
}

/**
 *  @inheritDoc
 */
+ (NSString *)stringFromUnsignedInt:(unsigned int)anUnsignedInt numberSystem:(VSNumberSystemType)numberSystemType
{
    switch (numberSystemType)
    {
        case VSNumberSystemTypeHexadecimal:
        {
            return [NSString stringWithFormat:@"%@%@", VS_N_HEXADECIMAL_PREFIX, [NSString stringWithFormat:VS_N_NUMERIC_FORMAT_UNSIGNED_LONG_HEXADECIMAL, (unsigned long)anUnsignedInt]];
        }

        case VSNumberSystemTypeOctal:
        {
            return [NSString stringWithFormat:VS_N_NUMERIC_FORMAT_UNSIGNED_LONG_OCTAL, (unsigned long)anUnsignedInt];
        }

        case VSNumberSystemTypeBinary:
        {
            NSString *output = @"";
            NSString *buffer = @"";

            unsigned long n = sizeof(unsigned int) * 8;

            for (unsigned long i = 0; i < n; i++)
            {
                unsigned int bit = (anUnsignedInt & 1);

                buffer = [((bit) ? @"1" : @"0") stringByAppendingString:buffer];

                if (bit)
                {
                    output = [buffer stringByAppendingString:output];
                    buffer = @"";
                }

                anUnsignedInt >>= 1;
            }

            if ([VSStringUtil stringIsNilOrBlank:output])
            {
                output = @"0";
            }

            return output;
        }

        case VSNumberSystemTypeDecimal:
        default:
        {
            return [VSStringUtil stringFromUnsignedInt:anUnsignedInt];
        }
    }
}

/**
 *  @inheritDoc
 */
+ (NSString *)stringFromUnsignedLong:(unsigned long)anUnsignedLong
{
    return [VSStringUtil stringFromUnsignedLong:anUnsignedLong numericFormatSpecifier:nil];
}

/**
 *  @inheritDoc
 */
+ (NSString *)stringFromUnsignedLong:(unsigned long)anUnsignedLong numericFormatSpecifier:(NSString *)numericFormatSpecifier
{
    if (numericFormatSpecifier == nil) numericFormatSpecifier = VS_N_NUMERIC_FORMAT_UNSIGNED_LONG_DECIMAL;

    return [NSString stringWithFormat:numericFormatSpecifier, anUnsignedLong];
}

/**
 *  @inheritDoc
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

/**
 *  @inheritDoc
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

        case VSNumberSystemTypeBinary:
        {
            NSString *output = @"";
            NSString *buffer = @"";

            unsigned long n = sizeof(unsigned long) * 8;

            for (unsigned long i = 0; i < n; i++)
            {
                unsigned int bit = (anUnsignedLong & 1);

                buffer = [((bit) ? @"1" : @"0") stringByAppendingString:buffer];

                if (bit)
                {
                    output = [buffer stringByAppendingString:output];
                    buffer = @"";
                }

                anUnsignedLong >>= 1;
            }

            if ([VSStringUtil stringIsNilOrBlank:output])
            {
                output = @"0";
            }

            return output;
        }

        case VSNumberSystemTypeDecimal:
        default:
        {
            return [VSStringUtil stringFromUnsignedLong:anUnsignedLong];
        }
    }
}

/**
 *  @inheritDoc
 */
+ (NSString *)stringFromUnsignedLongLong:(unsigned long long)anUnsignedLongLong
{
    return [VSStringUtil stringFromUnsignedLongLong:anUnsignedLongLong numericFormatSpecifier:nil];
}

/**
 *  @inheritDoc
 */
+ (NSString *)stringFromUnsignedLongLong:(unsigned long long)anUnsignedLongLong numericFormatSpecifier:(NSString *)numericFormatSpecifier
{
    if (numericFormatSpecifier == nil) numericFormatSpecifier = VS_N_NUMERIC_FORMAT_UNSIGNED_LONG_LONG_DECIMAL;

    return [NSString stringWithFormat:numericFormatSpecifier, anUnsignedLongLong];
}

/**
 *  @inheritDoc
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

/**
 *  @inheritDoc
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

        case VSNumberSystemTypeBinary:
        {
            NSString *output = @"";
            NSString *buffer = @"";

            unsigned long n = sizeof(unsigned long long) * 8;

            for (unsigned long i = 0; i < n; i++)
            {
                unsigned int bit = (anUnsignedLongLong & 1);

                buffer = [((bit) ? @"1" : @"0") stringByAppendingString:buffer];

                if (bit)
                {
                    output = [buffer stringByAppendingString:output];
                    buffer = @"";
                }

                anUnsignedLongLong >>= 1;
            }

            if ([VSStringUtil stringIsNilOrBlank:output])
            {
                output = @"0";
            }

            return output;
        }

        case VSNumberSystemTypeDecimal:
        default:
        {
            return [VSStringUtil stringFromUnsignedLongLong:anUnsignedLongLong];
        }
    }
}

#pragma mark - Character Encoding

/**
 *  @inheritDoc
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

/**
 *  @inheritDoc
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
