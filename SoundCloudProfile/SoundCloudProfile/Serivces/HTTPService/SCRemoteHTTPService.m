#import "SCRemoteHTTPService.h"

@interface SCRemoteHTTPService (Private)

@property (nonatomic, strong, nonnull) NSURLSession *session;

+ (NSDictionary<NSString *, NSString *> *)defaultParameters;

@end

@implementation SCRemoteHTTPService

#pragma mark - Initialization

- (instancetype)init {
    self = [super init];
    if (self != nil) {
        NSURLSessionConfiguration *config = NSURLSessionConfiguration.defaultSessionConfiguration;
        config.timeoutIntervalForRequest = 15.0;
        config.timeoutIntervalForResource = 60.0;
        self.session = [NSURLSession sessionWithConfiguration:config];
    }
    return self;
}

#pragma mark - SCHTTPService

- (void)downloadDataByUrl:(nonnull NSURL *)url success:(SCHTTPSuccess *)success fail:(SCHTTPFail *)fail {
    
}

- (void)getByUrl:(nonnull NSURL *)url
      parameters:(nullable NSDictionary<NSString *,NSString *> *)parameters
         headers:(nullable NSDictionary<NSString *,NSString *> *)headers
         success:(SCHTTPSuccess *)success
            fail:(SCHTTPFail *)fail {
    
}

@end
