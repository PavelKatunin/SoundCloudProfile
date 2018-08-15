#import "SCRemoteTracksService.h"

@interface SCRemoteTracksService (Private)

@property (nonatomic, weak) id <SCTracksParser> parser;
@property (nonatomic, weak) id <SCHTTPService> httpService;

@end

@implementation SCRemoteTracksService

#pragma mark - Initialization

- (instancetype)initWithParser:(id <SCTracksParser>)parser
                   httpService:(id <SCHTTPService>)httpService {
    self = [super init];
    if (self != nil) {
        self.parser = parser;
        self.httpService = httpService;
    }
    return self;
}

@end
