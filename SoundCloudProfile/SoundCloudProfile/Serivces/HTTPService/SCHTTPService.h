#import <Foundation/Foundation.h>

typedef void (^SCHTTPSuccess)(NSData *data);
typedef void (^SCHTTPFail)(NSError *error);

@protocol SCHTTPService <NSObject>

- (void)getByUrl:(nonnull NSURL *)url
      parameters:(nullable NSDictionary<NSString *, NSString *> *) parameters
         headers:(nullable NSDictionary<NSString *, NSString *> *) headers
         success:(SCHTTPSuccess)success
            fail:(SCHTTPFail)fail;

- (void)downloadDataByUrl:(nonnull NSURL *)url
                  success:(SCHTTPSuccess)success
                     fail:(SCHTTPFail)fail;

@end
