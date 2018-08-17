#import "SCRemoteProfileService.h"
#import "SCGetUserOperation.h"
#import "SCGetFavoritTracksOperation.h"
#import "SCDownloadDataOperation.h"

@interface SCRemoteProfileService ()

@property (nonatomic, strong) NSOperationQueue *queue;

@property (nonatomic, strong) id <SCUserService> userService;
@property (nonatomic, strong) id <SCTracksService> tracksService;
@property (nonatomic, strong) id <SCHTTPService> httpService;

@end

@implementation SCRemoteProfileService

#pragma mark - Initialization

- (instancetype)initWithUserService:(id <SCUserService>)userService
                      tracksService:(id <SCTracksService>)tracksService
                        httpService:(id <SCHTTPService>)httpService {
    self = [super init];
    if (self != nil) {
        self.userService = userService;
        self.tracksService = tracksService;
        self.httpService = httpService;
        self.queue = [[NSOperationQueue alloc] init];
    }
    return self;
}

#pragma mark - Public methods

- (void)getProfileByUserId:(NSNumber *)identifier
                   success:(SCProfileSuccess)success
                      fail:(SCProfileFail)fail {
    
    SCGetUserOperation *getUserOperation =
        [[SCGetUserOperation alloc] initWithUserService:self.userService
                                                 userId:identifier];
    
    SCGetFavoritTracksOperation *getTracksOperation =
        [[SCGetFavoritTracksOperation alloc] initWithTracksService:self.tracksService
                                                            userId:identifier];
    
    SCDownloadDataOperation *downloadImageOperation =
        [[SCDownloadDataOperation alloc] initWithHttpService:self.httpService url:nil];
    
    [downloadImageOperation addDependency:getUserOperation];
    
    __weak SCGetUserOperation *weakUserOperation = getUserOperation;
    getUserOperation.completionBlock = ^{
        downloadImageOperation.url = weakUserOperation.user.avatarUrl;
    };

    NSOperation *compileProfileOperation = [[NSOperation alloc] init];
    [compileProfileOperation addDependency:getUserOperation];
    [compileProfileOperation addDependency:getTracksOperation];
    [compileProfileOperation addDependency:downloadImageOperation];

    compileProfileOperation.completionBlock = ^{
        SCUser *user = getUserOperation.user;
        NSArray<SCTrack *> *tracks = getTracksOperation.tracks;
        
        if (user != nil) {
            SCProfile *profile = [[SCProfile alloc] initWithUser:user
                                                          tracks:tracks
                                                 avatarImageData:downloadImageOperation.data];
            success(profile);
        }
        else {
            //TODO: add error
            fail(getUserOperation.error);
        }
        
    };
    
    [self.queue addOperation:getUserOperation];
    [self.queue addOperation:getTracksOperation];
    [self.queue addOperation:compileProfileOperation];
    [self.queue addOperation:downloadImageOperation];
}

@end
