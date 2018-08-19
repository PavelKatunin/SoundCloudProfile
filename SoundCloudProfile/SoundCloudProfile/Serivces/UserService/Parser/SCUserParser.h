#import <Foundation/Foundation.h>
#import "SCUser.h"

typedef enum : NSUInteger {
    kSCIncorrectUserFormat,
    kSCIncorrectUserDataFormat,
    kSCNoRequiredUserFields
} SCUserParserError;

extern NSString *const kUserParserErrorDomain;

@protocol SCUserParser <NSObject>

- (nullable SCUser *)userFromData:(NSData *)data error:(NSError * __autoreleasing *)error;

@end
