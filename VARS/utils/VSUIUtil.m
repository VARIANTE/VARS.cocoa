/**
 *  VARS
 *  (c) VARIANTE <http://variante.io>
 *
 *  Utility for UI manipulation, containing various helper methods.
 *
 *  This software is released under the MIT License:
 *  http://www.opensource.org/licenses/mit-license.php
 */

#import "vsmem.h"
#import "VSUIUtil.h"

@implementation VSUIUtil

/**
 *  @inheritDoc
 */
+ (CGFloat)heightOfTextViewWithText:(NSString *)text font:(UIFont *)font width:(CGFloat)width
{
    UITextView *textView = [[UITextView alloc] init];
    [textView setFont:font];
    [textView setText:text];

    CGSize size = [textView sizeThatFits:CGSizeMake(width, FLT_MAX)];

    vs_dealloc(textView);

    return size.height;
}

/**
 *  @inheritDoc
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return image;
}

@end
