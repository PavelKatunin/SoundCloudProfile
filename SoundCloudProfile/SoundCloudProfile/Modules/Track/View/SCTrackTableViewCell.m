#import "SCTrackTableViewCell.h"

@implementation SCTrackTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self != nil) {
        SCTrackView *trackView = [[SCTrackView alloc] initWithFrame:CGRectZero];
        trackView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:trackView];
        self.trackView = trackView;
        
        //TODO: Move to layout extension
        [[trackView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor] setActive:YES];
        [[trackView.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor] setActive:YES];
        [[trackView.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor] setActive:YES];
        [[trackView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor] setActive:YES];
    }
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
