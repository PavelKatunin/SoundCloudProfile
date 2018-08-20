#import "SCProfile.h"
#import "SCTrack.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol SCProfileInfoInput <NSObject>

@property (nonatomic, copy) NSNumber *userId;

@end

@protocol SCProfileInfoViewProtocol;

@protocol SCProfileInfoRouterProtocol

+ (UIViewController<SCProfileInfoViewProtocol> *)createProfileControllerWithUserId:(NSNumber *)userId;

@end

@protocol SCProfileInfoPresenterProtocol <NSObject, SCProfileInfoInput>

@property (nonatomic, weak) id <SCProfileInfoViewProtocol> view;
@property (nonatomic, strong) id <SCProfileInfoRouterProtocol> router;

- (void)didPullToRefresh;
- (void)didLoadView;

@end

@protocol SCProfileInfoViewProtocol <NSObject>

@property (nonatomic, strong) id <SCProfileInfoPresenterProtocol> presenter;
@property (nonatomic, copy, nullable) NSString *nameText;
@property (nonatomic, copy, nullable) NSString *fullNameText;
@property (nonatomic, copy, nullable) NSString *locationText;
@property (nonatomic, strong, nullable) UIImage *image;
@property (nonatomic, strong, nullable) NSArray<SCTrack *> *tracks;

- (void)showErrorText:(NSString *)errorText;
- (void)stopRefreshing;

@end
