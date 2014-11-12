/**
 *  VARSobjc
 *  (c) VARIANTE <http://variante.io>
 *
 *  This software is released under the MIT License:
 *  http://www.opensource.org/licenses/mit-license.php
 */

#import "vsmath.h"
#import "vsmem.h"

#import "VSMathUtil.h"
#import "VSNumberUtil.h"
#import "VSStringUtil.h"

/**
 *  Static NSNumberFormatter instnace.
 */
static NSNumberFormatter *NUMBER_FORMATTER;

#pragma mark - ENUMS

/*
 *  @inheritdoc
 */
NSString *NSStringFromVSNumberSystemType(VSNumberSystemType type)
{
    switch (type)
    {
        case VSNumberSystemTypeUnknown:     return @"VSNumberSystemTypeUnknown";
        case VSNumberSystemTypeDecimal:     return @"VSNumberSystemTypeDecimal";
        case VSNumberSystemTypeHexadecimal: return @"VSNumberSystemTypeHexadecimal";
        case VSNumberSystemTypeMaxTypes:    return @"VSNumberSystemTypeMaxTypes";
        default:                            return @(type).stringValue;
    }
}

#pragma mark - INTERFACE

/*
 *  @inheritdoc
 */
@interface VSNumberUtil()

#pragma mark - CLASS METHODS
#pragma mark - Formatting

/**
 *  Gets the singleton NSNumberFormatter instance.
 *
 *  @return NSNumberFormatter instance.
 */
+ (NSNumberFormatter *)globalNumberFormatter;

@end

#pragma mark - IMPLEMENTATION

/*
 *  @inheritdoc
 */
@implementation VSNumberUtil

#pragma mark - CLASS METHODS
#pragma mark - Formatting

/*
 *  @inheritdoc
 */
+ (NSNumberFormatter *)globalNumberFormatter
{
    static dispatch_once_t predicate;

    dispatch_once(&predicate, ^{
        if (NUMBER_FORMATTER == nil)
        {
            NUMBER_FORMATTER = [[NSNumberFormatter alloc] init];
        }
    });

    return NUMBER_FORMATTER;
}

/*
 *  @inheritdoc
 */
