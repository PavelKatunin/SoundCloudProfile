#import "SCTrackTableViewCell.h"
#import "UIView+Constraints.h"

@implementation SCTrackTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self != nil) {
        SCTrackView *trackView = [[SCTrackView alloc] initWithFrame:CGRectZero];
        trackView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:trackView];
        self.trackView = trackView;
        
        [trackView activateConstraintsToWrapView:self.contentView];
    }
    
    return self;
}

- (void)prepareForReuse {
    [super prepareForReuse];
    [self.trackView prepareForReuse];
}

@end
