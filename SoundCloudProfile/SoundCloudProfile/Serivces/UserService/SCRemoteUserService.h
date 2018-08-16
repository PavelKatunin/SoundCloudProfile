#import <Foundation/Foundation.h>
#import "SCEnvironmentService.h"
#import "SCAuthenticationService.h"
#import "SCHTTPService.h"
#import "SCUserService.h"
#import "SCUserParser.h"

@interface SCRemoteUserService : NSObject <SCUserService>

- (instancetype)initWithEnvironment:(id <SCEnvironmentService>)environment
                     authentication:(id <SCAuthenticationService>)authentication
                               http:(id <SCHTTPService>)http
                             parser:(id <SCUserParser>)parser;

@end
