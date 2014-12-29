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
#import "VSStringUtil.h"

#pragma mark - ENUMS

/*
 *  @inheritdoc
 */
NSString *NSStringFromVSMathAngleModeType(VSMathAngleModeType type)
{
    switch (type)
    {
        case VSMathAngleModeTypeUnknown:  return @"VSMathAngleModeTypeUnknown";
        case VSMathAngleModeTypeDegree:   return @"VSMathAngleModeTypeDegree";
        case VSMathAngleModeTypeRadian:   return @"VSMathAngleModeTypeRadian";
        case VSMathAngleModeTypeGradian:  return @"VSMathAngleModeTypeGradian";
        case VSMathAngleModeTypeMaxTypes: return @"VSMathAngleModeTypeMaxTypes";
        default:                          return @(type).stringValue;
    }
}

/*
 *  @inheritdoc
 */
NSString *NSStringFromVSMathSymbolType(VSMathSymbolType type)
{
    switch (type)
    {
        case VSMathSymbolTypeUnknown:                  return @"VSMathSymbolTypeUnknown";
        case VSMathSymbolTypeEqual:                    return @"VSMathSymbolTypeEqual";
        case VSMathSymbolTypeAdd:                      return @"VSMathSymbolTypeAdd";
        case VSMathSymbolTypeSubtract:                 return @"VSMathSymbolTypeSubtract";
        case VSMathSymbolTypeMultiply:                 return @"VSMathSymbolTypeMultiply";
        case VSMathSymbolTypeMultiplyAlternate:        return @"VSMathSymbolTypeMultiplyAlternate";
        case VSMathSymbolTypeDivide:                   return @"VSMathSymbolTypeDivide";
        case VSMathSymbolTypeDivideAlternate:          return @"VSMathSymbolTypeDivideAlternate";
        case VSMathSymbolTypeModulo:                   return @"VSMathSymbolTypeModulo";
        case VSMathSymbolTypeExponent:                 return @"VSMathSymbolTypeExponent";
        case VSMathSymbolTypeRoot:                     return @"VSMathSymbolTypeRoot";
        case VSMathSymbolTypeScientificNotation:       return @"VSMathSymbolTypeScientificNotation";
        case VSMathSymbolTypeChoose:                   return @"VSMathSymbolTypeChoose";
        case VSMathSymbolTypePick:                     return @"VSMathSymbolTypePick";
        case VSMathSymbolTypeNegative:                 return @"VSMathSymbolTypeNegative";
        case VSMathSymbolTypeSquare:                   return @"VSMathSymbolTypeSquare";
        case VSMathSymbolTypeSquareRoot:               return @"VSMathSymbolTypeSquareRoot";
        case VSMathSymbolTypeCube:                     return @"VSMathSymbolTypeCube";
        case VSMathSymbolTypeCubeRoot:                 return @"VSMathSymbolTypeCubeRoot";
        case VSMathSymbolTypePercent:                  return @"VSMathSymbolTypePercent";
        case VSMathSymbolTypeFactorial:                return @"VSMathSymbolTypeFactorial";
        case VSMathSymbolTypeSine:                     return @"VSMathSymbolTypeSine";
        case VSMathSymbolTypeCosine:                   return @"VSMathSymbolTypeCosine";
        case VSMathSymbolTypeTangent:                  return @"VSMathSymbolTypeTangent";
        case VSMathSymbolTypeInverseSine:              return @"VSMathSymbolTypeInverseSine";
        case VSMathSymbolTypeInverseCosine:            return @"VSMathSymbolTypeInverseCosine";
        case VSMathSymbolTypeInverseTangent:           return @"VSMathSymbolTypeInverseTangent";
        case VSMathSymbolTypeHyperbolicSine:           return @"VSMathSymbolTypeHyperbolicSine";
        case VSMathSymbolTypeHyperbolicCosine:         return @"VSMathSymbolTypeHyperbolicCosine";
        case VSMathSymbolTypeHyperbolicTangent:        return @"VSMathSymbolTypeHyperbolicTangent";
        case VSMathSymbolTypeInverseHyperbolicSine:    return @"VSMathSymbolTypeInverseHyperbolicSine";
        case VSMathSymbolTypeInverseHyperbolicCosine:  return @"VSMathSymbolTypeInverseHyperbolicCosine";
        case VSMathSymbolTypeInverseHyperbolicTangent: return @"VSMathSymbolTypeInverseHyperbolicTangent";
        case VSMathSymbolTypeNaturalLogarithm:         return @"VSMathSymbolTypeNaturalLogarithm";
        case VSMathSymbolTypeLogarithm10:              return @"VSMathSymbolTypeLogarithm10";
        case VSMathSymbolTypeLogarithm2:               return @"VSMathSymbolTypeLogarithm2";
        case VSMathSymbolTypeAbsoluteValue:            return @"VSMathSymbolTypeAbsoluteValue";
        case VSMathSymbolTypeLeftParenthesis:          return @"VSMathSymbolTypeLeftParenthesis";
        case VSMathSymbolTypeRightParenthesis:         return @"VSMathSymbolTypeRightParenthesis";
        case VSMathSymbolTypeLeftShift:                return @"VSMathSymbolTypeLeftShift";
        case VSMathSymbolTypeLeftShiftBy:              return @"VSMathSymbolTypeLeftShiftBy";
        case VSMathSymbolTypeRightShift:               return @"VSMathSymbolTypeRightShift";
        case VSMathSymbolTypeRightShiftBy:             return @"VSMathSymbolTypeRightShiftBy";
        case VSMathSymbolTypeLeftRotate:               return @"VSMathSymbolTypeLeftRotate";
        case VSMathSymbolTypeRightRotate:              return @"VSMathSymbolTypeRightRotate";
        case VSMathSymbolTypeOnesComplement:           return @"VSMathSymbolTypeOnesComplement";
        case VSMathSymbolTypeTwosComplement:           return @"VSMathSymbolTypeTwosComplement";
        case VSMathSymbolTypeFlipWord:                 return @"VSMathSymbolTypeFlipWord";
        case VSMathSymbolTypeFlipByte:                 return @"VSMathSymbolTypeFlipByte";
        case VSMathSymbolTypeAnd:                      return @"VSMathSymbolTypeAnd";
        case VSMathSymbolTypeNand:                     return @"VSMathSymbolTypeNand";
        case VSMathSymbolTypeOr:                       return @"VSMathSymbolTypeOr";
        case VSMathSymbolTypeNor:                      return @"VSMathSymbolTypeNor";
        case VSMathSymbolTypeXor:                      return @"VSMathSymbolTypeXor";
        case VSMathSymbolTypeXnor:                     return @"VSMathSymbolTypeXnor";
        case VSMathSymbolTypePi:                       return @"VSMathSymbolTypePi";
        case VSMathSymbolTypeEuler:                    return @"VSMathSymbolTypeEuler";
        case VSMathSymbolTypeRandomNumber:             return @"VSMathSymbolTypeRandomNumber";
        case VSMathSymbolTypeXVariable:                return @"VSMathSymbolTypeXVariable";
        case VSMathSymbolTypeYVariable:                return @"VSMathSymbolTypeYVariable";
        case VSMathSymbolTypeMaxTypes:                 return @"VSMathSymbolTypeMaxTypes";
        default:                                       return @(type).stringValue;
    }
}

/*
 *  @inheritdoc
 */
NSString *NSStringFromVSMathOperationType(VSMathOperationType type)
{
    switch (type)
    {
        case VSMathOperationTypeUnknown:                  return @"VSMathOperationTypeUnknown";
        case VSMathOperationTypeExponent:                 return @"VSMathOperationTypeExponent";
        case VSMathOperationTypeRoot:                     return @"VSMathOperationTypeRoot";
        case VSMathOperationTypeScientificNotation:       return @"VSMathOperationTypeScientificNotation";
        case VSMathOperationTypeChoose:                   return @"VSMathOperationTypeChoose";
        case VSMathOperationTypePick:                     return @"VSMathOperationTypePick";
        case VSMathOperationTypeSquare:                   return @"VSMathOperationTypeSquare";
        case VSMathOperationTypeCube:                     return @"VSMathOperationTypeCube";
        case VSMathOperationTypeSquareRoot:               return @"VSMathOperationTypeSquareRoot";
        case VSMathOperationTypeCubeRoot:                 return @"VSMathOperationTypeCubeRoot";
        case VSMathOperationTypePercent:                  return @"VSMathOperationTypePercent";
        case VSMathOperationTypeFactorial:                return @"VSMathOperationTypeFactorial";
        case VSMathOperationTypeSine:                     return @"VSMathOperationTypeSine";
        case VSMathOperationTypeCosine:                   return @"VSMathOperationTypeCosine";
        case VSMathOperationTypeTangent:                  return @"VSMathOperationTypeTangent";
        case VSMathOperationTypeInverseSine:              return @"VSMathOperationTypeInverseSine";
        case VSMathOperationTypeInverseCosine:            return @"VSMathOperationTypeInverseCosine";
        case VSMathOperationTypeInverseTangent:           return @"VSMathOperationTypeInverseTangent";
        case VSMathOperationTypeHyperbolicSine:           return @"VSMathOperationTypeHyperbolicSine";
        case VSMathOperationTypeHyperbolicCosine:         return @"VSMathOperationTypeHyperbolicCosine";
        case VSMathOperationTypeHyperbolicTangent:        return @"VSMathOperationTypeHyperbolicTangent";
        case VSMathOperationTypeInverseHyperbolicSine:    return @"VSMathOperationTypeInverseHyperbolicSine";
        case VSMathOperationTypeInverseHyperbolicCosine:  return @"VSMathOperationTypeInverseHyperbolicCosine";
        case VSMathOperationTypeInverseHyperbolicTangent: return @"VSMathOperationTypeInverseHyperbolicTangent";
        case VSMathOperationTypeNaturalLogarithm:         return @"VSMathOperationTypeNaturalLogarithm";
        case VSMathOperationTypeInverseNaturalLogarithm:  return @"VSMathOperationTypeInverseNaturalLogarithm";
        case VSMathOperationTypeLogarithm10:              return @"VSMathOperationTypeLogarithm10";
        case VSMathOperationTypeInverseLogarithm10:       return @"VSMathOperationTypeInverseLogarithm10";
        case VSMathOperationTypeLogarithm2:               return @"VSMathOperationTypeLogarithm2";
        case VSMathOperationTypeInverseLogarithm2:        return @"VSMathOperationTypeInverseLogarithm2";
        case VSMathOperationTypeAbsoluteValue:            return @"VSMathOperationTypeAbsoluteValue";
        case VSMathOperationTypeLeftParenthesis:          return @"VSMathOperationTypeLeftParenthesis";
        case VSMathOperationTypeRightParenthesis:         return @"VSMathOperationTypeRightParenthesis";
        case VSMathOperationTypePi:                       return @"VSMathOperationTypePi";
        case VSMathOperationTypeEuler:                    return @"VSMathOperationTypeEuler";
        case VSMathOperationTypeRandomNumber:             return @"VSMathOperationTypeRandomNumber";
        case VSMathOperationTypeInverse:                  return @"VSMathOperationTypeInverse";
        case VSMathOperationTypeNegative:                 return @"VSMathOperationTypeNegative";
        case VSMathOperationTypeModulo:                   return @"VSMathOperationTypeModulo";
        case VSMathOperationTypeDivide:                   return @"VSMathOperationTypeDivide";
        case VSMathOperationTypeMultiply:                 return @"VSMathOperationTypeMultiply";
        case VSMathOperationTypeSubtract:                 return @"VSMathOperationTypeSubtract";
        case VSMathOperationTypeAdd:                      return @"VSMathOperationTypeAdd";
        case VSMathOperationTypeEqual:                    return @"VSMathOperationTypeEqual";
        case VSMathOperationTypeLeftShift:                return @"VSMathOperationTypeLeftShift";
        case VSMathOperationTypeLeftShiftBy:              return @"VSMathOperationTypeLeftShiftBy";
        case VSMathOperationTypeRightShift:               return @"VSMathOperationTypeRightShift";
        case VSMathOperationTypeRightShiftBy:             return @"VSMathOperationTypeRightShiftBy";
        case VSMathOperationTypeOnesComplement:           return @"VSMathOperationTypeOnesComplement";
        case VSMathOperationTypeTwosComplement:           return @"VSMathOperationTypeTwosComplement";
        case VSMathOperationTypeFlipWord:                 return @"VSMathOperationTypeFlipWord";
        case VSMathOperationTypeFlipByte:                 return @"VSMathOperationTypeFlipByte";
        case VSMathOperationTypeRoR:                      return @"VSMathOperationTypeRoR";
        case VSMathOperationTypeRoL:                      return @"VSMathOperationTypeRoL";
        case VSMathOperationTypeAnd:                      return @"VSMathOperationTypeAnd";
        case VSMathOperationTypeNand:                     return @"VSMathOperationTypeNand";
        case VSMathOperationTypeOr:                       return @"VSMathOperationTypeOr";
        case VSMathOperationTypeNor:                      return @"VSMathOperationTypeNor";
        case VSMathOperationTypeXor:                      return @"VSMathOperationTypeXor";
        case VSMathOperationTypeXnor:                     return @"VSMathOperationTypeXnor";
        case VSMathOperationTypeMaxTypes:                 return @"VSMathOperationTypeMaxTypes";
        default:                                          return @(type).stringValue;
    }
}

/*
 *  @inheritdoc
 */
NSString *NSStringFromVSMathOperatorUnaryType(VSMathOperatorUnaryType type)
{
    switch (type)
    {
        case VSMathOperatorUnaryTypeUnknown:      return @"VSMathOperatorUnaryTypeUnknown";
        case VSMathOperatorUnaryTypeNonUnary:     return @"VSMathOperatorUnaryTypeNonUnary";
        case VSMathOperatorUnaryTypeUnaryPrefix:  return @"VSMathOperatorUnaryTypeUnaryPrefix";
        case VSMathOperatorUnaryTypeUnaryPostfix: return @"VSMathOperatorUnaryTypeUnaryPostfix";
        case VSMathOperatorUnaryTypeMaxTypes:     return @"VSMathOperatorUnaryTypeMaxTypes";
        default:                                  return @(type).stringValue;
    }
}

/*
 *  @inheritdoc
 */
NSString *NSStringFromVSMathOperatorAssociativeType(VSMathOperatorAssociativeType type)
{
    switch (type)
    {
        case VSMathOperatorAssociativeTypeUnknown:  return @"VSMathOperatorAssociativeTypeUnknown";
        case VSMathOperatorAssociativeTypeLeft:     return @"VSMathOperatorAssociativeTypeLeft";
        case VSMathOperatorAssociativeTypeRight:    return @"VSMathOperatorAssociativeTypeRight";
        case VSMathOperatorAssociativeTypeMaxTypes: return @"VSMathOperatorAssociativeTypeMaxTypes";
        default:                                    return @(type).stringValue;
    }
}

/*
 *  @inheritdoc
 */
NSString *NSStringFromVSMathTokenType(VSMathTokenType type)
{
    switch (type)
    {
        case VSMathTokenTypeUnknown:              return @"VSMathTokenTypeUnknown";
        case VSMathTokenTypeNumeric:              return @"VSMathTokenTypeNumeric";
        case VSMathTokenTypeFunction:             return @"VSMathTokenTypeFunction";
        case VSMathTokenTypeOperator:             return @"VSMathTokenTypeOperator";
        case VSMathTokenTypeUnaryPrefixOperator:  return @"VSMathTokenTypeUnaryPrefixOperator";
        case VSMathTokenTypeUnaryPostfixOperator: return @"VSMathTokenTypeUnaryPostfixOperator";
        case VSMathTokenTypeConstant:             return @"VSMathTokenTypeConstant";
        case VSMathTokenTypeVariable:             return @"VSMathTokenTypeVariable";
        case VSMathTokenTypeParenthesis:          return @"VSMathTokenTypeParenthesis";
        case VSMathTokenTypeMaxTypes:             return @"VSMathTokenTypeMaxTypes";
        default:                                  return @(type).stringValue;
    }
}

#pragma mark - INTERFACE

@interface VSMathUtil()

#pragma mark - CLASS METHODS
#pragma mark - Shunting-Yard Algorithm

/**
 *  @private
 *
 *  Processes token and allocates them to the stack according to shunting-yard rules, with the option to
 *  specify custom variable sets. Setting contentAware as true means each token is processed separately independent 
 *  of each other. This process only fails under 3 conditions:
 *      1. Token is recorded as numeric but the operand is invalid (i.e. 1.2.3.4.5.6)
 *      2. Token is a right parenthesis, but no left parenthesis is found on the stack, hence parenthesis mismatch.
 *      3. Token is unrecognized.
 *
 *  @param token
 *  @param prevToken
 *  @param stack
 *  @param output
 *  @param customVariableSets
 *  @param isContentAware
 *
 *  @return YES if everything went fine, NO if anything went wrong.
 */
