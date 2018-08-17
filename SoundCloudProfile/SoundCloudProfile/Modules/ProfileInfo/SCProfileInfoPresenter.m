#import "SCProfileInfoPresenter.h"

@interface SCProfileInfoPresenter ()

@property (nonatomic, strong) id <SCProfileService> profileService;
@property (nonatomic, strong) id <SCHTTPService> httpService;

@end

@implementation SCProfileInfoPresenter

#pragma mark - Initialization

- (instancetype)initWithUserProfileService:(id <SCProfileService>)profileService
                               httpService:(id <SCHTTPService>)httpService {
    self = [super init];
    if (self != nil) {
        self.profileService = profileService;
        self.httpService = httpService;
    }
    return self;
}

#pragma mark - Public

- (void)didLoadView {

}

- (void)didPullToRefresh {
    
}

@end
