/**
 *  VARSobjc
 *  (c) VARIANTE <http://variante.io>
 *
 *  VARS math tools.
 *
 *  This software is released under the MIT License:
 *  http://www.opensource.org/licenses/mit-license.php
 */

#ifndef vsmath_h
#define vsmath_h

#define VS_M_ARC4RANDOM_MAX 0x100000000

#define VS_M_BITS_PER_UNSIGNED_CHAR      (sizeof(unsigned char)*8)
#define VS_M_BITS_PER_UNSIGNED_SHORT     (sizeof(unsigned short)*8)
#define VS_M_BITS_PER_UNSIGNED_INT       (sizeof(unsigned int)*8)
#define VS_M_BITS_PER_UNSIGNED_LONG      (sizeof(unsigned long)*8)
#define VS_M_BITS_PER_UNSIGNED_LONG_LONG (sizeof(unsigned long long)*8)

#define VS_M_BITS_PER_BYTE  8
#define VS_M_BITS_PER_QWORD 64
#define VS_M_BITS_PER_DWORD 32
#define VS_M_BITS_PER_WORD  16

#define VS_M_BYTES_PER_WORD  2
#define VS_M_BYTES_PER_DWORD 4
#define VS_M_BYTES_PER_QWORD 8

#ifdef __OBJC__
#define VS_M_SYMBOL_EQUAL                      @"="
#define VS_M_SYMBOL_ADD                        @"+"
#define VS_M_SYMBOL_SUBTRACT                   @"−" // 0x2212
#define VS_M_SYMBOL_MULTIPLY                   @"*"
#define VS_M_SYMBOL_MULTIPLY_ALTERNATE         @"×" // 0x00D7
#define VS_M_SYMBOL_DIVIDE                     @"/"
#define VS_M_SYMBOL_DIVIDE_ALTERNATE           @"÷" // 0x00F7
#define VS_M_SYMBOL_MODULO                     @"%"
#define VS_M_SYMBOL_EXPONENT                   @"^"
#define VS_M_SYMBOL_ROOT                       @"~"
#define VS_M_SYMBOL_SCIENTIFIC_NOTATION        @"E"
#define VS_M_SYMBOL_CHOOSE                     @"C"
#define VS_M_SYMBOL_PICK                       @"P"
#define VS_M_SYMBOL_NEGATIVE                   @"-"
#define VS_M_SYMBOL_SQUARE                     @"²" // 0x00B2
#define VS_M_SYMBOL_SQUARE_ROOT                @"√" // 0x221A
#define VS_M_SYMBOL_CUBE                       @"³" // 0x00B3
#define VS_M_SYMBOL_CUBE_ROOT                  @"∛" // 0x221B
#define VS_M_SYMBOL_PERCENT                    @"pct"
#define VS_M_SYMBOL_FACTORIAL                  @"!"
#define VS_M_SYMBOL_SINE                       @"sin"
#define VS_M_SYMBOL_COSINE                     @"cos"
#define VS_M_SYMBOL_TANGENT                    @"tan"
#define VS_M_SYMBOL_INVERSE_SINE               @"asin"
#define VS_M_SYMBOL_INVERSE_COSINE             @"acos"
#define VS_M_SYMBOL_INVERSE_TANGENT            @"atan"
#define VS_M_SYMBOL_HYPERBOLIC_SINE            @"sinh"
#define VS_M_SYMBOL_HYPERBOLIC_COSINE          @"cosh"
#define VS_M_SYMBOL_HYPERBOLIC_TANGENT         @"tanh"
#define VS_M_SYMBOL_INVERSE_HYPERBOLIC_SINE    @"asinh"
#define VS_M_SYMBOL_INVERSE_HYPERBOLIC_COSINE  @"acosh"
#define VS_M_SYMBOL_INVERSE_HYPERBOLIC_TANGENT @"atanh"
#define VS_M_SYMBOL_NATURAL_LOGARITHM          @"ln"
#define VS_M_SYMBOL_LOGARITHM_10               @"log"
#define VS_M_SYMBOL_LOGARITHM_2                @"log₂"
#define VS_M_SYMBOL_ABSOLUTE_VALUE             @"abs"
#define VS_M_SYMBOL_LEFT_PARENTHESIS           @"("
#define VS_M_SYMBOL_RIGHT_PARENTHESIS          @")"
#define VS_M_SYMBOL_PI                         @"π" // 0x03C0
#define VS_M_SYMBOL_EULER                      @"e"
#define VS_M_SYMBOL_RANDOM_NUMBER              @"?"
#define VS_M_SYMBOL_LEFT_SHIFT                 @"lshft"
#define VS_M_SYMBOL_LEFT_SHIFT_BY              @"≪" // 0x226A
#define VS_M_SYMBOL_RIGHT_SHIFT                @"rshft"
#define VS_M_SYMBOL_RIGHT_SHIFT_BY             @"≫" // 0x226B
#define VS_M_SYMBOL_LEFT_ROTATE                @"lrot"
#define VS_M_SYMBOL_RIGHT_ROTATE               @"rrot"
#define VS_M_SYMBOL_ONES_COMPLEMENT            @"comp₁"
#define VS_M_SYMBOL_TWOS_COMPLEMENT            @"comp₂"
#define VS_M_SYMBOL_FLIP_WORD                  @"flipw"
#define VS_M_SYMBOL_FLIP_BYTE                  @"flipb"
#define VS_M_SYMBOL_AND                        @"∧" // 0x2227
#define VS_M_SYMBOL_NAND                       @"⊼" // 0x22BC
#define VS_M_SYMBOL_OR                         @"∨" // 0x2228
#define VS_M_SYMBOL_NOR                        @"⊽" // 0x22BD
#define VS_M_SYMBOL_XOR                        @"⊻" // 0x22BB
#define VS_M_SYMBOL_XNOR                       @"⋊" // 0x22CA
#define VS_M_SYMBOL_X_VARIABLE                 @"x"
#define VS_M_SYMBOL_Y_VARIABLE                 @"y"
#define VS_M_SYMBOL_NAN                        @"nan"
#define VS_M_REGEX_NUMERIC_SET 				   @"([0-9]|\\.|\\,)+"
#define VS_M_REGEX_FUNCTION_SET 			   @"([a-d]|[f-w]|z|_|₂)+"
#define VS_M_REGEX_OPERATOR_SET 			   @"(\\+|−|\\*|×|/|÷|\\^|E|~|C|P|≪|≫|∧|⊼|∨|⊻|⊽|⋊|=|%)"
#define VS_M_REGEX_UNARY_PREFIX_OPERATOR_SET   @"(-|√|∛)"
#define VS_M_REGEX_UNARY_POSTFIX_OPERATOR_SET  @"(!|²|³)"
#define VS_M_REGEX_CONSTANT_SET				   @"(π|e|\\?)"
#define VS_M_REGEX_VARIABLE_SET 			   @"(x|y)"
#define VS_M_REGEX_PARENTHESIS_SET			   @"(\\(|\\))"
#else
#define VS_M_SYMBOL_EQUAL                      "="
#define VS_M_SYMBOL_ADD                        "+"
#define VS_M_SYMBOL_SUBTRACT                   "−" // 0x2212
#define VS_M_SYMBOL_MULTIPLY                   "*"
#define VS_M_SYMBOL_MULTIPLY_ALTERNATE         "×" // 0x00D7
#define VS_M_SYMBOL_DIVIDE                     "/"
#define VS_M_SYMBOL_DIVIDE_ALTERNATE           "÷" // 0x00F7
#define VS_M_SYMBOL_MODULO                     "%"
#define VS_M_SYMBOL_EXPONENT                   "^"
#define VS_M_SYMBOL_ROOT                       "~"
#define VS_M_SYMBOL_SCIENTIFIC_NOTATION        "E"
#define VS_M_SYMBOL_CHOOSE                     "C"
#define VS_M_SYMBOL_PICK                       "P"
#define VS_M_SYMBOL_NEGATIVE                   "-"
#define VS_M_SYMBOL_SQUARE                     "²" // 0x00B2
#define VS_M_SYMBOL_SQUARE_ROOT                "√" // 0x221A
#define VS_M_SYMBOL_CUBE                       "³" // 0x00B3
#define VS_M_SYMBOL_CUBE_ROOT                  "∛" // 0x221B
#define VS_M_SYMBOL_PERCENT                    "pct"
#define VS_M_SYMBOL_FACTORIAL                  "!"
#define VS_M_SYMBOL_SINE                       "sin"
#define VS_M_SYMBOL_COSINE                     "cos"
#define VS_M_SYMBOL_TANGENT                    "tan"
#define VS_M_SYMBOL_INVERSE_SINE               "asin"
#define VS_M_SYMBOL_INVERSE_COSINE             "acos"
#define VS_M_SYMBOL_INVERSE_TANGENT            "atan"
#define VS_M_SYMBOL_HYPERBOLIC_SINE            "sinh"
#define VS_M_SYMBOL_HYPERBOLIC_COSINE          "cosh"
#define VS_M_SYMBOL_HYPERBOLIC_TANGENT         "tanh"
#define VS_M_SYMBOL_INVERSE_HYPERBOLIC_SINE    "asinh"
#define VS_M_SYMBOL_INVERSE_HYPERBOLIC_COSINE  "acosh"
#define VS_M_SYMBOL_INVERSE_HYPERBOLIC_TANGENT "atanh"
#define VS_M_SYMBOL_NATURAL_LOGARITHM          "ln"
#define VS_M_SYMBOL_LOGARITHM_10               "log"
#define VS_M_SYMBOL_LOGARITHM_2                "log₂"
#define VS_M_SYMBOL_ABSOLUTE_VALUE             "abs"
#define VS_M_SYMBOL_LEFT_PARENTHESIS           "("
#define VS_M_SYMBOL_RIGHT_PARENTHESIS          ")"
#define VS_M_SYMBOL_PI                         "π" // 0x03C0
#define VS_M_SYMBOL_EULER                      "e"
#define VS_M_SYMBOL_RANDOM_NUMBER              "?"
#define VS_M_SYMBOL_LEFT_SHIFT                 "lshft"
#define VS_M_SYMBOL_LEFT_SHIFT_BY              "≪" // 0x226A
#define VS_M_SYMBOL_RIGHT_SHIFT                "rshft"
#define VS_M_SYMBOL_RIGHT_SHIFT_BY             "≫" // 0x226B
#define VS_M_SYMBOL_LEFT_ROTATE                "lrot"
#define VS_M_SYMBOL_RIGHT_ROTATE               "rrot"
#define VS_M_SYMBOL_ONES_COMPLEMENT            "comp₁"
#define VS_M_SYMBOL_TWOS_COMPLEMENT            "comp₂"
#define VS_M_SYMBOL_FLIP_WORD                  "flipw"
#define VS_M_SYMBOL_FLIP_BYTE                  "flipb"
#define VS_M_SYMBOL_AND                        "∧" // 0x2227
#define VS_M_SYMBOL_NAND                       "⊼" // 0x22BC
#define VS_M_SYMBOL_OR                         "∨" // 0x2228
#define VS_M_SYMBOL_NOR                        "⊽" // 0x22BD
#define VS_M_SYMBOL_XOR                        "⊻" // 0x22BB
#define VS_M_SYMBOL_XNOR                       "⋊" // 0x22CA
#define VS_M_SYMBOL_X_VARIABLE                 "x"
#define VS_M_SYMBOL_Y_VARIABLE                 "y"
#define VS_M_SYMBOL_NAN                        "nan"
#define VS_M_REGEX_NUMERIC_SET 				   "([0-9]|\\.|\\,)+"
#define VS_M_REGEX_FUNCTION_SET 			   "([a-d]|[f-w]|z|_|₂)+"
#define VS_M_REGEX_OPERATOR_SET 			   "(\\+|−|\\*|×|/|÷|\\^|E|~|C|P|≪|≫|∧|⊼|∨|⊻|⊽|⋊|=|%)"
#define VS_M_REGEX_UNARY_PREFIX_OPERATOR_SET   "(-|√|∛)"
#define VS_M_REGEX_UNARY_POSTFIX_OPERATOR_SET  "(!|²|³)"
#define VS_M_REGEX_CONSTANT_SET				   "(π|e|\\?)"
#define VS_M_REGEX_VARIABLE_SET 			   "(x|y)"
#define VS_M_REGEX_PARENTHESIS_SET			   "(\\(|\\))"
#endif // __OBJC__

