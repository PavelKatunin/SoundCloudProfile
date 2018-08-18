#import <Foundation/Foundation.h>
#import "SCProfile.h"
#import "SCTrack.h"
#import <UIKit/UIKit.h>

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
@property (nonatomic, copy, nullable) NSString *nameText;
@property (nonatomic, copy, nullable) NSString *fullNameText;
@property (nonatomic, copy, nullable) NSString *locationText;
@property (nonatomic, strong, nullable) UIImage *image;
@property (nonatomic, strong, nullable) NSArray<SCTrack *> *tracks;

- (void)showError;
- (void)stopRefreshing;

@end
