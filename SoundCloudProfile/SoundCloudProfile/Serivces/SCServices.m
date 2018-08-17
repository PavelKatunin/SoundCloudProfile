#import "SCServices.h"
#import "SCProdAuthenticationService.h"
#import "SCRemoteHTTPService.h"
#import "SCRemoteUserService.h"
#import "SCProdEnvironmentService.h"
#import "SCUserJSONParser.h"
#import "SCRemoteTracksService.h"
#import "SCTracksJSONParser.h"
#import "SCRemoteProfileService.h"

@interface SCServices ()

@property (nonatomic, strong) id <SCEnvironmentService> environmentService;
@property (nonatomic, strong) id <SCAuthenticationService> authenticationService;
@property (nonatomic, strong) id <SCHTTPService> httpService;
@property (nonatomic, strong) id <SCUserService> userService;
@property (nonatomic, strong) id <SCTracksService> tracksService;
@property (nonatomic, strong) id <SCProfileService> profileService;

@end

@implementation SCServices

#pragma mark - Initialization

+ (SCServices *)shared {
    static SCServices *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[SCServices alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    
    if (self != nil) {
        self.environmentService = [[SCProdEnvironmentService alloc] init];
        self.authenticationService = [[SCProdAuthenticationService alloc] init];
        self.httpService = [[SCRemoteHTTPService alloc] init];
        SCUserJSONParser *userParser = [[SCUserJSONParser alloc] init];
        self.userService = [[SCRemoteUserService alloc] initWithEnvironment:self.environmentService
                                                             authentication:self.authenticationService
                                                                       http:self.httpService
                                                                     parser:userParser];
        SCTracksJSONParser *tracksParser = [[SCTracksJSONParser alloc] init];
        self.tracksService = [[SCRemoteTracksService alloc] initWithParser:tracksParser
                                                               httpService:self.httpService
                                                            authentication:self.authenticationService
                                                               environment:self.environmentService];
        self.profileService = [[SCRemoteProfileService alloc] initWithUserService:self.userService
                                                                    tracksService:self.tracksService
                                                                      httpService:self.httpService];
    }
    
    return self;
}

@end
