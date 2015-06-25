/**
 *  VARS
 *  (c) VARIANTE <http://variante.io>
 *
 *  Utility for StoreKit, containing various helper methods.
 *
 *  This software is released under the MIT License:
 *  http://www.opensource.org/licenses/mit-license.php
 */

#import "vsmem.h"
#import "VSStoreKitUtil.h"
#import "VSStringUtil.h"

@implementation VSStoreKitUtil

/**
 *  @inheritDoc
 */
+ (NSComparisonResult)compareVersion:(NSString *)aVersion againstOriginalApplicationVersionInReceipt:(NSDictionary *)receipt
{
    NSString *originalApplicationVersion = [VSStoreKitUtil valueForKey:VS_S_APP_RECEIPT_KEY_ORIGINAL_APPLICATION_VERSION inReceipt:receipt];

    return [VSStringUtil compareVersion:aVersion againstAnotherVersion:originalApplicationVersion];
}

/**
 *  @inheritDoc
 */
+ (NSComparisonResult)compareDate:(NSString *)aDate againstOriginalPurchaseDateInReceipt:(NSDictionary *)receipt
{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy-MM-dd HH:mm:ss VV"];
    NSDate *date = [df dateFromString:aDate];
    vs_dealloc(df);

    NSDate *gmt = [VSStoreKitUtil valueForKey:VS_S_APP_RECEIPT_KEY_ORIGINAL_PURCHASE_DATE inReceipt:receipt];
    NSDate *pst = [VSStoreKitUtil valueForKey:VS_S_APP_RECEIPT_KEY_ORIGINAL_PURCHASE_DATE_PST inReceipt:receipt];
    NSDate *ms = [VSStoreKitUtil valueForKey:VS_S_APP_RECEIPT_KEY_ORIGINAL_PURCHASE_DATE_MS inReceipt:receipt];;

    if (date == nil)
    {
        return NSNotFound;
    }
    else if (gmt != nil)
    {
        return [date compare:gmt];
    }
    else if (pst != nil)
    {
        return [date compare:pst];
    }
    else if (ms != nil)
    {
        return [date compare:ms];
    }

    return NSNotFound;
}

/**
 *  @inheritDoc
 */
+ (NSComparisonResult)compareTimeIntervalSince1970:(NSTimeInterval)aTimeIntervalSince1970 againstOriginalPurchaseDateInReceipt:(NSDictionary *)receipt
{
    NSString *value = [VSStoreKitUtil valueForKey:VS_S_APP_RECEIPT_KEY_ORIGINAL_PURCHASE_DATE_MS inReceipt:receipt isTypeCasted:NO];

    if (value == nil)
    {
        return NSNotFound;
    }

    NSTimeInterval timeInterval = [value doubleValue]/1000;

    if (aTimeIntervalSince1970 > timeInterval)
    {
        return NSOrderedDescending;
    }
    else if (aTimeIntervalSince1970 < timeInterval)
    {
        return NSOrderedAscending;
    }
    else
    {
        return NSOrderedSame;
    }
}

/**
 *  @inheritDoc
 */
+ (id)valueForKey:(NSString *)key inReceipt:(NSDictionary *)receipt isTypeCasted:(BOOL)isTypeCasted
{
    if ((key == nil) || (receipt == nil) || (receipt[@"receipt"] == nil) || (receipt[@"receipt"] == [NSNull null]))
    {
        return nil;
    }

    id value = receipt[@"receipt"][key];

    if ((value == nil) || (value == [NSNull null]))
    {
        return nil;
    }

    if (isTypeCasted)
    {
        if (([key isEqualToString:VS_S_APP_RECEIPT_KEY_ADAM_ID]) ||
            ([key isEqualToString:VS_S_APP_RECEIPT_KEY_APP_ITEM_ID]) ||
            ([key isEqualToString:VS_S_APP_RECEIPT_KEY_APPLICATION_VERSION]) ||
            ([key isEqualToString:VS_S_APP_RECEIPT_KEY_BUNDLE_ID]) ||
            ([key isEqualToString:VS_S_APP_RECEIPT_KEY_DOWNLOAD_ID]) ||
            ([key isEqualToString:VS_S_APP_RECEIPT_KEY_ORIGINAL_APPLICATION_VERSION]) ||
            ([key isEqualToString:VS_S_APP_RECEIPT_KEY_VERSION_EXTERNAL_IDENTIFIER]) ||
            ([key isEqualToString:VS_S_APP_RECEIPT_KEY_RECEIPT_TYPE]))
        {
            return (NSString *)value;
        }
        else if ([key isEqualToString:VS_S_APP_RECEIPT_KEY_IN_APP])
        {
            return (NSArray *)value;
        }
        else if (([key isEqualToString:VS_S_APP_RECEIPT_KEY_ORIGINAL_PURCHASE_DATE]) ||
                 ([key isEqualToString:VS_S_APP_RECEIPT_KEY_ORIGINAL_PURCHASE_DATE_PST]) ||
                 ([key isEqualToString:VS_S_APP_RECEIPT_KEY_ORIGINAL_REQUEST_DATE]) ||
                 ([key isEqualToString:VS_S_APP_RECEIPT_KEY_ORIGINAL_REQUEST_DATE_PST]))
        {
            NSDateFormatter *df = [[NSDateFormatter alloc] init];
            [df setDateFormat:@"yyyy-MM-dd HH:mm:ss VV"];
            NSDate *date = [df dateFromString:(NSString *)value];
            vs_dealloc(df);

            return date;
        }
        else if (([key isEqualToString:VS_S_APP_RECEIPT_KEY_ORIGINAL_PURCHASE_DATE_MS]) ||
                 ([key isEqualToString:VS_S_APP_RECEIPT_KEY_ORIGINAL_REQUEST_DATE_MS]))
        {
            if (value == nil || isnan([(NSString *)value doubleValue])) return nil;

            return [NSDate dateWithTimeIntervalSince1970:[(NSString *)value doubleValue]/1000];
        }
        else
        {
            return nil;
        }
    }
    else
    {
        return value;
    }
}

/**
 *  @inheritDoc
 */
+ (id)valueForKey:(NSString *)key inReceipt:(NSDictionary *)receipt
{
    return [VSStoreKitUtil valueForKey:key inReceipt:receipt isTypeCasted:YES];
}

@end
