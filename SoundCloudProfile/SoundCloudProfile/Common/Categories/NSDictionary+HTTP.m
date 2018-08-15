#import "NSDictionary+HTTP.h"
#import "NSString+HTTP.h"

@implementation NSDictionary (HTTP)

- (NSString *)parametersString {
    NSString *resultString = @"";
    NSInteger iterationNumber = 1;
    
    NSArray *keys =  self.allKeys;

    NSArray *sortedKeys = [keys sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        NSAssert([obj1 isKindOfClass:[NSString class]], @"key should be a string type");
        NSAssert([obj2 isKindOfClass:[NSString class]], @"key should be a string type");
        NSString *string1 = obj1;
        NSString *string2 = obj2;
        
        return [string1 compare:string2];
    }];
    
    for (NSString * key in sortedKeys) {
        NSAssert([key isKindOfClass:[NSString class]], @"key should be a string type");
        NSString *value = self[key];
        NSAssert([value isKindOfClass:[NSString class]], @"value should be a string type");
        NSString *encodedKey = key.stringByAddingPercentEncoding;
        NSString *encodedValue = value.stringByAddingPercentEncoding;
        resultString = [resultString stringByAppendingString:[NSString stringWithFormat:@"%@=%@",
                                                              encodedKey,
                                                              encodedValue]];
        if (iterationNumber != self.count) {
            resultString = [resultString stringByAppendingString:@"&"];
        }
        iterationNumber++;
    }
    return resultString;
}

@end
