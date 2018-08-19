#import <XCTest/XCTest.h>
#import "SCProfile.h"
#import "SCTrack.h"
#import "SCUser.h"

@interface ProfileTests : XCTestCase

@end

@implementation ProfileTests

- (void)testFullProfileInitialization {
    NSURL *avatarUrl =
        [NSURL URLWithString:@"https://pbs.twimg.com/profile_images/817702598799044608/Np0mL0GI_400x400.jpg"];
    SCUser *user = [[SCUser alloc] initWithIdentifier:@(1584)
                                             userName:@"pkatunin"
                                             fullName:@"Pavel Katunin"
                                      userDescription:@"Some tracks I love to listen to"
                                            avatarUrl:avatarUrl
                                              country:@"Russia"
                                                 city:@"Saint-Petersburg"];
    NSURL *artwork =
        [NSURL URLWithString:@"https://upload.wikimedia.org/wikipedia/en/thumb" \
                              "/4/48/Papa_Roach_Infest.jpg/220px-Papa_Roach_Infest.jpg"];
    SCTrack *track = [[SCTrack alloc] initWithIdentifier:@(1423)
                                                   title:@"Scars"
                                                duration:@(18000)
                                                 artwork:artwork
                                                   genre:@"Rock"
                                          durationString:@"10:10"
                                        artworkImageData:nil];
    
    SCProfile *profile = [[SCProfile alloc] initWithUser:user
                                                  tracks:@[track]
                                         avatarImageData:nil];
    
    XCTAssertNotNil(profile.user);
    XCTAssertNotNil(profile.tracks);
    XCTAssertEqual(profile.tracks.count, 1);
}

- (void)testRequiredProfileInitialization {
    NSURL *avatarUrl =
        [NSURL URLWithString:@"https://pbs.twimg.com/profile_images/817702598799044608/Np0mL0GI_400x400.jpg"];
    SCUser *user = [[SCUser alloc] initWithIdentifier:@(1584)
                                             userName:@"pkatunin"
                                             fullName:@"Pavel Katunin"
                                      userDescription:@"Some tracks I love to listen to"
                                            avatarUrl:avatarUrl
                                              country:@"Russia"
                                                 city:@"Saint-Petersburg"];
    
    SCProfile *profile = [[SCProfile alloc] initWithUser:user
                                                  tracks:nil
                                         avatarImageData:nil];
    
    XCTAssertNotNil(profile.user);
    XCTAssertNil(profile.tracks);
}


@end
