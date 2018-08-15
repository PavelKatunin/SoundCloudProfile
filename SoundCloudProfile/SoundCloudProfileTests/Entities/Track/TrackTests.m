#import <XCTest/XCTest.h>
#import "SCTrack.h"

@interface TrackTests : XCTestCase

@end

@implementation TrackTests

- (void)testFullTrackInitialization {
    NSURL *artwork =
    [NSURL URLWithString:@"https://upload.wikimedia.org/wikipedia/en/thumb" \
                         "/4/48/Papa_Roach_Infest.jpg/220px-Papa_Roach_Infest.jpg"];
    SCTrack *track = [[SCTrack alloc] initWithIdentifier:@(1423)
                                                   title:@"Scars"
                                                duration:@(18000)
                                                 artwork:artwork
                                                   genre:@"Rock"];
    XCTAssertNotNil(track.identifier);
    XCTAssertNotNil(track.title);
    XCTAssertNotNil(track.duration);
    XCTAssertNotNil(track.artwork);
    XCTAssertNotNil(track.genre);
}

- (void)testRequiredTrackInitialization {
    SCTrack *track = [[SCTrack alloc] initWithIdentifier:@(1423)
                                                   title:@"Scars"
                                                duration:nil
                                                 artwork:nil
                                                   genre:nil];
    XCTAssertNotNil(track.identifier);
    XCTAssertNotNil(track.title);
    XCTAssertNil(track.duration);
    XCTAssertNil(track.artwork);
    XCTAssertNil(track.genre);
}

@end
