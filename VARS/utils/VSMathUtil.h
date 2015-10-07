/**
 *  VARS
 *  (c) VARIANTE <http://variante.io>
 *
 *  Utility for complex math operations.
 *
 *  This software is released under the MIT License:
 *  http://www.opensource.org/licenses/mit-license.php
 */

#if ! TARGET_OS_MAC
#import <CoreGraphics/CoreGraphics.h>
#endif

#import "VSNumberUtil.h"

/**
 *  Dictionary property for character sets.
 */
#define VS_M_DICTIONARY_PROPERTY_CHARACTER_SET @"characterSet"

/**
 *  Dictionary property for max range.
 */
#define VS_M_DICTIONARY_PROPERTY_MAX_RANGE @"maxRange"

#pragma mark - --------------------------------------------------------------------------

/**
 *  Enums of all angle mode types (i.e. degrees, radians, etc).
 */
typedef NS_ENUM(int, VSMathAngleModeType)
{
    VSMathAngleModeTypeUnknown = -1,
    VSMathAngleModeTypeDegree,
    VSMathAngleModeTypeRadian,
    VSMathAngleModeTypeGradian,
    VSMathAngleModeTypeMaxTypes
};

/**
 *  Translates VSMathAngleModeType to string.
 *
 *  @param type
 *
 *  @return NSString equivalent of the specified VSMathAngleModeType.
 */
NSString *NSStringFromVSMathAngleModeType(VSMathAngleModeType type);

/**
 *  Enums of all defined math symbols.
 */
typedef NS_ENUM(int, VSMathSymbolType)
{
    VSMathSymbolTypeUnknown = -1,
    VSMathSymbolTypeEqual,
    VSMathSymbolTypeAdd,
    VSMathSymbolTypeSubtract,
    VSMathSymbolTypeMultiply,
    VSMathSymbolTypeMultiplyAlternate,
    VSMathSymbolTypeDivide,
    VSMathSymbolTypeDivideAlternate,
    VSMathSymbolTypeModulo,
    VSMathSymbolTypeExponent,
    VSMathSymbolTypeRoot,
    VSMathSymbolTypeScientificNotation,
    VSMathSymbolTypeChoose,
    VSMathSymbolTypePick,
    VSMathSymbolTypeNegative,
    VSMathSymbolTypeSquare,
    VSMathSymbolTypeSquareRoot,
    VSMathSymbolTypeCube,
    VSMathSymbolTypeCubeRoot,
    VSMathSymbolTypePercent,
    VSMathSymbolTypeFactorial,
    VSMathSymbolTypeSine,
    VSMathSymbolTypeCosine,
    VSMathSymbolTypeTangent,
    VSMathSymbolTypeInverseSine,
    VSMathSymbolTypeInverseCosine,
    VSMathSymbolTypeInverseTangent,
    VSMathSymbolTypeHyperbolicSine,
    VSMathSymbolTypeHyperbolicCosine,
    VSMathSymbolTypeHyperbolicTangent,
    VSMathSymbolTypeInverseHyperbolicSine,
    VSMathSymbolTypeInverseHyperbolicCosine,
    VSMathSymbolTypeInverseHyperbolicTangent,
    VSMathSymbolTypeNaturalLogarithm,
    VSMathSymbolTypeLogarithm10,
    VSMathSymbolTypeLogarithm2,
    VSMathSymbolTypeAbsoluteValue,
    VSMathSymbolTypeLeftParenthesis,
    VSMathSymbolTypeRightParenthesis,
    VSMathSymbolTypeLeftShift,
    VSMathSymbolTypeLeftShiftBy,
    VSMathSymbolTypeRightShift,
    VSMathSymbolTypeRightShiftBy,
    VSMathSymbolTypeLeftRotate,
    VSMathSymbolTypeRightRotate,
    VSMathSymbolTypeOnesComplement,
    VSMathSymbolTypeTwosComplement,
    VSMathSymbolTypeFlipWord,
    VSMathSymbolTypeFlipByte,
    VSMathSymbolTypeAnd,
    VSMathSymbolTypeNand,
    VSMathSymbolTypeOr,
    VSMathSymbolTypeNor,
    VSMathSymbolTypeXor,
    VSMathSymbolTypeXnor,
    VSMathSymbolTypePi,
    VSMathSymbolTypeEuler,
    VSMathSymbolTypeRandomNumber,
    VSMathSymbolTypeXVariable,
    VSMathSymbolTypeYVariable,
    VSMathSymbolTypeMaxTypes
};

/**
 *  Translates VSMathSymbolType to string.
 *
 *  @param type
 *
 *  @return NSString equivalent of the specified VSMathSymbolType.
 */
NSString *NSStringFromVSMathSymbolType(VSMathSymbolType type);

