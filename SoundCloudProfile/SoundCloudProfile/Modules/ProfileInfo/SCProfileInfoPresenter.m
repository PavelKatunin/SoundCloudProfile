#import "SCProfileInfoPresenter.h"

//492436158
static const int kUserId = 492436158;
static const NSTimeInterval kUpdateProfileInterval = 120;

@interface SCProfileInfoPresenter ()

@property (nonatomic, strong) id <SCProfileService> profileService;
@property (nonatomic, strong) id <SCHTTPService> httpService;
@property (nonatomic, strong) NSTimer *updateTimer;

@end

@implementation SCProfileInfoPresenter

#pragma mark - Initialization

- (instancetype)initWithUserProfileService:(id <SCProfileService>)profileService
                               httpService:(id <SCHTTPService>)httpService {
    self = [super init];
    if (self != nil) {
        self.profileService = profileService;
        self.httpService = httpService;
        
        __weak SCProfileInfoPresenter *weakSelf = self;
        self.updateTimer = [NSTimer timerWithTimeInterval:kUpdateProfileInterval
                                                  repeats:YES
                                                    block:^(NSTimer * _Nonnull timer) {
                                                        [weakSelf updateProfile];
                                                    }];
        [[NSRunLoop mainRunLoop] addTimer:self.updateTimer forMode:NSRunLoopCommonModes];
    }
    return self;
}

#pragma mark - Public

- (void)didLoadView {
    [self updateProfile];
}

- (void)updateProfile {
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
    [self updateProfile];
}

@end
