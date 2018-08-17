#import "SCProfileInfoTableViewController.h"
#import "SCUserInfoView.h"

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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (self.userInfoView == nil) {
        SCUserInfoView *userInfoView = [[SCUserInfoView alloc] initWithFrame:CGRectZero];
        userInfoView.translatesAutoresizingMaskIntoConstraints = false;
        [[userInfoView.heightAnchor constraintEqualToConstant:150] setActive:YES];
        [[userInfoView.widthAnchor constraintEqualToConstant:self.view.frame.size.width] setActive:YES];
        self.userInfoView = userInfoView;
        [self updateUserInfoView];
    }
    return self.userInfoView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTrackCellId forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}

#pragma mark - View life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.presenter didLoadView];
}

#pragma mark - Private

- (void)updateUserInfoView {
    SCUser *user = self.profile.user;
    self.userInfoView.userNameLabel.text = user.userName != nil ? user.userName : @"";
    if (![user.userName isEqualToString:user.fullName]) {
        self.userInfoView.fullNameLabel.text = user.fullName != nil ? user.fullName : @"";
    }
    else {
        self.userInfoView.fullNameLabel.text = @"";
    }
    self.userInfoView.locationLabel.text = [NSString stringWithFormat:@"%@, %@", user.city, user.country];
}

@end
