#import "AppDelegate.h"
#import "SCRemoteHTTPService.h"
#import "SCProfileInfoTableViewController.h"

static NSString *const kProfileId = @"actuallygrimes";

@interface AppDelegate ()

@property (nonatomic, strong) SCRemoteHTTPService *http;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    SCProfileInfoTableViewController *rootController =
        [[SCProfileInfoTableViewController alloc] initWithNibName:nil bundle:nil];
    self.window.rootViewController = rootController;
    return YES;
}

@end