#pragma mark - Trigonometry
#pragma mark Angle Conversions

/**
 *  Converts a float value in degrees to a float value in radians.
 *
 *  @param __n
 *
 *  @return The converted float value in radians.
 */
float fdtorf(float __n);

/**
 *  Converts a double value in degrees to a double value in radians.
 *
 *  @param __n
 *
 *  @return The converted double value in radians.
 */
double fdtor(double __n);

/**
 *  Converts a float value in degrees to a float value in gradians.
 *
 *  @param __n
 *
 *  @return The converted float value in gradians.
 */
float fdtogf(float __n);

/**
 *  Converts a double value in degrees to a double value in gradians.
 *
 *  @param __n
 *
 *  @return The converted double value in gradians.
 */
double fdtog(double __n);

/**
 *  Converts a float value in radians to a float value in degrees.
 *
 *  @param __n
 *
 *  @return The converted float value in degrees.
 */
float frtodf(float __n);

/**
 *  Converts a double value in radians to a double value in degrees.
 *
 *  @param __n
 *
 *  @return The converted double value in degrees.
 */
double frtod(double __n);

/**
 *  Converts a float value in radians to a float value in gradians.
 *
 *  @param __n
 *
 *  @return The converted float value in gradians.
 */
float frtogf(float __n);

