#import "SCProfileInfoRouter.h"
#import "SCRemoteHTTPService.h"
#import "SCProfileInfoTableViewController.h"
#import "SCServices.h"
#import "SCProfileInfoPresenter.h"

@implementation SCProfileInfoRouter

+ (UIViewController<SCProfileInfoViewProtocol> *)createProfileControllerWithUserId:(NSNumber *)userId {
    SCServices *services = [SCServices shared];
    
    SCProfileInfoPresenter *presenter =
    [[SCProfileInfoPresenter alloc] initWithUserProfileService:services.profileService
                                                   httpService:services.httpService];
    SCProfileInfoTableViewController *controller =
    [[SCProfileInfoTableViewController alloc] initWithStyle:UITableViewStylePlain];
    controller.presenter = presenter;
    presenter.view = controller;
    presenter.userId = userId;
    presenter.router = [[SCProfileInfoRouter alloc] init];
    return controller;
}

@end
