/**
 *  VARS
 *  (c) VARIANTE <http://variante.io>
 *
 *  Utility for StoreKit, containing various helper methods.
 *
 *  This software is released under the MIT License:
 *  http://www.opensource.org/licenses/mit-license.php
 */

#import <Foundation/Foundation.h>

NS_ROOT_CLASS @interface VSStoreKitUtil

/**
 *  Compares the specified version against the original application version of an
 *  app receipt.
 *
 *  @param aVersion
 *  @param receipt
 *
 *  @return NSComparisonResult where:
 *                     NSOrderedSame: aVersion is the same as the original application version
 *               NSOrderedDescending: aVersion is newer than original application version
 *                NSOrderedAscending: aVersion is older than original application version
 *                        NSNotFound: unable to determine
 */
+ (NSComparisonResult)compareVersion:(NSString *)aVersion againstOriginalApplicationVersionInReceipt:(NSDictionary *)receipt;

/**
 *  Compares the specified date against the original purchase date of an
 *  app receipt. Specified date must be in this format: "yyyy-MM-dd HH:mm:ss VV"
 *
 *  @param aDate
 *  @param receipt
 *
 *  @return NSComparisonResult where:
 *                     NSOrderedSame: aDate is the same as the original purchase date
 *               NSOrderedDescending: aDate is newer than original purchase date
 *                NSOrderedAscending: aDate is earlier than original purchase date
 *                        NSNotFound: unable to determine 
 */
+ (NSComparisonResult)compareDate:(NSString *)aDate againstOriginalPurchaseDateInReceipt:(NSDictionary *)receipt;

/**
 *  Compares the specified time interval since 1970 against the original purchase date (ms) of an
 *  app receipt.
 *
 *  @param aTimeIntervalSince1970
 *  @param receipt
 *
 *  @return NSComparisonResult where:
 *                     NSOrderedSame: aDate is the same as the original purchase date
 *               NSOrderedDescending: aDate is newer than original purchase date
 *                NSOrderedAscending: aDate is earlier than original purchase date
 *                        NSNotFound: unable to determine
 */
+ (NSComparisonResult)compareTimeIntervalSince1970:(NSTimeInterval)aTimeIntervalSince1970 againstOriginalPurchaseDateInReceipt:(NSDictionary *)receipt;

@end