/**
 *  Converts a double value in radians to a double value in gradians.
 *
 *  @param __n
 *
 *  @return The converted double value in gradians.
 */
double frtog(double __n);

/**
 *  Converts a float value in gradians to a float value in degrees.
 *
 *  @param __n
 *
 *  @return The converted float value in degrees.
 */
float fgtodf(float __n);

/**
 *  Converts a double value in gradians to a double value in degrees.
 *
 *  @param __n
 *
 *  @return The converted double value in degrees.
 */
double fgtod(double __n);

/**
 *  Converts a float value in gradians to a float value in radians.
 *
 *  @param __n
 *
 *  @return The converted float value in radians.
 */
float fgtorf(float __n);

/**
 *  Converts a double value in gradians to a double value in radians.
 *
 *  @param __n
 *
 *  @return The converted double value in radians.
 */
double fgtor(double __n);

#pragma mark Trigonometric Functions

/**
 *  Computes the sine of a float value in degrees.
 *
 *  @param __n
 *
 *  @return The computed float value.
 */
float fsindf(float __n);

/**
 *  Computes the sine of a double value in degrees.
 *
 *  @param __n
 *
 *  @return The computed double value.
 */
double fsind(double __n);

/**
 *  Computes the cosine of a float value in degrees.
 *
 *  @param __n
 *
 *  @return The computed float value.
 */
