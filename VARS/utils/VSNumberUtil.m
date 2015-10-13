/**
 *  VARS
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
 *  Static NSNumberFormatter instance.
 */
static NSNumberFormatter *NUMBER_FORMATTER;

#pragma mark -

NSString *NSStringFromVSNumberSystemType(VSNumberSystemType type) {
    switch (type) {
        case VSNumberSystemTypeUnknown:     return @"VSNumberSystemTypeUnknown";
        case VSNumberSystemTypeDecimal:     return @"VSNumberSystemTypeDecimal";
        case VSNumberSystemTypeHexadecimal: return @"VSNumberSystemTypeHexadecimal";
        case VSNumberSystemTypeOctal:       return @"VSNumberSystemTypeOctal";
        case VSNumberSystemTypeBinary:      return @"VSNumberSystemTypeBinary";
        case VSNumberSystemTypeMaxTypes:    return @"VSNumberSystemTypeMaxTypes";
        default:                            return @(type).stringValue;
    }
}

NSString *NSStringFromVSBinaryDigitType(VSBinaryDigitType type) {
    switch (type) {
        case VSBinaryDigitTypeUnknown:  return @"VSBinaryDigitTypeUnknown";
        case VSBinaryDigitType8Bit:     return @"VSBinaryDigitType8Bit";
        case VSBinaryDigitType16Bit:    return @"VSBinaryDigitType16Bit";
        case VSBinaryDigitType32Bit:    return @"VSBinaryDigitType32Bit";
        case VSBinaryDigitType64Bit:    return @"VSBinaryDigitType64Bit";
        case VSBinaryDigitTypeMaxTypes: return @"VSBinaryDigitTypeMaxTypes";
        default:                              return @(type).stringValue;
    }
}

#pragma mark -

@implementation VSNumberUtil

#pragma mark Formatting

/**
 *  @private
 *
 *  Gets the singleton NSNumberFormatter instance.
 *
 *  @return NSNumberFormatter instance.
 */
+ (NSNumberFormatter *)_globalNumberFormatter {
    static dispatch_once_t predicate;

    dispatch_once(&predicate, ^{
        if (NUMBER_FORMATTER == nil) {
            NUMBER_FORMATTER = [[NSNumberFormatter alloc] init];
        }
    });

    return NUMBER_FORMATTER;
}

