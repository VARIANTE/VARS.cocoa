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

#define VS_S_APP_RECEIPT_KEY_ADAM_ID                      @"adam_id"
#define VS_S_APP_RECEIPT_KEY_APP_ITEM_ID                  @"app_item_id"
#define VS_S_APP_RECEIPT_KEY_APPLICATION_VERSION          @"application_version"
#define VS_S_APP_RECEIPT_KEY_BUNDLE_ID                    @"bundle_id"
#define VS_S_APP_RECEIPT_KEY_DOWNLOAD_ID                  @"download_id"
#define VS_S_APP_RECEIPT_KEY_IN_APP                       @"in_app"
#define VS_S_APP_RECEIPT_KEY_ORIGINAL_APPLICATION_VERSION @"original_application_version"
#define VS_S_APP_RECEIPT_KEY_ORIGINAL_PURCHASE_DATE       @"original_purchase_date"
#define VS_S_APP_RECEIPT_KEY_ORIGINAL_PURCHASE_DATE_MS    @"original_purchase_date_ms"
#define VS_S_APP_RECEIPT_KEY_ORIGINAL_PURCHASE_DATE_PST   @"original_purchase_date_pst"
#define VS_S_APP_RECEIPT_KEY_ORIGINAL_REQUEST_DATE        @"request_date"
#define VS_S_APP_RECEIPT_KEY_ORIGINAL_REQUEST_DATE_MS     @"request_date_ms"
#define VS_S_APP_RECEIPT_KEY_ORIGINAL_REQUEST_DATE_PST    @"request_date_pst"
#define VS_S_APP_RECEIPT_KEY_VERSION_EXTERNAL_IDENTIFIER  @"version_external_identifier"
#define VS_S_APP_RECEIPT_KEY_RECEIPT_TYPE                 @"receipt_type"

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

/**
 *  Gets the value of the specified key in the specified app receipt. Option to type cast the value into
 *  corresponding data types.
 *
 *  @param key
 *  @param receipt
 *  @param isProcessed
 *
 *  @return Object of corresponding value (type casted if enabled).
 */
+ (id)valueForKey:(NSString *)key inReceipt:(NSDictionary *)receipt isTypeCasted:(BOOL)isTypeCasted;

/**
 *  Gets the raw value of the specified key in the specified app receipt.
 *
 *  @param key
 *  @param receipt
 *
 *  @return Object of corresponding value.
 */
+ (id)valueForKey:(NSString *)key inReceipt:(NSDictionary *)receipt;

@end
