#import "SCProfileService.h"
#import "SCUserService.h"
#import "SCTracksService.h"
#import "SCHTTPService.h"
#import <Foundation/Foundation.h>

@interface SCRemoteProfileService : NSObject <SCProfileService>

- (instancetype)initWithUserService:(id <SCUserService>)userService
                      tracksService:(id <SCTracksService>)tracksService
                        httpService:(id <SCHTTPService>)httpService;

@end
