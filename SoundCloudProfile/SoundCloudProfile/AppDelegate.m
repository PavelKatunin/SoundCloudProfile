#import "AppDelegate.h"
#import "SCRemoteHTTPService.h"
#import "SCProfileInfoTableViewController.h"
#import "SCServices.h"
#import "SCProfileInfoPresenter.h"

static NSString *const kProfileId = @"actuallygrimes";

@interface AppDelegate ()

@property (nonatomic, strong) SCRemoteHTTPService *http;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    SCServices *services = [SCServices shared];
    
    SCProfileInfoPresenter *presenter =
        [[SCProfileInfoPresenter alloc] initWithUserProfileService:services.profileService
                                                       httpService:services.httpService];
    SCProfileInfoTableViewController *rootController =
        [[SCProfileInfoTableViewController alloc] initWithStyle:UITableViewStylePlain];
    rootController.presenter = presenter;
    presenter.view = rootController;
    self.window.rootViewController = rootController;
    return YES;
}

@end
