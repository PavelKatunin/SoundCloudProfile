#import <Foundation/Foundation.h>
#import "SCProfile.h"

@protocol SCProfileInfoInput <NSObject>

@end

@protocol SCProfileInfoViewProtocol;

@protocol SCProfileInfoPresenterProtocol <NSObject>

@property (nonatomic, weak) id <SCProfileInfoViewProtocol> view;

- (void)didPullToRefresh;
- (void)didLoadView;

@end

@protocol SCProfileInfoViewProtocol <NSObject>

@property (nonatomic, strong) id <SCProfileInfoPresenterProtocol> presenter;
@property (nonatomic, strong) SCProfile *profile;

- (void)showError;

@end