/**
 *  Enums of all defined math operations and functions.
 */
typedef NS_ENUM(int, VSMathOperationType)
{
    VSMathOperationTypeUnknown = -1,
    VSMathOperationTypeExponent,
    VSMathOperationTypeRoot,
    VSMathOperationTypeScientificNotation,
    VSMathOperationTypeChoose,
    VSMathOperationTypePick,
    VSMathOperationTypeSquare,
    VSMathOperationTypeCube,
    VSMathOperationTypeSquareRoot,
    VSMathOperationTypeCubeRoot,
    VSMathOperationTypePercent,
    VSMathOperationTypeFactorial,
    VSMathOperationTypeSine,
    VSMathOperationTypeCosine,
    VSMathOperationTypeTangent,
    VSMathOperationTypeInverseSine,
    VSMathOperationTypeInverseCosine,
    VSMathOperationTypeInverseTangent,
    VSMathOperationTypeHyperbolicSine,
    VSMathOperationTypeHyperbolicCosine,
    VSMathOperationTypeHyperbolicTangent,
    VSMathOperationTypeInverseHyperbolicSine,
    VSMathOperationTypeInverseHyperbolicCosine,
    VSMathOperationTypeInverseHyperbolicTangent,
    VSMathOperationTypeNaturalLogarithm,
    VSMathOperationTypeInverseNaturalLogarithm,
    VSMathOperationTypeLogarithm10,
    VSMathOperationTypeInverseLogarithm10,
    VSMathOperationTypeLogarithm2,
    VSMathOperationTypeInverseLogarithm2,
    VSMathOperationTypeAbsoluteValue,
    VSMathOperationTypeLeftParenthesis,
    VSMathOperationTypeRightParenthesis,
    VSMathOperationTypePi,
    VSMathOperationTypeEuler,
    VSMathOperationTypeRandomNumber,
    VSMathOperationTypeInverse,
    VSMathOperationTypeNegative,
    VSMathOperationTypeModulo,
    VSMathOperationTypeDivide,
    VSMathOperationTypeMultiply,
    VSMathOperationTypeSubtract,
    VSMathOperationTypeAdd,
    VSMathOperationTypeEqual,
    VSMathOperationTypeLeftShift,
    VSMathOperationTypeLeftShiftBy,
    VSMathOperationTypeRightShift,
    VSMathOperationTypeRightShiftBy,
    VSMathOperationTypeOnesComplement,
    VSMathOperationTypeTwosComplement,
    VSMathOperationTypeFlipWord,
    VSMathOperationTypeFlipByte,
    VSMathOperationTypeRoR,
    VSMathOperationTypeRoL,
    VSMathOperationTypeAnd,
    VSMathOperationTypeNand,
    VSMathOperationTypeOr,
    VSMathOperationTypeNor,
    VSMathOperationTypeXor,
    VSMathOperationTypeXnor,
    VSMathOperationTypeMaxTypes
};

/**
 *  Translates VSMathOperationType to string.
 *
 *  @param type
 *
 *  @return NSString equivalent of the specified VSMathOperationType.
 */
NSString *NSStringFromVSMathOperationType(VSMathOperationType type);


/**
 *  Enums of all math operator unary types (i.e. unary prefix, unary postfix, etc).
 */
typedef NS_ENUM(int, VSMathOperatorUnaryType)
{
    VSMathOperatorUnaryTypeUnknown = -1,
    VSMathOperatorUnaryTypeNonUnary,
    VSMathOperatorUnaryTypeUnaryPrefix,
    VSMathOperatorUnaryTypeUnaryPostfix,
    VSMathOperatorUnaryTypeMaxTypes
};

/**
 *  Translates VSMathOperatorUnaryType to string.
 *
 *  @param type
 *
 *  @return NSString equivalent of the specified VSMathOperatorUnaryType.
 */
NSString *NSStringFromVSMathOperatorUnaryType(VSMathOperatorUnaryType type);

/**
 *  Enums of all math operator associative types (i.e. left, right, etc).
 */
typedef NS_ENUM(int, VSMathOperatorAssociativeType)
{
    VSMathOperatorAssociativeTypeUnknown = -1,
    VSMathOperatorAssociativeTypeLeft,
    VSMathOperatorAssociativeTypeRight,
    VSMathOperatorAssociativeTypeMaxTypes
};

/**
 *  Translates VSMathOperatorAssociativeType to string.
 *
 *  @param type
 *
 *  @return NSString equivalent of the specified VSMathOperatorAssociativeType.
 */
NSString *NSStringFromVSMathOperatorAssociativeType(VSMathOperatorAssociativeType type);

/**
 *  Enums of all math expression token types.
 */
