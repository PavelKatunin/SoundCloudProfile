#import "SCHTTPService.h"
#import "SCAsynchronousOperation.h"
#import <Foundation/Foundation.h>

@interface SCDownloadGroupDataOperation : SCAsynchronousOperation

//input
@property (copy, nonnull) NSArray<NSURL *> *urls;

//output
@property (readonly, nullable) NSDictionary<NSURL *, NSData *> *groupData;

- (instancetype)initWithHttpService:(nonnull id <SCHTTPService>)httpService;

@end
