/**
 *  VARSobjc
 *  (c) VARIANTE <http://variante.io>
 *
 *  This software is released under the MIT License:
 *  http://www.opensource.org/licenses/mit-license.php
 */

#import <Foundation/Foundation.h>

/**
 *  Number formats.
 */
#define VS_N_NUMERIC_FORMAT_DOUBLE                         @"%0.16g"
#define VS_N_NUMERIC_FORMAT_FLOAT                          @"%0.16f"
#define VS_N_NUMERIC_FORMAT_UNSIGNED_LONG_DECIMAL          @"%lu"
#define VS_N_NUMERIC_FORMAT_UNSIGNED_LONG_HEXADECIMAL      @"%lX"
#define VS_N_NUMERIC_FORMAT_UNSIGNED_LONG_OCTAL            @"%lo"
#define VS_N_NUMERIC_FORMAT_UNSIGNED_LONG_LONG_DECIMAL     @"%llu"
#define VS_N_NUMERIC_FORMAT_UNSIGNED_LONG_LONG_HEXADECIMAL @"%llX"
#define VS_N_NUMERIC_FORMAT_UNSIGNED_LONG_LONG_OCTAL       @"%llo"

/**
 *  Symbols.
 */
#define VS_N_HEXADECIMAL_PREFIX @"0x"

#pragma mark - ENUMS

/**
 *  Enums of all numeral system types.
 */
typedef NS_ENUM(int, VSNumberSystemType)
{
    VSNumberSystemTypeUnknown = -1,
    VSNumberSystemTypeDecimal,
    VSNumberSystemTypeHexadecimal,
    VSNumberSystemTypeOctal,
    VSNumberSystemTypeMaxTypes
};

/**
 *  Translates VSNumberSystemType to string.
 *
 *  @param type
 *
 *  @return NSString equivalent of the specified VSNumberSystemType.
 */
NSString *NSStringFromVSNumberSystemType(VSNumberSystemType type);

#pragma mark - INTERFACE

NS_ROOT_CLASS
@interface VSNumberUtil

#pragma mark - CLASS METHODS
#pragma mark - Formatting

/**
 *  Gets the singleton global number formatter with the default "en_US" locale.
 *
 *  @return NSNumberFormatter instance.
 */
+ (NSNumberFormatter *)globalNumberFormatterWithDefaultLocale;

/**
 *  Gets the singleton global number formatter with the current device locale.
 *
 *  @return NSNumberFormatter instance.
 */
+ (NSNumberFormatter *)globalNumberFormatterWithCurrentLocale;

/**
 *  Gets the singleton global number formatter with the specified locale.
 *
 *  @param locale
 *
 *  @return NSNumberFormatter instance.
 */
+ (NSNumberFormatter *)globalNumberFormatterWithLocale:(NSLocale *)locale;

/**
 *  Gets the precision of a numeric format specifier. This function only supports specifiers
 *  of the following format: x.x[g/f], where a '.' is required and 'g'/'f' must be specified.
 *
 *  @param numericFormatSpecifier
 *
 *  @return Integer value of precision.
 */
+ (unsigned int)precisionFromNumericFormatSpecifier:(NSString *)numericFormatSpecifier;

#pragma mark - Type Conversion

/**
 *  Reads and returns an NSNumber value from an NSString.
 *
 *  @param aString
 *
 *  @return The corresponding NSNumber value if valid, nil if NSString does not represent a number.
 */
+ (NSNumber *)numberFromString:(NSString *)aString;

/**
 *  Reads and returns an NSNumber value from an NSString using the specified NSNumberFormatter instance.
 *  If no NSNumberFormatter instance is specified, a default one will be generated locally. The default
 *  locale is "en_US".
 *
 *  @param aString
 *  @param aNumberFormatter
 *
 *  @return The corresponding NSNumber value if valid, nil if NSString does not represent a number.
 */
+ (NSNumber *)numberFromString:(NSString *)aString numberFormatter:(NSNumberFormatter *)aNumberFormatter;

/**
 *  Reads and returns a double value from an NSString.
 *
 *  @param aString
 *
 *  @return The corresponding double value if valid, NAN if invalid.
 */
+ (float)floatFromString:(NSString *)aString;

/**
 *  Reads and returns a float value from an NSString using the specified NSNumberFormatter instance.
 *  If no NSNumberFormatter instance is specified, the strtof_l from stdlib will be used instead with
 *  LC_GLOBAL_LOCALE.
 *
 *  @param aString
 *  @param aNumberFormatter
 *
 *  @return The corresponding float value if valid, NAN if invalid.
 */
+ (float)floatFromString:(NSString *)aString numberFormatter:(NSNumberFormatter *)aNumberFormatter;

/**
 *  Reads and returns a double value from an NSString.
 *
 *  @param aString
 *
 *  @return The corresponding double value if valid, NAN if invalid.
 */
+ (double)doubleFromString:(NSString *)aString;

/**
 *  Reads and returns a double value from an NSString using the specified NSNumberFormatter instance.
 *  If no NSNumberFormatter instance is specified, the strtod_l from stdlib will be used instead with
 *  LC_GLOBAL_LOCALE.
 *
 *  @param aString
 *  @param aNumberFormatter
 *
 *  @return The corresponding double value if valid, NAN if invalid.
 */