typedef NS_ENUM(int, VSMathTokenType)
{
    VSMathTokenTypeUnknown = -1,
    VSMathTokenTypeNumeric,
    VSMathTokenTypeFunction,
    VSMathTokenTypeOperator,
    VSMathTokenTypeUnaryPrefixOperator,
    VSMathTokenTypeUnaryPostfixOperator,
    VSMathTokenTypeConstant,
    VSMathTokenTypeVariable,
    VSMathTokenTypeParenthesis,
    VSMathTokenTypeMaxTypes
};

/**
 *  Translates VSMathTokenType to string.
 *
 *  @param type
 *
 *  @return NSString equivalent of the specified VSMathTokenType.
 */
NSString *NSStringFromVSMathTokenType(VSMathTokenType type);

#pragma mark - --------------------------------------------------------------------------

NS_ROOT_CLASS @interface VSMathUtil

#pragma mark - Math Character Sets

/**
 *  Gets the NSCharacterSet for numeric symbols.
 *
 *  @return An NSCharacterSet instance for numeric symbols.
 */
+ (NSCharacterSet *)numericCharacterSet;

/**
 *  Gets the NSCharacterSet for function symbols.
 *
 *  @return An NSCharacterSet instance for function symbols.
 */
+ (NSCharacterSet *)functionCharacterSet;

/**
 *  Gets the NSCharacterSet for nonunary operator symbols.
 *
 *  @return An NSCharacterSet instance for nonunary operator symbols.
 */
+ (NSCharacterSet *)operatorCharacterSet;

/**
 *  Gets the NSCharacterSet for unary prefix operator symbols.
 *
 *  @return An NSCharacterSet instance for unary prefix operator symbols.
 */
+ (NSCharacterSet *)unaryPrefixOperatorCharacterSet;

/**
 *  Gets the NSCharacterSet for unary postfix operator symbols.
 *
 *  @return An NSCharacterSet instance for unary postfix operator symbols.
 */
+ (NSCharacterSet *)unaryPostfixOperatorCharacterSet;

/**
 *  Gets the NSCharacterSet for constant symbols.
 *
 *  @return An NSCharacterSet instance for constant symbols.
 */
+ (NSCharacterSet *)constantCharacterSet;

/**
 *  Gets the NSCharacterSet for variable symbols.
 *
 *  @return An NSCharacterSet instance for variable symbols.
 */
+ (NSCharacterSet *)variableCharacterSet;

/**
 *  Gets the NSCharacterSet for parenthesis symbols.
 *
 *  @return An NSCharacterSet instance for parenthesis symbols.
 */
+ (NSCharacterSet *)parenthesisCharacterSet;

#pragma mark - Math Operations
#pragma mark Bitwise Operations

/**
 *  Evaluates the given bitwise operation type with one decimal operand.
 *
 *  @param operationType
 *  @param operand
 *
 *  @return Unsigned long long value result.
 */
+ (unsigned long long)evaluateBitwiseOperation:(VSMathOperationType)operationType operand:(unsigned long long)operand binaryDigitType:(VSBinaryDigitType)binaryDigitType;

/**
 *  Evaluates the given bitwise operation type with two decimal operands.
 *
 *  @param operationType
 *  @param operandX
 *  @param operandY
 *
 *  @return Unsigned long long value result.
 */
+ (unsigned long long)evaluateBitwiseOperation:(VSMathOperationType)operationType operandX:(unsigned long long)operandX operandY:(unsigned long long)operandY binaryDigitType:(VSBinaryDigitType)binaryDigitType;

#pragma mark Floating-Point Operations

/**
 *  Evaluates the given operation type with no operand.
 *
 *  @param operationType
 *  @param angleMode
 *
 *  @return Double value result.
 */
+ (double)evaluateOperation:(VSMathOperationType)operationType angleMode:(VSMathAngleModeType)angleMode;

/**
 *  Evaluates the given operation type with only one operand x.
 *
 *  @param operationType
 *  @param angleMode
 *  @param operand
 *
 *  @return Double value result.
 */
+ (double)evaluateOperation:(VSMathOperationType)operationType angleMode:(VSMathAngleModeType)angleMode operand:(double)operand;

/**
 *  Evaluates the given operation type with two operands x and y.
 *
 *  @param operationType
 *  @param angleMode
 *  @param operandX
 *  @param operandY
 *
 *  @return Double value result.
 */
+ (double)evaluateOperation:(VSMathOperationType)operationType angleMode:(VSMathAngleModeType)angleMode operandX:(double)operandX operandY:(double)operandY;

#pragma mark - Expression Syntax Verification

/**
 *  Validates the syntax of a math expression in infix notation.
 *
 *  @param infixExpression
 *
 *  @return YES if syntax is correct, NO otherwise.
 */
+ (BOOL)validateInfixExpressionSyntax:(NSString *)infixExpression;

