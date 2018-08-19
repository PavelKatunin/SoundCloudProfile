#import "NSString+HTTP.h"

@implementation NSString (HTTP)

- (NSString *)stringByAddingPercentEncoding {
    return [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
}

@end
