/**
 *  VARS
 *  (c) VARIANTE <http://variante.io>
 *
 *  This software is released under the MIT License:
 *  http://www.opensource.org/licenses/mit-license.php
 */

#import "VSQuartzUtil.h"

@implementation VSQuartzUtil

/**
 *  @inheritDoc
 */
+ (void)setAnchorPoint:(CGPoint)anchorPoint forView:(UIView *)view
{
    CGPoint newPoint = CGPointMake(view.bounds.size.width * anchorPoint.x, view.bounds.size.height * anchorPoint.y);
    CGPoint oldPoint = CGPointMake(view.bounds.size.width * view.layer.anchorPoint.x, view.bounds.size.height * view.layer.anchorPoint.y);

    newPoint = CGPointApplyAffineTransform(newPoint, view.transform);
    oldPoint = CGPointApplyAffineTransform(oldPoint, view.transform);

    CGPoint position = view.layer.position;

    position.x -= oldPoint.x;
    position.x += newPoint.x;

    position.y -= oldPoint.y;
    position.y += newPoint.y;

    view.layer.position = position;
    view.layer.anchorPoint = anchorPoint;
}

/**
 *  @inheritDoc
 */
+ (CAShapeLayer *)linearCAShapeLayerFromPoint:(CGPoint)pointA toPoint:(CGPoint)pointB color:(UIColor *)color thickness:(CGFloat)thickness opacity:(float)opacity
{
    @autoreleasepool
    {
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:pointA];
        [path addLineToPoint:pointB];

        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        [shapeLayer setPath:[path CGPath]];
        [shapeLayer setStrokeColor:((color == nil) ? [[UIColor whiteColor] CGColor] : [color CGColor])];
        [shapeLayer setLineWidth:thickness];
        [shapeLayer setFillColor:[[UIColor clearColor] CGColor]];
        [shapeLayer setOpacity:opacity];

        path = nil;

        return shapeLayer;
    }
}

/**
 *  @inheritDoc
 */
+ (CAShapeLayer *)linearCAShapeLayerWithPoints:(NSArray *)points color:(UIColor *)color thickness:(CGFloat)thickness opacity:(float)opacity
{
    @autoreleasepool
    {
        // Minimum 2 points required.
        if (points == nil || points.count < 2) return nil;

        // Define defaults.
        if (color == nil) color = [UIColor whiteColor];

        unsigned long arrlen = points.count;

        UIBezierPath *path = [UIBezierPath bezierPath];
        BOOL isContinuous = NO;

        for (int i = 0; i < arrlen; i++)
        {
            id entry = points[i];

            if (entry == nil || ![entry isKindOfClass:[NSValue class]] || (strcmp([entry objCType], @encode(CGPoint)) != 0))
            {
                isContinuous = NO;
                continue;
            }
            else
            {
                CGPoint point = [(NSValue *)entry CGPointValue];

                if (isnan(point.x) || isnan(point.y))
                {
                    isContinuous = NO;
                    continue;
                }
                else
                {
                    if (isContinuous)
                    {
                        [path addLineToPoint:point];
                    }
                    else
                    {
                        [path moveToPoint:point];
                    }

                    isContinuous = YES;
                }
            }
        }

        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        [shapeLayer setPath:[path CGPath]];
        [shapeLayer setStrokeColor:[color CGColor]];
        [shapeLayer setLineWidth:thickness];
        [shapeLayer setFillColor:[[UIColor clearColor] CGColor]];
        [shapeLayer setOpacity:opacity];

        path = nil;

        return shapeLayer;
    }
}

/**
 *  @inheritDoc
 */
+ (CAShapeLayer *)circularCAShapeLayerWithRadius:(CGFloat)radius color:(UIColor *)color position:(CGPoint)position
{
    @autoreleasepool
    {
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:position radius:radius startAngle:0.0 endAngle:M_PI*2.0 clockwise:YES];

        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        [shapeLayer setLineWidth:0.0];
        [shapeLayer setFillColor:[color CGColor]];
        [shapeLayer setPath:[path CGPath]];

        path = nil;

        return shapeLayer;
    }
}

/**
 *  @inheritDoc
 */
+ (CATextLayer *)CATextLayerWithText:(NSString *)text font:(UIFont *)font foregroundColor:(UIColor *)foregroundColor backgroundColor:(UIColor *)backgroundColor bounds:(CGRect)bounds position:(CGPoint)position alignment:(NSString *)alignment
{
    @autoreleasepool
    {
        CATextLayer *textLayer = [CATextLayer layer];
        [textLayer setBounds:bounds];
        [textLayer setString:text];
        [textLayer setAlignmentMode:((alignment == nil) ? kCAAlignmentCenter : alignment)];
        [textLayer setFont:(__bridge CFTypeRef)font.fontName];
        [textLayer setFontSize:font.pointSize];
        [textLayer setForegroundColor:((foregroundColor == nil) ? [[UIColor whiteColor] CGColor] : [foregroundColor CGColor])];
        [textLayer setBackgroundColor:((backgroundColor == nil) ? [[UIColor clearColor] CGColor] : [backgroundColor CGColor])];
        [textLayer setPosition:position];
        [textLayer setContentsScale:[[UIScreen mainScreen] scale]];

        return textLayer;
    }
}

@end
