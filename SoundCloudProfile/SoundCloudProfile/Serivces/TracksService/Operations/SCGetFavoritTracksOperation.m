#import "SCGetFavoritTracksOperation.h"

@interface SCGetFavoritTracksOperation ()

@property (nonatomic, strong, nonnull) id <SCTracksService> tracksService;
@property (nonatomic, copy, nonnull) NSNumber *userId;
@property (nonatomic, strong, nullable) NSArray<SCTrack *> *tracks;
@property (nonatomic, strong, nullable) NSError *error;

@end

@implementation SCGetFavoritTracksOperation

#pragma mark - Initialization

- (instancetype)initWithTracksService:(id <SCTracksService>)tracksService
                               userId:(NSNumber *)userId {
    self = [super init];
    if (self != nil) {
        self.tracksService = tracksService;
        self.userId = userId;
    }
    return self;
}

#pragma mark - Async task

- (void)execute {
    [self.tracksService getFavoritTracksForUser:self.userId
                                        success:^(NSArray<SCTrack *> *tracks) {
                                            self.tracks = tracks;
                                            [self completeOperation];
                                        } fail:^(NSError *error) {
                                            self.error = error;
                                            [self completeOperation];
                                        }];
}

@end
