/**
 *  VARSobjc
 *  (c) VARIANTE <http://variante.io>
 *
 *  This software is released under the MIT License:
 *  http://www.opensource.org/licenses/mit-license.php
 */

#import "VSNumberUtil.h"

#pragma mark - ENUMS

/**
 *  Enums of all numeral system types.
 */
typedef NS_ENUM(int, VSCharacterEncodingType)
{
    VSCharacterEncodingTypeUnknown = -1,
    VSCharacterEncodingTypeAscii,
    VSCharacterEncodingTypeUTF16,
    VSCharacterEncodingTypeMaxTypes
};

/**
 *  Translates VSCharacterEncodingType to string.
 *
 *  @param type
 *
 *  @return NSString equivalent of the specified VSCharacterEncodingType.
 */
NSString *NSStringFromVSCharacterEncodingType(VSCharacterEncodingType type);

#pragma mark - INTERFACE

/**
 *  VARS utility for string operations.
 */
NS_ROOT_CLASS
@interface VSStringUtil

#pragma mark - CLASS METHODS
#pragma mark - Sanity Checking

/**
 *  Checks if string is nil or blank.
 *
 *  @param aString
 *
 *  @return YES if nil or blank, NO otherwise.
 */
+ (BOOL)stringIsNilOrBlank:(NSString *)aString;

/**
 *  Gets the number of occurances of a substring in a string.
 *
 *  @param aSubstring
 *  @param aString
 *
 *  @return Number of occurances.
 */
+ (unsigned long)occurancesOfString:(NSString *)aSubstring inString:(NSString *)aString;

#pragma mark - Type Conversion

/**
 *  Converts a double value to a string using the default "%0.15g" numeric format specifier.
 *
 *  @param aDouble
 *
 *  @return The NSString representation of the specified double value.
 */
+ (NSString *)stringFromDouble:(double)aDouble;

/**
 *  Converts a double value to a string with the specified numberic format and optional string representation of NAN.
 *
 *  @param aDouble
 *  @param numericFormatSpecifier
 *  @param exponentSymbol
 *  @param NANSymbol
 *
 *  @return The NSString representation of the specified double value.
 */
+ (NSString *)stringFromDouble:(double)aDouble numericFormatSpecifier:(NSString *)numericFormatSpecifier exponentSymbol:(NSString *)exponentSymbol NANSymbol:(NSString *)NANSymbol;

/**
 *  Converts a double value to a string with the specified NSNumberFormatter instance.
 *
 *  @param aDouble
 *  @param aNumberFormatter
 *
 *  @return The NSString representation of the specified double value.
 */
+ (NSString *)stringFromDouble:(double)aDouble numberFormatter:(NSNumberFormatter *)aNumberFormatter;

/**
 *  Returns a string that represents the specified double value in multiples of the specified constant.
 *
 *  @param aDouble
 *  @param symbol
 *
 *  @return The NSString representation of the specified double value in multiples of the specified constant.
 */
+ (NSString *)stringFromDouble:(double)aDouble inMultiplesOfConstant:(NSString *)symbol;

/**
 *  Returns a string that represents the specified double value in multiples of the specified constant.
 *
 *  @param aDouble
 *  @param symbol
 *  @param numericFormatSpecifier
 *
 *  @return The NSString representation of the specified double value in multiples of the specified constant.
 */
+ (NSString *)stringFromDouble:(double)aDouble inMultiplesOfConstant:(NSString *)symbol numericFormatSpecifier:(NSString *)numericFormatSpecifier;

/**
 *  Returns a string that represents the specified double value in multiples of the specified constant.
 *
 *  @param aDouble
 *  @param symbol
 *  @param aNumberFormatter
 *
 *  @return The NSString representation of the specified double value in multiples of the specified constant.
 */
+ (NSString *)stringFromDouble:(double)aDouble inMultiplesOfConstant:(NSString *)symbol numberFormatter:(NSNumberFormatter *)aNumberFormatter;

