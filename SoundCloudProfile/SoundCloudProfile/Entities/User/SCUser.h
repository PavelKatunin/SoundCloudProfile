#import <Foundation/Foundation.h>

@interface SCUser : NSObject

//required
@property (nonatomic, readonly, nonnull) NSNumber *identifier;
@property (nonatomic, readonly, nonnull) NSString *userName;

//optional
@property (nonatomic, readonly, nullable) NSString *fullName;
@property (nonatomic, readonly, nullable) NSString *userDescription;
@property (nonatomic, readonly, nullable) NSURL *avatarUrl;
@property (nonatomic, readonly, nullable) NSString *country;
@property (nonatomic, readonly, nullable) NSString *city;

- (instancetype)initWithIdentifier:(nonnull NSNumber *)identifier
                          userName:(nonnull NSString *)userName
                          fullName:(nullable NSString *)fullName
                   userDescription:(nullable NSString *)userDescription
                         avatarUrl:(nullable NSURL *)avatarUrl
                           country:(nullable NSString *)country
                              city:(nullable NSString *)city;

@end
