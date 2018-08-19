#import "SCUserService.h"
#import "SCTracksService.h"
#import "SCProfileService.h"
#import "SCHTTPService.h"
#import <Foundation/Foundation.h>

@protocol SCServicesProvider <NSObject>

@property (nonatomic, readonly) id <SCHTTPService> httpService;
@property (nonatomic, readonly) id <SCUserService> userService;
@property (nonatomic, readonly) id <SCTracksService> tracksService;
@property (nonatomic, readonly) id <SCProfileService> profileService;

@end
