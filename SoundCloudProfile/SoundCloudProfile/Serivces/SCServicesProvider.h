#import <Foundation/Foundation.h>

@protocol SCServicesProvider <NSObject>

@property (atomic, readonly) id <SCUserService> userService;
@property (atomic, readonly) id <SCTracksService> tracksService;
@property (atomic, readonly) id <SCProfileService> profileService;

@end
