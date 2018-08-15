#import <Foundation/Foundation.h>
#import "SCTracksParser.h"
#import "SCHTTPService.h"

@interface SCRemoteTracksService : NSObject

- (instancetype)initWithParser:(id <SCTracksParser>)parser
                   httpService:(id <SCHTTPService>)httpService;

@end