+ (BOOL)_processShuntingYardToken:(id)token andPreviousToken:(id)prevToken stack:(NSMutableArray *)stack output:(NSMutableArray *)output customVariableSets:(NSArray *)customVariableSets contentAware:(BOOL)isContentAware;

/**
 *  @private
 *
 *  Inserts a multiplier after a linkable token (i.e. 2sin(90) == 2*sin(90)).
 *
 *  @param token
 *  @param stack
 *  @param output
 *  @param customVariableSets
 *
 *  @return YES if successful, NO otherwise.
 */
+ (BOOL)_insertMultiplierAfterLinkableToken:(id)token stack:(NSMutableArray *)stack output:(NSMutableArray *)output customVariableSets:(NSArray *)customVariableSets;

/**
 *  @private
 *
 *  Verifies that a given token is product linkable (i.e. 3x = 3*x, meaning that 3 is linkable). Option
 *  to specify custom linkable variable sets.
 *
 *  @param token
 *  @param customVariableSets
 *
 *  @return YES if linkable, NO otherwise.
 */
+ (BOOL)_validateLinkableToken:(id)token customVariableSets:(NSArray *)customVariableSets;

/**
 *  @private
 *
 *  Verifies that a custom variable set is valid. A custom variable sets is defined by a NSDictionary object 
 *  containing a "characterSet" key (an NSCharacterSet object) and a "maxRange" key (an NSNumber object, 
 *  indicating the max character length of the token of associated type).
 *
 *  @param customVariableSet
 *
 *  @return YES if valid, NO otherwise.
 */
+ (BOOL)_validateCustomVariableSet:(id)customVariableSet;

/**
 *  @private
 *
 *  Gets the last numeric token on the stack and pops it on success.
 *
 *  @param stack
 *
 *  @return Last numeric token on the stack, nil if anything goes wrong.
 */
+ (id)_popNumericTokenOnStack:(NSMutableArray *)stack;

@end

#pragma mark - IMPLEMENTATION

/*
 *  @inheritdoc
 */
@implementation VSMathUtil

#pragma mark - CLASS METHODS
#pragma mark - Math Character Sets

/*
 *  @inheritdoc
 */
+ (NSCharacterSet *)numericCharacterSet { return [NSCharacterSet characterSetWithCharactersInString:@"0123456789.,"]; }

/*
 *  @inheritdoc
 */
+ (NSCharacterSet *)functionCharacterSet { return [NSCharacterSet characterSetWithCharactersInString:@"abcdfghijklmnopqrstuvwz₁₂_"]; }

/*
 *  @inheritdoc
 */
