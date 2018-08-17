#import <XCTest/XCTest.h>
#import "SCUserJSONParser.h"

@interface SCUserJSONParserTests : XCTestCase

@end

@implementation SCUserJSONParserTests

- (NSData *)userJSONData {
    NSString *trackPath = [[NSBundle bundleForClass:[self class]] pathForResource:@"User" ofType:@"json"];
    return [NSData dataWithContentsOfFile:trackPath];
}

- (void)testParseCorrectUser {
    SCUserJSONParser *parser = [[SCUserJSONParser alloc] init];
    NSError *error = nil;
    SCUser *user = [parser userFromData:[self userJSONData]
                                  error:&error];
    
    XCTAssertNil(error);
    XCTAssertNotNil(user);
    XCTAssertEqualObjects(user.identifier, @(3207));
    XCTAssertEqualObjects(user.userName, @"Johannes Wagener");
    XCTAssertEqualObjects(user.avatarUrl.absoluteString,
                          @"http://i1.sndcdn.com/avatars-000001552142-pbw8yd-large.jpg?142a848");
    XCTAssertEqualObjects(user.fullName, @"Johannes Wagener");
    XCTAssertEqualObjects(user.userDescription,
                          @"<b>Hacker at SoundCloud</b>\r\n\r\nSome of my recent Hacks:\r\n\r\nsoundiverse.com"\
                          " \r\nbrowse recordings with the FiRe app by artwork\r\n\r\ntopbillin.com \r\nfind"\
                          " people to follow on SoundCloud\r\n\r\nchatter.fm \r\nget your account hooked up"\
                          " with a voicebox\r\n\r\nrecbutton.com \r\nrecord straight to your soundcloud account");
    XCTAssertEqualObjects(user.country, @"Germany");
    XCTAssertEqualObjects(user.city, @"Berlin");
}

- (void)testParseUserWithoutRequiredFields {
    //TODO: Implement
}

- (void)testParseCorruptedJson {
    //TODO: Implement
}

@end
