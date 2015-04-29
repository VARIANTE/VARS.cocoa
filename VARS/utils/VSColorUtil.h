/**
 *  VARSobjc
 *  (c) VARIANTE <http://variante.io>
 *
 *  Utility for processing colors.
 *
 *  This software is released under the MIT License:
 *  http://www.opensource.org/licenses/mit-license.php
 */

#import <UIKit/UIKit.h>

NS_ROOT_CLASS @interface VSColorUtil

/**
 *  Modifies the RGB scale of the specified color by a uniform value.
 *
 *  @param color
 *  @param value
 *
 *  @return The modified color.
 */
+ (UIColor *)modifyRGBOfColor:(UIColor *)color byUniformValue:(CGFloat)value;

/**
 *  Modifies the RGB scale of the specified color by each specified value.
 *
 *  @param color
 *  @param red
 *  @param green
 *  @param blue
 *
 *  @return The modified color.
 */
+ (UIColor *)modifyRGBOfColor:(UIColor *)color red:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;

/**
 *  Modifies the alpha of the specified color to the specified value.
 *
 *  @param color
 *  @param value
 *
 *  @return The modified color.
 */
+ (UIColor *)modifyAlphaOfColor:(UIColor *)color toValue:(CGFloat)value;

/**
 *  Gets the inverted color of the specified color.
 *
 *  @param color
 *
 *  @return The inverted color.
 */
+ (UIColor *)invertedColorOfColor:(UIColor *)color;

/**
 *  Gets the UIColor object with the given hex that represents RGB values (i.e. 0xFFFFFF).
 *
 *  @param hex
 *  @param alpha 
 *
 *  @return UIColor object.
 */
+ (UIColor *)colorWithHex:(unsigned int)hex alpha:(CGFloat)alpha;

/**
 *  Gets the inverted UIColor object with the given hex that represents RGB values (i.e. 0xFFFFFF).
 *
 *  @paran hex
 *  @param alpha
 *
 *  @return UIColor object.
 */
+ (UIColor *)invertedColorWithHex:(unsigned int)hex alpha:(CGFloat)alpha;

/**
 *  Gets the UIColor object with the provided RGB value.
 *
 *  @param red
 *  @param green
 *  @param blue
 *  @param alpha
 *
 *  @return UIColor object.
 */
+ (UIColor *)colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

/**
 *  Gets the inverted UIColor object with the provided RGB value.
 *
 *  @param red
 *  @param green
 *  @param blue
 *  @param alpha
 *
 *  @return UIColor object.
 */
+ (UIColor *)invertedColorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

/**
 *  Verifies that the specified color has room to apply a delta uniform value.
 *
 *  @param color
 *  @param value
 *
 *  @return YES if possible, NO otherwise.
 */
+ (BOOL)verifyRGBOfColor:(UIColor *)color hasRoomForDeltaUniformValue:(CGFloat)value;

@end
