#import "SCDownloadDataOperation.h"

@interface SCDownloadDataOperation ()

@property (strong, nullable) NSData *data;
@property (strong, nullable) NSError *error;
@property (strong, nonnull ) id <SCHTTPService> httpService;

@end

@implementation SCDownloadDataOperation

#pragma mark - Initialization

- (instancetype)initWithHttpService:(id <SCHTTPService>)httpService
                                url:(NSURL *)url {
    self = [super init];
    if (self != nil) {
        self.url = url;
        self.httpService = httpService;
    }
    return self;
}

#pragma mark - Async task

- (void)execute {
    [self.httpService downloadDataByUrl:self.url
                                success:^(NSData *data) {
                                    self.data = data;
                                    [self completeOperation];
                                } fail:^(NSError *error) {
                                    self.error = error;
                                    [self completeOperation];
                                }];
}

@end