float fcosdf(float __n);

/**
 *  Computes the cosine of a double value in degrees.
 *
 *  @param __n
 *
 *  @return The computed double value.
 */
double fcosd(double __n);

/**
 *  Computes the tangent of a float value in degrees.
 *
 *  @param __n
 *
 *  @return The computed float value.
 */
float ftandf(float __n);

/**
 *  Computes the tangent of a double value in degrees.
 *
 *  @param __n
 *
 *  @return The computed double value.
 */
double ftand(double __n);

/**
 *  Computes the sine of a float value in radians.
 *
 *  @param __n
 *
 *  @return The computed float value.
 */
float fsinrf(float __n);

/**
 *  Computes the sine of a double value in radians.
 *
 *  @param __n
 *
 *  @return The computed double value.
 */
double fsinr(double __n);

/**
 *  Computes the cosine of a float value in radians.
 *
 *  @param __n
 *
 *  @return The computed float value.
 */
float fcosrf(float __n);

/**
 *  Computes the cosine of a double value in radians.
 *
 *  @param __n
 *
 *  @return The computed double value.
 */
double fcosr(double __n);

/**
 *  Computes the tangent of a float value in radians.
 *
 *  @param __n
 *
 *  @return The computed float value.
 */
float ftanrf(float __n);

/**
 *  Computes the tangent of a double value in radians.
 *
 *  @param __n
 *
 *  @return The computed double value.
 */
