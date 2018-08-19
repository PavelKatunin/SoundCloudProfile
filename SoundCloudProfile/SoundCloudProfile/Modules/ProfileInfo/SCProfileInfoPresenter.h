#import "SCProfileInfoProtocols.h"
#import "SCProfileService.h"
#import "SCHTTPService.h"
#import <Foundation/Foundation.h>

@interface SCProfileInfoPresenter : NSObject <SCProfileInfoPresenterProtocol>

- (instancetype)initWithUserProfileService:(id <SCProfileService>)profileService
                               httpService:(id <SCHTTPService>)httpService;

@property (nonatomic, weak) id <SCProfileInfoViewProtocol> view;

@end