+ (NSCharacterSet *)operatorCharacterSet { return [NSCharacterSet characterSetWithCharactersInString:[NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@", VS_M_SYMBOL_ADD, VS_M_SYMBOL_SUBTRACT, VS_M_SYMBOL_MULTIPLY, VS_M_SYMBOL_MULTIPLY_ALTERNATE, VS_M_SYMBOL_DIVIDE, VS_M_SYMBOL_DIVIDE_ALTERNATE, VS_M_SYMBOL_EXPONENT, VS_M_SYMBOL_SCIENTIFIC_NOTATION, VS_M_SYMBOL_ROOT, VS_M_SYMBOL_CHOOSE, VS_M_SYMBOL_PICK, VS_M_SYMBOL_LEFT_SHIFT_BY, VS_M_SYMBOL_RIGHT_SHIFT_BY, VS_M_SYMBOL_AND, VS_M_SYMBOL_NAND, VS_M_SYMBOL_OR, VS_M_SYMBOL_NOR, VS_M_SYMBOL_XOR, VS_M_SYMBOL_XNOR]]; }

/*
 *  @inheritdoc
 */
+ (NSCharacterSet *)unaryPrefixOperatorCharacterSet { return [NSCharacterSet characterSetWithCharactersInString:[NSString stringWithFormat:@"%@%@%@", VS_M_SYMBOL_NEGATIVE, VS_M_SYMBOL_SQUARE_ROOT, VS_M_SYMBOL_CUBE_ROOT]]; }

/*
 *  @inheritdoc
 */
+ (NSCharacterSet *)unaryPostfixOperatorCharacterSet { return [NSCharacterSet characterSetWithCharactersInString:[NSString stringWithFormat:@"%@%@%@%@", VS_M_SYMBOL_FACTORIAL, VS_M_SYMBOL_PERCENT, VS_M_SYMBOL_SQUARE, VS_M_SYMBOL_CUBE]]; }

/*
 *  @inheritdoc
 */
+ (NSCharacterSet *)constantCharacterSet { return [NSCharacterSet characterSetWithCharactersInString:[NSString stringWithFormat:@"%@%@%@", VS_M_SYMBOL_PI, VS_M_SYMBOL_EULER, VS_M_SYMBOL_RANDOM_NUMBER]]; }

/*
 *  @inheritdoc
 */
+ (NSCharacterSet *)variableCharacterSet { return [NSCharacterSet characterSetWithCharactersInString:[NSString stringWithFormat:@"%@%@", VS_M_SYMBOL_X_VARIABLE, VS_M_SYMBOL_Y_VARIABLE]]; }

/*
 *  @inheritdoc
 */
+ (NSCharacterSet *)parenthesisCharacterSet { return [NSCharacterSet characterSetWithCharactersInString:[NSString stringWithFormat:@"%@%@", VS_M_SYMBOL_LEFT_PARENTHESIS, VS_M_SYMBOL_RIGHT_PARENTHESIS]]; }

#pragma mark - Math Operations
#pragma mark Bitwise Operations

/*
 *  @inheritdoc
 */
+ (unsigned long long)evaluateBitwiseOperation:(VSMathOperationType)operationType operand:(unsigned long long)operand binaryDigitType:(VSBinaryDigitType)binaryDigitType
{
    unsigned long long result = 0;
    unsigned long long mask = 0;

    // Depending on the specified binary digit type, a bit mask needs to be applied to preserve bits.
    switch (binaryDigitType)
    {
        case VSBinaryDigitType8Bit:
        {
            mask = 0xFF;
            break;
        }

        case VSBinaryDigitType16Bit:
        {
            mask = 0xFFFF;
            break;
        }

        case VSBinaryDigitType32Bit:
        {
            mask = 0xFFFFFFFF;
            break;
        }

        case VSBinaryDigitType64Bit:
        default:
        {
            mask = 0xFFFFFFFFFFFFFFFF;
            break;
        }
    }

    switch (operationType)
    {
        case VSMathOperationTypeLeftShift:
        {
            switch (binaryDigitType)
            {
                case VSBinaryDigitType8Bit:  result = clshift((unsigned char)operand);        break;
                case VSBinaryDigitType16Bit: result = hulshift((unsigned short)operand);      break;
                case VSBinaryDigitType32Bit: result = ulshift((unsigned int)operand);         break;
                case VSBinaryDigitType64Bit: result = llulshift((unsigned long long)operand); break;
                default:                     result = 0;                                      break;
            }

            break;
        }

        case VSMathOperationTypeRightShift:
        {
            switch (binaryDigitType)
            {
                case VSBinaryDigitType8Bit:  result = crshift((unsigned char)operand);        break;
                case VSBinaryDigitType16Bit: result = hurshift((unsigned short)operand);      break;
                case VSBinaryDigitType32Bit: result = urshift((unsigned int)operand);         break;
                case VSBinaryDigitType64Bit: result = llurshift((unsigned long long)operand); break;
                default:                     result = 0;                                      break;
            }

            break;
        }

        case VSMathOperationTypeRoL:
        {
            switch (binaryDigitType)
            {
                case VSBinaryDigitType8Bit:  result = clrotate((unsigned char)operand);        break;
                case VSBinaryDigitType16Bit: result = hulrotate((unsigned short)operand);      break;
                case VSBinaryDigitType32Bit: result = ulrotate((unsigned int)operand);         break;
                case VSBinaryDigitType64Bit: result = llulrotate((unsigned long long)operand); break;
                default:                     result = 0;                                       break;
            }

            break;
        }

        case VSMathOperationTypeRoR:
        {
            switch (binaryDigitType)
            {
                case VSBinaryDigitType8Bit:  result = crrotate((unsigned char)operand);        break;
                case VSBinaryDigitType16Bit: result = hurrotate((unsigned short)operand);      break;
                case VSBinaryDigitType32Bit: result = urrotate((unsigned int)operand);         break;
                case VSBinaryDigitType64Bit: result = llurrotate((unsigned long long)operand); break;
                default:                     result = 0;                                       break;
            }

            break;
        }

        case VSMathOperationTypeOnesComplement:
        {
            switch (binaryDigitType)
            {
                case VSBinaryDigitType8Bit:  result = ccomp1((unsigned char)operand);        break;
                case VSBinaryDigitType16Bit: result = hucomp1((unsigned short)operand);      break;
                case VSBinaryDigitType32Bit: result = ucomp1((unsigned int)operand);         break;
                case VSBinaryDigitType64Bit: result = llucomp1((unsigned long long)operand); break;
                default:                     result = 0;                                     break;
            }

            break;
        }

        case VSMathOperationTypeTwosComplement:
        {
            switch (binaryDigitType)
            {
                case VSBinaryDigitType8Bit:  result = ccomp2((unsigned char)operand);        break;
                case VSBinaryDigitType16Bit: result = hucomp2((unsigned short)operand);      break;
                case VSBinaryDigitType32Bit: result = ucomp2((unsigned int)operand);         break;
                case VSBinaryDigitType64Bit: result = llucomp2((unsigned long long)operand); break;
                default:                     result = 0;                                     break;
            }

            break;
        }

        case VSMathOperationTypeFlipWord:
        {
            switch (binaryDigitType)
            {
                case VSBinaryDigitType8Bit:  result = cflipw((unsigned char)operand);        break;
                case VSBinaryDigitType16Bit: result = huflipw((unsigned short)operand);      break;
                case VSBinaryDigitType32Bit: result = uflipw((unsigned int)operand);         break;
                case VSBinaryDigitType64Bit: result = lluflipw((unsigned long long)operand); break;
                default:                     result = 0;                                     break;
            }

            break;
        }

        case VSMathOperationTypeFlipByte:
        {
            switch (binaryDigitType)
            {
                case VSBinaryDigitType8Bit:  result = cflipb((unsigned char)operand);        break;
                case VSBinaryDigitType16Bit: result = huflipb((unsigned short)operand);      break;
                case VSBinaryDigitType32Bit: result = uflipb((unsigned int)operand);         break;
                case VSBinaryDigitType64Bit: result = lluflipb((unsigned long long)operand); break;
                default:                     result = 0;                                     break;
            }

            break;
        }

        default:
        {
            // Do nothing.
            break;
        }
    }

    return (operand & ~mask) | result;
}

/*
 *  @inheritdoc
 */
+ (unsigned long long)evaluateBitwiseOperation:(VSMathOperationType)operationType operandX:(unsigned long long)operandX operandY:(unsigned long long)operandY binaryDigitType:(VSBinaryDigitType)binaryDigitType
{
    unsigned long long result = 0;
    unsigned long long mask = 0;

    // Depending on the specified binary digit type, a bit mask needs to be applied to preserve bits.
    switch (binaryDigitType)
    {
        case VSBinaryDigitType8Bit:
        {
            mask = 0xFF;
            break;
        }

        case VSBinaryDigitType16Bit:
        {
            mask = 0xFFFF;
            break;
        }

        case VSBinaryDigitType32Bit:
        {
            mask = 0xFFFFFFFF;
            break;
        }

        case VSBinaryDigitType64Bit:
        default:
        {
            mask = 0xFFFFFFFFFFFFFFFF;
            break;
        }
    }

    switch (operationType)
    {
        case VSMathOperationTypeAdd:
        {
            switch (binaryDigitType)
            {
                case VSBinaryDigitType8Bit:  result = (unsigned char)operandX + (unsigned char)operandY;           break;
                case VSBinaryDigitType16Bit: result = (unsigned short)operandX + (unsigned short)operandY;         break;
                case VSBinaryDigitType32Bit: result = (unsigned int)operandX + (unsigned int)operandY;             break;
                case VSBinaryDigitType64Bit: result = (unsigned long long)operandX + (unsigned long long)operandY; break;
                default:                     result = 0;                                                           break;
            }

            break;
        }

        case VSMathOperationTypeSubtract:
        {
            switch (binaryDigitType)
            {
                case VSBinaryDigitType8Bit:  result = (unsigned char)operandX - (unsigned char)operandY;           break;
                case VSBinaryDigitType16Bit: result = (unsigned short)operandX - (unsigned short)operandY;         break;
                case VSBinaryDigitType32Bit: result = (unsigned int)operandX - (unsigned int)operandY;             break;
                case VSBinaryDigitType64Bit: result = (unsigned long long)operandX - (unsigned long long)operandY; break;
                default:                     result = 0;                                                           break;
            }

            break;
        }

        case VSMathOperationTypeMultiply:
        {
            switch (binaryDigitType)
            {
                case VSBinaryDigitType8Bit:  result = (unsigned char)operandX * (unsigned char)operandY;           break;
                case VSBinaryDigitType16Bit: result = (unsigned short)operandX * (unsigned short)operandY;         break;
                case VSBinaryDigitType32Bit: result = (unsigned int)operandX * (unsigned int)operandY;             break;
                case VSBinaryDigitType64Bit: result = (unsigned long long)operandX * (unsigned long long)operandY; break;
                default:                     result = 0;                                                           break;
            }

            break;
        }

        case VSMathOperationTypeDivide:
        {
            switch (binaryDigitType)
            {
                case VSBinaryDigitType8Bit:  result = floor((unsigned char)operandX / (unsigned char)operandY);           break;
                case VSBinaryDigitType16Bit: result = floor((unsigned short)operandX / (unsigned short)operandY);         break;
                case VSBinaryDigitType32Bit: result = floor((unsigned int)operandX / (unsigned int)operandY);             break;
                case VSBinaryDigitType64Bit: result = floor((unsigned long long)operandX / (unsigned long long)operandY); break;
                default:                     result = 0;                                                                  break;
            }

            break;
        }

        case VSMathOperationTypeModulo:
        {
            switch (binaryDigitType)
            {
                case VSBinaryDigitType8Bit:  result = (unsigned char)operandX % (unsigned char)operandY;           break;
                case VSBinaryDigitType16Bit: result = (unsigned short)operandX % (unsigned short)operandY;         break;
                case VSBinaryDigitType32Bit: result = (unsigned int)operandX % (unsigned int)operandY;             break;
                case VSBinaryDigitType64Bit: result = (unsigned long long)operandX % (unsigned long long)operandY; break;
                default:                     result = 0;                                                           break;
            }

            break;
        }

        case VSMathOperationTypeLeftShiftBy:
        {
            switch (binaryDigitType)
            {
                case VSBinaryDigitType8Bit:  result = ((unsigned char)operandX << (unsigned char)operandY);           break;
                case VSBinaryDigitType16Bit: result = ((unsigned short)operandX << (unsigned short)operandY);         break;
                case VSBinaryDigitType32Bit: result = ((unsigned int)operandX << (unsigned int)operandY);             break;
                case VSBinaryDigitType64Bit: result = ((unsigned long long)operandX << (unsigned long long)operandY); break;
                default:                     result = 0;                                                              break;
            }

            break;
        }

        case VSMathOperationTypeRightShiftBy:
        {
            switch (binaryDigitType)
            {
                case VSBinaryDigitType8Bit:  result = ((unsigned char)operandX >> (unsigned char)operandY);           break;
                case VSBinaryDigitType16Bit: result = ((unsigned short)operandX >> (unsigned short)operandY);         break;
                case VSBinaryDigitType32Bit: result = ((unsigned int)operandX >> (unsigned int)operandY);             break;
                case VSBinaryDigitType64Bit: result = ((unsigned long long)operandX >> (unsigned long long)operandY); break;
                default:                     result = 0;                                                              break;
            }

            break;
        }

        case VSMathOperationTypeAnd:
        {
            switch (binaryDigitType)
            {
                case VSBinaryDigitType8Bit:  result = ((unsigned char)operandX & (unsigned char)operandY);           break;
                case VSBinaryDigitType16Bit: result = ((unsigned short)operandX & (unsigned short)operandY);         break;
                case VSBinaryDigitType32Bit: result = ((unsigned int)operandX & (unsigned int)operandY);             break;
                case VSBinaryDigitType64Bit: result = ((unsigned long long)operandX & (unsigned long long)operandY); break;
                default:                     result = 0;                                                             break;
            }

            break;
        }

        case VSMathOperationTypeNand:
        {
            switch (binaryDigitType)
            {
                case VSBinaryDigitType8Bit:  result = ~((unsigned char)operandX & (unsigned char)operandY);           break;
                case VSBinaryDigitType16Bit: result = ~((unsigned short)operandX & (unsigned short)operandY);         break;
                case VSBinaryDigitType32Bit: result = ~((unsigned int)operandX & (unsigned int)operandY);             break;
                case VSBinaryDigitType64Bit: result = ~((unsigned long long)operandX & (unsigned long long)operandY); break;
                default:                     result = 0;                                                              break;
            }

            break;
        }

        case VSMathOperationTypeOr:
        {
            switch (binaryDigitType)
            {
                case VSBinaryDigitType8Bit:  result = ((unsigned char)operandX | (unsigned char)operandY);           break;
                case VSBinaryDigitType16Bit: result = ((unsigned short)operandX | (unsigned short)operandY);         break;
                case VSBinaryDigitType32Bit: result = ((unsigned int)operandX | (unsigned int)operandY);             break;
                case VSBinaryDigitType64Bit: result = ((unsigned long long)operandX | (unsigned long long)operandY); break;
                default:                     result = 0;                                                             break;
            }

            break;
        }

        case VSMathOperationTypeNor:
        {
            switch (binaryDigitType)
            {
                case VSBinaryDigitType8Bit:  result = ~((unsigned char)operandX | (unsigned char)operandY);           break;
                case VSBinaryDigitType16Bit: result = ~((unsigned short)operandX | (unsigned short)operandY);         break;
                case VSBinaryDigitType32Bit: result = ~((unsigned int)operandX | (unsigned int)operandY);             break;
                case VSBinaryDigitType64Bit: result = ~((unsigned long long)operandX | (unsigned long long)operandY); break;
                default:                     result = 0;                                                              break;
            }

            break;
        }

        case VSMathOperationTypeXor:
        {
            switch (binaryDigitType)
            {
                case VSBinaryDigitType8Bit:  result = ((unsigned char)operandX ^ (unsigned char)operandY);           break;
                case VSBinaryDigitType16Bit: result = ((unsigned short)operandX ^ (unsigned short)operandY);         break;
                case VSBinaryDigitType32Bit: result = ((unsigned int)operandX ^ (unsigned int)operandY);             break;
                case VSBinaryDigitType64Bit: result = ((unsigned long long)operandX ^ (unsigned long long)operandY); break;
                default:                     result = 0;                                                             break;
            }

            break;
        }

        case VSMathOperationTypeXnor:
        {
            switch (binaryDigitType)
            {
                case VSBinaryDigitType8Bit:  result = ~((unsigned char)operandX ^ (unsigned char)operandY);           break;
                case VSBinaryDigitType16Bit: result = ~((unsigned short)operandX ^ (unsigned short)operandY);         break;
                case VSBinaryDigitType32Bit: result = ~((unsigned int)operandX ^ (unsigned int)operandY);             break;
                case VSBinaryDigitType64Bit: result = ~((unsigned long long)operandX ^ (unsigned long long)operandY); break;
                default:                     result = 0;                                                              break;
            }

            break;
        }

        default:
        {
            break;
        }
    }

    return (operandX & ~mask) | result;
}

#pragma mark Floating-Point Operations

/*
 *  @inheritdoc
 */
+ (double)evaluateOperation:(VSMathOperationType)operationType angleMode:(VSMathAngleModeType)angleMode
{
    return [VSMathUtil evaluateOperation:operationType angleMode:angleMode operandX:NAN operandY:NAN];
}

/*
 *  @inheritdoc
 */
+ (double)evaluateOperation:(VSMathOperationType)operationType angleMode:(VSMathAngleModeType)angleMode operand:(double)operand
{
    return [VSMathUtil evaluateOperation:operationType angleMode:angleMode operandX:operand operandY:NAN];
}

/*
 *  @inheritdoc
 */
+ (double)evaluateOperation:(VSMathOperationType)operationType angleMode:(VSMathAngleModeType)angleMode operandX:(double)operandX operandY:(double)operandY
{
    double result = NAN;

    switch (operationType)
    {
        case VSMathOperationTypeAdd:
        {
            if (isnan(operandX)) return NAN;
            if (isnan(operandY)) return NAN;
            result = operandX + operandY;
            break;
        }

        case VSMathOperationTypeSubtract:
        {
            if (isnan(operandX)) return NAN;
            if (isnan(operandY)) return NAN;
            result = operandX - operandY;
            break;
        }

        case VSMathOperationTypeMultiply:
        {
            if (isnan(operandX)) return NAN;
            if (isnan(operandY)) return NAN;
            result = operandX * operandY;
            break;
        }

        case VSMathOperationTypeDivide:
        {
            if (isnan(operandX)) return NAN;
            if (isnan(operandY)) return NAN;
            result = operandX / operandY;
            break;
        }

        case VSMathOperationTypeModulo:
        {
            if (isnan(operandX)) return NAN;
            if (isnan(operandY)) return NAN;
            result = fmod(operandX, operandY);
            break;
        }

        case VSMathOperationTypeExponent:
        {
            if (isnan(operandX)) return NAN;
            if (isnan(operandY)) return NAN;
            result = pow(operandX, operandY);
            break;
        }

        case VSMathOperationTypeRoot:
        {
            if (isnan(operandX)) return NAN;
            if (isnan(operandY)) return NAN;
            result = pow(operandY, (1/operandX));
            break;
        }

        case VSMathOperationTypeScientificNotation:
        {
            if (isnan(operandX)) return NAN;
            if (isnan(operandY)) return NAN;
            result = operandX * pow(10, operandY);
            break;
        }

        case VSMathOperationTypeChoose:
        {
            if (isnan(operandX)) return NAN;
            if (isnan(operandY)) return NAN;
            result = fncr(operandX, operandY);
            break;
        }

        case VSMathOperationTypePick:
        {
            if (isnan(operandX)) return NAN;
            if (isnan(operandY)) return NAN;
            result = fnpr(operandX, operandY);
            break;
        }

        case VSMathOperationTypeSine:
        {
            if (isnan(operandX)) return NAN;

            switch (angleMode)
            {
                case VSMathAngleModeTypeDegree:
                {
                    result = fsind(operandX);
                    break;
                }

                case VSMathAngleModeTypeRadian:
                {
                    result = fsinr(operandX);
                    break;
                }

                case VSMathAngleModeTypeGradian:
                {
                    result = fsing(operandX);
                    break;
                }

                default:
                {
                    result = NAN;
                    break;
                }
            }

            break;
        }

        case VSMathOperationTypeCosine:
        {
            if (isnan(operandX)) return NAN;

            switch (angleMode)
            {
                case VSMathAngleModeTypeDegree:
                {
                    result = fcosd(operandX);
                    break;
                }

                case VSMathAngleModeTypeRadian:
                {
                    result = fcosr(operandX);
                    break;
                }

                case VSMathAngleModeTypeGradian:
                {
                    result = fcosg(operandX);
                    break;
                }

                default:
                {
                    result = NAN;
                    break;
                }
            }

            break;
        }

        case VSMathOperationTypeTangent:
        {
            if (isnan(operandX)) return NAN;

            switch (angleMode)
            {
                case VSMathAngleModeTypeDegree:
                {
                    result = ftand(operandX);
                    break;
                }

                case VSMathAngleModeTypeRadian:
                {
                    result = ftanr(operandX);
                    break;
                }

                case VSMathAngleModeTypeGradian:
                {
                    result = ftang(operandX);
                    break;
                }

                default:
                {
                    result = NAN;
                    break;
                }
            }

            break;
        }

        case VSMathOperationTypeInverseSine:
        {
            if (isnan(operandX)) return NAN;

            switch (angleMode)
            {
                case VSMathAngleModeTypeDegree:
                {
                    result = frtod(asin(operandX));
                    break;
                }

                case VSMathAngleModeTypeRadian:
                {
                    result = asin(operandX);
                    break;
                }

                case VSMathAngleModeTypeGradian:
                {
                    result = frtog(asin(operandX));
                    break;
                }

                default:
                {
                    result = NAN;
                    break;
                }
            }

            break;
        }

        case VSMathOperationTypeInverseCosine:
        {
            if (isnan(operandX)) return NAN;

            switch (angleMode)
            {
                case VSMathAngleModeTypeDegree:
                {
                    result = frtod(acos(operandX));
                    break;
                }

                case VSMathAngleModeTypeRadian:
                {
                    result = acos(operandX);
                    break;
                }

                case VSMathAngleModeTypeGradian:
                {
                    result = frtog(acos(operandX));
                    break;
                }

                default:
                {
                    result = NAN;
                    break;
                }
            }

            break;
        }

        case VSMathOperationTypeInverseTangent:
        {
            if (isnan(operandX)) return NAN;

            switch (angleMode)
            {
                case VSMathAngleModeTypeDegree:
                {
                    result = frtod(atan(operandX));
                    break;
                }

                case VSMathAngleModeTypeRadian:
                {
                    result = atan(operandX);
                    break;
                }

                case VSMathAngleModeTypeGradian:
                {
                    result = frtog(atan(operandX));
                    break;
                }

                default:
                {
                    result = NAN;
                    break;
                }
            }

            break;
        }

        case VSMathOperationTypeHyperbolicSine:
        {
            if (isnan(operandX)) return NAN;
            result = sinh(operandX);
            break;
        }

        case VSMathOperationTypeHyperbolicCosine:
        {
            if (isnan(operandX)) return NAN;
            result = cosh(operandX);
            break;
        }

        case VSMathOperationTypeHyperbolicTangent:
        {
            if (isnan(operandX)) return NAN;
            result = tanh(operandX);
            break;
        }

        case VSMathOperationTypeInverseHyperbolicSine:
        {
            if (isnan(operandX)) return NAN;
            result = asinh(operandX);
            break;
        }

        case VSMathOperationTypeInverseHyperbolicCosine:
        {
            if (isnan(operandX)) return NAN;
            result = acosh(operandX);
            break;
        }

        case VSMathOperationTypeInverseHyperbolicTangent:
        {
            if (isnan(operandX)) return NAN;
            result = atanh(operandX);
            break;
        }

        case VSMathOperationTypeLogarithm10:
        {
            if (isnan(operandX)) return NAN;
            result = log10(operandX);
            break;
        }

        case VSMathOperationTypeInverseLogarithm10:
        {
            if (isnan(operandX)) return NAN;
            result = pow(10.0, operandX);
            break;
        }

        case VSMathOperationTypeLogarithm2:
        {
            if (isnan(operandX)) return NAN;
            result = log2(operandX);
            break;
        }

        case VSMathOperationTypeInverseLogarithm2:
        {
            if (isnan(operandX)) return NAN;
            result = pow(2.0, operandX);
            break;
        }

        case VSMathOperationTypeNaturalLogarithm:
        {
            if (isnan(operandX)) return NAN;
            result = fln(operandX);
            break;
        }

        case VSMathOperationTypeInverseNaturalLogarithm:
        {
            if (isnan(operandX)) return NAN;
            result = exp(operandX);
            break;
        }

        case VSMathOperationTypeAbsoluteValue:
        {
            if (isnan(operandX)) return NAN;
            result = fabs(operandX);
            break;
        }

        case VSMathOperationTypeSquare:
        {
            if (isnan(operandX)) return NAN;
            result = pow(operandX, 2.0);
            break;
        }

        case VSMathOperationTypeSquareRoot:
        {
            if (isnan(operandX)) return NAN;
            result = sqrt(operandX);
            break;
        }

        case VSMathOperationTypeCube:
        {
            if (isnan(operandX)) return NAN;
            result = pow(operandX, 3.0);
            break;
        }

        case VSMathOperationTypeCubeRoot:
        {
            if (isnan(operandX)) return NAN;
            result = cbrt(operandX);
            break;
        }

        case VSMathOperationTypeNegative:
        {
            if (isnan(operandX)) return NAN;
            result = operandX * -1;
            break;
        }

        case VSMathOperationTypeFactorial:
        {
            if (isnan(operandX)) return NAN;
            result = ffact(operandX);
            break;
        }

        case VSMathOperationTypePercent:
        {
            if (isnan(operandX)) return NAN;
            result = operandX / 100.0;
            break;
        }

        case VSMathOperationTypePi:
        {
            result = M_PI;
            break;
        }

        case VSMathOperationTypeEuler:
        {
            result = M_E;
            break;
        }

        case VSMathOperationTypeRandomNumber:
        {
            result = ((double)arc4random()/VS_M_ARC4RANDOM_MAX);
            break;
        }

        case VSMathOperationTypeInverse:
        {
            if (isnan(operandX)) return NAN;
            result = 1/operandX;
            break;
        }

        default:
        {
            return NAN;
        }
    }

    if (result == INFINITY || result == -INFINITY)
    {
        return NAN;
    }
    else if (fabs(result) == 0)
    {
        return 0.0;
    }
    else
    {
        return result;
    }
}

#pragma mark - Expression Syntax Verification

/*
 *  @inheritdoc
 */
+ (BOOL)validateInfixExpressionSyntax:(NSString *)infixExpression
{
    return [VSMathUtil validateInfixExpressionSyntax:infixExpression customVariableSets:nil];
}

/*
 *  @inheritdoc
 */
+ (BOOL)validateInfixExpressionSyntax:(NSString *)infixExpression customVariableSets:(NSArray *)customVariableSets
{
    return [VSMathUtil validatePostfixStackSyntax:[VSMathUtil postfixStackFromInfixExpression:infixExpression customVariableSets:customVariableSets]];
}

/*
 *  @inheritdoc
 */
+ (BOOL)validatePostfixStackSyntax:(NSArray *)postfixStack
{
    return ([VSMathUtil evaluatePostfixStack:postfixStack angleMode:VSMathAngleModeTypeDegree tokenMap:nil] != nil);
}

#pragma mark - Expression Parsing

/*
 *  @inheritdoc
 */
+ (NSArray *)tokensInInfixExpression:(NSString *)infixExpression customVariableSets:(NSArray *)customVariableSets
{
    if (infixExpression == nil || infixExpression.length <= 0)
    {
        return nil;
    }

    NSMutableArray *tokens = [[NSMutableArray alloc] init];

    if ([VSMathUtil parseInfixExpressionIntoTokens:tokens infixExpression:infixExpression customVariableSets:customVariableSets])
    {
#if !__has_feature(objc_arc)
        return [tokens autorelease];
#else
        return tokens;
#endif
    }
    else
    {
        vs_dealloc(tokens);

        return nil;
    }
}

/*
 *  @inheritdoc
 */
+ (BOOL)parseInfixExpressionIntoTokens:(NSMutableArray *)tokens infixExpression:(NSString *)infixExpression customVariableSets:(NSArray *)customVariableSets
{
    if (tokens == nil)
    {
        return NO;
    }

    if (infixExpression == nil)
    {
        [tokens removeAllObjects];
        return NO;
    }

    unsigned long range = 1;
    unsigned long length = infixExpression.length;

    if (length <= 0)
    {
        [tokens removeAllObjects];
        return NO;
    }

    if (tokens.count > 0)
    {
        [tokens removeAllObjects];
    }

    // Begin scanning the expression to capture individual tokens.
    for (int i = 0; i < length; i++)
    {
        BOOL shouldRecordNow = YES;
        unichar key = [infixExpression characterAtIndex:i];
        unichar nextKey = (i+1 < length) ? [infixExpression characterAtIndex:i+1] : 0;

        // Ignore white space.
        if (key == ' ')
        {
            continue;
        }

        // Check custom character sets.
        if (customVariableSets != nil)
        {
            unsigned long arrlen = customVariableSets.count;

            if (arrlen > 0)
            {
                for (int j = 0; j < arrlen; j++)
                {
                    if (![VSMathUtil _validateCustomVariableSet:customVariableSets[j]])
                    {
                        continue;
                    }

                    NSDictionary *dictionary = (NSDictionary *)customVariableSets[j];
                    NSCharacterSet *characterSet = (NSCharacterSet *)[dictionary objectForKey:VS_M_DICTIONARY_PROPERTY_CHARACTER_SET];
                    unsigned long maxRange = [(NSNumber *)[dictionary objectForKey:VS_M_DICTIONARY_PROPERTY_MAX_RANGE] unsignedLongValue];

                    if (maxRange <= 1)
                    {
                        continue;
                    }
                    else
                    {
                        if (((i + 1) < length) && ([characterSet characterIsMember:key] && [characterSet characterIsMember:nextKey] && (range < maxRange)))
                        {
                            range++;
                            shouldRecordNow = NO;
                        }
                    }
                }
            }
        }

        // Check if current char and next char is of character set: numeric/function/variable, if so increase the capture range until a token can be recorded.
        if ((i+1 < length) &&
            (([[VSMathUtil numericCharacterSet] characterIsMember:key] && [[VSMathUtil numericCharacterSet] characterIsMember:nextKey]) ||
             ([[VSMathUtil functionCharacterSet] characterIsMember:key] && [[VSMathUtil functionCharacterSet] characterIsMember:nextKey])))
        {
            shouldRecordNow = NO;
            range++;
        }

        if (shouldRecordNow)
        {
            NSString *stringToken = [infixExpression substringWithRange:NSMakeRange(i - range + 1, range)];

            [tokens addObject:stringToken];

            range = 1;
        }
    }

    if (tokens.count <= 0)
    {
        return NO;
    }
    else
    {
        return YES;
    }
}

/*
 *  @inheritdoc
 */
+ (double)doubleFromToken:(id)token
{
    VSMathTokenType tokenType = [VSMathUtil typeOfToken:token];

    if (tokenType == VSMathTokenTypeNumeric)
    {
        if ([token isKindOfClass:[NSNumber class]])
        {
            return [(NSNumber *)token doubleValue];
        }
        else
        {
            return [VSNumberUtil doubleFromString:token];
        }
    }
    else if (tokenType == VSMathTokenTypeConstant)
    {
        return [VSMathUtil evaluateOperation:[VSMathUtil operationTypeOfSymbol:token] angleMode:VSMathAngleModeTypeUnknown];
    }
    else
    {
        return NAN;
    }
}

/*
 *  @inheritdoc
 */
+ (unsigned long long)unsignedLongLongFromToken:(id)token
{
    VSMathTokenType tokenType = [VSMathUtil typeOfToken:token];

    if (tokenType == VSMathTokenTypeNumeric)
    {
        if ([token isKindOfClass:[NSNumber class]])
        {
            return [(NSNumber *)token unsignedLongLongValue];
        }
        else
        {
            return [VSNumberUtil unsignedLongLongFromString:token];
        }
    }
    else if (tokenType == VSMathTokenTypeConstant)
    {
        return [VSMathUtil evaluateOperation:[VSMathUtil operationTypeOfSymbol:token] angleMode:VSMathAngleModeTypeUnknown];
    }
    else
    {
        return NAN;
    }
}

/*
 *  @inheritdoc
 */
+ (unsigned long long)unsignedLongLongFromToken:(id)token numberSystem:(VSNumberSystemType)numberSystemType
{
    if (token == nil)
    {
        return 0;
    }

    if ([token isKindOfClass:[NSString class]])
    {
        return [VSNumberUtil unsignedLongLongFromString:token numberSystem:numberSystemType];
    }
    else if ([token isKindOfClass:[NSNumber class]])
    {
        return [(NSNumber *)token unsignedLongLongValue];
    }
    else
    {
        return 0;
    }
}

#pragma mark - Infix-Postfix Conversions

/*
 *  @inheritdoc
 */
+ (NSArray *)postfixStackFromInfixExpression:(NSString *)infixExpression
{
    return [VSMathUtil postfixStackFromInfixExpression:infixExpression customVariableSets:nil];
}

/*
 *  @inheritdoc
 */
+ (NSArray *)postfixStackFromInfixExpression:(NSString *)infixExpression customVariableSets:(NSArray *)customVariableSets
{
    NSMutableArray *postfixStack = [[NSMutableArray alloc] init];

    if ([VSMathUtil parseInfixExpressionIntoPostfixStack:postfixStack infixExpression:infixExpression customVariableSets:customVariableSets])
    {
#if !__has_feature(objc_arc)
        return [postfixStack autorelease];
#else
        return postfixStack;
#endif
    }
    else
    {
        vs_dealloc(postfixStack);

        return nil;
    }
}

/*
 *  @inheritdoc
 */
+ (BOOL)parseInfixExpressionIntoPostfixStack:(NSMutableArray *)postfixStack infixExpression:(NSString *)infixExpression
{
    return [VSMathUtil parseInfixExpressionIntoPostfixStack:postfixStack infixExpression:infixExpression customVariableSets:nil];
}

/*
 *  @inheritdoc
 */
+ (BOOL)parseInfixExpressionIntoPostfixStack:(NSMutableArray *)postfixStack infixExpression:(NSString *)infixExpression customVariableSets:(NSArray *)customVariableSets
{
    if (postfixStack == nil)
    {
        return NO;
    }

    // Parse expression into tokens.
    NSArray *tokens = [VSMathUtil tokensInInfixExpression:infixExpression customVariableSets:customVariableSets];

    if (tokens == nil || tokens.count <= 0)
    {
        [postfixStack removeAllObjects];

        return NO;
    }

    NSString *currToken = nil;
    NSString *prevToken = nil;

    NSMutableArray *stack = [[NSMutableArray alloc] init];

    unsigned long arrlen = tokens.count;

    for (int i = 0; i < arrlen; i++)
    {
        currToken = (NSString *)tokens[i];

        // Try to process the token.
        if (![VSMathUtil _processShuntingYardToken:currToken andPreviousToken:prevToken stack:stack output:postfixStack customVariableSets:customVariableSets contentAware:YES])
        {
            vs_dealloc(stack);

            [postfixStack removeAllObjects];

            return NO;
        }

        prevToken = currToken;
    }

    // Pop remaining stack onto output.
    while (stack.count > 0)
    {
        [postfixStack addObject:stack.lastObject];
        [stack removeLastObject];
    }

    // Strip out useless left parenthesis symbols.
    NSString *leftParenthesisSymbol = [VSMathUtil symbolWithType:VSMathSymbolTypeLeftParenthesis];

    while ([postfixStack containsObject:leftParenthesisSymbol])
    {
        [postfixStack removeObjectAtIndex:[postfixStack indexOfObject:leftParenthesisSymbol]];
    }

    vs_dealloc(stack);

    return YES;
}

#pragma mark - Shunting-Yard Algorithm

/*
 *  @inheritdoc
 */
+ (BOOL)processShuntingYardToken:(id)token stack:(NSMutableArray *)stack output:(NSMutableArray *)output
{
    return [VSMathUtil processShuntingYardToken:token stack:stack output:output customVariableSets:nil];
}

/*
 *  @inheritdoc
 */
+ (BOOL)processShuntingYardToken:(id)token stack:(NSMutableArray *)stack output:(NSMutableArray *)output customVariableSets:(NSArray *)customVariableSets
{
    return [VSMathUtil _processShuntingYardToken:token andPreviousToken:nil stack:stack output:output customVariableSets:customVariableSets contentAware:NO];
}

/*
 *  @inheritdoc
 */
+ (BOOL)_processShuntingYardToken:(id)token andPreviousToken:(id)prevToken stack:(NSMutableArray *)stack output:(NSMutableArray *)output customVariableSets:(NSArray *)customVariableSets contentAware:(BOOL)isContentAware
{
    if ((token == nil) || (stack == nil) || (output == nil))
    {
        return NO;
    }

    VSMathTokenType tokenType = [VSMathUtil typeOfTokenSubset:token];
    VSMathTokenType stackTopTokenType = (stack.count > 0) ? [VSMathUtil typeOfTokenSubset:stack.lastObject] : VSMathTokenTypeUnknown;

    switch (tokenType)
    {
        case VSMathTokenTypeNumeric:
        {
            if ([token isKindOfClass:[NSString class]])
            {
                NSNumber *number = [VSNumberUtil numberFromString:token];

                if (number == nil)
                {
                    return NO;
                }
                else
                {
                    if (isContentAware)
                    {
                        [VSMathUtil _insertMultiplierAfterLinkableToken:prevToken stack:stack output:output customVariableSets:customVariableSets];
                    }

                    [output addObject:number]; // push number to output
                }
            }
            else
            {
                if (isContentAware)
                {
                    [VSMathUtil _insertMultiplierAfterLinkableToken:prevToken stack:stack output:output customVariableSets:customVariableSets];
                }

                [output addObject:token]; // push number to output
            }

            break;
        }

        case VSMathTokenTypeVariable:
        case VSMathTokenTypeConstant:
        {
            if (isContentAware)
            {
                [VSMathUtil _insertMultiplierAfterLinkableToken:prevToken stack:stack output:output customVariableSets:customVariableSets];
            }

            [output addObject:token]; // push variable/constant to output
            break;
        }

        case VSMathTokenTypeUnaryPostfixOperator:
        {
            [output addObject:token]; // push unary postfix operator to output
            break;
        }

        case VSMathTokenTypeUnaryPrefixOperator:
        case VSMathTokenTypeFunction:
        {
            // Check if this negative sign should behave like a minus sign.
            if (isContentAware && ([VSMathUtil typeOfSymbol:token] == VSMathSymbolTypeNegative) && [VSMathUtil _validateLinkableToken:prevToken customVariableSets:customVariableSets])
            {
                if (stackTopTokenType == VSMathTokenTypeOperator || stackTopTokenType == VSMathTokenTypeUnaryPrefixOperator || stackTopTokenType == VSMathTokenTypeFunction)
                {
                    while (([VSMathUtil precedenceOfSymbol:stack.lastObject] >= [VSMathUtil precedenceOfSymbol:VS_M_SYMBOL_SUBTRACT]) ||
                           ([VSMathUtil typeOfTokenSubset:stack.lastObject] == VSMathTokenTypeFunction))
                    {
                        [output addObject:stack.lastObject];
                        [stack removeLastObject];
                    }
                }

                [stack addObject:VS_M_SYMBOL_SUBTRACT];
            }
            else
            {
                if (isContentAware)
                {
                    [VSMathUtil _insertMultiplierAfterLinkableToken:prevToken stack:stack output:output customVariableSets:customVariableSets];
                }

                [stack addObject:token]; // push unary prefix operators/functions to stack
            }

            break;
        }

        case VSMathTokenTypeOperator:
        {
            // Check if this minus sign should behave like a negative sign.
            if (isContentAware && ([VSMathUtil typeOfSymbol:token] == VSMathSymbolTypeSubtract) && ![VSMathUtil _validateLinkableToken:prevToken customVariableSets:customVariableSets])
            {
                [stack addObject:VS_M_SYMBOL_NEGATIVE];
            }
            else
            {
                if (stackTopTokenType == VSMathTokenTypeOperator || stackTopTokenType == VSMathTokenTypeUnaryPrefixOperator || stackTopTokenType == VSMathTokenTypeFunction)
                {
                    // If left-associative.
                    if ([VSMathUtil operatorAssociativeTypeOfSymbol:token] == VSMathOperatorAssociativeTypeLeft)
                    {
                        while (([VSMathUtil precedenceOfSymbol:stack.lastObject] >= [VSMathUtil precedenceOfSymbol:token]) ||
                               ([VSMathUtil typeOfTokenSubset:stack.lastObject] == VSMathTokenTypeFunction))
                        {
                            [output addObject:stack.lastObject];
                            [stack removeLastObject];
                        }
                    }
                    // If right-associative.
                    else if ([VSMathUtil operatorAssociativeTypeOfSymbol:token] == VSMathOperatorAssociativeTypeRight)
                    {
                        while (([VSMathUtil precedenceOfSymbol:stack.lastObject] > [VSMathUtil precedenceOfSymbol:token]) ||
                               ([VSMathUtil typeOfTokenSubset:stack.lastObject] == VSMathTokenTypeFunction))
                        {
                            [output addObject:stack.lastObject];
                            [stack removeLastObject];
                        }
                    }
                }

                [stack addObject:token];
            }

            break;
        }

        case VSMathTokenTypeParenthesis:
        {
            if ([VSMathUtil typeOfSymbol:token] == VSMathSymbolTypeLeftParenthesis)
            {
                if (isContentAware)
                {
                    [VSMathUtil _insertMultiplierAfterLinkableToken:prevToken stack:stack output:output customVariableSets:customVariableSets];
                }

                [stack addObject:token]; // push left-paren to stack
            }
            else if ([VSMathUtil typeOfSymbol:token] == VSMathSymbolTypeRightParenthesis)
            {
                // While stacktop is not left-paren, pop stacktop to ouptut.
                while ([VSMathUtil typeOfSymbol:stack.lastObject] != VSMathSymbolTypeLeftParenthesis)
                {
                    if (stack.count > 0)
                    {
                        [output addObject:stack.lastObject];
                        [stack removeLastObject];
                    }
                    // Since stack count has reached 0 and there is still no left parenthesis found, there is a misbalance between left and right parenthesis, operation failed.
                    else
                    {
                        return NO;
                    }
                }

                // Pop stacktop (should be left-paren).
                if ([VSMathUtil typeOfSymbol:(NSString *)stack.lastObject] == VSMathSymbolTypeLeftParenthesis)
                {
                    [stack removeLastObject];
                }
                // If no left-paren found, paren mis-match, return error.
                else
                {
                    return NO;
                }

                // Evaluate to see if stacktop is now a function and pop to output if it is.
                if ((stack.count > 0) && ([VSMathUtil typeOfTokenSubset:stack.lastObject] == VSMathTokenTypeFunction))
                {
                    [output addObject:stack.lastObject];
                    [stack removeLastObject];
                }
            }

            break;
        }

        case VSMathTokenTypeUnknown:
        {
            if (customVariableSets != nil)
            {
                unsigned long arrlen = customVariableSets.count;

                for (int i = 0; i < arrlen; i++)
                {
                    if (![VSMathUtil _validateCustomVariableSet:customVariableSets[i]])
                    {
                        continue;
                    }

                    NSDictionary *dictionary = (NSDictionary *)customVariableSets[i];
                    NSCharacterSet *characterSet = [dictionary objectForKey:VS_M_DICTIONARY_PROPERTY_CHARACTER_SET];
                    NSCharacterSet *tokenSet = [NSCharacterSet characterSetWithCharactersInString:token];

                    if ([characterSet isSupersetOfSet:tokenSet])
                    {
                        if (isContentAware)
                        {
                            [VSMathUtil _insertMultiplierAfterLinkableToken:prevToken stack:stack output:output customVariableSets:customVariableSets];
                        }

                        [output addObject:token];
                        return YES;
                    }
                }
            }

            return NO;
        }

        default:
        {
            return NO;
        }
    }

    return YES;
}

/*
 *  @inheritdoc
 */
+ (BOOL)_insertMultiplierAfterLinkableToken:(id)token stack:(NSMutableArray *)stack output:(NSMutableArray *)output customVariableSets:(NSArray *)customVariableSets;
{
    if ([VSMathUtil _validateLinkableToken:token customVariableSets:customVariableSets])
    {
        return [VSMathUtil processShuntingYardToken:VS_M_SYMBOL_MULTIPLY stack:stack output:output customVariableSets:customVariableSets];
    }
    else
    {
        return NO;
    }
}

/*
 *  @inheritdoc
 */
+ (BOOL)_validateLinkableToken:(id)token customVariableSets:(NSArray *)customVariableSets
{
    if (token == nil)
    {
        return NO;
    }

    if ([token isKindOfClass:[NSNumber class]])
    {
        return YES;
    }
    else if ([token isKindOfClass:[NSString class]])
    {
        VSMathTokenType tokenType = [VSMathUtil typeOfToken:token];
        VSMathSymbolType symbolType = [VSMathUtil typeOfSymbol:token];
        NSCharacterSet *tokenSet = [NSCharacterSet characterSetWithCharactersInString:token];

        if (tokenType == VSMathTokenTypeNumeric)
        {
            return YES;
        }

        if (customVariableSets != nil)
        {
            unsigned long arrlen = customVariableSets.count;

            for (int i = 0; i < arrlen; i++)
            {
                if (![VSMathUtil _validateCustomVariableSet:customVariableSets[i]])
                {
                    continue;
                }

                NSDictionary *dictionary = (NSDictionary *)customVariableSets[i];
                NSCharacterSet *characterSet = [dictionary objectForKey:VS_M_DICTIONARY_PROPERTY_CHARACTER_SET];

                if ([characterSet isSupersetOfSet:tokenSet])
                {
                    return YES;
                }
            }
        }

        switch (symbolType)
        {
            case VSMathSymbolTypeXVariable:
            case VSMathSymbolTypeYVariable:
            case VSMathSymbolTypeRightParenthesis:
            case VSMathSymbolTypeFactorial:
            case VSMathSymbolTypePercent:
            case VSMathSymbolTypePi:
            case VSMathSymbolTypeEuler:
                return YES;

            default:
                return NO;
        }
    }
    else
    {
        return NO;
    }
}

/*
 *  @inheritdoc
 */
+ (BOOL)_validateCustomVariableSet:(id)customVariableSet
{
    if (customVariableSet == nil)
    {
        return NO;
    }

    if (![customVariableSet isKindOfClass:[NSDictionary class]])
    {
        return NO;
    }

    NSDictionary *dictionary = (NSDictionary *)customVariableSet;
    id characterSet = [dictionary objectForKey:VS_M_DICTIONARY_PROPERTY_CHARACTER_SET];
    id maxRange = [dictionary objectForKey:VS_M_DICTIONARY_PROPERTY_MAX_RANGE];

    if ((characterSet == nil) || ![characterSet isKindOfClass:[NSCharacterSet class]])
    {
        return NO;
    }

    if ((maxRange == nil) || ![maxRange isKindOfClass:[NSNumber class]])
    {
        return NO;
    }
    
    return YES;
}

/*
 *  @inheritdoc
 */
+ (id)_popNumericTokenOnStack:(NSMutableArray *)stack
{
    if (stack == nil || stack.count <= 0)
    {
        return nil;
    }
    
    if ([VSMathUtil typeOfToken:stack.lastObject] == VSMathTokenTypeNumeric)
    {
        id result = stack.lastObject;
        [stack removeLastObject];
        
        return result;
    }
    else
    {
        return nil;
    }
}

#pragma mark - RPN Processing

/*
 *  @inheritdoc
 */
+ (NSArray *)postfixStackByTruncatingPostfixStack:(NSArray *)postfixStack angleMode:(VSMathAngleModeType)angleMode
{
    return [VSMathUtil postfixStackByTruncatingPostfixStack:postfixStack angleMode:angleMode tokenMap:nil];
}

/*
 *  @inheritdoc
 */
+ (NSArray *)postfixStackByTruncatingPostfixStack:(NSArray *)postfixStack angleMode:(VSMathAngleModeType)angleMode tokenMap:(NSDictionary *)tokenMap
{
    if ((postfixStack == nil) || (postfixStack.count <= 0))
    {
        return nil;
    }

    NSMutableArray *truncatedPostfixStack = [[NSMutableArray alloc] init];

    if ([VSMathUtil truncatePostfixStackIntoPostfixStack:truncatedPostfixStack postfixStack:postfixStack angleMode:angleMode tokenMap:tokenMap])
    {
#if !__has_feature(objc_arc)
        return [truncatedPostfixStack autorelease];
#else
        return truncatedPostfixStack;
#endif
    }
    else
    {
        vs_dealloc(truncatedPostfixStack);
        return nil;
    }
}

/*
 *  @inheritdoc
 */
+ (NSArray *)postfixStackByTruncatingBitwisePostfixStack:(NSArray *)postfixStack binaryDigitMode:(VSBinaryDigitType)binaryDigitMode
{
    return [VSMathUtil postfixStackByTruncatingBitwisePostfixStack:postfixStack binaryDigitMode:binaryDigitMode tokenMap:nil];
}

/*
 *  @inheritdoc
 */
+ (NSArray *)postfixStackByTruncatingBitwisePostfixStack:(NSArray *)postfixStack binaryDigitMode:(VSBinaryDigitType)binaryDigitMode tokenMap:(NSDictionary *)tokenMap
{
    if ((postfixStack == nil) || (postfixStack.count <= 0))
    {
        return nil;
    }

    NSMutableArray *truncatedPostfixStack = [[NSMutableArray alloc] init];

    if ([VSMathUtil truncateBitwisePostfixStackIntoPostfixStack:truncatedPostfixStack postfixStack:postfixStack binaryDigitMode:binaryDigitMode tokenMap:tokenMap])
    {
#if !__has_feature(objc_arc)
        return [truncatedPostfixStack autorelease];
#else
        return truncatedPostfixStack;
#endif
    }
    else
    {
        vs_dealloc(truncatedPostfixStack);
        return nil;
    }
}

/*
 *  @inheritdoc
 */
+ (BOOL)truncatePostfixStackIntoPostfixStack:(NSMutableArray *)truncatedPostfixStack postfixStack:(NSArray *)postfixStack angleMode:(VSMathAngleModeType)angleMode;
{
    return [VSMathUtil truncatePostfixStackIntoPostfixStack:truncatedPostfixStack postfixStack:postfixStack angleMode:angleMode tokenMap:nil];
}

/*
 *  @inheritdoc
 */
+ (BOOL)truncatePostfixStackIntoPostfixStack:(NSMutableArray *)truncatedPostfixStack postfixStack:(NSArray *)postfixStack angleMode:(VSMathAngleModeType)angleMode tokenMap:(NSDictionary *)tokenMap;
{
    if (truncatedPostfixStack == nil)
    {
        return NO;
    }

    unsigned long arrlen = postfixStack.count;

    if ((postfixStack == nil) || (arrlen <= 0))
    {
        [truncatedPostfixStack removeAllObjects];

        return NO;
    }

    for (int i = 0; i < arrlen; i++)
    {
        id token = [postfixStack objectAtIndex:i];
        VSMathTokenType tokenType = [VSMathUtil typeOfToken:token];

        switch (tokenType)
        {
            case VSMathTokenTypeNumeric:
            case VSMathTokenTypeConstant:
            {
                [truncatedPostfixStack addObject:[NSNumber numberWithDouble:[VSMathUtil doubleFromToken:token]]];
                break;
            }

            case VSMathTokenTypeVariable:
            {
                id replacementToken = nil;

                if (tokenMap == nil)
                {
                    replacementToken = [NSNumber numberWithDouble:NAN];
                }
                else
                {
                    replacementToken = [tokenMap objectForKey:token];

                    if (![replacementToken isKindOfClass:[NSNumber class]])
                    {
                        replacementToken = [NSNumber numberWithDouble:[VSMathUtil doubleFromToken:replacementToken]];
                    }
                }

                if (replacementToken != nil)
                {
                    [truncatedPostfixStack addObject:replacementToken];
                }

                break;
            }

            case VSMathTokenTypeUnaryPostfixOperator:
            {
                if ((truncatedPostfixStack.count <= 0) || ([VSMathUtil typeOfToken:truncatedPostfixStack.lastObject] != VSMathTokenTypeNumeric))
                {
                    [truncatedPostfixStack removeAllObjects];
                    return NO;
                }

                double tempOperand = [VSMathUtil doubleFromToken:[VSMathUtil _popNumericTokenOnStack:truncatedPostfixStack]];
                double tempResult = [VSMathUtil evaluateOperation:[VSMathUtil operationTypeOfSymbol:token] angleMode:angleMode operand:tempOperand];

                [truncatedPostfixStack addObject:[NSNumber numberWithDouble:tempResult]];
                break;
            }

            case VSMathTokenTypeUnaryPrefixOperator:
            case VSMathTokenTypeFunction:
            {
                if ((truncatedPostfixStack.count <= 0) || ([VSMathUtil typeOfToken:truncatedPostfixStack.lastObject] != VSMathTokenTypeNumeric))
                {
                    [truncatedPostfixStack removeAllObjects];
                    return NO;
                }

                double tempOperand = [VSMathUtil doubleFromToken:[VSMathUtil _popNumericTokenOnStack:truncatedPostfixStack]];
                double tempResult = [VSMathUtil evaluateOperation:[VSMathUtil operationTypeOfSymbol:token] angleMode:angleMode operand:tempOperand];

                [truncatedPostfixStack addObject:[NSNumber numberWithDouble:tempResult]];
                break;
            }

            case VSMathTokenTypeOperator:
            {
                if ((truncatedPostfixStack.count < 2) || ([VSMathUtil typeOfToken:truncatedPostfixStack.lastObject] != VSMathTokenTypeNumeric) || ([VSMathUtil typeOfToken:[truncatedPostfixStack objectAtIndex:truncatedPostfixStack.count-2]] != VSMathTokenTypeNumeric))
                {
                    [truncatedPostfixStack removeAllObjects];
                    return NO;
                }

                double tempOperand = [VSMathUtil doubleFromToken:[VSMathUtil _popNumericTokenOnStack:truncatedPostfixStack]];
                double stackOperand = [VSMathUtil doubleFromToken:[VSMathUtil _popNumericTokenOnStack:truncatedPostfixStack]];
                double tempResult = [VSMathUtil evaluateOperation:[VSMathUtil operationTypeOfSymbol:token] angleMode:angleMode operandX:stackOperand operandY:tempOperand];

                [truncatedPostfixStack addObject:[NSNumber numberWithDouble:tempResult]];
                break;
            }

            case VSMathTokenTypeParenthesis:
            {
                // Ignore, as if they never existed.
                break;
            }

            default:
            {
                if (tokenMap != nil)
                {
                    id replacementToken = [tokenMap objectForKey:token];

                    if (replacementToken != nil)
                    {
                        if ([replacementToken isKindOfClass:[NSNumber class]])
                        {
                            [truncatedPostfixStack addObject:replacementToken];
                        }
                        else
                        {
                            [truncatedPostfixStack addObject:[NSNumber numberWithDouble:[VSMathUtil doubleFromToken:replacementToken]]];
                        }
                    }
                    else
                    {
                        [truncatedPostfixStack removeAllObjects];
                        return NO;
                    }
                }
                else
                {
                    [truncatedPostfixStack removeAllObjects];
                    return NO;
                }
            }
        }
    }
    
    if (truncatedPostfixStack.count <= 0)
    {
        return NO;
    }
    else if (![truncatedPostfixStack.lastObject isKindOfClass:[NSNumber class]])
    {
        [truncatedPostfixStack removeAllObjects];
        return NO;
    }
    else
    {
        return YES;
    }
}

/*
 *  @inheritdoc
 */
+ (BOOL)truncateBitwisePostfixStackIntoPostfixStack:(NSMutableArray *)truncatedPostfixStack postfixStack:(NSArray *)postfixStack binaryDigitMode:(VSBinaryDigitType)binaryDigitMode
{
    return [VSMathUtil truncateBitwisePostfixStackIntoPostfixStack:truncatedPostfixStack postfixStack:postfixStack binaryDigitMode:binaryDigitMode tokenMap:nil];
}

/*
 *  @inheritdoc
 */
+ (BOOL)truncateBitwisePostfixStackIntoPostfixStack:(NSMutableArray *)truncatedPostfixStack postfixStack:(NSArray *)postfixStack binaryDigitMode:(VSBinaryDigitType)binaryDigitMode tokenMap:(NSDictionary *)tokenMap
{
    if (truncatedPostfixStack == nil)
    {
        return NO;
    }

    unsigned long arrlen = postfixStack.count;

    if ((postfixStack == nil) || (arrlen <= 0))
    {
        [truncatedPostfixStack removeAllObjects];
        return NO;
    }

    for (int i = 0; i < arrlen; i++)
    {
        id token = [postfixStack objectAtIndex:i];
        VSMathTokenType tokenType = [VSMathUtil typeOfToken:token];

        switch (tokenType)
        {
            case VSMathTokenTypeNumeric:
            case VSMathTokenTypeConstant:
            {
                [truncatedPostfixStack addObject:[NSNumber numberWithUnsignedLongLong:[VSMathUtil unsignedLongLongFromToken:token]]];
                break;
            }

            case VSMathTokenTypeVariable:
            {
                id replacementToken = nil;

                if (tokenMap == nil)
                {
                    replacementToken = [NSNumber numberWithUnsignedLongLong:0];
                }
                else
                {
                    replacementToken = [tokenMap objectForKey:token];

                    if (![replacementToken isKindOfClass:[NSNumber class]])
                    {
                        replacementToken = [NSNumber numberWithUnsignedLongLong:[VSMathUtil unsignedLongLongFromToken:replacementToken]];
                    }
                }

                if (replacementToken != nil)
                {
                    [truncatedPostfixStack addObject:replacementToken];
                }

                break;
            }

            case VSMathTokenTypeUnaryPostfixOperator:
            {
                if ((truncatedPostfixStack.count <= 0) || ([VSMathUtil typeOfToken:truncatedPostfixStack.lastObject] != VSMathTokenTypeNumeric))
                {
                    [truncatedPostfixStack removeAllObjects];
                    return NO;
                }

                unsigned long long tempOperand = [VSMathUtil unsignedLongLongFromToken:[VSMathUtil _popNumericTokenOnStack:truncatedPostfixStack]];
                unsigned long long stackOperand = ([VSMathUtil typeOfToken:truncatedPostfixStack.lastObject] == VSMathTokenTypeNumeric) ? [VSMathUtil unsignedLongLongFromToken:truncatedPostfixStack.lastObject] : 1;
                unsigned long long tempResult = [VSMathUtil evaluateBitwiseOperation:[VSMathUtil operationTypeOfSymbol:token] operandX:tempOperand operandY:stackOperand binaryDigitType:binaryDigitMode];

                [truncatedPostfixStack addObject:[NSNumber numberWithUnsignedLongLong:tempResult]];
                break;
            }

            case VSMathTokenTypeUnaryPrefixOperator:
            case VSMathTokenTypeFunction:
            {
                if ((truncatedPostfixStack.count <= 0) || ([VSMathUtil typeOfToken:truncatedPostfixStack.lastObject] != VSMathTokenTypeNumeric))
                {
                    [truncatedPostfixStack removeAllObjects];
                    return NO;
                }

                unsigned long long tempOperand = [VSMathUtil unsignedLongLongFromToken:[VSMathUtil _popNumericTokenOnStack:truncatedPostfixStack]];
                unsigned long long tempResult = [VSMathUtil evaluateBitwiseOperation:[VSMathUtil operationTypeOfSymbol:token] operand:tempOperand binaryDigitType:binaryDigitMode];

                [truncatedPostfixStack addObject:[NSNumber numberWithUnsignedLongLong:tempResult]];
                break;
            }

            case VSMathTokenTypeOperator:
            {
                if ((truncatedPostfixStack.count < 2) || ([VSMathUtil typeOfToken:truncatedPostfixStack.lastObject] != VSMathTokenTypeNumeric) || ([VSMathUtil typeOfToken:[truncatedPostfixStack objectAtIndex:truncatedPostfixStack.count-2]] != VSMathTokenTypeNumeric))
                {
                    [truncatedPostfixStack removeAllObjects];
                    return NO;
                }

                unsigned long long tempOperand = [VSMathUtil unsignedLongLongFromToken:[VSMathUtil _popNumericTokenOnStack:truncatedPostfixStack]];
                unsigned long long stackOperand = [VSMathUtil unsignedLongLongFromToken:[VSMathUtil _popNumericTokenOnStack:truncatedPostfixStack]];
                unsigned long long tempResult = [VSMathUtil evaluateBitwiseOperation:[VSMathUtil operationTypeOfSymbol:token] operandX:stackOperand operandY:tempOperand binaryDigitType:binaryDigitMode];

                [truncatedPostfixStack addObject:[NSNumber numberWithUnsignedLongLong:tempResult]];
                break;
            }

            case VSMathTokenTypeParenthesis:
            {
                // Ignore, as if they never existed.
                break;
            }

            default:
            {
                if (tokenMap != nil)
                {
                    id replacementToken = [tokenMap objectForKey:token];

                    if (replacementToken != nil)
                    {
                        if ([replacementToken isKindOfClass:[NSNumber class]])
                        {
                            [truncatedPostfixStack addObject:replacementToken];
                        }
                        else
                        {
                            [truncatedPostfixStack addObject:[NSNumber numberWithUnsignedLongLong:[VSMathUtil unsignedLongLongFromToken:replacementToken]]];
                        }
                    }
                    else
                    {
                        [truncatedPostfixStack removeAllObjects];
                        return NO;
                    }
                }
                else
                {
                    [truncatedPostfixStack removeAllObjects];
                    return NO;
                }
            }
        }
    }
    
    if (truncatedPostfixStack.count <= 0)
    {
        return NO;
    }
    else if (![truncatedPostfixStack.lastObject isKindOfClass:[NSNumber class]])
    {
        [truncatedPostfixStack removeAllObjects];
        return NO;
    }
    else
    {
        return YES;
    }
}

#pragma mark - Expression Evaluation

/*
 *  @inheritdoc
 */
+ (NSNumber *)evaluateInfixExpression:(NSString *)infixExpression angleMode:(VSMathAngleModeType)angleMode
{
    return [VSMathUtil evaluateInfixExpression:infixExpression angleMode:angleMode tokenMap:nil customVariableSets:nil];
}

/*
 *  @inheritdoc
 */
+ (NSNumber *)evaluateInfixExpression:(NSString *)infixExpression angleMode:(VSMathAngleModeType)angleMode tokenMap:(NSDictionary *)tokenMap customVariableSets:(NSArray *)customVariableSets
{
    return [VSMathUtil evaluatePostfixStack:[VSMathUtil postfixStackFromInfixExpression:infixExpression customVariableSets:customVariableSets] angleMode:angleMode tokenMap:tokenMap];
}

/*
 *  @inheritdoc
 */
+ (NSNumber *)evaluatePostfixStack:(NSArray *)postfixStack angleMode:(VSMathAngleModeType)angleMode
{
    return [VSMathUtil evaluatePostfixStack:postfixStack angleMode:angleMode tokenMap:nil];
}

/*
 *  @inheritdoc
 */
+ (NSNumber *)evaluatePostfixStack:(NSArray *)postfixStack angleMode:(VSMathAngleModeType)angleMode tokenMap:(NSDictionary *)tokenMap
{
    NSArray *truncatedRPN = [VSMathUtil postfixStackByTruncatingPostfixStack:postfixStack angleMode:angleMode tokenMap:tokenMap];

    if (truncatedRPN == nil)
    {
        return nil;
    }
    else if (truncatedRPN.count != 1)
    {
        return nil;
    }
    else if (![truncatedRPN.lastObject isKindOfClass:[NSNumber class]])
    {
        return nil;
    }
    else
    {
        return truncatedRPN.lastObject;
    }
}

/*
 *  @inheritdoc
 */
+ (NSNumber *)evaluateBitwisePostfixStack:(NSArray *)postfixStack binaryDigitMode:(VSBinaryDigitType)binaryDigitMode
{
    return [VSMathUtil evaluateBitwisePostfixStack:postfixStack binaryDigitMode:binaryDigitMode tokenMap:nil];
}

/*
 *  @inheritdoc
 */
+ (NSNumber *)evaluateBitwisePostfixStack:(NSArray *)postfixStack binaryDigitMode:(VSBinaryDigitType)binaryDigitMode tokenMap:(NSDictionary *)tokenMap
{
    NSArray *truncatedRPN = [VSMathUtil postfixStackByTruncatingBitwisePostfixStack:postfixStack binaryDigitMode:binaryDigitMode tokenMap:tokenMap];

    if (truncatedRPN == nil)
    {
        return nil;
    }
    else if (truncatedRPN.count != 1)
    {
        return nil;
    }
    else if (![truncatedRPN.lastObject isKindOfClass:[NSNumber class]])
    {
        return nil;
    }
    else
    {
        return truncatedRPN.lastObject;
    }
}

#pragma mark - Function Sampling

/*
 *  @inheritdoc
 */
+ (NSArray *)samplesFromLinearSamplingInfixExpression:(NSString *)infixExpression angleMode:(VSMathAngleModeType)angleMode xMin:(double)xMin xMax:(double)xMax numberOfSamples:(int)numberOfSamples
{
    return [VSMathUtil samplesFromLinearSamplingPostfixStack:[VSMathUtil postfixStackFromInfixExpression:infixExpression] angleMode:angleMode xMin:xMin xMax:xMax numberOfSamples:numberOfSamples];
}

/*
 *  @inheritdoc
 */
+ (NSArray *)samplesFromLinearSamplingPostfixStack:(NSArray *)postfixStack angleMode:(VSMathAngleModeType)angleMode xMin:(double)xMin xMax:(double)xMax numberOfSamples:(int)numberOfSamples
{
    NSMutableArray *samples = [[NSMutableArray alloc] init];

    // Determine the ranges.
    double xStep = (xMax - xMin) / numberOfSamples;

    for (int i = 0; i < numberOfSamples; i++)
    {
        double x = xMin + (xStep * i);
        NSNumber *output = [VSMathUtil evaluatePostfixStack:postfixStack angleMode:angleMode tokenMap:[NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithDouble:x], [VSMathUtil symbolWithType:VSMathSymbolTypeXVariable], nil]];

        // Check for syntax error.
        if (output == nil)
        {
            vs_dealloc(samples);

            return nil;
        }

        double y = [VSMathUtil doubleFromToken:output];

        CGPoint sample = CGPointMake(x, y);
        [samples addObject:[NSValue valueWithCGPoint:sample]];
    }

#if !__has_feature(objc_arc)
    return [samples autorelease];
#else
    return samples;
#endif
}

/*
 *  @inheritdoc
 */
+ (NSArray *)samplesFromAdaptiveSamplingInfixExpression:(NSString *)infixExpression angleMode:(VSMathAngleModeType)angleMode xMin:(double)xMin xMax:(double)xMax tolerance:(double)tolerance depth:(int)depth
{
    return [VSMathUtil samplesFromAdaptiveSamplingPostfixStack:[VSMathUtil postfixStackFromInfixExpression:infixExpression] angleMode:angleMode xMin:xMin xMax:xMax tolerance:tolerance depth:depth];
}

/*
 *  @inheritdoc
 */
+ (NSArray *)samplesFromAdaptiveSamplingPostfixStack:(NSArray *)postfixStack angleMode:(VSMathAngleModeType)angleMode xMin:(double)xMin xMax:(double)xMax tolerance:(double)tolerance depth:(int)depth
{
    if (isnan(tolerance) || tolerance <= 0.0) tolerance = DBL_EPSILON;

    double xa  = xMin;
    double xb  = xa + (xMax - xMin) / 2;
    double xc  = xMax;
    double xab = xa + (xb - xa) / 2;
    double xbc = xb + (xc - xb) / 2;
    double ya  = [[VSMathUtil evaluatePostfixStack:postfixStack angleMode:angleMode tokenMap:[NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithDouble:xa], VS_M_SYMBOL_X_VARIABLE, nil]] doubleValue];
    double yb  = [[VSMathUtil evaluatePostfixStack:postfixStack angleMode:angleMode tokenMap:[NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithDouble:xb], VS_M_SYMBOL_X_VARIABLE, nil]] doubleValue];
    double yc  = [[VSMathUtil evaluatePostfixStack:postfixStack angleMode:angleMode tokenMap:[NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithDouble:xc], VS_M_SYMBOL_X_VARIABLE, nil]] doubleValue];
    double yab = [[VSMathUtil evaluatePostfixStack:postfixStack angleMode:angleMode tokenMap:[NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithDouble:xab], VS_M_SYMBOL_X_VARIABLE, nil]] doubleValue];
    double ybc = [[VSMathUtil evaluatePostfixStack:postfixStack angleMode:angleMode tokenMap:[NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithDouble:xbc], VS_M_SYMBOL_X_VARIABLE, nil]] doubleValue];

    NSArray *localSamples = [NSArray arrayWithObjects:[NSValue valueWithCGPoint:CGPointMake(xa, ya)], [NSValue valueWithCGPoint:CGPointMake(xab, yab)], [NSValue valueWithCGPoint:CGPointMake(xb, yb)], [NSValue valueWithCGPoint:CGPointMake(xbc, ybc)], [NSValue valueWithCGPoint:CGPointMake(xc, yc)], nil];

    if (depth <= 0)
    {
        return localSamples;
    }

    // Manually walk through the plots to determine whether there is a rapid oscillation.
    int flag = 0;

    for (int i = 1; i < 4; i++)
    {
        double prevValue = [(NSValue *)localSamples[i-1] CGPointValue].y;
        double currValue = [(NSValue *)localSamples[i] CGPointValue].y;
        double nextValue = [(NSValue *)localSamples[i+1] CGPointValue].y;

        if (isnan(prevValue) || isnan(currValue) || isnan(nextValue) || ((currValue > prevValue) && (currValue > nextValue)) || ((currValue < prevValue) && (currValue < nextValue)))
        {
            flag++;
        }
    }

    if (flag <= 2)
    {
        double ncq1 = (3/8)*ya + (19/24)*yab + (-5/24)*yb + (1/24)*ybc;
        double ncq2 = (5/12)*yb + (2/3)*ybc + (-1/12)*yc;

        if (fabs(ncq1-ncq2) < tolerance*ncq2)
        {
            return localSamples;
        }
    }

    // Refinements needed.
    NSMutableArray *leftSamples = [NSMutableArray arrayWithArray:[VSMathUtil samplesFromAdaptiveSamplingPostfixStack:postfixStack angleMode:angleMode xMin:xa xMax:xb tolerance:tolerance*2 depth:depth-1]];
    [leftSamples removeLastObject];
    NSArray *rightSamples = [VSMathUtil samplesFromAdaptiveSamplingPostfixStack:postfixStack angleMode:angleMode xMin:xb xMax:xc tolerance:tolerance*2 depth:depth-1];

    return [leftSamples arrayByAddingObjectsFromArray:rightSamples];
}