/**
 *  Validates the syntax of a math expression in infix notation with the option to specify
 *  custom variable sets.
 *
 *  @param infixExpression
 *  @param customVariableSets
 *
 *  @return YES if syntax is correct, NO otherwise.
 */
+ (BOOL)validateInfixExpressionSyntax:(NSString *)infixExpression customVariableSets:(NSArray *)customVariableSets;

/**
 *  Validates the syntax of a math expression in the form of a postfix RPN stack.
 *
 *  @param postfixStack
 *
 *  @return YES if syntax is correct, NO otherwise.
 */
+ (BOOL)validatePostfixStackSyntax:(NSArray *)postfixStack;

#pragma mark - Expression Parsing

/**
 *  Parses the expression into tokens and returns them in the form of an NSArray with the option to take into 
 *  consideration the specified custom character sets. Custom character sets are defined by an array of NSDictionary 
 *  objects, each containing a "characterSet" key (an NSCharacterSet object) and a "maxRange" key (an NSNumber object, 
 *  indicating the max character length of the string token of associated type). This process does not detect any errors, 
 *  everything will be parsed into string tokens.
 *
 *  @param infixExpression
 *  @param customVariableSets
 *
 *  @return An array of string tokens.
 */
+ (NSArray *)tokensInInfixExpression:(NSString *)infixExpression customVariableSets:(NSArray *)customVariableSets;

/**
 *  Parses the infix expression into tokens and stores them into the specified NSMutableArray pointer with the option 
 *  to take into consideration the specified custom character sets. Custom character sets are defined by an array of 
 *  NSDictionary objects, each containing a "characterSet" key (an NSCharacterSet object) and a "maxRange" key (an NSNumber 
 *  object, indicating the max character length of the string token of associated type). This process does not 
 *  detect any errors, everything will be parsed into string tokens.
 *
 *  @param tokens
 *  @param infixExpression
 *  @param customVariableSets
 *
 *  @return YES if successful, NO if something went wrong.
 */
+ (BOOL)parseInfixExpressionIntoTokens:(NSMutableArray *)tokens infixExpression:(NSString *)infixExpression customVariableSets:(NSArray *)customVariableSets;

/**
 *  Gets the double value from a math expression token.
 *
 *  @param token
 *
 *  @return The double value, NAN if invalid.
 */
+ (double)doubleFromToken:(id)token;

/**
 *  Gets the unsigned long long value from a math expression token.
 *
 *  @param token
 *
 *  @return The unsigned long long value, 0 if invalid.
 */
+ (unsigned long long)unsignedLongLongFromToken:(id)token;

/**
 *  Gets the unsigned long long value from a math expression token in the specified number system type.
 *
 *  @param token
 *  @param numberSystemType
 *
 *  @return The unsigned long long value, 0 if invalid.
 */
+ (unsigned long long)unsignedLongLongFromToken:(id)token numberSystem:(VSNumberSystemType)numberSystemType;

#pragma mark - Infix-Postfix Conversions

/**
 *  Converts a string math expression in infix notation to postfix notation (RPN) represented in an array. This operation only fails under
 *  the following condition(s):
 *      1. Process token operation fails. See VSMathUtil::processShuntingYardToken:andPreviousToken:stack:output:customVariableSets:
 *
 *  @param infixExpression
 *
 *  @return The corresponding postfix notation, nil if anything goes wrong.
 */
+ (NSArray *)postfixStackFromInfixExpression:(NSString *)infixExpression;

/**
 *  Converts a string math expression in infix notation to postfix notation (RPN) represented in an array. This process allows
 *  optinally specifying an array of custom variable sets to verify variable types against. This operation only fails under
 *  the following condition(s):
 *      1. Process token operation fails. See VSMathUtil::processShuntingYardToken:andPreviousToken:stack:output:customVariableSets:
 *
 *  @param infixExpression
 *  @param customVariableSets
 *
 *  @return The corresponding postfix notation, nil if anything goes wrong.
 */
+ (NSArray *)postfixStackFromInfixExpression:(NSString *)infixExpression customVariableSets:(NSArray *)customVariableSets;

/**
 *  Converts a string math expression in infix notation to postfix notation (RPN) represented in an array. The postfix notation is stored
 *  in the specified array pointer. This operation only fails under the following condition(s):
 *      1. Process token operation fails. See VSMathUtil::processShuntingYardToken:andPreviousToken:stack:output:customVariableSets:
 *
 *  @param postfixStack
 *  @param infixExpression
 *
 *  @return The corresponding postfix notation, nil if something went wrong.
 */
+ (BOOL)parseInfixExpressionIntoPostfixStack:(NSMutableArray *)postfixStack infixExpression:(NSString *)infixExpression;

