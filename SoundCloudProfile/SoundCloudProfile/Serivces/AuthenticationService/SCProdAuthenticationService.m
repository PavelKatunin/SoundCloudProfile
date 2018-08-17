#import "SCProdAuthenticationService.h"

// You need to set your own Api Key here
static NSString *const kApiKey = @"c23089b7e88643b5b839c4b8609fce3b";
static NSString *const kApiKeyParameter = @"client_id";

@implementation SCProdAuthenticationService

- (NSDictionary *)signRequestHeaders {
    return @{ kApiKeyParameter : kApiKey };
}

@end
