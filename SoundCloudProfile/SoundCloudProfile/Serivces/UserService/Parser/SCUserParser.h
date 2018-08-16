#import <Foundation/Foundation.h>
#import "SCUser.h"

typedef enum : NSUInteger {
    kSCIncorrectUserFormat,
    kSCIncorrectUserDataFormat,
    kSCNoRequiredUserFields
} SCUserParserError;

//TODO: move to m
static NSString *const kUserParserErrorDomain = @"user.parser.scoundCloud";

@protocol SCUserParser <NSObject>

- (nullable SCUser *)userFromData:(NSData *)data error:(NSError * __autoreleasing *)error;

@end
