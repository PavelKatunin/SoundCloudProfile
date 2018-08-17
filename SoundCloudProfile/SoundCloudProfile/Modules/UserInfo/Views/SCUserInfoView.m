#import "SCUserInfoView.h"

static const CGFloat kPadding = 8;

@interface SCUserInfoView ()

- (SCFloatingBackgroundView *)createBackgroundView;
- (UILabel *)createNameLabel;
- (UILabel *)createFullNameLabel;
- (UILabel *)createLocationLabel;
- (UIImageView *)createAvatarImageView;

- (void)activateConstraints;

@end

static SCUserInfoView *CommonInit(SCUserInfoView *self) {
    if (self != nil) {
        SCFloatingBackgroundView *backgroundView = [self createBackgroundView];
        [self addSubview:backgroundView];
        self.backgroundView = backgroundView;
        
        UILabel *nameLabel = [self createNameLabel];
        [self addSubview:nameLabel];
        self.userNameLabel = nameLabel;
        
        UILabel *fullNameLabel = [self createFullNameLabel];
        [self addSubview:fullNameLabel];
        self.fullNameLabel = fullNameLabel;
        
        UILabel *locationLabel = [self createLocationLabel];
        [self addSubview:locationLabel];
        self.locationLabel = locationLabel;
        
        UIImageView *avatarView = [self createAvatarImageView];
        [self addSubview:avatarView];
        self.avatarImageView = avatarView;
        
        [self activateConstraints];
    }
    return self;
}

@implementation SCUserInfoView

#pragma mark - Views

- (UIView *)createBackgroundView {
    SCFloatingBackgroundView *view = [[SCFloatingBackgroundView alloc] initWithBubblesCount:4];
    view.translatesAutoresizingMaskIntoConstraints = false;
    return view;
}

- (UILabel *)createNameLabel {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.translatesAutoresizingMaskIntoConstraints = false;
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    return label;
}

- (UILabel *)createFullNameLabel {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.translatesAutoresizingMaskIntoConstraints = false;
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    return label;
}

- (UILabel *)createLocationLabel {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.translatesAutoresizingMaskIntoConstraints = false;
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    return label;
}

- (UIImageView *)createAvatarImageView {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    imageView.translatesAutoresizingMaskIntoConstraints = false;
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    return imageView;
}

#pragma mark - Initialization

- (instancetype)initWithCoder:(NSCoder *)coder {
    return CommonInit([super initWithCoder:coder]);
}

- (instancetype)initWithFrame:(CGRect)frame {
    return CommonInit([super initWithFrame:frame]);
}

#pragma mark - Layout

- (void)activateConstraints {
    [[self.leftAnchor constraintEqualToAnchor:self.backgroundView.leftAnchor] setActive:YES];
    [[self.rightAnchor constraintEqualToAnchor:self.backgroundView.rightAnchor] setActive:YES];
    [[self.bottomAnchor constraintEqualToAnchor:self.backgroundView.bottomAnchor] setActive:YES];
    [[self.topAnchor constraintEqualToAnchor:self.backgroundView.topAnchor] setActive:YES];
    
    [[self.leftAnchor constraintEqualToAnchor:self.userNameLabel.leftAnchor constant: -kPadding] setActive:YES];
    [[self.topAnchor constraintEqualToAnchor:self.userNameLabel.topAnchor constant: -kPadding] setActive:YES];
    
    [[self.leftAnchor constraintEqualToAnchor:self.fullNameLabel.leftAnchor constant: -kPadding] setActive:YES];
    [[self.fullNameLabel.topAnchor constraintEqualToAnchor:self.userNameLabel.bottomAnchor
                                                  constant:kPadding] setActive:YES];
    
    [[self.centerXAnchor constraintEqualToAnchor:self.avatarImageView.centerXAnchor] setActive:YES];
    [[self.centerYAnchor constraintEqualToAnchor:self.avatarImageView.centerYAnchor] setActive:YES];
    [[self.avatarImageView.widthAnchor constraintEqualToAnchor:self.avatarImageView.heightAnchor] setActive:YES];
    [[self.avatarImageView.widthAnchor constraintEqualToConstant:100] setActive:YES];
    
    [[self.rightAnchor constraintEqualToAnchor:self.locationLabel.rightAnchor constant: kPadding] setActive:YES];
    [[self.bottomAnchor constraintEqualToAnchor:self.locationLabel.bottomAnchor constant: kPadding] setActive:YES];
}

@end