/*
 *  @inheritdoc
 */
+ (NSArray *)samplesFromCustomSamplingInfixExpression:(NSString *)infixExpression angleMode:(VSMathAngleModeType)angleMode xMin:(double)xMin xMax:(double)xMax yMin:(double)yMin yMax:(double)yMax tolerance:(double)tolerance
{
    return [VSMathUtil samplesFromCustomSamplingPostfixStack:[VSMathUtil postfixStackFromInfixExpression:infixExpression] angleMode:angleMode xMin:xMin xMax:xMax yMin:yMin yMax:yMax tolerance:tolerance];
}

/*
 *  @inheritdoc
 */
+ (NSArray *)samplesFromCustomSamplingPostfixStack:(NSArray *)postfixStack angleMode:(VSMathAngleModeType)angleMode xMin:(double)xMin xMax:(double)xMax yMin:(double)yMin yMax:(double)yMax tolerance:(double)tolerance
{
    if (isnan(tolerance)) tolerance = FLT_EPSILON;

    NSMutableArray *samples = [[NSMutableArray alloc] init];

    double x     = xMin;
    double xStep = tolerance * 250;
    double prevY = NAN;
    double currY = NAN;

    while (x < xMax)
    {
        currY = [VSMathUtil doubleFromToken:[VSMathUtil evaluatePostfixStack:postfixStack angleMode:angleMode tokenMap:[NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithDouble:x], VS_M_SYMBOL_X_VARIABLE, nil]]];

        if ((xStep > tolerance) && fisbounded(currY, yMin, yMax) && !fisbounded(prevY, yMin, yMax))
        {
            x -= xStep;
            xStep /= 10;
        }
        else
        {
            if (!(isnan(prevY) || isnan(currY)) && (fisbounded(prevY, yMin, yMax) || fisbounded(currY, yMin, yMax)))
            {
                CGPoint sample = CGPointMake(x, currY);
                [samples addObject:[NSValue valueWithCGPoint:sample]];
            }
            else
            {
                CGPoint sample = CGPointMake(x, currY);
                [samples addObject:[NSValue valueWithCGPoint:sample]];
            }

            if (fisbounded(currY, yMin, yMax))
            {
                xStep /= fabs(prevY - currY);
            }
            else
            {
                xStep = tolerance * 1000;
            }

            if (isnan(xStep))
            {
                xStep = tolerance * 1000;
            }

            xStep = fbound(xStep, tolerance, tolerance*2000);
            prevY = currY;
        }
        
        x += xStep;
    }

