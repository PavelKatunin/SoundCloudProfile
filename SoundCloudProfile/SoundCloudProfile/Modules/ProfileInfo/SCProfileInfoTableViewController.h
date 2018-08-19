#import "SCProfile.h"
#import "SCProfileInfoProtocols.h"
#import <UIKit/UIKit.h>

@interface SCProfileInfoTableViewController : UITableViewController <SCProfileInfoViewProtocol>

@property (nonatomic, strong) id <SCProfileInfoPresenterProtocol> presenter;
@property (nonatomic, copy, nullable) NSString *nameText;
@property (nonatomic, copy, nullable) NSString *fullNameText;
@property (nonatomic, copy, nullable) NSString *locationText;
@property (nonatomic, strong, nullable) UIImage *image;
@property (nonatomic, strong, nullable) NSArray<SCTrack *> *tracks;

@end
