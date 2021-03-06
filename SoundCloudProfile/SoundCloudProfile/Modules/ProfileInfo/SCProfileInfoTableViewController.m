#import "SCProfileInfoTableViewController.h"
#import "SCUserInfoView.h"
#import "SCTrackTableViewCell.h"
#import "SCTrack.h"
#import "UIViewController+Toast.h"

static NSString *const kTrackCellId = @"TrackCell";
static const CGFloat kFavoritesTitleLabelFontSize = 17.;
static const CGFloat kFavoritesLabelHeight = 40.;
static const CGFloat kUserInfoViewHeight = 170.;
static const CGFloat kTrackCellHeight = 84.;

@interface SCProfileInfoTableViewController ()

@property (nonatomic, weak) SCUserInfoView *userInfoView;
@property (nonatomic, strong) UIStackView *favoritesHeaderView;

@end

@implementation SCProfileInfoTableViewController

#pragma mark - Public

- (void)setNameText:(NSString *)nameText {
    _nameText = nameText;
     [self updateUserInfoView];
}

- (void)setFullNameText:(NSString *)fullNameText {
    _fullNameText = fullNameText;
    [self updateUserInfoView];
}

- (void)setLocationText:(NSString *)locationText {
    _locationText = locationText;
    [self updateUserInfoView];
}

- (void)stopRefreshing {
    [self.refreshControl endRefreshing];
}

- (void)setTracks:(NSArray<SCTrack *> *)tracks {
    _tracks = tracks;
    [self.tableView reloadData];
}

- (void)setImage:(UIImage *)image {
    _image = image;
    [self updateUserInfoView];
}

- (void)showErrorText:(NSString *)errorText; {
    [self showToastWithMessage:errorText];
    [self.refreshControl endRefreshing];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tracks.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (self.favoritesHeaderView == nil) {
        self.favoritesHeaderView = [self createFavoritesHeaderView];
        [self updateUserInfoView];
    }
    return self.favoritesHeaderView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTrackCellId forIndexPath:indexPath];
    NSAssert([cell isKindOfClass:[SCTrackTableViewCell class]], @"Unsupported cell type");
    SCTrackTableViewCell *trackCell = (SCTrackTableViewCell *)cell;
    SCTrack *track = self.tracks[indexPath.row];
    trackCell.trackView.titleLabel.text = track.title;
    trackCell.trackView.durationLabel.text = track.durationString;
    trackCell.trackView.genreLabel.text = track.genre;
    
    if (track.artworkImageData != nil) {
        UIImage *image = [UIImage imageWithData:track.artworkImageData];
        trackCell.trackView.artworkImageView.image = image;
    }
    return trackCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kTrackCellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - View life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[SCTrackTableViewCell class] forCellReuseIdentifier:kTrackCellId];
    [self.presenter didLoadView];
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self
                            action:@selector(refreshControlDidChangeValue:)
                  forControlEvents:UIControlEventValueChanged];
}

#pragma mark - Private

- (UIStackView *)createFavoritesTitleStack {
    UILabel *favoritesLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    favoritesLabel.translatesAutoresizingMaskIntoConstraints = NO;
    favoritesLabel.text = NSLocalizedString(@"Favorite tracks", nil);
    favoritesLabel.font = [UIFont boldSystemFontOfSize:kFavoritesTitleLabelFontSize];
    [[favoritesLabel.heightAnchor constraintEqualToConstant:kFavoritesLabelHeight] setActive:YES];
    
    UIView *offsetView = [[UIView alloc] initWithFrame:CGRectZero];
    offsetView.translatesAutoresizingMaskIntoConstraints = NO;
    [[offsetView.widthAnchor constraintEqualToConstant:8] setActive:YES];
    [[offsetView.heightAnchor constraintEqualToConstant:kFavoritesLabelHeight] setActive:YES];
    
    UIStackView *stackView = [[UIStackView alloc] initWithArrangedSubviews:@[offsetView, favoritesLabel]];
    stackView.distribution = UIStackViewDistributionFillProportionally;
    stackView.translatesAutoresizingMaskIntoConstraints = NO;
    stackView.axis = UILayoutConstraintAxisHorizontal;
    stackView.backgroundColor = [UIColor greenColor];
    return stackView;
}

- (UIStackView *)createFavoritesHeaderView {
    SCUserInfoView *userInfoView = [[SCUserInfoView alloc] initWithFrame:CGRectZero];
    userInfoView.translatesAutoresizingMaskIntoConstraints = false;
    [[userInfoView.heightAnchor constraintEqualToConstant:kUserInfoViewHeight] setActive:YES];
    [[userInfoView.widthAnchor constraintEqualToConstant:self.view.frame.size.width] setActive:YES];
    self.userInfoView = userInfoView;
    
    UIStackView *favoritesTitleStack = [self createFavoritesTitleStack];
    
    UIStackView *favoritesHeaderView = [[UIStackView alloc] initWithArrangedSubviews: @[userInfoView,
                                                                                        favoritesTitleStack]];
    favoritesHeaderView.axis = UILayoutConstraintAxisVertical;
    favoritesHeaderView.translatesAutoresizingMaskIntoConstraints = NO;
    
    return favoritesHeaderView;
}

- (void)refreshControlDidChangeValue:(id)sender {
    [self.presenter didPullToRefresh];
}

- (void)updateUserInfoView {
    self.userInfoView.userNameLabel.text = self.nameText;
    self.userInfoView.fullNameLabel.text = self.fullNameText;
    self.userInfoView.locationLabel.text = self.locationText;
    self.userInfoView.avatarImageView.image = self.image;
}

@end