/**
 *  Converts an unsigned long value to a string using the default "%lu" numeric format specifier.
 *
 *  @param anUnsignedLong
 *
 *  @return The NSString representation of the specified unsigned long value.
 */
+ (NSString *)stringFromUnsignedLong:(unsigned long)anUnsignedLong;

/**
 *  Converts an unsigned long value to a string with the specified numeric format.
 *
 *  @param anUnsignedLong
 *  @param numericFormatSpecifier
 *
 *  @return The NSString representation of the specified unsigned long value.
 */
+ (NSString *)stringFromUnsignedLong:(unsigned long)anUnsignedLong numericFormatSpecifier:(NSString *)numericFormatSpecifier;

/**
 *  Converts an unsigned long value to a string with the specified NSNumberFormatter instance.
 *
 *  @param anUnsignedLong
 *  @param aNumberFormatter
 *
 *  @return The NSString representation of the specified unsigned long value.
 */
+ (NSString *)stringFromUnsignedLong:(unsigned long)anUnsignedLong numberFormatter:(NSNumberFormatter *)aNumberFormatter;

/**
 *  Converts an unsigned long value to a string in the specified number system type.
 *
 *  @param anUnsignedLong
 *  @param numberSystemType
 *
 *  @return The NSString representation of the specified unsigned long value in the specified number system type.
 */
+ (NSString *)stringFromUnsignedLong:(unsigned long)anUnsignedLong numberSystem:(VSNumberSystemType)numberSystemType;

/**
 *  Converts an unsigned long long value to a string using the default "%llu" numeric format specifier.
 *
 *  @param anUnsignedLongLong
 *
 *  @return The NSString representation of the specified unsigned long long value.
 */
+ (NSString *)stringFromUnsignedLongLong:(unsigned long long)anUnsignedLongLong;

/**
 *  Converts an unsigned long long value to a string with the specified numeric format.
 *
 *  @param anUnsignedLongLong
 *  @param numericFormatSpecifier
 *
 *  @return The NSString representation of the specified unsigned long long value.
 */
+ (NSString *)stringFromUnsignedLongLong:(unsigned long long)anUnsignedLongLong numericFormatSpecifier:(NSString *)numericFormatSpecifier;

/**
 *  Converts an unsigned long long value to a string with the specified NSNumberFormatter instance.
 *
 *  @param anUnsignedLongLong
 *  @param aNumberFormatter
 *
 *  @return The NSString representation of the specified unsigned long long value.
 */
+ (NSString *)stringFromUnsignedLongLong:(unsigned long long)anUnsignedLongLong numberFormatter:(NSNumberFormatter *)aNumberFormatter;

/**
 *  Converts an unsigned long long value to a string in the specified number system type.
 *
 *  @param anUnsignedLongLong
 *  @param numberSystemType
 *
 *  @return The NSString representation of the specified unsigned long long value in the specified number system type.
 */
+ (NSString *)stringFromUnsignedLongLong:(unsigned long long)anUnsignedLongLong numberSystem:(VSNumberSystemType)numberSystemType;

#pragma mark - Character Encoding

/**
 *  Gets the subscript unichar from an unsigned integer.
 *
 *  @param anUnsignedInteger
 *
 *  @return The subscript unichar if applicable, -1 otherwise.
 */
+ (unichar)subscriptUnicharFromUnsignedInt:(unsigned int)anUnsignedInteger;

/**
 *  Gets the encoded characters from an unsigned long long value in the specified
 *  character encoding type.
 *
 *  @param anUnsignedLongLong
 *  @param characterEncodingType
 *
 *  @return The encoded characters.
 */
+ (NSString *)encodedCharactersFromUnsignedLongLong:(unsigned long long)anUnsignedLongLong characterEncodingType:(VSCharacterEncodingType)characterEncodingType;

@end
