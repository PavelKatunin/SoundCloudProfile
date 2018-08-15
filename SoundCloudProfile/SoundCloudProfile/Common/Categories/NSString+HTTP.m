#import "NSString+HTTP.h"

@implementation NSString (HTTP)

- (NSString *)stringByAppendingGetParameters:(NSDictionary *)parameters {
    return @"";
}

- (NSString *)stringByAddingPercentEncoding {
    return [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
}

@end