+ (double)doubleFromString:(NSString *)aString numberFormatter:(NSNumberFormatter *)aNumberFormatter;

/**
 *  Reads and returns an int value from an NSString.
 *
 *  @param aString
 *
 *  @return The corresponding int value if valid, 0 if invalid.
 */
+ (int)intFromString:(NSString *)aString;

/**
 *  Reads and returns an int value from an NSString using the specified NSNumberFormatter instance.
 *  If no NSNumberFormatter instance is specified, the strtol_l from stdlib will be used instead with
 *  LC_GLOBAL_LOCALE.
 *
 *  @param aString
 *  @param aNumberFormatter
 *
 *  @return The corresponding int value if valid, 0 if invalid.
 */
+ (int)intFromString:(NSString *)aString numberFormatter:(NSNumberFormatter *)aNumberFormatter;

/**
 *  Reads and returns a long value from an NSString.
 *
 *  @param aString
 *
 *  @return The corresponding long value if valid, 0 if invalid.
 */
+ (long)longFromString:(NSString *)aString;

/**
 *  Reads and returns a long value from an NSString using the specified NSNumberFormatter instance.
 *  If no NSNumberFormatter instance is specified, the strtol_l from stdlib will be used instead with
 *  LC_GLOBAL_LOCALE.
 *
 *  @param aString
 *  @param aNumberFormatter
 *
 *  @return The corresponding long value if valid, 0 if invalid.
 */
+ (long)longFromString:(NSString *)aString numberFormatter:(NSNumberFormatter *)aNumberFormatter;

/**
 *  Reads and returns a long long value from an NSString.
 *
 *  @param aString
 *
 *  @return The corresponding long long value if valid, 0 if invalid.
 */
+ (long long)longLongFromString:(NSString *)aString;

/**
 *  Reads and returns a long long value from an NSString using the specified NSNumberFormatter instance.
 *  If no NSNumberFormatter instance is specified, the strtoll_l from stdlib will be used instead with
 *  LC_GLOBAL_LOCALE.
 *
 *  @param aString
 *  @param aNumberFormatter
 *
 *  @return The corresponding long long value if valid, 0 if invalid.
 */
+ (long long)longLongFromString:(NSString *)aString numberFormatter:(NSNumberFormatter *)aNumberFormatter;

/**
 *  Reads and returns an unsigned int value from an NSString.
 *
 *  @param aString
 *
 *  @return The corresponding unsigned int value if valid, 0 if invalid.
 */
+ (unsigned int)unsignedIntFromString:(NSString *)aString;

/**
 *  Reads and returns an unsigned int value from an NSString using the specified NSNumberFormatter instance.
 *  If no NSNumberFormatter instance is specified, the strtoul_l from stdlib will be used instead with
 *  LC_GLOBAL_LOCALE.
 *
 *  @param aString
 *  @param aNumberFormatter
 *
 *  @return The corresponding unsigned int value if valid, 0 if invalid.
 */
+ (unsigned int)unsignedIntFromString:(NSString *)aString numberFormatter:(NSNumberFormatter *)aNumberFormatter;

/**
 *  Reads and returns an unsigned long value from an NSString.
 *
 *  @param aString
 *
 *  @return The corresponding unsigned long value if valid, 0 if invalid.
 */
+ (unsigned long)unsignedLongFromString:(NSString *)aString;

/**
 *  Reads and returns an unsigned long value from an NSString using the specified NSNumberFormatter instance.
 *  If no NSNumberFormatter instance is specified, the strtoul_l from stdlib will be used instead with
 *  LC_GLOBAL_LOCALE.
 *
 *  @param aString
 *  @param aNumberFormatter
 *
 *  @return The corresponding unsigned long value if valid, 0 if invalid.
 */
+ (unsigned long)unsignedLongFromString:(NSString *)aString numberFormatter:(NSNumberFormatter *)aNumberFormatter;

/**
 *  Reads and returns an unsigned long long value from an NSString.
 *
 *  @param aString
 *
 *  @return The corresponding unsigned long long value if valid, 0 if invalid.
 */
+ (unsigned long long)unsignedLongLongFromString:(NSString *)aString;

/**
 *  Reads and returns an unsigned long long value from an NSString using the specified NSNumberFormatter instance.
 *  If no NSNumberFormatter instance is specified, a default one will be generated locally.
 *
 *  @param aString
 *  @param aNumberFormatter
 *
 *  @return The corresponding unsigned long long value if valid, 0 if invalid.
 */
+ (unsigned long long)unsignedLongLongFromString:(NSString *)aString numberFormatter:(NSNumberFormatter *)aNumberFormatter;

/**
 *  Reads and returns an unsigned long long value from an NSString in the specified number system type.
 *
 *  @param aString
 *  @param numberSystemType
 *
 *  @return The corresponding unsigned long long value if valid, 0 if invalid.
 */
+ (unsigned long long)unsignedLongLongFromString:(NSString *)aString numberSystem:(VSNumberSystemType)numberSystemType;

@end
