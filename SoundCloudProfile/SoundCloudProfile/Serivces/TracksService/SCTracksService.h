#import <Foundation/Foundation.h>
#import "SCTrack.h"

typedef void (^SCTracksSuccess)(SCTrack *user);
typedef void (^SCTracksFail)(NSError *error);

@protocol SCTracksService <NSObject>

- (void)getFavoritTracksForUser:(NSString *)userId
                        success:(SCTracksSuccess)success
                           fail:(SCTracksFail)fail;

@end
