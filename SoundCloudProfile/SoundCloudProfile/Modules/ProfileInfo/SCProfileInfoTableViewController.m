#import "SCProfileInfoTableViewController.h"
#import "SCUserInfoView.h"
#import "SCTrackTableViewCell.h"
#import "SCTrack.h"

static NSString *const kTrackCellId = @"TrackCell";

@interface SCProfileInfoTableViewController ()

@property (nonatomic, strong) SCUserInfoView *userInfoView;

@end

@implementation SCProfileInfoTableViewController

#pragma mark - Public

- (void)setProfile:(SCProfile *)profile {
    _profile = profile;
    [self updateUserInfoView];
    [self.tableView reloadData];
}

- (void)showError {
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"%ld", self.profile.tracks.count);
    return self.profile.tracks.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (self.userInfoView == nil) {
        SCUserInfoView *userInfoView = [[SCUserInfoView alloc] initWithFrame:CGRectZero];
        userInfoView.translatesAutoresizingMaskIntoConstraints = false;
        [[userInfoView.heightAnchor constraintEqualToConstant:170] setActive:YES];
        [[userInfoView.widthAnchor constraintEqualToConstant:self.view.frame.size.width] setActive:YES];
        self.userInfoView = userInfoView;
        [self updateUserInfoView];
    }
    return self.userInfoView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTrackCellId forIndexPath:indexPath];
    NSAssert([cell isKindOfClass:[SCTrackTableViewCell class]], @"Unsupported cell type");
    SCTrackTableViewCell *trackCell = (SCTrackTableViewCell *)cell;
    SCTrack *track = self.profile.tracks[indexPath.row];
    trackCell.trackView.titleLabel.text = track.title;
    trackCell.trackView.durationLabel.text = track.durationString;
    trackCell.trackView.genreLabel.text = track.genre;
    return trackCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 84.;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - View life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[SCTrackTableViewCell class] forCellReuseIdentifier:kTrackCellId];
    [self.presenter didLoadView];
}

#pragma mark - Private

//TODO: Move to presenter
- (void)updateUserInfoView {
    SCUser *user = self.profile.user;
    self.userInfoView.userNameLabel.text = user.userName != nil ? user.userName : @"";
    if (![user.userName isEqualToString:user.fullName]) {
        self.userInfoView.fullNameLabel.text = user.fullName != nil ? user.fullName : @"";
    }
    else {
        self.userInfoView.fullNameLabel.text = @"";
    }
    
    NSString *locationString = @"";
    
    if (user.city != nil) {
        locationString = [locationString stringByAppendingString:[NSString stringWithFormat:@"%@, ", user.city]];
    }
    
    if (user.country != nil) {
        locationString = [locationString stringByAppendingString:user.country];
    }
    
    self.userInfoView.locationLabel.text = locationString;
    
    if (self.profile.avtarImageData != nil) {
        UIImage *image = [UIImage imageWithData:self.profile.avtarImageData];
        self.userInfoView.avatarImageView.image = image;
    }

}

@end
