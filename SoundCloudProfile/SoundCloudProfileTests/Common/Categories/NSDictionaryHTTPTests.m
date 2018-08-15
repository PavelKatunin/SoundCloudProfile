#import <XCTest/XCTest.h>
#import "NSDictionary+HTTP.h"

@interface NSDictionaryHTTPTests : XCTestCase

@end

@implementation NSDictionaryHTTPTests

- (void)testFewGetParametersGeneration {
    NSDictionary *parameters = @{ @"CLIENT_ID" : @"41345",
                                  @"some_key" : @"some_value",
                                  @"track" : @"90" };
    NSString *expectedString = @"CLIENT_ID=41345&some_key=some_value&track=90";
    XCTAssertEqualObjects(expectedString, parameters.parametersString);
}

- (void)testOneGetParameterGeneration {
    NSDictionary *parameters = @{ @"CLIENT_ID" : @"312" };
    NSString *expectedString = @"CLIENT_ID=312";
    XCTAssertEqualObjects(expectedString, parameters.parametersString);
}

- (void)testFewGetParametersWithSpaces {
    NSDictionary *parameters = @{ @"CLIENT_ID" : @"41345",
                                  @"some_text" : @"Some text with spaces to be tested",
                                  @"track" : @"90" };
    NSString *expectedString = @"CLIENT_ID=41345&some_text=Some%20text%20with%20spaces%20to%20be%20tested&track=90";
    XCTAssertEqualObjects(expectedString, parameters.parametersString);
}

@end
