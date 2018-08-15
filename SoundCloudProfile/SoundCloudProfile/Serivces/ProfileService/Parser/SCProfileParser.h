#import <Foundation/Foundation.h>
#import "SCProfile.h"

@protocol SCProfileParser <NSObject>

- (nullable SCProfile *)profileFromData:(NSData *)data error:(NSError **)error;

@end
