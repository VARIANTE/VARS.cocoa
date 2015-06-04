/**
 *  VARS
 *  (c) VARIANTE <http://variante.io>
 *
 *  This software is released under the MIT License:
 *  http://www.opensource.org/licenses/mit-license.php
 */

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

NS_ROOT_CLASS @interface VSQuartzUtil

/**
 *  Sets the anchor point of a UIView instance, handling all position displacement issues.
 *
 *  @param anchorPoint
 *  @param view
 */
+ (void)setAnchorPoint:(CGPoint)anchorPoint forView:(UIView *)view;

/**
 *  Creates a linear CAShapeLayer with the specified parameters.
 *
 *  @param pointA
 *  @param pointB
 *  @param color
 *  @param thickness
 *  @param opacity
 *
 *  @return The created CAShapeLayer instance.
 */
+ (CAShapeLayer *)linearCAShapeLayerFromPoint:(CGPoint)pointA toPoint:(CGPoint)pointB color:(UIColor *)color thickness:(CGFloat)thickness opacity:(float)opacity;

/**
 *  Creates a linear CAShapeLayer connecting the specified array of points using the specified parameters. In the array, if a point is invalid,
 *  it will not be connected. A minimum of 2 points is required.
 *
 *  @param points
 *  @param color
 *  @param thickness
 *  @param opacity
 *
 *  @return The created CAShapeLayer instance.
 */
+ (CAShapeLayer *)linearCAShapeLayerWithPoints:(NSArray *)points color:(UIColor *)color thickness:(CGFloat)thickness opacity:(float)opacity;

/**
 *  Creates a circular CAShapeLayer instance of a circle with the specified parameters.
 *
 *  @param radius
 *  @param color
 *  @param position
 *
 *  @return The created CAShapeLayer instance.
 */
+ (CAShapeLayer *)circularCAShapeLayerWithRadius:(CGFloat)radius color:(UIColor *)color position:(CGPoint)position;

/**
 *  Creates a CATextLayer instance with the specified parameters.
 *
 *  @param text
 *  @param font
 *  @param foregroundColor
 *  @param backgroundColor
 *  @param bounds
 *  @param position
 *  @param alignment
 *
 *  @return The created CATextLayer instance.
 */
+ (CATextLayer *)CATextLayerWithText:(NSString *)text font:(UIFont *)font foregroundColor:(UIColor *)foregroundColor backgroundColor:(UIColor *)backgroundColor bounds:(CGRect)bounds position:(CGPoint)position alignment:(NSString *)alignment;

@end
