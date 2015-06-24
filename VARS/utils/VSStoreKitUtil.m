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
    if ((receipt == nil) || (receipt[@"receipt"] == nil) || (receipt[@"receipt"] == [NSNull null]))
    {
        return NSNotFound;
    }

    id value = receipt[@"receipt"][@"original_application_version"];

    if ((value == nil) || (value == [NSNull null]))
    {
        return NSNotFound;
    }

    NSString *originalApplicationVersion = (NSString *)value;

    return [VSStringUtil compareVersion:aVersion againstAnotherVersion:originalApplicationVersion];
}

/**
 *  @inheritDoc
 */
+ (NSComparisonResult)compareDate:(NSString *)aDate againstOriginalPurchaseDateInReceipt:(NSDictionary *)receipt
{
    if ((receipt == nil) || (receipt[@"receipt"] == nil) || (receipt[@"receipt"] == [NSNull null]))
    {
        return NSNotFound;
    }

    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy-MM-dd HH:mm:ss VV"];

    id gmtValue = receipt[@"receipt"][@"original_purchase_date"];
    id pstValue = receipt[@"receipt"][@"original_purchase_date_pst"];
    id msValue = receipt[@"receipt"][@"original_purchase_date_ms"];

    NSDate *date = [df dateFromString:aDate];
    NSDate *gmt = [df dateFromString:((gmtValue == [NSNull null]) ? nil : (NSString *)gmtValue)];
    NSDate *pst = [df dateFromString:((pstValue == [NSNull null]) ? nil : (NSString *)pstValue)];
    NSDate *ms = (msValue == nil || msValue == [NSNull null]) ? nil : [NSDate dateWithTimeIntervalSince1970:([(NSString *)msValue doubleValue])/1000];

    vs_dealloc(df);

    if (date == nil) return NSNotFound;

    if (gmt != nil)
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
    if ((receipt == nil) || (receipt[@"receipt"] == nil) || (receipt[@"receipt"] == [NSNull null]))
    {
        return NSNotFound;
    }

    id value = receipt[@"receipt"][@"original_purchase_date_ms"];

    if (value == nil || value == [NSNull null])
    {
        return NSNotFound;
    }

    NSTimeInterval timeInterval = [(NSString *)value doubleValue]/1000;

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

@end
