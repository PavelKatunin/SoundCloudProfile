#import "SCRemoteUserService.h"
#import "NSDictionary+HTTP.h"

static NSString *const kUserPath = @"users";

@interface SCRemoteUserService ()

@property (nonatomic, strong) NSOperationQueue *queue;

@property (nonatomic, strong) id <SCEnvironmentService> environment;
@property (nonatomic, strong) id <SCAuthenticationService> authentication;
@property (nonatomic, strong) id <SCHTTPService> http;
@property (nonatomic, strong) id <SCUserParser> parser;

@end

@implementation SCRemoteUserService

#pragma mark - Initialization

- (instancetype)initWithEnvironment:(id <SCEnvironmentService>)environment
                     authentication:(id <SCAuthenticationService>)authentication
                               http:(id <SCHTTPService>)http
                             parser:(id <SCUserParser>)parser {
    self = [super init];
    if (self != nil) {
        self.environment = environment;
        self.authentication = authentication;
        self.http = http;
        self.parser = parser;
    }
    return self;
}

#pragma mark - Public

- (void)getUserById:(NSNumber *)identifier
            success:(SCUserSuccess)success
               fail:(SCUserFail)fail {
    
    NSURL *baseUrl = [self.environment apiBaseUrl];
    NSURL *requestUrl = [baseUrl URLByAppendingPathComponent:kUserPath isDirectory:NO];
    requestUrl = [requestUrl URLByAppendingPathComponent:identifier.description];
    
    __weak SCRemoteUserService *weakSelf = self;
    
    [self.http getByUrl:requestUrl
             parameters:[self.authentication signRequestHeaders]
                headers:nil
                success:^(NSData *data) {
                    SCRemoteUserService *sSelf = weakSelf;
                    SCUser *user = nil;
                    NSError *error = nil;
                    user = [sSelf.parser userFromData:data
                                                error:&error];
                    
                    if (user != nil && error == nil) {
                        success(user);
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
