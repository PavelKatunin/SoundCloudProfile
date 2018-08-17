#import <Foundation/Foundation.h>
#import "SCTrack.h"

typedef void (^SCTracksSuccess)(NSArray<SCTrack *> *tracks);
typedef void (^SCTracksFail)(NSError *error);

@protocol SCTracksService <NSObject>

- (void)getFavoritTracksForUser:(NSNumber *)userId
                        success:(SCTracksSuccess)success
                           fail:(SCTracksFail)fail;

@end
