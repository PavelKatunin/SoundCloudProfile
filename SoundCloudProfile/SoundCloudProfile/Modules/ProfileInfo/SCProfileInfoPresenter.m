#import "SCProfileInfoPresenter.h"

//492436158
static const int kUserId = 492436158;

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
    [self.profileService getProfileByUserId:@(kUserId)
                                    success:^(SCProfile *profile) {
                                        dispatch_async(dispatch_get_main_queue(), ^{
                                            self.view.profile = profile;
                                        });
                                    } fail:^(NSError *error) {
                                        dispatch_async(dispatch_get_main_queue(), ^{
                                            [self.view showError];
                                        });
                                    }];
}

- (void)didPullToRefresh {
    
}

@end
