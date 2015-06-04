/**
 *  VARS
 *  (c) VARIANTE <http://variante.io>
 *
 *  Utility for UI manipulation, containing various helper methods.
 *
 *  This software is released under the MIT License:
 *  http://www.opensource.org/licenses/mit-license.php
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ROOT_CLASS @interface VSUIUtil

/**
 *  Computes the height of a UITextView given a string and width.
 *
 *  @param text
 *  @param width
 *
 *  @return CGFloat value of the height.
 */
+ (CGFloat)heightOfTextViewWithText:(NSString *)text font:(UIFont *)font width:(CGFloat)width;
 
@end
