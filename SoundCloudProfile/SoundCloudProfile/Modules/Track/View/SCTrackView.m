#import "SCTrackView.h"

static const CGFloat kPadding = 8;

@interface SCTrackView ()

- (UILabel *)createTitleLabel;
- (UILabel *)createDurationLabel;
- (UILabel *)createGenreLabel;
- (UIImageView *)createArtworkImageView;
- (void)activateConstraints;

@end

static SCTrackView *CommonInit(SCTrackView *self) {
    if (self != nil) {
        
        UILabel *titleLabel = [self createTitleLabel];
        [self addSubview:titleLabel];
        self.titleLabel = titleLabel;
        
        UILabel *durationLabel = [self createDurationLabel];
        [self addSubview:durationLabel];
        self.durationLabel = durationLabel;
        
        UILabel *genreLabel = [self createGenreLabel];
        [self addSubview:genreLabel];
        self.genreLabel = genreLabel;
        
        UIImageView *artworkImageView = [self createArtworkImageView];
        [self addSubview:artworkImageView];
        self.artworkImageView = artworkImageView;

        [self activateConstraints];
    }
    return self;
}

@implementation SCTrackView

#pragma mark - Views

- (UILabel *)createTitleLabel {
    UILabel *label = [[UILabel alloc] init];
    label.translatesAutoresizingMaskIntoConstraints = NO;
    label.textColor = [UIColor darkTextColor];
    return label;
}

- (UILabel *)createDurationLabel {
    UILabel *label = [[UILabel alloc] init];
    label.translatesAutoresizingMaskIntoConstraints = NO;
    label.font = [UIFont systemFontOfSize:12.];
    return label;
}

- (UILabel *)createGenreLabel {
    UILabel *label = [[UILabel alloc] init];
    label.translatesAutoresizingMaskIntoConstraints = NO;
    label.font = [UIFont systemFontOfSize:12.];
    return label;
}

- (UIImageView *)createArtworkImageView {
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.image = [UIImage imageNamed:@"musicPlaceholder"];
    imageView.clipsToBounds = YES;
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
    [[self.leftAnchor constraintEqualToAnchor:self.artworkImageView.leftAnchor ] setActive:YES];
    [[self.topAnchor constraintEqualToAnchor:self.artworkImageView.topAnchor constant:-kPadding] setActive:YES];
    [[self.bottomAnchor constraintEqualToAnchor:self.artworkImageView.bottomAnchor constant:kPadding] setActive:YES];
    [[self.artworkImageView.widthAnchor constraintEqualToAnchor:self.artworkImageView.heightAnchor multiplier:1]
        setActive:YES];
    
    [[self.titleLabel.leftAnchor constraintEqualToAnchor:self.artworkImageView.rightAnchor constant:kPadding]
        setActive:YES];
    [[self.rightAnchor constraintEqualToAnchor:self.titleLabel.rightAnchor constant:kPadding]
        setActive:YES];
    
    [[self.centerYAnchor constraintEqualToAnchor:self.titleLabel.bottomAnchor constant:0] setActive:YES];
    
    [[self.durationLabel.leftAnchor constraintEqualToAnchor:self.artworkImageView.rightAnchor constant:kPadding]
        setActive:YES];
    [[self.titleLabel.bottomAnchor constraintEqualToAnchor:self.durationLabel.topAnchor constant: -kPadding]
        setActive:YES];
    
    [[self.genreLabel.leftAnchor constraintEqualToAnchor:self.durationLabel.rightAnchor constant: kPadding]
     setActive:YES];
    [[self.titleLabel.bottomAnchor constraintEqualToAnchor:self.genreLabel.topAnchor constant: -kPadding]
     setActive:YES];
}

@end