double ftanr(double __n);

/**
 *  Computes the sine of a float value in gradians.
 *
 *  @param __n
 *
 *  @return The computed float value.
 */
float fsingf(float __n);

/**
 *  Computes the sine of a double value in gradians.
 *
 *  @param __n
 *
 *  @return The computed double value.
 */
double fsing(double __n);

/**
 *  Computes the cosine of a float value in gradians.
 *
 *  @param __n
 *
 *  @return The computed float value.
 */
float fcosgf(float __n);

/**
 *  Computes the cosine of a double value in gradians.
 *
 *  @param __n
 *
 *  @return The computed double value.
 */
double fcosg(double __n);

/**
 *  Computes the tangent of a float value in gradians.
 *
 *  @param __n
 *
 *  @return The computed float value.
 */
float ftangf(float __n);

/**
 *  Computes the tangent of a double value in gradians.
 *
 *  @param __n
 *
 *  @return The computed double value.
 */
double ftang(double __n);

#pragma mark - Differential Calculus

/**
 *  Evaluates the slope between two points.
 *
 *  @param __x1
 *  @param __x2
 *  @param __y1
 *  @param __y2
 *
 *  @return The float value of the slope.
 */
float fslopef(float __x1, float __x2, float __y1, float __y2);

/**
 *  Evaluates the slope between two points.
 *
 *  @param __x1
 *  @param __x2
 *  @param __y1
 *  @param __y2
 *
 *  @return The double value of the slope.
 */
double fslope(double __x1, double __x2, double __y1, double __y2);

#pragma mark - Logarithms

/**
 *  Computes the natural logarithm of a float value.
 *
 *  @param __n
 *
 *  @return The computed float value.
 */
float flnf(float __n);

/**
 *  Computes the natural logarithm of a double value.
 *
 *  @param __n
 *
 *  @return The computed double value.
 */
double fln(double __n);

#pragma mark - Probability

/**
 *  Computes the factorial of a float value. Supports the factorial computation
 *  of positive/negative non-integers.
 *
 *  @param __n
 *
 *  @return The computed float value if applicable, otherwise (i.e. computing the factorial of
 *          a negative integer).
 */
float ffactf(float __n);

/**
 *  Computes the factorial of a double value. Supports the factorial computation
 *  of positive/negative non-integers.
 *
 *  @param __n
 *
 *  @return The computed double value if applicable, NAN otherwise (i.e. computing the factorial of
 *          a negative integer).
 */
double ffact(double __n);

/**
 *  Computes n choose r. If both n and r are positive integers, the output
 *  would be the binomial coefficient, involving Stirling's approximation for
 *  larger values of r. If either is a complex/negative number, the gamma function Γ would
 *  be used.
 *
 *  @param __n
 *  @param __r
 *
 *  @return The computed float value.
 */
float fncrf(float __n, float __r);

/**
 *  Computes n choose r. If both n and r are positive integers, the output
 *  would be the binomial coefficient, involving Stirling's approximation for
 *  larger values of r. If either is a complex/negative number, the gamma function Γ would
 *  be used.
 *
 *  @param __n
 *  @param __r
 *
 *  @return The computed double value.
 */
double fncr(double __n, double __r);

/**
 *  Computes n pick r. If both n and r are positive integers, the output
 *  would be the standard r-permutations of n involving Stirling's approximation for
 *  larger values of r. If either is a complex/negative number, the gamma function Γ would
 *  be used.
 *
 *  @param __n
 *  @param __r
 *
 *  @return The computed float value.
 */
float fnprf(float __n, float __r);

/**
 *  Computes n pick r. If both n and r are positive integers, the output
 *  would be the standard r-permutations of n involving Stirling's approximation for
 *  larger values of r. If either is a complex/negative number, the gamma function Γ would
 *  be used.
 *
 *  @param __n
 *  @param __r
 *
 *  @return The computed double value.
 */
double fnpr(double __n, double __r);

#pragma mark - Bitwise Operations
#pragma mark Bit Shifting

/**
 *  Left shifts an unsigned char value.
 *
 *  @param __n
 *
 *  @return The computed unsigned char value.
 */
