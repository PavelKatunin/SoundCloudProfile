#import "AppDelegate.h"
#import "SCProfileInfoRouter.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UIViewController *controller = [SCProfileInfoRouter createProfileController];
    self.window.rootViewController = controller;
    return YES;
}

@end
