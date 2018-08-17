#import "SCRemoteTracksService.h"

static NSString *const kFavoritTracksPathFormat = @"users/%ld/favorites";

@interface SCRemoteTracksService ()

@property (nonatomic, strong) id <SCTracksParser> parser;
@property (nonatomic, strong) id <SCHTTPService> httpService;
@property (nonatomic, strong) id <SCEnvironmentService> environment;
@property (nonatomic, strong) id <SCAuthenticationService> authentication;

@end

@implementation SCRemoteTracksService

#pragma mark - Initialization

- (instancetype)initWithParser:(id <SCTracksParser>)parser
                   httpService:(id <SCHTTPService>)httpService
                authentication:(id <SCAuthenticationService>)authentication
                   environment:(id <SCEnvironmentService>)environment {
    self = [super init];
    if (self != nil) {
        self.parser = parser;
        self.httpService = httpService;
        self.environment = environment;
        self.authentication = authentication;
    }
    return self;
}

#pragma mark - Public

- (void)getFavoritTracksForUser:(NSNumber *)userId
                        success:(SCTracksSuccess)success
                           fail:(SCTracksFail)fail {
    
    NSURL *baseUrl = [self.environment apiBaseUrl];
    NSString *favoritesPath = [NSString stringWithFormat:kFavoritTracksPathFormat,
                               (long)userId.integerValue];
    NSURL *requestUrl = [baseUrl URLByAppendingPathComponent:favoritesPath];
    
    __weak SCRemoteTracksService *weakSelf = self;
    
    [self.httpService getByUrl:requestUrl
                    parameters:[self.authentication signRequestHeaders]
                       headers:nil
                       success:^(NSData *data) {
                           
                           SCRemoteTracksService *sSelf = weakSelf;
                           NSArray<SCTrack *> *tracks = nil;
                           NSError *error = nil;
                           tracks = [sSelf.parser tracksFromData:data
                                                           error:&error];
                           if (tracks != nil && error == nil) {
                               success(tracks);
                           }
                           else {
                               fail(error);
                           }
                       }
                          fail:^(NSError *error) {
                            fail(error);
                          }];
}

@end
