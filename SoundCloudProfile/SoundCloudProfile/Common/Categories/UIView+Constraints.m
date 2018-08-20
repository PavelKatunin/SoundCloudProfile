#import "UIView+Constraints.h"

@implementation UIView (Constraints)

- (void)activateConstraintsToWrapView:(UIView *)view {
    [[self.topAnchor constraintEqualToAnchor:view.topAnchor] setActive:YES];
    [[self.leftAnchor constraintEqualToAnchor:view.leftAnchor] setActive:YES];
    [[self.rightAnchor constraintEqualToAnchor:view.rightAnchor] setActive:YES];
    [[self.bottomAnchor constraintEqualToAnchor:view.bottomAnchor] setActive:YES];
}

@end
