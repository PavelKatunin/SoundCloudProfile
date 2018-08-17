#import <Foundation/Foundation.h>
#import "SCAuthenticationService.h"
#import "SCTracksParser.h"
#import "SCHTTPService.h"
#import "SCTracksService.h"
#import "SCEnvironmentService.h"

@interface SCRemoteTracksService : NSObject <SCTracksService>

- (instancetype)initWithParser:(id <SCTracksParser>)parser
                   httpService:(id <SCHTTPService>)httpService
                authentication:(id <SCAuthenticationService>)authentication
                   environment:(id <SCEnvironmentService>)environment;

@end