#if !__has_feature(objc_arc)
    return [samples autorelease];
#else
    return samples;
#endif
}

/*
 *  @inheritdoc
 */
+ (double)evaluateSlopeBetweenPoint:(CGPoint)pointA andPoint:(CGPoint)pointB
{
    if (isnan(pointA.x) || isnan(pointA.y) || isnan(pointB.x) || isnan(pointB.y))
    {
        return NAN;
    }

    double xDelta = pointB.x - pointA.x;
    double yDelta = pointB.y - pointA.y;

    if (fabs(yDelta) < DBL_EPSILON)
    {
        return 0.0;
    }

    if (fabs(xDelta) < DBL_EPSILON)
    {
        return NAN;
    }

    return yDelta/xDelta;
}

#pragma mark - Math Operator Properties

/*
 *  @inheritdoc
 */
+ (int)precedenceOfSymbol:(NSString *)symbol
{
    return [VSMathUtil precedenceOfSymbolType:[VSMathUtil typeOfSymbol:symbol]];
}

/*
 *  @inheritdoc
 */
+ (int)precedenceOfSymbolType:(VSMathSymbolType)symbolType
{
    return [VSMathUtil precedenceOfOperationType:[VSMathUtil operationTypeOfSymbolType:symbolType]];
}

/*
 *  @inheritdoc
 */