/**
 *  Converts a string math expression in infix notation to postfix notation (RPN) represented in an array. The postfix notation is stored
 *  in the specified array pointer. This process allows optinally specifying an array of custom variable sets to verify variable types
 *  against. This operation only fails under the following condition(s):
 *      1. Process token operation fails. See VSMathUtil::processShuntingYardToken:andPreviousToken:stack:output:customVariableSets:
 *
 *  @param postfixStack
 *  @param infixExpression
 *  @param customVariableSets
 *
 *  @return YES if successful, NO if something went wrong.
 */
+ (BOOL)parseInfixExpressionIntoPostfixStack:(NSMutableArray *)postfixStack infixExpression:(NSString *)infixExpression customVariableSets:(NSArray *)customVariableSets;

#pragma mark - Shunting-Yard Algorithm

/**
 *  Processes a token and allocates them to the stack according to shunting-yard rules. This process only fails under 3
 *  conditions:
 *      1. Token is recorded as numeric but the operand is invalid (i.e. 1.2.3.4.5.6)
 *      2. Token is a right parenthesis, but no left parenthesis is found on the stack, hence parenthesis mismatch.
 *      3. Token is unrecognized.
 *
 *  @param token
 *  @param stack
 *  @param output
 *
 *  @return YES if everything went fine, NO if something went wrong.
 */
+ (BOOL)processShuntingYardToken:(id)token stack:(NSMutableArray *)stack output:(NSMutableArray *)output;

/**
 *  Processes a token and allocates them to the stack according to shunting-yard rules, with the option to 
 *  specify custom variable sets. This process only fails under 3
 *  conditions:
 *      1. Token is recorded as numeric but the operand is invalid (i.e. 1.2.3.4.5.6)
 *      2. Token is a right parenthesis, but no left parenthesis is found on the stack, hence parenthesis mismatch.
 *      3. Token is unrecognized.
 *
 *  @param token
 *  @param stack
 *  @param output
 *  @param customVariableSets
 *
 *  @return YES if everything went fine, NO if something went wrong.
 */
+ (BOOL)processShuntingYardToken:(id)token stack:(NSMutableArray *)stack output:(NSMutableArray *)output customVariableSets:(NSArray *)customVariableSets;

#pragma mark - RPN Processing

/**
 *  Truncates a math expression in postfix notation (RPN) in double values and returns an autoreleased array of
 *  the truncated stack.
 *
 *  @param postfixStack
 *  @param angleMode
 *
 *  @return An array of truncated tokens, nil if expression is invalid or contains syntax errors.
 */
+ (NSArray *)postfixStackByTruncatingPostfixStack:(NSArray *)postfixStack angleMode:(VSMathAngleModeType)angleMode;

/**
 *  Truncates a math expression in postfix notation (RPN) in double values and returns an autoreleased array of
 *  the truncated stack, with the option to replace tokens by specifying a token map.
 *
 *  @param postfixStack
 *  @param angleMode
 *  @param tokenMap
 *
 *  @return An array of truncated tokens, nil if expression is invalid or contains syntax errors.
 */
+ (NSArray *)postfixStackByTruncatingPostfixStack:(NSArray *)postfixStack angleMode:(VSMathAngleModeType)angleMode tokenMap:(NSDictionary *)tokenMap;

/**
 *  Truncates a math expression in postfix notation (RPN) in unsigned long long values and returns an autoreleased array
 *  of the truncated stack.
 *
 *  @param postfixStack
 *  @param binaryDigitMode
 *
 *  @return An array of truncated tokens, nil if expression is invalid or contains syntax errors.
 */
+ (NSArray *)postfixStackByTruncatingBitwisePostfixStack:(NSArray *)postfixStack binaryDigitMode:(VSBinaryDigitType)binaryDigitMode;

/**
 *  Truncates a math expression in postfix notation (RPN) in unsigned long long values and returns an autoreleased array
 *  of the truncated stack, with the option to replace tokens by specifying a token map.
 *
 *  @param postfixStack
 *  @param binaryDigitMode
 *  @param tokenMap
 *
 *  @return An array of truncated tokens, nil if expression is invalid or contains syntax errors.
 */
+ (NSArray *)postfixStackByTruncatingBitwisePostfixStack:(NSArray *)postfixStack binaryDigitMode:(VSBinaryDigitType)binaryDigitMode tokenMap:(NSDictionary *)tokenMap;

/**
 *  Truncates a math expression in postfix notation (RPN) in double values and stores the truncated stack 
 *  into a specified array pointer.
 *
 *  @param truncatedPostfixStack
 *  @param postfixStack
 *  @param angleMode
 *
 *  @return YES if successful, NO if something went wrong.
 */
+ (BOOL)truncatePostfixStackIntoPostfixStack:(NSMutableArray *)truncatedPostfixStack postfixStack:(NSArray *)postfixStack angleMode:(VSMathAngleModeType)angleMode;

