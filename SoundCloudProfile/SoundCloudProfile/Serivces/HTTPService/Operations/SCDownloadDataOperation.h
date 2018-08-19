#import "SCHTTPService.h"
#import "SCAsynchronousOperation.h"
#import <Foundation/Foundation.h>

@interface SCDownloadDataOperation : SCAsynchronousOperation

//input
@property (copy, nonnull) NSURL *url;

//output
@property (readonly, nullable) NSData *data;
@property (readonly, nullable) NSError *error;

- (instancetype)initWithHttpService:(nonnull id <SCHTTPService>)httpService
                                url:(nullable NSURL *)url;

@end
