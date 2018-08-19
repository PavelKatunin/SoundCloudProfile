#import "SCDownloadGroupDataOperation.h"
#import "SCDownloadDataOperation.h"

@interface SCDownloadGroupDataOperation ()

@property (strong, nonnull ) id <SCHTTPService> httpService;
@property (strong, nonnull) NSOperationQueue *queue;
@property (strong, nullable) NSMutableDictionary<NSURL *, NSData *> *internalGroupData;

@end

@implementation SCDownloadGroupDataOperation

#pragma mark - Public

- (NSDictionary<NSURL *,NSData *> *)groupData {
    return self.internalGroupData;
}

#pragma mark - Initialization

- (instancetype)initWithHttpService:(id <SCHTTPService>)httpService {
    self = [super init];
    if (self != nil) {
        self.httpService = httpService;
        self.queue = [[NSOperationQueue alloc] init];
        self.internalGroupData = [[NSMutableDictionary alloc] init];
    }
    return self;
}

#pragma mark - Async tasks

- (void)execute {
    NSMutableArray<SCDownloadDataOperation *> *dataOperations = [[NSMutableArray alloc] init];
    [self.urls enumerateObjectsUsingBlock:^(NSURL * _Nonnull url,
                                            NSUInteger idx,
                                            BOOL * _Nonnull stop) {
        SCDownloadDataOperation *downloadDataOperation =
            [[SCDownloadDataOperation alloc] initWithHttpService:self.httpService url:url];
        [dataOperations addObject:downloadDataOperation];
    }];
    
    NSOperation *dataCompilationOperation = [[NSOperation alloc] init];
    [dataOperations enumerateObjectsUsingBlock:^(SCDownloadDataOperation * _Nonnull operation,
                                                 NSUInteger idx,
                                                 BOOL * _Nonnull stop) {
        [dataCompilationOperation addDependency:operation];
        [self.queue addOperation:operation];
    }];
    
    [self.queue addOperation:dataCompilationOperation];
    dataCompilationOperation.completionBlock = ^{
        [dataOperations enumerateObjectsUsingBlock:^(SCDownloadDataOperation * _Nonnull operation,
                                                     NSUInteger idx,
                                                     BOOL * _Nonnull stop) {
            self.internalGroupData[operation.url] = operation.data;
        }];
        [self completeOperation];
    };
}


@end
