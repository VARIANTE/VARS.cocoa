/**
 *  VARSobjc
 *  (c) VARIANTE <http://variante.io>
 *
 *  This software is released under the MIT License:
 *  http://www.opensource.org/licenses/mit-license.php
 */

#import "vsmath.h"

#import "VSColorUtil.h"

@implementation VSColorUtil

/**
 *  @inheritDoc
 */
+ (UIColor *)modifyRGBOfColor:(UIColor *)color byUniformValue:(CGFloat)value
{
    CGFloat newRed, newGreen, newBlue, newAlpha;

    [color getRed:&newRed green:&newGreen blue:&newBlue alpha:&newAlpha];
    newRed = fboundf(newRed + value/255.0, 0.0, 1.0);
    newGreen = fboundf(newGreen + value/255.0, 0.0, 1.0);
    newBlue = fboundf(newBlue + value/255.0, 0.0, 1.0);

    return [UIColor colorWithRed:newRed green:newGreen blue:newBlue alpha:newAlpha];
}

/**
 *  @inheritDoc
 */
+ (UIColor *)modifyRGBOfColor:(UIColor *)color red:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue
{
    CGFloat newRed, newGreen, newBlue, newAlpha;

    [color getRed:&newRed green:&newGreen blue:&newBlue alpha:&newAlpha];
    newRed = fboundf(newRed + red/255.0, 0.0, 1.0);
    newGreen = fboundf(newGreen + green/255.0, 0.0, 1.0);
    newBlue = fboundf(newBlue + blue/255.0, 0.0, 1.0);

    return [UIColor colorWithRed:newRed green:newGreen blue:newBlue alpha:newAlpha];
}

/**
 *  @inheritDoc
 */
+ (UIColor *)modifyAlphaOfColor:(UIColor *)color toValue:(CGFloat)value
{
    CGFloat newRed, newGreen, newBlue, newAlpha;

    [color getRed:&newRed green:&newGreen blue:&newBlue alpha:&newAlpha];

    newAlpha = value;

    return [UIColor colorWithRed:newRed green:newGreen blue:newBlue alpha:newAlpha];
}

/**
 *  @inheritDoc
 */
+ (UIColor *)invertedColorOfColor:(UIColor *)color
{
    CGFloat newRed, newGreen, newBlue, newAlpha;

    [color getRed:&newRed green:&newGreen blue:&newBlue alpha:&newAlpha];
    newRed = 1.0 - newRed;
    newGreen = 1.0 - newGreen;
    newBlue = 1.0 - newBlue;

    return [UIColor colorWithRed:newRed green:newGreen blue:newBlue alpha:newAlpha];
}

/**
 *  @inheritDoc
 */
+ (UIColor *)colorWithHex:(unsigned int)hex alpha:(CGFloat)alpha
{
    CGFloat red = ((hex >> 16) & 0xFF) / 255.0;
    CGFloat green = ((hex >> 8) & 0xFF) / 255.0;
    CGFloat blue = ((hex >> 0) & 0xFF) / 255.0;

    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

/**
 *  @inheritDoc
 */
+ (UIColor *)invertedColorWithHex:(unsigned int)hex alpha:(CGFloat)alpha
{
    CGFloat red = ((hex >> 16) & 0xFF) / 255.0;
    CGFloat green = ((hex >> 8) & 0xFF) / 255.0;
    CGFloat blue = ((hex >> 0) & 0xFF) / 255.0;

    return [UIColor colorWithRed:1.0-red green:1.0-green blue:1.0-blue alpha:alpha];
}

/**
 *  @inheritDoc
 */
+ (UIColor *)colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha];
}

/**
 *  @inheritDoc
 */
+ (UIColor *)invertedColorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:1.0-(red/255.0) green:1.0-(green/255.0) blue:1.0-(blue/255.0) alpha:alpha];
}

/**
 *  @inheritDoc
 */
+ (BOOL)verifyRGBOfColor:(UIColor *)color hasRoomForDeltaUniformValue:(CGFloat)value
{
    CGFloat red, green, blue, alpha;

    [color getRed:&red green:&green blue:&blue alpha:&alpha];

    if (fisbounded(red + value/255.0, 0.0, 1.0)) return YES;
    if (fisbounded(green + value/255.0, 0.0, 1.0)) return YES;
    if (fisbounded(blue + value/255.0, 0.0, 1.0)) return YES;

    return NO;
}

@end
