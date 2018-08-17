#import <Foundation/Foundation.h>
#import "SCAsynchronousOperation.h"
#import "SCTrack.h"
#import "SCTracksService.h"

@interface SCGetFavoritTracksOperation : SCAsynchronousOperation

//input
@property (nonatomic, readonly, nonnull) NSNumber *userId;

//output
@property (nonatomic, readonly, nullable) NSArray<SCTrack *> *tracks;
@property (nonatomic, readonly, nullable) NSError *error;

- (instancetype)initWithTracksService:(nonnull id <SCTracksService>)userService
                               userId:(nonnull NSNumber *)userId;

@end
