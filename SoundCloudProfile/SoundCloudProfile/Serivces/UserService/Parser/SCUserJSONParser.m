#import "SCUserJSONParser.h"

static NSString *const kIdentifierKey = @"id";
static NSString *const kUserNameKey = @"username";
static NSString *const kFullNameKey = @"full_name";
static NSString *const kUserDescriptionKey = @"description";
static NSString *const kAvatarUrlKey = @"avatar_url";

@implementation SCUserJSONParser

- (nullable SCUser *)userFromData:(NSData *)data error:(NSError * __autoreleasing *)error {
    SCUser *user = nil;
    NSError *jsonParsingError = nil;
    id userObject = [NSJSONSerialization JSONObjectWithData:data
                                                    options:0
                                                      error:&jsonParsingError];
    
    if (userObject != nil && jsonParsingError == nil) {
        if ([userObject isKindOfClass:[NSDictionary class]]) {
            NSDictionary *userDictionary = userObject;
            user = [self userFromDictionary:userDictionary
                                      error:error];
        }
        else {
            *error = [NSError errorWithDomain:kUserParserErrorDomain
                                         code:kSCIncorrectUserFormat
                                     userInfo:nil];
        }
    }
    else {
        NSLog(@"Parsing error: %@", jsonParsingError);
        *error = [NSError errorWithDomain:kUserParserErrorDomain
                                     code:kSCIncorrectUserDataFormat
                                 userInfo:nil];
    }
    
    return user;
}

- (nullable SCUser *)userFromDictionary:(NSDictionary *)dictionary error:(NSError * __autoreleasing *)error {
    SCUser *user = nil;

    NSNumber *identifier = dictionary[kIdentifierKey];
    NSString *userName = dictionary[kUserNameKey];
    NSString *fullName = dictionary[kUserNameKey];
    NSString *userDescription = dictionary[kUserDescriptionKey];
    NSString *avatarUrlString = dictionary[kAvatarUrlKey];
    NSURL *avatarUrl = [NSURL URLWithString:avatarUrlString];
    
    if (identifier != nil && userName != nil) {
        user = [[SCUser alloc] initWithIdentifier:identifier
                                         userName:userName
                                         fullName:fullName
                                  userDescription:userDescription
                                        avatarUrl:avatarUrl];
    }
    else {
        *error = [NSError errorWithDomain:kUserParserErrorDomain
                                     code:kSCNoRequiredUserFields
                                 userInfo:nil];
    }
    
    return user;
}

@end