+ (int)precedenceOfOperationType:(VSMathOperationType)operationType
{
    switch (operationType)
    {
        case VSMathOperationTypeEqual:
            return 1;

        case VSMathOperationTypeAdd:
        case VSMathOperationTypeSubtract:
            return 2;

        case VSMathOperationTypeMultiply:
        case VSMathOperationTypeDivide:
        case VSMathOperationTypeModulo:
            return 3;

        case VSMathOperationTypeExponent:
        case VSMathOperationTypeRoot:
        case VSMathOperationTypeScientificNotation:
        case VSMathOperationTypeChoose:
        case VSMathOperationTypePick:
        case VSMathOperationTypeNegative:
            return 4;

        case VSMathOperationTypeSquareRoot:
        case VSMathOperationTypeCubeRoot:
        case VSMathOperationTypeLeftShiftBy:
        case VSMathOperationTypeRightShiftBy:
        case VSMathOperationTypeAnd:
        case VSMathOperationTypeNand:
        case VSMathOperationTypeOr:
        case VSMathOperationTypeNor:
        case VSMathOperationTypeXor:
        case VSMathOperationTypeXnor:
            return 5;

        default:
            return -1;
    }
}

/*
 *  @inheritdoc
 */
+ (VSMathOperatorAssociativeType)operatorAssociativeTypeOfSymbol:(NSString *)symbol
{
    return [VSMathUtil operatorAssociativeTypeOfSymbolType:[VSMathUtil typeOfSymbol:symbol]];
}

/*
 *  @inheritdoc
 */
+ (VSMathOperatorAssociativeType)operatorAssociativeTypeOfSymbolType:(VSMathSymbolType)symbolType
{
    return [VSMathUtil operatorAssociativeTypeOfOperationType:[VSMathUtil operationTypeOfSymbolType:symbolType]];
}

/*
 *  @inheritdoc
 */
+ (VSMathOperatorAssociativeType)operatorAssociativeTypeOfOperationType:(VSMathOperationType)operationType
{
    switch (operationType)
    {
        case VSMathOperationTypeAdd:
        case VSMathOperationTypeSubtract:
        case VSMathOperationTypeMultiply:
        case VSMathOperationTypeDivide:
        case VSMathOperationTypeModulo:
        case VSMathOperationTypeChoose:
        case VSMathOperationTypePick:
        case VSMathOperationTypeLeftShiftBy:
        case VSMathOperationTypeRightShiftBy:
        case VSMathOperationTypeAnd:
        case VSMathOperationTypeNand:
        case VSMathOperationTypeOr:
        case VSMathOperationTypeNor:
        case VSMathOperationTypeXor:
        case VSMathOperationTypeXnor:
            return VSMathOperatorAssociativeTypeLeft;

        case VSMathOperationTypeEqual:
        case VSMathOperationTypeExponent:
        case VSMathOperationTypeRoot:
        case VSMathOperationTypeScientificNotation:
        case VSMathOperationTypeNegative:
        case VSMathOperationTypeSquareRoot:
        case VSMathOperationTypeCubeRoot:
            return VSMathOperatorAssociativeTypeRight;

        default:
            return VSMathOperatorAssociativeTypeUnknown;
    }
}

/*
 *  @inheritdoc
 */
+ (VSMathOperatorUnaryType)operatorUnaryTypeOfSymbol:(NSString *)symbol
{
    return [VSMathUtil operatorUnaryTypeOfOperationType:[VSMathUtil operationTypeOfSymbol:symbol]];
}

/*
 *  @inheritdoc
 */
+ (VSMathOperatorUnaryType)operatorUnaryTypeOfSymbolType:(VSMathSymbolType)symbolType
{
    return [VSMathUtil operatorUnaryTypeOfOperationType:[VSMathUtil operationTypeOfSymbolType:symbolType]];
}

/*
 *  @inheritdoc
 */
+ (VSMathOperatorUnaryType)operatorUnaryTypeOfOperationType:(VSMathOperationType)operationType
{
    switch (operationType)
    {
        case VSMathOperationTypeAdd:
        case VSMathOperationTypeSubtract:
        case VSMathOperationTypeMultiply:
        case VSMathOperationTypeDivide:
        case VSMathOperationTypeModulo:
        case VSMathOperationTypeChoose:
        case VSMathOperationTypePick:
        case VSMathOperationTypeLeftShiftBy:
        case VSMathOperationTypeRightShiftBy:
        case VSMathOperationTypeAnd:
        case VSMathOperationTypeNand:
        case VSMathOperationTypeOr:
        case VSMathOperationTypeNor:
        case VSMathOperationTypeXor:
        case VSMathOperationTypeXnor:
        case VSMathOperationTypeExponent:
        case VSMathOperationTypeRoot:
        case VSMathOperationTypeScientificNotation:
            return VSMathOperatorUnaryTypeNonUnary;

        case VSMathOperationTypeFactorial:
        case VSMathOperationTypeSquare:
        case VSMathOperationTypeCube:
        case VSMathOperationTypeInverse:
            return VSMathOperatorUnaryTypeUnaryPostfix;

        case VSMathOperationTypeSquareRoot:
        case VSMathOperationTypeCubeRoot:
        case VSMathOperationTypeNegative:
            return VSMathOperatorUnaryTypeUnaryPrefix;
            
        default:
            return VSMathOperatorUnaryTypeUnknown;
    }
}

#pragma mark - Enum Translations

/*
 *  @inheritdoc
 */
