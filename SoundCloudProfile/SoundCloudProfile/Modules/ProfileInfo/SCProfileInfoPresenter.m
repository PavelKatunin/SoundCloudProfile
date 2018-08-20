#import "SCProfileInfoPresenter.h"

static const NSTimeInterval kUpdateProfileInterval = 120;

@interface SCProfileInfoPresenter ()

@property (nonatomic, strong) id <SCProfileService> profileService;
@property (nonatomic, strong) id <SCHTTPService> httpService;
@property (nonatomic, strong) NSTimer *updateTimer;
@property (nonatomic, strong) SCProfile *profile;

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
                                                        [weakSelf stratUpdatingProfile];
                                                    }];
        [[NSRunLoop mainRunLoop] addTimer:self.updateTimer forMode:NSRunLoopCommonModes];
    }
    return self;
}

#pragma mark - Public

- (void)didLoadView {
    [self stratUpdatingProfile];
}

- (void)stratUpdatingProfile {
    __weak SCProfileInfoPresenter *weakSelf = self;
    [self.profileService getProfileByUserId:self.userId
                                    success:^(SCProfile *profile) {
                                        dispatch_async(dispatch_get_main_queue(), ^{
                                            weakSelf.profile = profile;
                                            [weakSelf updateViewProfile];
                                            [weakSelf.view stopRefreshing];
                                        });
                                    } fail:^(NSError *error) {
                                        dispatch_async(dispatch_get_main_queue(), ^{
                                            [weakSelf.view showErrorText:NSLocalizedString(@" Updating profile error ",
                                                                                           nil)];
                                            [weakSelf.view stopRefreshing];
                                        });
                                    }];
}

- (void)didPullToRefresh {
    [self stratUpdatingProfile];
}

- (void)updateViewProfile {
    SCUser *user = self.profile.user;
    self.view.nameText = user.userName != nil ? user.userName : @"";
    if (![user.userName isEqualToString:user.fullName]) {
        self.view.fullNameText = user.fullName != nil ? user.fullName : @"";
    }
    else {
        self.view.fullNameText = @"";
    }
    
    NSString *locationString = @"";
    
    if (user.city != nil) {
        locationString = [locationString stringByAppendingString:[NSString stringWithFormat:@"%@, ", user.city]];
    }
    
    if (user.country != nil) {
        locationString = [locationString stringByAppendingString:user.country];
    }
    
    self.view.locationText = locationString;
    
    if (self.profile.avtarImageData != nil) {
        UIImage *image = [UIImage imageWithData:self.profile.avtarImageData];
        self.view.image = image;
    }
    
    self.view.tracks = self.profile.tracks;
}

@end
