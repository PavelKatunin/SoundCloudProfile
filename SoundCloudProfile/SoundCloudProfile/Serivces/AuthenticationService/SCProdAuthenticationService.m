#import "SCProdAuthenticationService.h"

// You need to set your own Api Key here
static NSString *const kApiKey = @"";
static NSString *const kApiKeyParameter = @"client_id";

@implementation SCProdAuthenticationService

- (NSDictionary *)signRequestHeaders {
    return @{ kApiKeyParameter : kApiKey };
}

@end
