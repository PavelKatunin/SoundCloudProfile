#import <XCTest/XCTest.h>
#import "SCUser.h"

@interface UserTests : XCTestCase

@end

@implementation UserTests

- (void)testFullUserInitialization {
    NSURL *avatarUrl =
        [NSURL URLWithString:@"https://pbs.twimg.com/profile_images/817702598799044608/Np0mL0GI_400x400.jpg"];
    SCUser *user = [[SCUser alloc] initWithIdentifier:@(1584)
                                             userName:@"pkatunin"
                                             fullName:@"Pavel Katunin"
                                      userDescription:@"Some tracks I love to listen to"
                                            avatarUrl:avatarUrl];
    XCTAssertNotNil(user.identifier);
    XCTAssertNotNil(user.userName);
    XCTAssertNotNil(user.fullName);
    XCTAssertNotNil(user.userDescription);
    XCTAssertNotNil(user.avatarUrl);
}

- (void)testRequiredFieldsInitialization {
    SCUser *user = [[SCUser alloc] initWithIdentifier:@(1584)
                                             userName:@"pkatunin"
                                             fullName:nil
                                      userDescription:nil
                                            avatarUrl:nil];
    XCTAssertNotNil(user.identifier);
    XCTAssertNotNil(user.userName);
    XCTAssertNil(user.fullName);
    XCTAssertNil(user.userDescription);
    XCTAssertNil(user.avatarUrl);
}

@end