+ (NSNumberFormatter *)globalNumberFormatterWithDefaultLocale
{
    [[VSNumberUtil globalNumberFormatter] setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US"]];

    return [VSNumberUtil globalNumberFormatter];
}

/*
 *  @inheritdoc
 */
+ (NSNumberFormatter *)globalNumberFormatterWithCurrentLocale
{
    [[VSNumberUtil globalNumberFormatter] setLocale:[NSLocale currentLocale]];

    return [VSNumberUtil globalNumberFormatter];
}

/*
 *  @inheritdoc
 */
+ (NSNumberFormatter *)globalNumberFormatterWithLocale:(NSLocale *)locale
{
    [[VSNumberUtil globalNumberFormatter] setLocale:locale];

    return [VSNumberUtil globalNumberFormatter];
}

/*
 *  @inheritdoc
 */
+ (unsigned int)precisionFromNumericFormatSpecifier:(NSString *)numericFormatSpecifier
{
    if (([numericFormatSpecifier rangeOfString:@"."].location == NSNotFound) ||
        (([numericFormatSpecifier rangeOfString:@"g"].location == NSNotFound) &&
         ([numericFormatSpecifier rangeOfString:@"G"].location == NSNotFound) &&
         ([numericFormatSpecifier rangeOfString:@"f"].location == NSNotFound) &&
         ([numericFormatSpecifier rangeOfString:@"F"].location == NSNotFound)))
    {
        return 0;
    }

    NSArray *components = [numericFormatSpecifier componentsSeparatedByString:@"."];

    if (components.count > 2) return 0;

    NSString *buffer = components[1];
    unsigned long len = buffer.length;

    return [VSNumberUtil intFromString:[buffer substringToIndex:len-1]];
}

#pragma mark - Type Conversion

/*
 *  @inheritdoc
 */
+ (NSNumber *)numberFromString:(NSString *)aString
{
    return [VSNumberUtil numberFromString:aString numberFormatter:nil];
}

/*
 *  @inheritdoc
 */
+ (NSNumber *)numberFromString:(NSString *)aString numberFormatter:(NSNumberFormatter *)aNumberFormatter
{
    NSNumber *number = nil;

    if (aString == nil)
    {
        // Do nothing.
    }
    else if (aNumberFormatter == nil)
    {
        if ([[aString lowercaseString] isEqualToString:[VS_M_SYMBOL_NAN lowercaseString]])
        {
            number = [NSNumber numberWithDouble:NAN];
        }
        else
        {
            // Somehow grouping separators invalidates the numeric value in the string, remove them.
            aString = [aString stringByReplacingOccurrencesOfString:[VSNumberUtil globalNumberFormatterWithDefaultLocale].groupingSeparator withString:@""];

            number = [[VSNumberUtil globalNumberFormatterWithDefaultLocale] numberFromString:aString];

            // Double check.
            if (number != nil)
            {
                number = [NSNumber numberWithDouble:[VSNumberUtil doubleFromString:aString]];
            }
        }
    }
    else
    {
        if ([[aString lowercaseString] isEqualToString:[VS_M_SYMBOL_NAN lowercaseString]])
        {
            number = [NSNumber numberWithDouble:NAN];
        }
        else if ([[aString lowercaseString] isEqualToString:[aNumberFormatter.notANumberSymbol lowercaseString]])
        {
            number = [NSNumber numberWithDouble:NAN];
        }
        else
        {
            number = [aNumberFormatter numberFromString:aString];
        }
    }

    return number;
}

/*
 *  @inheritdoc
 */
+ (float)floatFromString:(NSString *)aString
{
    return [VSNumberUtil floatFromString:aString numberFormatter:nil];
}

/*
 *  @inheritdoc
 */
+ (float)floatFromString:(NSString *)aString numberFormatter:(NSNumberFormatter *)aNumberFormatter
{
    if (aString == nil)
    {
        return NAN;
    }
    else if (aNumberFormatter == nil)
    {
        return fstrtonumf([aString UTF8String]);
    }
    else
    {
        NSNumber *number = [aNumberFormatter numberFromString:aString];

        if (number == nil)
        {
            return NAN;
        }
        else
        {
            return [number floatValue];
        }
    }
}

/*
 *  @inheritdoc
 */
+ (double)doubleFromString:(NSString *)aString
{
    return [VSNumberUtil doubleFromString:aString numberFormatter:nil];
}

/*
 *  @inheritdoc
 */
+ (double)doubleFromString:(NSString *)aString numberFormatter:(NSNumberFormatter *)aNumberFormatter
{
    if (aString == nil)
    {
        return NAN;
    }
    else if (aNumberFormatter == nil)
    {
        return fstrtonum([aString UTF8String]);
    }
    else
    {
        NSNumber *number = [aNumberFormatter numberFromString:aString];

        if (number == nil)
        {
            return NAN;
        }
        else
        {
            return [number doubleValue];
        }
    }
}

/*
 *  @inheritdoc
 */
+ (int)intFromString:(NSString *)aString
{
    return [VSNumberUtil intFromString:aString numberFormatter:nil];
}

/*
 *  @inheritdoc
 */
+ (int)intFromString:(NSString *)aString numberFormatter:(NSNumberFormatter *)aNumberFormatter
{
    if (aString == nil)
    {
        return 0;
    }
    else if (aNumberFormatter == nil)
    {
        return (int)lstrtonum([aString UTF8String]);
    }
    else
    {
        NSNumber *number = [aNumberFormatter numberFromString:aString];

        if (number == nil)
        {
            return 0;
        }
        else
        {
            return [number intValue];
        }
    }
}

/*
 *  @inheritdoc
 */
+ (long)longFromString:(NSString *)aString
{
    return [VSNumberUtil longFromString:aString numberFormatter:nil];
}

/*
 *  @inheritdoc
 */
+ (long)longFromString:(NSString *)aString numberFormatter:(NSNumberFormatter *)aNumberFormatter
{
    if (aString == nil)
    {
        return 0;
    }
    else if (aNumberFormatter == nil)
    {
        return lstrtonum([aString UTF8String]);
    }
    else
    {
        NSNumber *number = [aNumberFormatter numberFromString:aString];

        if (number == nil)
        {
            return 0;
        }
        else
        {
            return [number longValue];
        }
    }
}

/*
 *  @inheritdoc
 */
+ (long long)longLongFromString:(NSString *)aString
{
    return [VSNumberUtil longLongFromString:aString numberFormatter:nil];
}

/*
 *  @inheritdoc
 */
+ (long long)longLongFromString:(NSString *)aString numberFormatter:(NSNumberFormatter *)aNumberFormatter
{
    if (aString == nil)
    {
        return 0;
    }
    else if (aNumberFormatter == nil)
    {
        return llstrtonum([aString UTF8String]);
    }
    else
    {
        NSNumber *number = [aNumberFormatter numberFromString:aString];

        if (number == nil)
        {
            return 0;
        }
        else
        {
            return [number longLongValue];
        }
    }
}

/*
 *  @inheritdoc
 */
+ (unsigned int)unsignedIntFromString:(NSString *)aString
{
    return [VSNumberUtil unsignedIntFromString:aString numberFormatter:nil];
}

/*
 *  @inheritdoc
 */
+ (unsigned int)unsignedIntFromString:(NSString *)aString numberFormatter:(NSNumberFormatter *)aNumberFormatter
{
    if (aString == nil)
    {
        return 0;
    }
    else if (aNumberFormatter == nil)
    {
        return (unsigned int)lustrtonum([aString UTF8String]);
    }
    else
    {
        NSNumber *number = [aNumberFormatter numberFromString:aString];

        if (number == nil)
        {
            return 0;
        }
        else
        {
            return [number unsignedIntValue];
        }
    }
}

/*
 *  @inheritdoc
 */
+ (unsigned long)unsignedLongFromString:(NSString *)aString
{
    return [VSNumberUtil unsignedLongFromString:aString numberFormatter:nil];
}

/*
 *  @inheritdoc
 */
+ (unsigned long)unsignedLongFromString:(NSString *)aString numberFormatter:(NSNumberFormatter *)aNumberFormatter
{
    if (aString == nil)
    {
        return 0;
    }
    else if (aNumberFormatter == nil)
    {
        return lustrtonum([aString UTF8String]);
    }
    else
    {
        NSNumber *number = [aNumberFormatter numberFromString:aString];

        if (number == nil)
        {
            return 0;
        }
        else
        {
            return [number unsignedLongValue];
        }
    }
}

/*
 *  @inheritdoc
 */
+ (unsigned long long)unsignedLongLongFromString:(NSString *)aString
{
    return [VSNumberUtil unsignedLongLongFromString:aString numberFormatter:nil];
}

/*
 *  @inheritdoc
 */
+ (unsigned long long)unsignedLongLongFromString:(NSString *)aString numberFormatter:(NSNumberFormatter *)aNumberFormatter
{
    if (aString == nil)
    {
        return 0;
    }
    else if (aNumberFormatter == nil)
    {
        return llustrtonum([aString UTF8String]);
    }
    else
    {
        NSNumber *number = [aNumberFormatter numberFromString:aString];

        if (number == nil)
        {
            return NAN;
        }
        else
        {
            return [number unsignedLongLongValue];
        }
    }
}

/*
 *  @inheritdoc
 */
+ (unsigned long long)unsignedLongLongFromString:(NSString *)aString numberSystem:(VSNumberSystemType)numberSystemType
{
    if ((aString == nil) || [aString isEqualToString:@""])
    {
        return 0;
    }

    switch (numberSystemType)
    {
        case VSNumberSystemTypeHexadecimal:
        {
            unsigned long long output = 0;

            NSScanner *hexScanner = [NSScanner scannerWithString:aString];
            [hexScanner setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US"]];
            [hexScanner scanHexLongLong:&output];
            hexScanner = nil;

            return output;
        }

        case VSNumberSystemTypeOctal:
        {
            unsigned long long output = 0;
            unsigned long strlen = aString.length;

            for (int i = 0; i < strlen; i++)
            {
                unsigned long long temp = [aString characterAtIndex:i] - 48;
                temp *= pow(8, strlen - 1 - i);

                output += temp;
            }

            return output;
        }
            
        case VSNumberSystemTypeDecimal:
        default:
        {
            return [VSNumberUtil unsignedLongLongFromString:aString];
        }
    }
}

@end
