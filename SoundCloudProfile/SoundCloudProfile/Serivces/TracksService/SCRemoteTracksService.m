#import "SCRemoteTracksService.h"

static NSString *const kFavoritTracksPath = @"users";

@interface SCRemoteTracksService (Private)

@property (nonatomic, weak) id <SCTracksParser> parser;
@property (nonatomic, weak) id <SCHTTPService> httpService;
@property (nonatomic, weak) id <SCEnvironmentService> environment;
@property (nonatomic, weak) id <SCAuthenticationService> authentication;

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
    }
    return self;
}

#pragma mark - Public

- (void)getFavoritTracksForUser:(NSString *)userId
                        success:(SCTracksSuccess)success
                           fail:(SCTracksFail)fail {
    
    NSURL *baseUrl = [self.environment apiBaseUrl];
    //TODO: implement
}

@end
