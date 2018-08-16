#import "SCRemoteHTTPService.h"
#import "NSDictionary+HTTP.h"

@interface SCRemoteHTTPService ()

@property (nonatomic, strong, nonnull) NSURLSession *session;

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

- (void)downloadDataByUrl:(nonnull NSURL *)url
                  success:(SCHTTPSuccess)success
                     fail:(SCHTTPFail)fail {
    
}

- (void)getByUrl:(nonnull NSURL *)url
      parameters:(nullable NSDictionary<NSString *,NSString *> *)parameters
         headers:(nullable NSDictionary<NSString *,NSString *> *)headers
         success:(SCHTTPSuccess)success
            fail:(SCHTTPFail)fail {
    
    NSString *requestUrlString = [NSString stringWithFormat:@"?%@", [parameters parametersString]];
    NSURL *requestUrl = [url URLByAppendingPathComponent:requestUrlString];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:requestUrl
                                                                cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                            timeoutInterval:15.0];
    request.HTTPMethod = @"GET";
    request.allHTTPHeaderFields = headers;
    
    [[self.session dataTaskWithRequest:request
                     completionHandler:^(NSData * _Nullable data,
                                         NSURLResponse * _Nullable response,
                                         NSError * _Nullable error) {
                         if (data == nil && error != nil) {
                             fail(error);
                         }
                         else {
                            success(data);
                         }
    }] resume];
}

@end
