#import "SCProfileInfoRouter.h"
#import "SCRemoteHTTPService.h"
#import "SCProfileInfoTableViewController.h"
#import "SCServices.h"
#import "SCProfileInfoPresenter.h"

@implementation SCProfileInfoRouter

+ (UIViewController<SCProfileInfoViewProtocol> *)createProfileController {
    SCServices *services = [SCServices shared];
    
    SCProfileInfoPresenter *presenter =
    [[SCProfileInfoPresenter alloc] initWithUserProfileService:services.profileService
                                                   httpService:services.httpService];
    SCProfileInfoTableViewController *controller =
    [[SCProfileInfoTableViewController alloc] initWithStyle:UITableViewStylePlain];
    controller.presenter = presenter;
    presenter.view = controller;
    return controller;
}

@end
