#import <Foundation/Foundation.h>
#import "SCHTTPService.h"
#import "SCAsynchronousOperation.h"

@interface SCDownloadGroupDataOperation : SCAsynchronousOperation

//input
@property (copy, nonnull) NSArray<NSURL *> *urls;

//output
@property (readonly, nullable) NSDictionary<NSURL *, NSData *> *groupData;

- (instancetype)initWithHttpService:(nonnull id <SCHTTPService>)httpService;

@end