+ (VSMathTokenType)typeOfToken:(id)token
{
    if (token == nil)
    {
        return VSMathTokenTypeUnknown;
    }
    else if ([token isKindOfClass:[NSNumber class]])
    {
        return VSMathTokenTypeNumeric;
    }
    else if ([token isKindOfClass:[NSString class]])
    {
        if (([token isEqualToString:VS_M_SYMBOL_ADD]) ||
            ([token isEqualToString:VS_M_SYMBOL_SUBTRACT]) ||
            ([token isEqualToString:VS_M_SYMBOL_MULTIPLY]) ||
            ([token isEqualToString:VS_M_SYMBOL_MULTIPLY_ALTERNATE]) ||
            ([token isEqualToString:VS_M_SYMBOL_DIVIDE]) ||
            ([token isEqualToString:VS_M_SYMBOL_DIVIDE_ALTERNATE]) ||
            ([token isEqualToString:VS_M_SYMBOL_EXPONENT]) ||
            ([token isEqualToString:VS_M_SYMBOL_ROOT]) ||
            ([token isEqualToString:VS_M_SYMBOL_MODULO]) ||
            ([token isEqualToString:VS_M_SYMBOL_SCIENTIFIC_NOTATION]) ||
            ([token isEqualToString:VS_M_SYMBOL_CHOOSE]) ||
            ([token isEqualToString:VS_M_SYMBOL_PICK]) ||
            ([token isEqualToString:VS_M_SYMBOL_ADD]) ||
            ([token isEqualToString:VS_M_SYMBOL_LEFT_SHIFT_BY]) ||
            ([token isEqualToString:VS_M_SYMBOL_RIGHT_SHIFT_BY]) ||
            ([token isEqualToString:VS_M_SYMBOL_AND]) ||
            ([token isEqualToString:VS_M_SYMBOL_NAND]) ||
            ([token isEqualToString:VS_M_SYMBOL_OR]) ||
            ([token isEqualToString:VS_M_SYMBOL_NOR]) ||
            ([token isEqualToString:VS_M_SYMBOL_XOR]) ||
            ([token isEqualToString:VS_M_SYMBOL_XNOR]))
        {
            return VSMathTokenTypeOperator;
        }
        else if (([token isEqualToString:VS_M_SYMBOL_NEGATIVE]) ||
                 ([token isEqualToString:VS_M_SYMBOL_SQUARE_ROOT]) ||
                 ([token isEqualToString:VS_M_SYMBOL_CUBE_ROOT]))
        {
            return VSMathTokenTypeUnaryPrefixOperator;
        }
        else if (([token isEqualToString:VS_M_SYMBOL_SQUARE]) ||
                 ([token isEqualToString:VS_M_SYMBOL_CUBE]) ||
                 ([token isEqualToString:VS_M_SYMBOL_FACTORIAL]))
        {
            return VSMathTokenTypeUnaryPostfixOperator;
        }
        else if (([token isEqualToString:VS_M_SYMBOL_SINE]) ||
                 ([token isEqualToString:VS_M_SYMBOL_COSINE]) ||
                 ([token isEqualToString:VS_M_SYMBOL_TANGENT]) ||
                 ([token isEqualToString:VS_M_SYMBOL_INVERSE_SINE]) ||
                 ([token isEqualToString:VS_M_SYMBOL_INVERSE_COSINE]) ||
                 ([token isEqualToString:VS_M_SYMBOL_INVERSE_TANGENT]) ||
                 ([token isEqualToString:VS_M_SYMBOL_HYPERBOLIC_SINE]) ||
                 ([token isEqualToString:VS_M_SYMBOL_HYPERBOLIC_COSINE]) ||
                 ([token isEqualToString:VS_M_SYMBOL_HYPERBOLIC_TANGENT]) ||
                 ([token isEqualToString:VS_M_SYMBOL_INVERSE_HYPERBOLIC_SINE]) ||
                 ([token isEqualToString:VS_M_SYMBOL_INVERSE_HYPERBOLIC_COSINE]) ||
                 ([token isEqualToString:VS_M_SYMBOL_INVERSE_HYPERBOLIC_TANGENT]) ||
                 ([token isEqualToString:VS_M_SYMBOL_NATURAL_LOGARITHM]) ||
                 ([token isEqualToString:VS_M_SYMBOL_LOGARITHM_10]) ||
                 ([token isEqualToString:VS_M_SYMBOL_LOGARITHM_2]) ||
                 ([token isEqualToString:VS_M_SYMBOL_ABSOLUTE_VALUE]) ||
                 ([token isEqualToString:VS_M_SYMBOL_PERCENT]) ||
                 ([token isEqualToString:VS_M_SYMBOL_LEFT_SHIFT]) ||
                 ([token isEqualToString:VS_M_SYMBOL_RIGHT_SHIFT]) ||
                 ([token isEqualToString:VS_M_SYMBOL_LEFT_ROTATE]) ||
                 ([token isEqualToString:VS_M_SYMBOL_RIGHT_ROTATE]) ||
                 ([token isEqualToString:VS_M_SYMBOL_ONES_COMPLEMENT]) ||
                 ([token isEqualToString:VS_M_SYMBOL_TWOS_COMPLEMENT]) ||
                 ([token isEqualToString:VS_M_SYMBOL_FLIP_WORD]) ||
                 ([token isEqualToString:VS_M_SYMBOL_FLIP_BYTE]))
        {
            return VSMathTokenTypeFunction;
        }
        else if (([token isEqualToString:VS_M_SYMBOL_LEFT_PARENTHESIS]) ||
                 ([token isEqualToString:VS_M_SYMBOL_RIGHT_PARENTHESIS]))
        {
            return VSMathTokenTypeParenthesis;
        }
        else if (([token isEqualToString:VS_M_SYMBOL_PI]) ||
                 ([token isEqualToString:VS_M_SYMBOL_RANDOM_NUMBER]) ||
                 ([token isEqualToString:VS_M_SYMBOL_EULER]))
        {
            return VSMathTokenTypeConstant;
        }
        else if (([token isEqualToString:VS_M_SYMBOL_X_VARIABLE]) ||
                 ([token isEqualToString:VS_M_SYMBOL_Y_VARIABLE]))
        {
            return VSMathTokenTypeVariable;
        }
        else if ([VSNumberUtil numberFromString:token] != nil)
        {
            return VSMathTokenTypeNumeric;
        }
        else
        {
            return VSMathTokenTypeUnknown;
        }
    }

    return VSMathTokenTypeUnknown;
}

/*
 *  @inheritdoc
 */
+ (VSMathTokenType)typeOfTokenSubset:(id)tokenSubset
{
    if (tokenSubset == nil)
    {
        return VSMathTokenTypeUnknown;
    }

    VSMathTokenType tokenType = [VSMathUtil typeOfToken:tokenSubset];

    if (tokenType == VSMathTokenTypeUnknown)
    {
        if ([tokenSubset isKindOfClass:[NSString class]])
        {
            NSCharacterSet *cs = [NSCharacterSet characterSetWithCharactersInString:(NSString *)tokenSubset];

            if ([[VSMathUtil numericCharacterSet] isSupersetOfSet:cs])
            {
                return VSMathTokenTypeNumeric;
            }
            else if ([[VSMathUtil functionCharacterSet] isSupersetOfSet:cs])
            {
                return VSMathTokenTypeFunction;
            }
            else if ([[VSMathUtil operatorCharacterSet] isSupersetOfSet:cs])
            {
                return VSMathTokenTypeOperator;
            }
            else if ([[VSMathUtil unaryPostfixOperatorCharacterSet] isSupersetOfSet:cs])
            {
                return VSMathTokenTypeUnaryPostfixOperator;
            }
            else if ([[VSMathUtil unaryPrefixOperatorCharacterSet] isSupersetOfSet:cs])
            {
                return VSMathTokenTypeUnaryPrefixOperator;
            }
            else if ([[VSMathUtil constantCharacterSet] isSupersetOfSet:cs])
            {
                return VSMathTokenTypeConstant;
            }
            else if ([[VSMathUtil parenthesisCharacterSet] isSupersetOfSet:cs])
            {
                return VSMathTokenTypeParenthesis;
            }
            else if ([[VSMathUtil variableCharacterSet] isSupersetOfSet:cs])
            {
                return VSMathTokenTypeVariable;
            }
            else
            {
                return VSMathTokenTypeUnknown;
            }
        }
        else
        {
            return VSMathTokenTypeUnknown;
        }
    }
    else
    {
        return tokenType;
    }
}

/*
 *  @inheritdoc
 */
+ (NSString *)symbolWithType:(VSMathSymbolType)symbolType
{
    switch (symbolType)
    {
        case VSMathSymbolTypeEqual:                    return VS_M_SYMBOL_EQUAL;
        case VSMathSymbolTypeAdd:                      return VS_M_SYMBOL_ADD;
        case VSMathSymbolTypeSubtract:                 return VS_M_SYMBOL_SUBTRACT;
        case VSMathSymbolTypeMultiply:                 return VS_M_SYMBOL_MULTIPLY;
        case VSMathSymbolTypeMultiplyAlternate:        return VS_M_SYMBOL_MULTIPLY_ALTERNATE;
        case VSMathSymbolTypeDivide:                   return VS_M_SYMBOL_DIVIDE;
        case VSMathSymbolTypeDivideAlternate:          return VS_M_SYMBOL_DIVIDE_ALTERNATE;
        case VSMathSymbolTypeExponent:                 return VS_M_SYMBOL_EXPONENT;
        case VSMathSymbolTypeRoot:                     return VS_M_SYMBOL_ROOT;
        case VSMathSymbolTypeScientificNotation:       return VS_M_SYMBOL_SCIENTIFIC_NOTATION;
        case VSMathSymbolTypeChoose:                   return VS_M_SYMBOL_CHOOSE;
        case VSMathSymbolTypePick:                     return VS_M_SYMBOL_PICK;
        case VSMathSymbolTypeNegative:                 return VS_M_SYMBOL_NEGATIVE;
        case VSMathSymbolTypeSquare:                   return VS_M_SYMBOL_SQUARE;
        case VSMathSymbolTypeSquareRoot:               return VS_M_SYMBOL_SQUARE_ROOT;
        case VSMathSymbolTypeCube:                     return VS_M_SYMBOL_CUBE;
        case VSMathSymbolTypeCubeRoot:                 return VS_M_SYMBOL_CUBE_ROOT;
        case VSMathSymbolTypePercent:                  return VS_M_SYMBOL_PERCENT;
        case VSMathSymbolTypeModulo:                   return VS_M_SYMBOL_MODULO;
        case VSMathSymbolTypeFactorial:                return VS_M_SYMBOL_FACTORIAL;
        case VSMathSymbolTypeSine:                     return VS_M_SYMBOL_SINE;
        case VSMathSymbolTypeCosine:                   return VS_M_SYMBOL_COSINE;
        case VSMathSymbolTypeTangent:                  return VS_M_SYMBOL_TANGENT;
        case VSMathSymbolTypeInverseSine:              return VS_M_SYMBOL_INVERSE_SINE;
        case VSMathSymbolTypeInverseCosine:            return VS_M_SYMBOL_INVERSE_COSINE;
        case VSMathSymbolTypeInverseTangent:           return VS_M_SYMBOL_INVERSE_TANGENT;
        case VSMathSymbolTypeHyperbolicSine:           return VS_M_SYMBOL_HYPERBOLIC_SINE;
        case VSMathSymbolTypeHyperbolicCosine:         return VS_M_SYMBOL_HYPERBOLIC_COSINE;
        case VSMathSymbolTypeHyperbolicTangent:        return VS_M_SYMBOL_HYPERBOLIC_TANGENT;
        case VSMathSymbolTypeInverseHyperbolicSine:    return VS_M_SYMBOL_INVERSE_HYPERBOLIC_SINE;
        case VSMathSymbolTypeInverseHyperbolicCosine:  return VS_M_SYMBOL_INVERSE_HYPERBOLIC_COSINE;
        case VSMathSymbolTypeInverseHyperbolicTangent: return VS_M_SYMBOL_INVERSE_HYPERBOLIC_TANGENT;
        case VSMathSymbolTypeNaturalLogarithm:         return VS_M_SYMBOL_NATURAL_LOGARITHM;
        case VSMathSymbolTypeLogarithm10:              return VS_M_SYMBOL_LOGARITHM_10;
        case VSMathSymbolTypeLogarithm2:               return VS_M_SYMBOL_LOGARITHM_2;
        case VSMathSymbolTypeAbsoluteValue:            return VS_M_SYMBOL_ABSOLUTE_VALUE;
        case VSMathSymbolTypeLeftParenthesis:          return VS_M_SYMBOL_LEFT_PARENTHESIS;
        case VSMathSymbolTypeRightParenthesis:         return VS_M_SYMBOL_RIGHT_PARENTHESIS;
        case VSMathSymbolTypePi:                       return VS_M_SYMBOL_PI;
        case VSMathSymbolTypeEuler:                    return VS_M_SYMBOL_EULER;
        case VSMathSymbolTypeRandomNumber:             return VS_M_SYMBOL_RANDOM_NUMBER;
        case VSMathSymbolTypeLeftShift:                return VS_M_SYMBOL_LEFT_SHIFT;
        case VSMathSymbolTypeLeftShiftBy:              return VS_M_SYMBOL_LEFT_SHIFT_BY;
        case VSMathSymbolTypeRightShift:               return VS_M_SYMBOL_RIGHT_SHIFT;
        case VSMathSymbolTypeRightShiftBy:             return VS_M_SYMBOL_RIGHT_SHIFT_BY;
        case VSMathSymbolTypeLeftRotate:               return VS_M_SYMBOL_LEFT_ROTATE;
        case VSMathSymbolTypeRightRotate:              return VS_M_SYMBOL_RIGHT_ROTATE;
        case VSMathSymbolTypeOnesComplement:           return VS_M_SYMBOL_ONES_COMPLEMENT;
        case VSMathSymbolTypeTwosComplement:           return VS_M_SYMBOL_TWOS_COMPLEMENT;
        case VSMathSymbolTypeFlipWord:                 return VS_M_SYMBOL_FLIP_WORD;
        case VSMathSymbolTypeFlipByte:                 return VS_M_SYMBOL_FLIP_BYTE;
        case VSMathSymbolTypeAnd:                      return VS_M_SYMBOL_AND;
        case VSMathSymbolTypeNand:                     return VS_M_SYMBOL_NAND;
        case VSMathSymbolTypeOr:                       return VS_M_SYMBOL_OR;
        case VSMathSymbolTypeNor:                      return VS_M_SYMBOL_NOR;
        case VSMathSymbolTypeXor:                      return VS_M_SYMBOL_XOR;
        case VSMathSymbolTypeXnor:                     return VS_M_SYMBOL_XNOR;
        case VSMathSymbolTypeXVariable:                return VS_M_SYMBOL_X_VARIABLE;
        case VSMathSymbolTypeYVariable:                return VS_M_SYMBOL_Y_VARIABLE;
        default:                                       return nil;
    }
}

/*
 *  @inheritdoc
 */
