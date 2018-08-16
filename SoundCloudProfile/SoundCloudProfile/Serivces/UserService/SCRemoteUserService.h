#import <Foundation/Foundation.h>
#import "SCEnvironmentService.h"
#import "SCAuthenticationService.h"
#import "SCHTTPService.h"

@interface SCRemoteUserService : NSObject

- (instancetype)initWithEnvironment:(id <SCEnvironmentService>)environment
                     authentication:(id <SCAuthenticationService>)authentication
                               http:(id <SCHTTPService>)http;

@end
