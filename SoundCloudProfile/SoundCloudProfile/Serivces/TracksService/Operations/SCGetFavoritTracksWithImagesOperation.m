#import "SCGetFavoritTracksWithImagesOperation.h"
#import "SCDownloadGroupDataOperation.h"
#import "SCGetFavoritTracksOperation.h"

@interface SCGetFavoritTracksWithImagesOperation ()

@property (nonatomic, strong) NSOperationQueue *queue;
@property (strong, nonnull) id <SCTracksService> tracksService;
@property (strong, nonnull) id <SCHTTPService> httpService;
@property (copy, nonnull) NSNumber *userId;
@property (strong, nullable) NSArray<SCTrack *> *tracks;
@property (strong, nullable) NSError *error;

@end

@implementation SCGetFavoritTracksWithImagesOperation

#pragma mark - Initialization

- (instancetype)initWithTracksService:(id <SCTracksService>)tracksService
                               userId:(NSNumber *)userId
                          httpService:(id <SCHTTPService>)httpService {
    self = [super init];
    if (self != nil) {
        self.tracksService = tracksService;
        self.userId = userId;
        self.httpService = httpService;
        self.queue = [[NSOperationQueue alloc] init];
    }
    return self;
}

#pragma mark - Async task

- (void)execute {
    SCGetFavoritTracksOperation *getTracksOperation =
        [[SCGetFavoritTracksOperation alloc] initWithTracksService:self.tracksService userId:self.userId];
    
    __weak SCGetFavoritTracksOperation *weakTracksOperation = getTracksOperation;
    __weak SCGetFavoritTracksWithImagesOperation *weakSelf = self;
    __weak NSOperationQueue *weakQueue = self.queue;
    
    getTracksOperation.completionBlock = ^{
        if (weakTracksOperation.error == nil && weakTracksOperation.tracks != nil) {
            NSMutableArray<NSURL *> *urls = [[NSMutableArray alloc] init];
            [weakTracksOperation.tracks enumerateObjectsUsingBlock:^(SCTrack * _Nonnull track,
                                                                     NSUInteger idx,
                                                                     BOOL * _Nonnull stop) {
                if (track.artwork != nil) {
                    [urls addObject:track.artwork];
                }
                
            }];
            SCDownloadGroupDataOperation *downloadImagesOperation =
                [[SCDownloadGroupDataOperation alloc] initWithHttpService:self.httpService];
            downloadImagesOperation.urls = urls;
            NSArray<SCTrack *> *tracks = weakTracksOperation.tracks;
            
            __weak SCDownloadGroupDataOperation *weakDownloadImagesOperation = downloadImagesOperation;
            downloadImagesOperation.completionBlock = ^{
                [tracks enumerateObjectsUsingBlock:^(SCTrack * _Nonnull track, NSUInteger idx, BOOL * _Nonnull stop) {
                    track.artworkImageData = weakDownloadImagesOperation.groupData[track.artwork];
                }];
                weakSelf.tracks = tracks;
                [self completeOperation];
            };
            [weakQueue addOperation:downloadImagesOperation];
        }
        else {
            weakSelf.error = weakTracksOperation.error;
            [self completeOperation];
        }
    };
    
    [self.queue addOperation:getTracksOperation];
}

@end
