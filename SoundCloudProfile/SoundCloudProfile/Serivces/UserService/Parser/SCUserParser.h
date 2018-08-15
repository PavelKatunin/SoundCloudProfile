#import <Foundation/Foundation.h>
#import "SCUser.h"

@protocol SCUserParser <NSObject>

- (nullable SCUser *)userFromData:(NSData *)data error:(NSError **)error;

@end
