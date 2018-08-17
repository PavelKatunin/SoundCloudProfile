#import "SCProfileInfoTableViewController.h"
#import "SCUserInfoView.h"

@interface SCProfileInfoTableViewController ()

@property (nonatomic, strong) SCUserInfoView *userInfoView;

@end

@implementation SCProfileInfoTableViewController

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.profile.tracks.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    SCUserInfoView *userInfoView = [[SCUserInfoView alloc] initWithFrame:CGRectZero];
    userInfoView.translatesAutoresizingMaskIntoConstraints = false;
    [[userInfoView.heightAnchor constraintEqualToConstant:150] setActive:YES];
    [[userInfoView.widthAnchor constraintEqualToConstant:self.view.frame.size.width] setActive:YES];
    self.userInfoView = userInfoView;
    return userInfoView;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

#pragma mark - Private

- (void)updateUserInfoView {
    SCUser *user = self.profile.user;
    self.userInfoView.userNameLabel.text = user.userName;
    self.userInfoView.fullNameLabel.text = user.fullName;
    self.userInfoView.locationLabel.text = [NSString stringWithFormat:@"%@, %@", user.city, user.country];
}

@end
