#import <Foundation/Foundation.h>

@interface NSString (HTTP)

- (NSString *)stringByAppendingGetParameters:(NSDictionary *)parameters;

- (NSString *)stringByAddingPercentEncoding;

@end
