#import "UIViewController+Toast.h"

static const int kToastLabelTag = 9;
static const CGFloat kBottomOffset = 40.;

@implementation UIViewController (Toast)

- (void)showToastWithMessage:(NSString *)message {

    const NSTimeInterval alertDisapperTimeInSeconds = 3.0;
    
    UILabel *toastLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    toastLabel.translatesAutoresizingMaskIntoConstraints = NO;
    toastLabel.tag = kToastLabelTag;
    toastLabel.text = message;
    toastLabel.textColor = [UIColor whiteColor];
    
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];

    
    [window addSubview:toastLabel];
    
    [[toastLabel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor] setActive:YES];
    [[toastLabel.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant: -kBottomOffset] setActive:YES];
    toastLabel.backgroundColor = [UIColor colorWithWhite:0. alpha:0.5];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(alertDisapperTimeInSeconds * NSEC_PER_SEC)),
                   dispatch_get_main_queue(), ^{
                       [[window viewWithTag:kToastLabelTag] removeFromSuperview];
                   });
}

@end