/**
 *  Truncates a math expression in postfix notation (RPN) in double values and stores the truncated stack
 *  into a specified array pointer with the option to replace tokens by specifying a token map.
 *
 *  @param truncatedPostfixStack
 *  @param postfixStack
 *  @param angleMode
 *  @param tokenMap
 *
 *  @return YES if successful, NO if something went wrong.
 */
+ (BOOL)truncatePostfixStackIntoPostfixStack:(NSMutableArray *)truncatedPostfixStack postfixStack:(NSArray *)postfixStack angleMode:(VSMathAngleModeType)angleMode tokenMap:(NSDictionary *)tokenMap;

/**
 *  Truncates a math expression in postfix notation (RPN) in unsigned long long values and stores the truncated 
 *  stack into a specified array pointer.
 *
 *  @param truncatedPostfixStack
 *  @param postfixStack
 *  @param binaryDigitMode 
 *
 *  @return YES if successful, NO if something went wrong.
 */
+ (BOOL)truncateBitwisePostfixStackIntoPostfixStack:(NSMutableArray *)truncatedPostfixStack postfixStack:(NSArray *)postfixStack binaryDigitMode:(VSBinaryDigitType)binaryDigitMode;

/**
 *  Truncates a math expression in postfix notation (RPN) in unsigned long long values and stores the truncated
 *  stack into a specified array pointer, with the option to replace tokens by specifying a token map.
 *
 *  @param truncatedPostfixStack
 *  @param postfixStack
 *  @param binaryDigitMode
 *  @param tokenMap
 *
 *  @return YES if successful, NO if something went wrong.
 */
+ (BOOL)truncateBitwisePostfixStackIntoPostfixStack:(NSMutableArray *)truncatedPostfixStack postfixStack:(NSArray *)postfixStack binaryDigitMode:(VSBinaryDigitType)binaryDigitMode tokenMap:(NSDictionary *)tokenMap;

#pragma mark - Expression Evaluation

/**
 *  Evalutes the given infix math expression and returns the result.
 *
 *  @param infixExpression
 *  @param angleMode
 *
 *  @return NSNumber result if expression can be evaluated, nil if expression cannot be evaluated (syntax error, etc).
 */
+ (NSNumber *)evaluateInfixExpression:(NSString *)infixExpression angleMode:(VSMathAngleModeType)angleMode;

/**
 *  Evalutes the given infix math expression and returns the result with the option to replace tokens by inserting a token map and specifying
 *  custom variable sets.
 *
 *  @param infixExpression
 *  @param angleMode
 *  @param tokenMap
 *  @param customVariableSets
 *
 *  @return NSNumber result if expression can be evaluated, nil if expression cannot be evaluated (syntax error, etc).
 */
+ (NSNumber *)evaluateInfixExpression:(NSString *)infixExpression angleMode:(VSMathAngleModeType)angleMode tokenMap:(NSDictionary *)tokenMap customVariableSets:(NSArray *)customVariableSets;

/**
 *  Evaluates a math expression in postfix notation for double values.
 *
 *  @param postfixStack
 *  @param angleMode
 *
 *  @return The evaluated NSNumber object, nil if expression is invalid or contains syntax errors.
 */
+ (NSNumber *)evaluatePostfixStack:(NSArray *)postfixStack angleMode:(VSMathAngleModeType)angleMode;

/**
 *  Evaluates a math expression in postfix notation for double values with the option to replace tokens by specifying
 *  a token map.
 *
 *  @param postfixStack
 *  @param angleMode
 *  @param tokenMap
 *
 *  @return The evaluated NSNumber object, nil if expression is invalid or contains syntax errors.
 */
+ (NSNumber *)evaluatePostfixStack:(NSArray *)postfixStack angleMode:(VSMathAngleModeType)angleMode tokenMap:(NSDictionary *)tokenMap;

/**
 *  Evaluates a math expression in postfix notation for unsigned long long values.
 *
 *  @param postfixStack
 *  @param binaryDigitMode 
 *
 *  @return The evaluated NSNumber object, nil if expression is invalid or contains syntax errors.
 */
+ (NSNumber *)evaluateBitwisePostfixStack:(NSArray *)postfixStack binaryDigitMode:(VSBinaryDigitType)binaryDigitMode;

/**
 *  Evaluates a math expression in postfix notation for unsigned long long values with the option to replace tokens by specifying
 *  a token map.
 *
 *  @param postfixStack
 *  @param binaryDigitMode
 *  @param tokenMap
 *
 *  @return The evaluated NSNumber object, nil if expression is invalid or contains syntax errors.
 */
+ (NSNumber *)evaluateBitwisePostfixStack:(NSArray *)postfixStack binaryDigitMode:(VSBinaryDigitType)binaryDigitMode tokenMap:(NSDictionary *)tokenMap;

