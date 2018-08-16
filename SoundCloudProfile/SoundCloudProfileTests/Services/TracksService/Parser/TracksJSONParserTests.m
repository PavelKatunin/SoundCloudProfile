#import <XCTest/XCTest.h>
#import <Foundation/Foundation.h>
#import "SCTracksJSONParser.h"

@interface TracksJSONParserTests : XCTestCase

@end

@implementation TracksJSONParserTests

- (NSData *)trackJSONData {
    NSString *trackPath = [[NSBundle bundleForClass:[self class]] pathForResource:@"Track" ofType:@"json"];
    return [NSData dataWithContentsOfFile:trackPath];
}

- (void)testParseCorrectTrack {
    NSData *trackData = [self trackJSONData];
    SCTracksJSONParser *parser = [[SCTracksJSONParser alloc] init];
    NSError *error = nil;
    SCTrack *track = [parser trackFromData:trackData error:&error];
    
    XCTAssertNotNil(track);
    XCTAssertNil(error);
    XCTAssertEqualObjects(track.title, @"Munching at Tiannas house");
    XCTAssertEqualObjects(track.identifier, @(13158665));
    XCTAssertEqualObjects(track.duration, @(18109));
}

- (void)testParseCorruptedTrack {
    
}

- (void)testParseCorruptedJson {
    
}

- (void)testParseManyTracks {
    
}

@end