unsigned char clshift(unsigned char __n);

/**
 *  Left shifts an unsigned short value.
 *
 *  @param __n
 *
 *  @return The computed short value.
 */
unsigned short hulshift(unsigned short __n);

/**
 *  Left shifts an unsigned int value.
 *
 *  @param __n
 *
 *  @return The computed unsigned int value.
 */
unsigned int ulshift(unsigned int __n);

/**
 *  Left shifts an unsigned long value.
 *
 *  @param __n
 *
 *  @return The computed unsigned long value.
 */
unsigned long lulshift(unsigned long __n);

/**
 *  Left shifts an unsigned long long value.
 *
 *  @param __n
 *
 *  @return The computed unsigned long long value.
 */
unsigned long long llulshift(unsigned long long __n);

/**
 *  Right shifts an unsigned char value.
 *
 *  @param __n
 *
 *  @return The computed unsigned char value.
 */
unsigned char crshift(unsigned char __n);

/**
 *  Right shifts an unsigned short value.
 *
 *  @param __n
 *
 *  @return The computed short value.
 */
unsigned short hurshift(unsigned short __n);

/**
 *  Right shifts an unsigned int value.
 *
 *  @param __n
 *
 *  @return The computed unsigned int value.
 */
unsigned int urshift(unsigned int __n);

/**
 *  Right shifts an unsigned long value.
 *
 *  @param __n
 *
 *  @return The computed unsigned long value.
 */
unsigned long lurshift(unsigned long __n);

/**
 *  Right shifts an unsigned long long value.
 *
 *  @param __n
 *
 *  @return The computed unsigned long long value.
 */
unsigned long long llurshift(unsigned long long __n);

/**
 *  Left rotates an unsigned char value.
 *
 *  @param __n
 *
 *  @return The computed unsigned char value.
 */
unsigned char clrotate(unsigned char __n);

/**
 *  Left rotates an unsigned short value.
 *
 *  @param __n
 *
 *  @return The computed unsigned short value.
 */
unsigned short hulrotate(unsigned short __n);

/**
 *  Left rotates an unsigned int value.
 *
 *  @param __n
 *
 *  @return The computed unsigned int value.
 */
unsigned int ulrotate(unsigned int __n);

/**
 *  Left rotates an unsigned long value.
 *
 *  @param __n
 *
 *  @return The computed unsigned long value.
 */
unsigned long lulrotate(unsigned long __n);

/**
 *  Left rotates an unsigned long long value.
 *
 *  @param __n
 *
 *  @return The computed unsigned long long value.
 */
unsigned long long llulrotate(unsigned long long __n);

/**
 *  Right rotates an unsigned char value.
 *
 *  @param __n
 *
 *  @return The computed unsigned char value.
 */
unsigned char crrotate(unsigned char __n);

/**
 *  Right rotates an unsigned short value.
 *
 *  @param __n
 *
 *  @return The computed unsigned short value.
 */
unsigned short hurrotate(unsigned short __n);

/**
 *  Right rotates an unsigned int value.
 *
 *  @param __n
 *
 *  @return The computed unsigned int value.
 */
unsigned int urrotate(unsigned int __n);

/**
 *  Right rotates an unsigned long value.
 *
 *  @param __n
 *
 *  @return The computed unsigned long value.
 */
unsigned long lurrotate(unsigned long __n);

/**
 *  Right rotates an unsigned long long value.
 *
 *  @param __n
 *
 *  @return The computed unsigned long long value.
 */
unsigned long long llurrotate(unsigned long long __n);

#pragma mark Inverse

/**
 *  Computes the 1's complement of an unsigned char value.
 *
 *  @param __n
 *
 *  @return The computed unsigned char value.
 */
unsigned char ccomp1(unsigned char __n);

/**
 *  Computes the 1's complement of an unsigned short value.
 *
 *  @param __n
 *
 *  @return The computed unsigned short value.
 */
unsigned short hucomp1(unsigned short __n);

/**
 *  Computes the 1's complement of an unsigned int value.
 *
 *  @param __n
 *
 *  @return The computed unsigned int value.
 */
unsigned int ucomp1(unsigned int __n);