#pragma mark - Function Sampling

/**
 *  Performs linear sampling on a math expression f(x) over the specified range.
 *
 *  @param infixExpression
 *  @param angleMode
 *  @param xMin
 *  @param xMax
 *  @param numberOfSamples
 *
 *  @return An array of sampled points wrapped in NSValue.
 */
+ (NSArray *)samplesFromLinearSamplingInfixExpression:(NSString *)infixExpression angleMode:(VSMathAngleModeType)angleMode xMin:(double)xMin xMax:(double)xMax numberOfSamples:(int)numberOfSamples;

/**
 *  Performs linear sampling on a math expression in postfix notation (RPN) f(x) over the specified range.
 *
 *  @param postfixStack
 *  @param angleMode
 *  @param xMin
 *  @param xMax
 *  @param numberOfSamples
 *
 *  @return An array of sampled points wrapped in NSValue.
 */
+ (NSArray *)samplesFromLinearSamplingPostfixStack:(NSArray *)postfixStack angleMode:(VSMathAngleModeType)angleMode xMin:(double)xMin xMax:(double)xMax numberOfSamples:(int)numberOfSamples;

/**
 *  Performs adaptive sampling on a math expression in infix notation f(x) with specified paramaters.
 *
 *  @param infixExpression Math expression in infix notation represented in a string.
 *  @param angleMode       Angle mode (i.e. deg, rad, etc) in which the RPN should be evaluated in.
 *  @param xMin            Minimum x value to sample.
 *  @param xMax            Maximum x value to sample (along with xMin, marks the x boundary).
 *  @param tolerance       Tolerance to sample to, aka epsilon.
 *  @param depth           Maximum recursion iteration.
 *
 *  @return An array of sampled points wrapped in NSValue objects.
 */
+ (NSArray *)samplesFromAdaptiveSamplingInfixExpression:(NSString *)infixExpression angleMode:(VSMathAngleModeType)angleMode xMin:(double)xMin xMax:(double)xMax tolerance:(double)tolerance depth:(int)depth;

/**
 *  Performs adaptive sampling on a math expression in postfix notation (RPN) f(x) with specified paramaters.
 *
 *  @param postfixStack Math expression in postfix notation (RPN) represented in an array.
 *  @param angleMode    Angle mode (i.e. deg, rad, etc) in which the RPN should be evaluated in.
 *  @param xMin         Minimum x value to sample.
 *  @param xMax         Maximum x value to sample (along with xMin, marks the x boundary).
 *  @param tolerance    Tolerance to sample to, aka epsilon.
 *  @param depth        Maximum recursion iteration (8 is optimal).
 *
 *  @return An array of sampled points wrapped in NSValue objects.
 */
+ (NSArray *)samplesFromAdaptiveSamplingPostfixStack:(NSArray *)postfixStack angleMode:(VSMathAngleModeType)angleMode xMin:(double)xMin xMax:(double)xMax tolerance:(double)tolerance depth:(int)depth;

/**
 *  Performs custom sampling on a math expression in infix notation f(x) with specified paramaters.
 *
 *  @param infixExpression
 *  @param angleMode
 *  @param xMin
 *  @param xMax
 *  @param yMin
 *  @param yMax
 *  @param tolerance
 *
 *  @return An array of sampled points wrapped in NSValue objects.
 */
+ (NSArray *)samplesFromCustomSamplingInfixExpression:(NSString *)infixExpression angleMode:(VSMathAngleModeType)angleMode xMin:(double)xMin xMax:(double)xMax yMin:(double)yMin yMax:(double)yMax tolerance:(double)tolerance;

/**
 *  Performs custom sampling on a math expression in postfix notation (RPN) f(x) with specified paramaters.
 *
 *  @param postfixStack
 *  @param angleMode
 *  @param xMin
 *  @param xMax
 *  @param yMin
 *  @param yMax
 *  @param tolerance
 *
 *  @return An array of sampled points wrapped in NSValue objects.
 */
+ (NSArray *)samplesFromCustomSamplingPostfixStack:(NSArray *)postfixStack angleMode:(VSMathAngleModeType)angleMode xMin:(double)xMin xMax:(double)xMax yMin:(double)yMin yMax:(double)yMax tolerance:(double)tolerance;

/**
 *  Evaluates the slope between two given points.
 *
 *  @param pointA
 *  @param pointB
 *
 *  @return The slope if valid, NAN otherwise.
 */
+ (double)evaluateSlopeBetweenPoint:(CGPoint)pointA andPoint:(CGPoint)pointB;

#pragma mark - Math Operator Properties

/**
 *  Gets the precedence of an NSString math symbol (if applicable).
 *
 *  @param symbol
 *
 *  @return The precedence if applicable, -1 otherwise.
 */
