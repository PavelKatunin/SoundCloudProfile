#import <UIKit/UIKit.h>
#import "SCProfile.h"
#import "SCProfileInfoProtocols.h"

@interface SCProfileInfoTableViewController : UITableViewController <SCProfileInfoViewProtocol>

@property (nonatomic, strong) SCProfile *profile;
@property (nonatomic, strong) id <SCProfileInfoPresenterProtocol> presenter;

@end