/**
 *  Computes the 1's complement of an unsigned long value.
 *
 *  @param __n
 *
 *  @return The computed unsigned long value.
 */
unsigned long lucomp1(unsigned long __n);

/**
 *  Computes the 1's complement of an unsigned long long value.
 *
 *  @param __n
 *
 *  @return The computed unsigned long long value.
 */
unsigned long long llucomp1(unsigned long long __n);

/**
 *  Computes the 2's complement of an unsigned char value.
 *
 *  @param __n
 *
 *  @return The computed unsigned char value.
 */
unsigned char ccomp2(unsigned char __n);

/**
 *  Computes the 2's complement of an unsigned short value.
 *
 *  @param __n
 *
 *  @return The computed unsigned short value.
 */
unsigned short hucomp2(unsigned short __n);

/**
 *  Computes the 2's complement of an unsigned int value.
 *
 *  @param __n
 *
 *  @return The computed unsigned int value.
 */
unsigned int ucomp2(unsigned int __n);

/**
 *  Computes the 2's complement of an unsigned long value.
 *
 *  @param __n
 *
 *  @return The computed unsigned long value.
 */
unsigned long lucomp2(unsigned long __n);

/**
 *  Computes the 2's complement of an unsigned long long value.
 *
 *  @param __n
 *
 *  @return The computed unsigned long long value.
 */
unsigned long long llucomp2(unsigned long long __n);

/**
 *  Flips the bytes of an unsigned char value.
 *
 *  @param __n
 *
 *  @return The computed unsigned char value.
 */
unsigned char cflipb(unsigned char __n);

/**
 *  Flips the bytes of an unsigned short value.
 *
 *  @param __n
 *
 *  @return The computed unsigned short value.
 */
unsigned short huflipb(unsigned short __n);

/**
 *  Flips the bytes of an unsigned int value.
 *
 *  @param __n
 *
 *  @return The computed unsigned int value.
 */
unsigned int uflipb(unsigned int __n);

/**
 *  Flips the bytes of an unsigned long value.
 *
 *  @param __n
 *
 *  @return The computed unsigned long value.
 */
unsigned long luflipb(unsigned long __n);

/**
 *  Flips the bytes of an unsigned long long value.
 *
 *  @param __n
 *
 *  @return The computed unsigned long long value.
 */
unsigned long long lluflipb(unsigned long long __n);

/**
 *  Flips the words of an unsigned char value.
 *
 *  @param __n
 *
 *  @return The computed unsigned char value.
 */
unsigned char cflipw(unsigned char __n);

/**
 *  Flips the words of an unsigned short value.
 *
 *  @param __n
 *
 *  @return The computed unsigned short value.
 */
unsigned short huflipw(unsigned short __n);

/**
 *  Flips the words of an unsigned int value.
 *
 *  @param __n
 *
 *  @return The computed unsigned int value.
 */
unsigned int uflipw(unsigned int __n);

/**
 *  Flips the words of an unsigned long value.
 *
 *  @param __n
 *
 *  @return The computed unsigned long value.
 */
unsigned long luflipw(unsigned long __n);

/**
 *  Flips the words of an unsigned long long value.
 *
 *  @param __n
 *
 *  @return The computed unsigned long long value.
 */
unsigned long long lluflipw(unsigned long long __n);

#pragma mark - Number Moderations

/**
 *  Validates that the specified float value is within the
 *  specified bounds, returns the moderated specified value.
 *
 *  @param __n
 *
 *  @return The moderated float value.
 */
float fboundf(float __n, float __min, float __max);

/**
 *  Validates that the specified double value is within the
 *  specified bounds, returns the moderated specified value.
 *
 *  @param __n
 *
 *  @return The moderated double value.
 */
double fbound(double __n, double __min, double __max);

/**
 *  Verifies that a float value is within the specified bounds.
 *
 *  @param __n
 *  @param __min
 *  @param __max
 *
 *  @return 1 if bounded, 0 otherwise.
 */
int fisboundedf(float __n, float __min, float __max);

/**
 *  Verifies that a double value is within the specified bounds.
 *
 *  @param __n
 *  @param __min
 *  @param __max
 *
 *  @return 1 if bounded, 0 otherwise.
 */
