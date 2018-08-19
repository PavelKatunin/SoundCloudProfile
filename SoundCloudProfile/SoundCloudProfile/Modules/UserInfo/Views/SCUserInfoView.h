#import "SCFloatingBackgroundView.h"
#import <UIKit/UIKit.h>

@interface SCUserInfoView : UIView

@property (nonatomic, weak) UIImageView *avatarImageView;
@property (nonatomic, weak) UILabel *userNameLabel;
@property (nonatomic, weak) UILabel *fullNameLabel;
@property (nonatomic, weak) UILabel *locationLabel;
@property (nonatomic, weak) SCFloatingBackgroundView *backgroundView;

@end