+ (VSMathSymbolType)typeOfSymbol:(NSString *)symbol
{
    if      (symbol == nil)                                                   return VSMathSymbolTypeUnknown;
    else if ([symbol isEqualToString:VS_M_SYMBOL_EQUAL])                      return VSMathSymbolTypeEqual;
    else if ([symbol isEqualToString:VS_M_SYMBOL_ADD])                        return VSMathSymbolTypeAdd;
    else if ([symbol isEqualToString:VS_M_SYMBOL_SUBTRACT])                   return VSMathSymbolTypeSubtract;
    else if ([symbol isEqualToString:VS_M_SYMBOL_MULTIPLY])                   return VSMathSymbolTypeMultiply;
    else if ([symbol isEqualToString:VS_M_SYMBOL_MULTIPLY_ALTERNATE])         return VSMathSymbolTypeMultiplyAlternate;
    else if ([symbol isEqualToString:VS_M_SYMBOL_DIVIDE])                     return VSMathSymbolTypeDivide;
    else if ([symbol isEqualToString:VS_M_SYMBOL_DIVIDE_ALTERNATE])           return VSMathSymbolTypeDivideAlternate;
    else if ([symbol isEqualToString:VS_M_SYMBOL_EXPONENT])                   return VSMathSymbolTypeExponent;
    else if ([symbol isEqualToString:VS_M_SYMBOL_ROOT])                       return VSMathSymbolTypeRoot;
    else if ([symbol isEqualToString:VS_M_SYMBOL_SCIENTIFIC_NOTATION])        return VSMathSymbolTypeScientificNotation;
    else if ([symbol isEqualToString:VS_M_SYMBOL_CHOOSE])                     return VSMathSymbolTypeChoose;
    else if ([symbol isEqualToString:VS_M_SYMBOL_PICK])                       return VSMathSymbolTypePick;
    else if ([symbol isEqualToString:VS_M_SYMBOL_NEGATIVE])                   return VSMathSymbolTypeNegative;
    else if ([symbol isEqualToString:VS_M_SYMBOL_SQUARE])                     return VSMathSymbolTypeSquare;
    else if ([symbol isEqualToString:VS_M_SYMBOL_SQUARE_ROOT])                return VSMathSymbolTypeSquareRoot;
    else if ([symbol isEqualToString:VS_M_SYMBOL_CUBE_ROOT])                  return VSMathSymbolTypeCubeRoot;
    else if ([symbol isEqualToString:VS_M_SYMBOL_CUBE])                       return VSMathSymbolTypeCube;
    else if ([symbol isEqualToString:VS_M_SYMBOL_PERCENT])                    return VSMathSymbolTypePercent;
    else if ([symbol isEqualToString:VS_M_SYMBOL_MODULO])                     return VSMathSymbolTypeModulo;
    else if ([symbol isEqualToString:VS_M_SYMBOL_FACTORIAL])                  return VSMathSymbolTypeFactorial;
    else if ([symbol isEqualToString:VS_M_SYMBOL_SINE])                       return VSMathSymbolTypeSine;
    else if ([symbol isEqualToString:VS_M_SYMBOL_COSINE])                     return VSMathSymbolTypeCosine;
    else if ([symbol isEqualToString:VS_M_SYMBOL_TANGENT])                    return VSMathSymbolTypeTangent;
    else if ([symbol isEqualToString:VS_M_SYMBOL_INVERSE_SINE])               return VSMathSymbolTypeInverseSine;
    else if ([symbol isEqualToString:VS_M_SYMBOL_INVERSE_COSINE])             return VSMathSymbolTypeInverseCosine;
    else if ([symbol isEqualToString:VS_M_SYMBOL_INVERSE_TANGENT])            return VSMathSymbolTypeInverseTangent;
    else if ([symbol isEqualToString:VS_M_SYMBOL_HYPERBOLIC_SINE])            return VSMathSymbolTypeHyperbolicSine;
    else if ([symbol isEqualToString:VS_M_SYMBOL_HYPERBOLIC_COSINE])          return VSMathSymbolTypeHyperbolicCosine;
    else if ([symbol isEqualToString:VS_M_SYMBOL_HYPERBOLIC_TANGENT])         return VSMathSymbolTypeHyperbolicTangent;
    else if ([symbol isEqualToString:VS_M_SYMBOL_INVERSE_HYPERBOLIC_SINE])    return VSMathSymbolTypeInverseHyperbolicSine;
    else if ([symbol isEqualToString:VS_M_SYMBOL_INVERSE_HYPERBOLIC_COSINE])  return VSMathSymbolTypeInverseHyperbolicCosine;
    else if ([symbol isEqualToString:VS_M_SYMBOL_INVERSE_HYPERBOLIC_TANGENT]) return VSMathSymbolTypeInverseHyperbolicTangent;
    else if ([symbol isEqualToString:VS_M_SYMBOL_NATURAL_LOGARITHM])          return VSMathSymbolTypeNaturalLogarithm;
    else if ([symbol isEqualToString:VS_M_SYMBOL_LOGARITHM_10])               return VSMathSymbolTypeLogarithm10;
    else if ([symbol isEqualToString:VS_M_SYMBOL_LOGARITHM_2])                return VSMathSymbolTypeLogarithm2;
    else if ([symbol isEqualToString:VS_M_SYMBOL_ABSOLUTE_VALUE])             return VSMathSymbolTypeAbsoluteValue;
    else if ([symbol isEqualToString:VS_M_SYMBOL_LEFT_PARENTHESIS])           return VSMathSymbolTypeLeftParenthesis;
    else if ([symbol isEqualToString:VS_M_SYMBOL_RIGHT_PARENTHESIS])          return VSMathSymbolTypeRightParenthesis;
    else if ([symbol isEqualToString:VS_M_SYMBOL_LEFT_SHIFT])                 return VSMathSymbolTypeLeftShift;
    else if ([symbol isEqualToString:VS_M_SYMBOL_LEFT_SHIFT_BY])              return VSMathSymbolTypeLeftShiftBy;
    else if ([symbol isEqualToString:VS_M_SYMBOL_RIGHT_SHIFT])                return VSMathSymbolTypeRightShift;
    else if ([symbol isEqualToString:VS_M_SYMBOL_RIGHT_SHIFT_BY])             return VSMathSymbolTypeRightShiftBy;
    else if ([symbol isEqualToString:VS_M_SYMBOL_LEFT_ROTATE])                return VSMathSymbolTypeLeftRotate;
    else if ([symbol isEqualToString:VS_M_SYMBOL_RIGHT_ROTATE])               return VSMathSymbolTypeRightRotate;
    else if ([symbol isEqualToString:VS_M_SYMBOL_ONES_COMPLEMENT])            return VSMathSymbolTypeOnesComplement;
    else if ([symbol isEqualToString:VS_M_SYMBOL_TWOS_COMPLEMENT])            return VSMathSymbolTypeTwosComplement;
    else if ([symbol isEqualToString:VS_M_SYMBOL_FLIP_WORD])                  return VSMathSymbolTypeFlipWord;
    else if ([symbol isEqualToString:VS_M_SYMBOL_FLIP_BYTE])                  return VSMathSymbolTypeFlipByte;
    else if ([symbol isEqualToString:VS_M_SYMBOL_AND])                        return VSMathSymbolTypeAnd;
    else if ([symbol isEqualToString:VS_M_SYMBOL_NAND])                       return VSMathSymbolTypeNand;
    else if ([symbol isEqualToString:VS_M_SYMBOL_OR])                         return VSMathSymbolTypeOr;
    else if ([symbol isEqualToString:VS_M_SYMBOL_NOR])                        return VSMathSymbolTypeNor;
    else if ([symbol isEqualToString:VS_M_SYMBOL_XOR])                        return VSMathSymbolTypeXor;
    else if ([symbol isEqualToString:VS_M_SYMBOL_XNOR])                       return VSMathSymbolTypeXnor;
    else if ([symbol isEqualToString:VS_M_SYMBOL_PI])                         return VSMathSymbolTypePi;
    else if ([symbol isEqualToString:VS_M_SYMBOL_EULER])                      return VSMathSymbolTypeEuler;
    else if ([symbol isEqualToString:VS_M_SYMBOL_RANDOM_NUMBER])              return VSMathSymbolTypeRandomNumber;
    else if ([symbol isEqualToString:VS_M_SYMBOL_X_VARIABLE])                 return VSMathSymbolTypeXVariable;
    else if ([symbol isEqualToString:VS_M_SYMBOL_Y_VARIABLE])                 return VSMathSymbolTypeYVariable;
    else                                                                      return VSMathSymbolTypeUnknown;
}

/*
 *  @inheritdoc
 */
+ (VSMathOperationType)operationTypeOfSymbol:(NSString *)symbol
{
    return [VSMathUtil operationTypeOfSymbolType:[VSMathUtil typeOfSymbol:symbol]];
}

/*
 *  @inheritdoc
 */
+ (VSMathOperationType)operationTypeOfSymbolType:(VSMathSymbolType)symbolType
{
    switch (symbolType)
    {
        case VSMathSymbolTypeEqual:                    return VSMathOperationTypeEqual;
        case VSMathSymbolTypeAdd:                      return VSMathOperationTypeAdd;
        case VSMathSymbolTypeSubtract:                 return VSMathOperationTypeSubtract;
        case VSMathSymbolTypeMultiply:                 return VSMathOperationTypeMultiply;
        case VSMathSymbolTypeMultiplyAlternate:        return VSMathOperationTypeMultiply;
        case VSMathSymbolTypeDivide:                   return VSMathOperationTypeDivide;
        case VSMathSymbolTypeDivideAlternate:          return VSMathOperationTypeDivide;
        case VSMathSymbolTypeModulo:                   return VSMathOperationTypeModulo;
        case VSMathSymbolTypeExponent:                 return VSMathOperationTypeExponent;
        case VSMathSymbolTypeRoot:                     return VSMathOperationTypeRoot;
        case VSMathSymbolTypeScientificNotation:       return VSMathOperationTypeScientificNotation;
        case VSMathSymbolTypeChoose:                   return VSMathOperationTypeChoose;
        case VSMathSymbolTypePick:                     return VSMathOperationTypePick;
        case VSMathSymbolTypeNegative:                 return VSMathOperationTypeNegative;
        case VSMathSymbolTypeSquare:                   return VSMathOperationTypeSquare;
        case VSMathSymbolTypeSquareRoot:               return VSMathOperationTypeSquareRoot;
        case VSMathSymbolTypeCube:                     return VSMathOperationTypeCube;
        case VSMathSymbolTypeCubeRoot:                 return VSMathOperationTypeCubeRoot;
        case VSMathSymbolTypePercent:                  return VSMathOperationTypePercent;
        case VSMathSymbolTypeFactorial:                return VSMathOperationTypeFactorial;
        case VSMathSymbolTypeSine:                     return VSMathOperationTypeSine;
        case VSMathSymbolTypeCosine:                   return VSMathOperationTypeCosine;
        case VSMathSymbolTypeTangent:                  return VSMathOperationTypeTangent;
        case VSMathSymbolTypeInverseSine:              return VSMathOperationTypeInverseSine;
        case VSMathSymbolTypeInverseCosine:            return VSMathOperationTypeInverseCosine;
        case VSMathSymbolTypeInverseTangent:           return VSMathOperationTypeInverseTangent;
        case VSMathSymbolTypeHyperbolicSine:           return VSMathOperationTypeHyperbolicSine;
        case VSMathSymbolTypeHyperbolicCosine:         return VSMathOperationTypeHyperbolicCosine;
        case VSMathSymbolTypeHyperbolicTangent:        return VSMathOperationTypeHyperbolicTangent;
        case VSMathSymbolTypeInverseHyperbolicSine:    return VSMathOperationTypeInverseHyperbolicSine;
        case VSMathSymbolTypeInverseHyperbolicCosine:  return VSMathOperationTypeInverseHyperbolicCosine;
        case VSMathSymbolTypeInverseHyperbolicTangent: return VSMathOperationTypeInverseHyperbolicTangent;
        case VSMathSymbolTypeNaturalLogarithm:         return VSMathOperationTypeNaturalLogarithm;
        case VSMathSymbolTypeLogarithm10:              return VSMathOperationTypeLogarithm10;
        case VSMathSymbolTypeLogarithm2:               return VSMathOperationTypeLogarithm2;
        case VSMathSymbolTypeAbsoluteValue:            return VSMathOperationTypeAbsoluteValue;
        case VSMathSymbolTypeLeftParenthesis:          return VSMathOperationTypeLeftParenthesis;
        case VSMathSymbolTypeRightParenthesis:         return VSMathOperationTypeRightParenthesis;
        case VSMathSymbolTypePi:                       return VSMathOperationTypePi;
        case VSMathSymbolTypeEuler:                    return VSMathOperationTypeEuler;
        case VSMathSymbolTypeRandomNumber:             return VSMathOperationTypeRandomNumber;
        case VSMathSymbolTypeLeftShift:                return VSMathOperationTypeLeftShift;
        case VSMathSymbolTypeLeftShiftBy:              return VSMathOperationTypeLeftShiftBy;
        case VSMathSymbolTypeRightShift:               return VSMathOperationTypeRightShift;
        case VSMathSymbolTypeRightShiftBy:             return VSMathOperationTypeRightShiftBy;
        case VSMathSymbolTypeLeftRotate:               return VSMathOperationTypeRoL;
        case VSMathSymbolTypeRightRotate:              return VSMathOperationTypeRoR;
        case VSMathSymbolTypeOnesComplement:           return VSMathOperationTypeOnesComplement;
        case VSMathSymbolTypeTwosComplement:           return VSMathOperationTypeTwosComplement;
        case VSMathSymbolTypeFlipByte:                 return VSMathOperationTypeFlipByte;
        case VSMathSymbolTypeFlipWord:                 return VSMathOperationTypeFlipWord;
        case VSMathSymbolTypeAnd:                      return VSMathOperationTypeAnd;
        case VSMathSymbolTypeNand:                     return VSMathOperationTypeNand;
        case VSMathSymbolTypeOr:                       return VSMathOperationTypeOr;
        case VSMathSymbolTypeNor:                      return VSMathOperationTypeNor;
        case VSMathSymbolTypeXor:                      return VSMathOperationTypeXor;
        case VSMathSymbolTypeXnor:                     return VSMathOperationTypeXnor;
        default:                                       return VSMathOperationTypeUnknown;
    }
}

/*
 *  @inheritdoc
 */
+ (VSMathSymbolType)symbolTypeOfOperationType:(VSMathOperationType)operationType
{
    switch (operationType)
    {
        case VSMathOperationTypeEqual:                    return VSMathSymbolTypeEqual;
        case VSMathOperationTypeAdd:                      return VSMathSymbolTypeAdd;
        case VSMathOperationTypeSubtract:                 return VSMathSymbolTypeSubtract;
        case VSMathOperationTypeMultiply:                 return VSMathSymbolTypeMultiply;
        case VSMathOperationTypeDivide:                   return VSMathSymbolTypeDivide;
        case VSMathOperationTypeModulo:                   return VSMathSymbolTypeModulo;
        case VSMathOperationTypeExponent:                 return VSMathSymbolTypeExponent;
        case VSMathOperationTypeRoot:                     return VSMathSymbolTypeRoot;
        case VSMathOperationTypeScientificNotation:       return VSMathSymbolTypeScientificNotation;
        case VSMathOperationTypeChoose:                   return VSMathSymbolTypeChoose;
        case VSMathOperationTypePick:                     return VSMathSymbolTypePick;
        case VSMathOperationTypeNegative:                 return VSMathSymbolTypeNegative;
        case VSMathOperationTypeSquare:                   return VSMathSymbolTypeSquare;
        case VSMathOperationTypeSquareRoot:               return VSMathSymbolTypeSquareRoot;
        case VSMathOperationTypeCube:                     return VSMathSymbolTypeCube;
        case VSMathOperationTypeCubeRoot:                 return VSMathSymbolTypeCubeRoot;
        case VSMathOperationTypePercent:                  return VSMathSymbolTypePercent;
        case VSMathOperationTypeFactorial:                return VSMathSymbolTypeFactorial;
        case VSMathOperationTypeSine:                     return VSMathSymbolTypeSine;
        case VSMathOperationTypeCosine:                   return VSMathSymbolTypeCosine;
        case VSMathOperationTypeTangent:                  return VSMathSymbolTypeTangent;
        case VSMathOperationTypeInverseSine:              return VSMathSymbolTypeInverseSine;
        case VSMathOperationTypeInverseCosine:            return VSMathSymbolTypeInverseCosine;
        case VSMathOperationTypeInverseTangent:           return VSMathSymbolTypeInverseTangent;
        case VSMathOperationTypeHyperbolicSine:           return VSMathSymbolTypeHyperbolicSine;
        case VSMathOperationTypeHyperbolicCosine:         return VSMathSymbolTypeHyperbolicCosine;
        case VSMathOperationTypeHyperbolicTangent:        return VSMathSymbolTypeHyperbolicTangent;
        case VSMathOperationTypeInverseHyperbolicSine:    return VSMathSymbolTypeInverseHyperbolicSine;
        case VSMathOperationTypeInverseHyperbolicCosine:  return VSMathSymbolTypeInverseHyperbolicCosine;
        case VSMathOperationTypeInverseHyperbolicTangent: return VSMathSymbolTypeInverseHyperbolicTangent;
        case VSMathOperationTypeNaturalLogarithm:         return VSMathSymbolTypeNaturalLogarithm;
        case VSMathOperationTypeLogarithm10:              return VSMathSymbolTypeLogarithm10;
        case VSMathOperationTypeLogarithm2:               return VSMathSymbolTypeLogarithm2;
        case VSMathOperationTypeAbsoluteValue:            return VSMathSymbolTypeAbsoluteValue;
        case VSMathOperationTypeLeftParenthesis:          return VSMathSymbolTypeLeftParenthesis;
        case VSMathOperationTypeRightParenthesis:         return VSMathSymbolTypeRightParenthesis;
        case VSMathOperationTypePi:                       return VSMathSymbolTypePi;
        case VSMathOperationTypeEuler:                    return VSMathSymbolTypeEuler;
        case VSMathOperationTypeRandomNumber:             return VSMathSymbolTypeRandomNumber;
        case VSMathOperationTypeLeftShift:                return VSMathSymbolTypeLeftShift;
        case VSMathOperationTypeLeftShiftBy:              return VSMathSymbolTypeLeftShiftBy;
        case VSMathOperationTypeRightShift:               return VSMathSymbolTypeRightShift;
        case VSMathOperationTypeRightShiftBy:             return VSMathSymbolTypeRightShiftBy;
        case VSMathOperationTypeRoL:                      return VSMathSymbolTypeLeftRotate;
        case VSMathOperationTypeRoR:                      return VSMathSymbolTypeRightRotate;
        case VSMathOperationTypeOnesComplement:           return VSMathSymbolTypeOnesComplement;
        case VSMathOperationTypeTwosComplement:           return VSMathSymbolTypeTwosComplement;
        case VSMathOperationTypeFlipByte:                 return VSMathSymbolTypeFlipByte;
        case VSMathOperationTypeFlipWord:                 return VSMathSymbolTypeFlipWord;
        case VSMathOperationTypeAnd:                      return VSMathSymbolTypeAnd;
        case VSMathOperationTypeNand:                     return VSMathSymbolTypeNand;
        case VSMathOperationTypeOr:                       return VSMathSymbolTypeOr;
        case VSMathOperationTypeNor:                      return VSMathSymbolTypeNor;
        case VSMathOperationTypeXor:                      return VSMathSymbolTypeXor;
        case VSMathOperationTypeXnor:                     return VSMathSymbolTypeXnor;
        default:                                          return VSMathSymbolTypeUnknown;
    }
}

/*
 *  @inheritdoc
 */
+ (NSString *)symbolWithOperationType:(VSMathOperationType)operationType
{
    return [VSMathUtil symbolWithType:[VSMathUtil symbolTypeOfOperationType:operationType]];
}

@end
