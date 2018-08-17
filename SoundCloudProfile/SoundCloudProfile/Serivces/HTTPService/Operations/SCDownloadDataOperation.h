#import <Foundation/Foundation.h>
#import "SCHTTPService.h"
#import "SCAsynchronousOperation.h"

@interface SCDownloadDataOperation : SCAsynchronousOperation

//input
@property (nonatomic, readonly, nonnull) NSURL *url;

//output
@property (nonatomic, readonly, nullable) NSData *data;
@property (nonatomic, readonly, nullable) NSError *error;

- (instancetype)initWithHttpService:(nonnull id <SCHTTPService>)httpService
                                url:(nonnull NSURL *)url;

@end