+ (int)precedenceOfSymbol:(NSString *)symbol;

/**
 *  Gets the precedence of a VSMathSymbolType (if applicable).
 *
 *  @param symbolType
 *
 *  @return The precedence if applicable, -1 otherwise.
 */
+ (int)precedenceOfSymbolType:(VSMathSymbolType)symbolType;

/**
 *  Gets the precedence of a VSMathOperationType (if applicable).
 *
 *  @param operationType
 *
 *  @return The precedence if applicable, -1 otherwise.
 */
+ (int)precedenceOfOperationType:(VSMathOperationType)operationType;

/**
 *  Gets the VSMathOperatorAssociativeType of an NSString math symbol (i.e. left, right, etc).
 *
 *  @param symbol
 *
 *  @return The corresponding VSMathOperatorAssociativeType.
 */
+ (VSMathOperatorAssociativeType)operatorAssociativeTypeOfSymbol:(NSString *)symbol;

/**
 *  Gets the VSMathOperatorAssociativeType of a VSMathSymbolType (i.e. left, right, etc).
 *
 *  @param symbolType
 *
 *  @return The corresponding VSMathOperatorAssociativeType.
 */
+ (VSMathOperatorAssociativeType)operatorAssociativeTypeOfSymbolType:(VSMathSymbolType)symbolType;

/**
 *  Gets the VSMathOperatorAssociativeType of a VSMathOperationType (i.e. left, right, etc).
 *
 *  @param operationType
 *
 *  @return The corresponding VSMathOperatorAssociativeType.
 */
+ (VSMathOperatorAssociativeType)operatorAssociativeTypeOfOperationType:(VSMathOperationType)operationType;

/**
 *  Gets the VSMathOperatorUnaryType of an NSString math symbol.
 *
 *  @param symbol
 *
 *  @return The corresponding VSMathOperatorUnaryType.
 */
+ (VSMathOperatorUnaryType)operatorUnaryTypeOfSymbol:(NSString *)symbol;

/**
 *  Gets the VSMathOperatorUnaryType of a VSMathSymbolType.
 *
 *  @param symbolType
 *
 *  @return The corresponding VSMathOperatorUnaryType.
 */
+ (VSMathOperatorUnaryType)operatorUnaryTypeOfSymbolType:(VSMathSymbolType)symbolType;

/**
 *  Gets the VSMathOperatorUnaryType of a VSMathOperationType.
 *
 *  @param operationType
 *
 *  @return The corresponding VSMathOperatorUnaryType.
 */
+ (VSMathOperatorUnaryType)operatorUnaryTypeOfOperationType:(VSMathOperationType)operationType;

#pragma mark - Enum Translations

/**
 *  Returns the VSMathTokenType of a recognized token (must be either an NSString or an NSNumber).
 *
 *  @param token
 *
 *  @return The corresponding VSMathTokenType.
 */
+ (VSMathTokenType)typeOfToken:(id)token;

/**
 *  Returns the VSMathTokenType of a token subset.
 *
 *  @param tokenSubset
 *
 *  @return The corresponding VSMathTokenType.
 */
+ (VSMathTokenType)typeOfTokenSubset:(id)tokenSubset;

/**
 *  Returns an NSString math symbol using the specified VSMathSymbolType.
 *
 *  @param symbolType
 *
 *  @return The corresponding NSString symbol.
 */
+ (NSString *)symbolWithType:(VSMathSymbolType)symbolType;

/**
 *  Returns the VSMathSymbolType of the corresponding NSString math symbol.
 *
 *  @param symbol
 *
 *  @return The corresponding VSMathSymbolType.
 */
+ (VSMathSymbolType)typeOfSymbol:(NSString *)symbol;

/**
 *  Returns the VSMathOperationType of the corresponding NSString math symbol.
 *
 *  @param symbol
 *
 *  @return The corresponding VSMathOperationType.
 */
+ (VSMathOperationType)operationTypeOfSymbol:(NSString *)symbol;

/**
 *  Returns the VSMathOperationType of the corresponding VSMathSymbolType.
 *
 *  @param symbolType
 *
 *  @return The corresponding VSMathOperationType.
 */
+ (VSMathOperationType)operationTypeOfSymbolType:(VSMathSymbolType)symbolType;

/**
 *  Returns the VSMathSymbolType of the corresponding VSMathOperationType.
 *
 *  @param operationType
 *
 *  @return The corresponding VSMathSymbolType.
 */
+ (VSMathSymbolType)symbolTypeOfOperationType:(VSMathOperationType)operationType;

/**
 *  Returns the NSString math symbol of the corresponding VSMathOperationType.
 *
 *  @param operationType
 *
 *  @return The corresponding NSString math symbol.
 */
+ (NSString *)symbolWithOperationType:(VSMathOperationType)operationType;

@end
