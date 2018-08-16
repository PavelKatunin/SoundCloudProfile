#import "SCProdEnvironmentService.h"

@implementation SCProdEnvironmentService

- (NSURL *)apiBaseUrl {
    return [NSURL URLWithString:@"https://api.soundcloud.com"];
}

@end