int fisbounded(double __n, double __min, double __max);

/**
 *  Verifies that a float value is an integer.
 *
 *  @param __n
 *
 *  @return 1 if specified float value is an integer, 0 otherwise.
 */
int fisintf(float __n);

/**
 *  Verifies that a double value is an integer.
 *
 *  @param __n
 *
 *  @return 1 if specified double value is an integer, 0 otherwise.
 */
int fisint(double __n);

/**
 *  Verifies that an int value is even. 0 is considered even.
 *
 *  @param __n
 *
 *  @return 1 if even, 0 otherwise.
 */
int iseven(int __n);

/**
 *  Verifies that an int value is odd.
 *
 *  @param __n
 *
 *  @return 1 if odd, 0 otherwise.
 */
int isodd(int __n);

/**
 *  Normalizes a float value, checking against epsilon.
 *
 *  @param __n
 *
 *  @return The normalized float value.
 */
float fnormf(float __n);

/**
 *  Normalizes a double value, checking against epsilon.
 *
 *  @param __n
 *
 *  @return The normalized double value.
 */
double fnorm(double __n);

/**
 *  Computes the number of digits in an int.
 *
 *  @param __n
 *
 *  @return The number of digits.
 */
int ndigits(int __n);

#pragma mark - String Moderations
#pragma mark Verifications

/**
 *  Verifies that a string represents a float value.
 *
 *  @param __c
 *
 *  @return 1 if true, 0 otherwise.
 */
int fstrisnumf(const char *__c);

/**
 *  Verifies that a string represents a double value.
 *  
 *  @param __c
 *
 *  @return 1 if true, 0 otherwise.
 */
int fstrisnum(const char *__c);

/**
 *  Verifies that a string represents a long double value.
 *
 *  @param __c
 *
 *  @return 1 if true, 0 otherwise.
 */
int fstrisnuml(const char *__c);

/**
 *  Verifies that a string represents a long int value.
 *
 *  @param __c
 *
 *  @return 1 if true, 0 otherwise.
 */
int lstrisnum(const char *__c);

/**
 *  Verifies that a string represents a long long int value.
 *
 *  @param __c
 *
 *  @return 1 if true, 0 otherwise.
 */
int llstrisnum(const char *__c);

/**
 *  Verifies that a string represents an unsigned long int value.
 *
 *  @param __c
 *
 *  @return 1 if true, 0 otherwise.
 */
int lustrisnum(const char *__c);

/**
 *  Verifies that a string represents an unsigned long long int value.
 *
 *  @param __c
 *
 *  @return 1 if true, 0 otherwise.
 */
int llustrisnum(const char *__c);

#pragma mark Conversions

/**
 *  Converts a string to a float value if applicable.
 *
 *  @param __c
 *
 *  @return Float value of the string if applicable, NAN otherwise.
 */
float fstrtonumf(const char *__c);

/**
 *  Converts a string to a double value if applicable.
 *
 *  @param __c
 *
 *  @return Double value of the string if applicable, NAN otherwise.
 */
double fstrtonum(const char *__c);

/**
 *  Converts a string to a long double value if applicable.
 *
 *  @param __c
 *
 *  @return Long double value of the string if applicable, NAN otherwise.
 */
long double fstrtonuml(const char *__c);

/**
 *  Converts a string to a long int value if applicable.
 *
 *  @param __c
 *
 *  @return Long int value of the string if applicable, 0 otherwise.
 */
long int lstrtonum(const char *__c);

/**
 *  Converts a string to a long long int value if applicable.
 *
 *  @param __c
 *
 *  @return Long long int value of the string if applicable, 0 otherwise.
 */
long long int llstrtonum(const char *__c);

/**
 *  Converts a string to an unsigned long int value if applicable.
 *
 *  @param __c
 *
 *  @return Unsigned long int value of the string if applicable, 0 otherwise.
 */
unsigned long int lustrtonum(const char *__c);

/**
 *  Converts a string to an unsigned long long int value if applicable.
 *
 *  @param __c
 *
 *  @return Unsigned long long int value of the string if applicable, 0 otherwise.
 */
unsigned long long int llustrtonum(const char *__c);

#endif
