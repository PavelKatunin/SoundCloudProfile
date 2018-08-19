#import <Foundation/Foundation.h>
#import "SCAsynchronousOperation.h"
#import "SCTrack.h"
#import "SCTracksService.h"
#import "SCHTTPService.h"

@interface SCGetFavoritTracksWithImagesOperation : SCAsynchronousOperation

//input
@property (nonatomic, readonly, nonnull) NSNumber *userId;

//output
@property (nonatomic, readonly, nullable) NSArray<SCTrack *> *tracks;
@property (nonatomic, readonly, nullable) NSError *error;

- (instancetype)initWithTracksService:(id <SCTracksService>)tracksService
                               userId:(NSNumber *)userId
                          httpService:(id <SCHTTPService>)httpService;

@end
