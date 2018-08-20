#import "AppDelegate.h"
#import "SCProfileInfoRouter.h"


//492436158
static const int kUserId = 1050063;

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UIViewController *controller = [SCProfileInfoRouter createProfileControllerWithUserId:@(kUserId)];
    self.window.rootViewController = controller;
    return YES;
}

@end