+ (NSNumberFormatter *)globalNumberFormatterWithDefaultLocale {
    [[VSNumberUtil _globalNumberFormatter] setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US"]];

    return [VSNumberUtil _globalNumberFormatter];
}

+ (NSNumberFormatter *)globalNumberFormatterWithCurrentLocale {
    [[VSNumberUtil _globalNumberFormatter] setLocale:[NSLocale currentLocale]];

    return [VSNumberUtil _globalNumberFormatter];
}

+ (NSNumberFormatter *)globalNumberFormatterWithLocale:(NSLocale *)locale {
    [[VSNumberUtil _globalNumberFormatter] setLocale:locale];

    return [VSNumberUtil _globalNumberFormatter];
}

+ (unsigned int)precisionFromNumericFormatSpecifier:(NSString *)numericFormatSpecifier {
    if (([numericFormatSpecifier rangeOfString:@"."].location == NSNotFound) ||
        (([numericFormatSpecifier rangeOfString:@"g"].location == NSNotFound) &&
         ([numericFormatSpecifier rangeOfString:@"G"].location == NSNotFound) &&
         ([numericFormatSpecifier rangeOfString:@"f"].location == NSNotFound) &&
         ([numericFormatSpecifier rangeOfString:@"F"].location == NSNotFound))) {
        return 0;
    }

    NSArray *components = [numericFormatSpecifier componentsSeparatedByString:@"."];

    if (components.count > 2) return 0;

    NSString *buffer = components[1];
    unsigned long len = buffer.length;

    return [VSNumberUtil intFromString:[buffer substringToIndex:len-1]];
}

#pragma mark Type Conversion

+ (NSNumber *)numberFromString:(NSString *)aString {
    return [VSNumberUtil numberFromString:aString numberFormatter:nil];
}

+ (NSNumber *)numberFromString:(NSString *)aString numberFormatter:(NSNumberFormatter *)aNumberFormatter {
    NSNumber *number = nil;

    if (aString == nil) {
        // Do nothing.
    }
    else if (aNumberFormatter == nil) {
        if ([[aString lowercaseString] isEqualToString:[VS_M_SYMBOL_NAN lowercaseString]]) {
            number = [NSNumber numberWithDouble:NAN];
        }
        else {
            // Somehow grouping separators invalidates the numeric value in the string, remove them.
            aString = [aString stringByReplacingOccurrencesOfString:[VSNumberUtil globalNumberFormatterWithDefaultLocale].groupingSeparator withString:@""];

            number = [[VSNumberUtil globalNumberFormatterWithDefaultLocale] numberFromString:aString];

            // Double check.
            if (number != nil) {
                number = [NSNumber numberWithDouble:[VSNumberUtil doubleFromString:aString]];
            }
        }
    }
    else {
        if ([[aString lowercaseString] isEqualToString:[VS_M_SYMBOL_NAN lowercaseString]]) {
            number = [NSNumber numberWithDouble:NAN];
        }
        else if ([[aString lowercaseString] isEqualToString:[aNumberFormatter.notANumberSymbol lowercaseString]]) {
            number = [NSNumber numberWithDouble:NAN];
        }
        else {
            number = [aNumberFormatter numberFromString:aString];
        }
    }

    return number;
}

+ (float)floatFromString:(NSString *)aString {
    return [VSNumberUtil floatFromString:aString numberFormatter:nil];
}

+ (float)floatFromString:(NSString *)aString numberFormatter:(NSNumberFormatter *)aNumberFormatter {
    if (aString == nil) {
        return NAN;
    }
    else if (aNumberFormatter == nil) {
        return fstrtonumf([aString UTF8String]);
    }
    else {
        NSNumber *number = [aNumberFormatter numberFromString:aString];

        if (number == nil) {
            return NAN;
        }
        else {
            return [number floatValue];
        }
    }
}

+ (double)doubleFromString:(NSString *)aString {
    return [VSNumberUtil doubleFromString:aString numberFormatter:nil];
}

+ (double)doubleFromString:(NSString *)aString numberFormatter:(NSNumberFormatter *)aNumberFormatter {
    if (aString == nil) {
        return NAN;
    }
    else if (aNumberFormatter == nil) {
        return fstrtonum([aString UTF8String]);
    }
    else {
        NSNumber *number = [aNumberFormatter numberFromString:aString];

        if (number == nil) {
            return NAN;
        }
        else {
            return [number doubleValue];
        }
    }
}

+ (int)intFromString:(NSString *)aString {
    return [VSNumberUtil intFromString:aString numberFormatter:nil];
}

+ (int)intFromString:(NSString *)aString numberFormatter:(NSNumberFormatter *)aNumberFormatter {
    if (aString == nil) {
        return 0;
    }
    else if (aNumberFormatter == nil) {
        return (int)lstrtonum([aString UTF8String]);
    }
    else {
        NSNumber *number = [aNumberFormatter numberFromString:aString];

        if (number == nil) {
            return 0;
        }
        else {
            return [number intValue];
        }
    }
}

+ (long)longFromString:(NSString *)aString {
    return [VSNumberUtil longFromString:aString numberFormatter:nil];
}

+ (long)longFromString:(NSString *)aString numberFormatter:(NSNumberFormatter *)aNumberFormatter {
    if (aString == nil) {
        return 0;
    }
    else if (aNumberFormatter == nil) {
        return lstrtonum([aString UTF8String]);
    }
    else {
        NSNumber *number = [aNumberFormatter numberFromString:aString];

        if (number == nil) {
            return 0;
        }
        else {
            return [number longValue];
        }
    }
}

+ (long long)longLongFromString:(NSString *)aString {
    return [VSNumberUtil longLongFromString:aString numberFormatter:nil];
}

+ (long long)longLongFromString:(NSString *)aString numberFormatter:(NSNumberFormatter *)aNumberFormatter {
    if (aString == nil) {
        return 0;
    }
    else if (aNumberFormatter == nil) {
        return llstrtonum([aString UTF8String]);
    }
    else {
        NSNumber *number = [aNumberFormatter numberFromString:aString];

        if (number == nil) {
            return 0;
        }
        else {
            return [number longLongValue];
        }
    }
}

+ (unsigned char)unsignedCharFromString:(NSString *)aString {
    return [VSNumberUtil unsignedCharFromString:aString numberFormatter:nil];
}

+ (unsigned char)unsignedCharFromString:(NSString *)aString numberFormatter:(NSNumberFormatter *)aNumberFormatter {
    if (aString == nil) {
        return 0;
    }
    else if (aNumberFormatter == nil) {
        return (unsigned char)lustrtonum([aString UTF8String]);
    }
    else {
        NSNumber *number = [aNumberFormatter numberFromString:aString];

        if (number == nil) {
            return 0;
        }
        else {
            return [number unsignedCharValue];
        }
    }
}

+ (unsigned char)unsignedCharFromString:(NSString *)aString numberSystem:(VSNumberSystemType)numberSystemType {
    if ((aString == nil) || [aString isEqualToString:@""]) {
        return 0;
    }

    unsigned char output = 0;
    unsigned long strlen = aString.length;

    switch (numberSystemType) {
        case VSNumberSystemTypeHexadecimal: {
            unsigned int tmp = 0;

            NSScanner *hexScanner = [NSScanner scannerWithString:aString];
            [hexScanner setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US"]];
            [hexScanner scanHexInt:&tmp];
            hexScanner = nil;

            output = (unsigned char)tmp;

            break;
        }

        case VSNumberSystemTypeOctal: {
            for (int i = 0; i < strlen; i++) {
                unsigned int temp = [aString characterAtIndex:i] - 48;
                temp *= fpow(8, strlen - 1 - i);

                output += (unsigned char)temp;
            }

            break;
        }

        case VSNumberSystemTypeBinary: {
            for (unsigned long i = 0; i < strlen; i++) {
                unichar c = [aString characterAtIndex:(strlen - i - 1)];

                if (c == '1') {
                    output += (unsigned char)1 << (unsigned char)i;
                }
                else if (c != '0') {
                    output = 0;
                    break;
                }
            }

            break;
        }

        case VSNumberSystemTypeDecimal:
        default: {
            output = [VSNumberUtil unsignedCharFromString:aString];
        }
    }

    return (unsigned short)output;
}

+ (unsigned short)unsignedShortFromString:(NSString *)aString {
    return [VSNumberUtil unsignedShortFromString:aString numberFormatter:nil];
}

+ (unsigned short)unsignedShortFromString:(NSString *)aString numberFormatter:(NSNumberFormatter *)aNumberFormatter {
    if (aString == nil) {
        return 0;
    }
    else if (aNumberFormatter == nil) {
        return (unsigned short)lustrtonum([aString UTF8String]);
    }
    else {
        NSNumber *number = [aNumberFormatter numberFromString:aString];

        if (number == nil) {
            return 0;
        }
        else {
            return [number unsignedShortValue];
        }
    }
}

+ (unsigned short)unsignedShortFromString:(NSString *)aString numberSystem:(VSNumberSystemType)numberSystemType {
    if ((aString == nil) || [aString isEqualToString:@""]) {
        return 0;
    }

    unsigned short output = 0;
    unsigned long strlen = aString.length;

    switch (numberSystemType) {
        case VSNumberSystemTypeHexadecimal: {
            unsigned int tmp = 0;

            NSScanner *hexScanner = [NSScanner scannerWithString:aString];
            [hexScanner setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US"]];
            [hexScanner scanHexInt:&tmp];
            hexScanner = nil;

            output = tmp;

            break;
        }

        case VSNumberSystemTypeOctal: {
            for (int i = 0; i < strlen; i++) {
                unsigned int temp = [aString characterAtIndex:i] - 48;
                temp *= fpow(8, strlen - 1 - i);

                output += temp;
            }

            break;
        }

        case VSNumberSystemTypeBinary: {
            for (unsigned long i = 0; i < strlen; i++) {
                unichar c = [aString characterAtIndex:(strlen - i - 1)];

                if (c == '1') {
                    output += (unsigned short)1 << (unsigned short)i;
                }
                else if (c != '0') {
                    output = 0;
                    break;
                }
            }

            break;
        }

        case VSNumberSystemTypeDecimal:
        default: {
            output = [VSNumberUtil unsignedIntFromString:aString];
        }
    }

    return (unsigned short)output;
}

+ (unsigned int)unsignedIntFromString:(NSString *)aString {
    return [VSNumberUtil unsignedIntFromString:aString numberFormatter:nil];
}

+ (unsigned int)unsignedIntFromString:(NSString *)aString numberFormatter:(NSNumberFormatter *)aNumberFormatter {
    if (aString == nil) {
        return 0;
    }
    else if (aNumberFormatter == nil) {
        return (unsigned int)lustrtonum([aString UTF8String]);
    }
    else {
        NSNumber *number = [aNumberFormatter numberFromString:aString];

        if (number == nil) {
            return 0;
        }
        else {
            return [number unsignedIntValue];
        }
    }
}

+ (unsigned int)unsignedIntFromString:(NSString *)aString numberSystem:(VSNumberSystemType)numberSystemType {
    if ((aString == nil) || [aString isEqualToString:@""]) {
        return 0;
    }

    unsigned int output = 0;
    unsigned long strlen = aString.length;

    switch (numberSystemType) {
        case VSNumberSystemTypeHexadecimal: {
            NSScanner *hexScanner = [NSScanner scannerWithString:aString];
            [hexScanner setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US"]];
            [hexScanner scanHexInt:&output];
            hexScanner = nil;

            break;
        }

        case VSNumberSystemTypeOctal: {
            for (int i = 0; i < strlen; i++) {
                unsigned int temp = [aString characterAtIndex:i] - 48;
                temp *= fpow(8, strlen - 1 - i);

                output += temp;
            }

            break;
        }

        case VSNumberSystemTypeBinary: {
            for (unsigned long i = 0; i < strlen; i++) {
                unichar c = [aString characterAtIndex:(strlen - i - 1)];

                if (c == '1') {
                    output += (unsigned int)1 << (unsigned int)i;
                }
                else if (c != '0') {
                    output = 0;
                    break;
                }
            }

            break;
        }

        case VSNumberSystemTypeDecimal:
        default: {
            output = [VSNumberUtil unsignedIntFromString:aString];

            break;
        }
    }

    return output;
}

+ (unsigned long)unsignedLongFromString:(NSString *)aString {
    return [VSNumberUtil unsignedLongFromString:aString numberFormatter:nil];
}

+ (unsigned long)unsignedLongFromString:(NSString *)aString numberFormatter:(NSNumberFormatter *)aNumberFormatter {
    if (aString == nil) {
        return 0;
    }
    else if (aNumberFormatter == nil) {
        return lustrtonum([aString UTF8String]);
    }
    else {
        NSNumber *number = [aNumberFormatter numberFromString:aString];

        if (number == nil) {
            return 0;
        }
        else {
            return [number unsignedLongValue];
        }
    }
}

+ (unsigned long)unsignedLongFromString:(NSString *)aString numberSystem:(VSNumberSystemType)numberSystemType {
    if ((aString == nil) || [aString isEqualToString:@""]) {
        return 0;
    }

    unsigned long output = 0;
    unsigned long strlen = aString.length;

    switch (numberSystemType) {
        case VSNumberSystemTypeHexadecimal: {
            unsigned long long tmp = 0;

            NSScanner *hexScanner = [NSScanner scannerWithString:aString];
            [hexScanner setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US"]];
            [hexScanner scanHexLongLong:&tmp];
            hexScanner = nil;

            output = (unsigned long)tmp;

            break;
        }

        case VSNumberSystemTypeOctal: {
            for (int i = 0; i < strlen; i++) {
                unsigned long temp = [aString characterAtIndex:i] - 48;
                temp *= fpow(8, strlen - 1 - i);

                output += temp;
            }

            break;
        }

        case VSNumberSystemTypeBinary: {
            unsigned long strlen = aString.length;

            for (unsigned long i = 0; i < strlen; i++) {
                unichar c = [aString characterAtIndex:(strlen - i - 1)];

                if (c == '1') {
                    output += (unsigned long)1 << (unsigned long)i;
                }
                else if (c != '0') {
                    output = 0;
                    break;
                }
            }

            break;
        }

        case VSNumberSystemTypeDecimal:
        default: {
            output = [VSNumberUtil unsignedLongFromString:aString];

            break;
        }
    }

    return output;
}

+ (unsigned long long)unsignedLongLongFromString:(NSString *)aString {
    return [VSNumberUtil unsignedLongLongFromString:aString numberFormatter:nil];
}

+ (unsigned long long)unsignedLongLongFromString:(NSString *)aString numberFormatter:(NSNumberFormatter *)aNumberFormatter {
    if (aString == nil) {
        return 0;
    }
    else if (aNumberFormatter == nil) {
        return llustrtonum([aString UTF8String]);
    }
    else {
        NSNumber *number = [aNumberFormatter numberFromString:aString];

        if (number == nil) {
            return NAN;
        }
        else {
            return [number unsignedLongLongValue];
        }
    }
}

+ (unsigned long long)unsignedLongLongFromString:(NSString *)aString numberSystem:(VSNumberSystemType)numberSystemType {
    if ((aString == nil) || [aString isEqualToString:@""]) {
        return 0;
    }

    unsigned long long output = 0;
    unsigned long strlen = aString.length;

    switch (numberSystemType) {
        case VSNumberSystemTypeHexadecimal: {
            NSScanner *hexScanner = [NSScanner scannerWithString:aString];
            [hexScanner setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US"]];
            [hexScanner scanHexLongLong:&output];
            hexScanner = nil;

            break;
        }

        case VSNumberSystemTypeOctal: {
            for (int i = 0; i < strlen; i++) {
                unsigned long long temp = [aString characterAtIndex:i] - 48;
                temp *= fpow(8, strlen - 1 - i);

                output += temp;
            }

            break;
        }

        case VSNumberSystemTypeBinary: {
            for (unsigned long i = 0; i < strlen; i++) {
                unichar c = [aString characterAtIndex:(strlen - i - 1)];

                if (c == '1') {
                    output += (unsigned long long)1 << (unsigned long long)i;
                }
                else if (c != '0') {
                    output = 0;
                    break;
                }
            }

            break;
        }

        case VSNumberSystemTypeDecimal:
        default: {
            output = [VSNumberUtil unsignedLongLongFromString:aString];

            break;
        }
    }

    return output;
}

@end
