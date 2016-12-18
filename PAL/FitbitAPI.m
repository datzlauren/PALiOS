//
//  FitbitAPI.m
//  PAL
//
//  Created by Lauren Datz on 12/4/16.
//  Copyright © 2016 happy. All rights reserved.
//

#import "FitbitAPI.h"
#import "AFOAuth2Manager.h"

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#pragma mark Forward Declarations
@class FitbitAPI;

#pragma mark Class Constants
/// The shared Fitbit API object.
static FitbitAPI *sharedObject = nil;

@implementation FitbitAPI

# pragma mark Initializers
+ (instancetype)sharedObject
{
    @synchronized (self) {
        if (!sharedObject) {
            sharedObject = [[FitbitAPI alloc] init];
        }
    }
    return sharedObject;
}

#pragma mark Fitbit API
- (BOOL)authorizeFitbitAPI
{
    /*return [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.fitbit.com/oauth2/authorize?response_type=token&client_id=227Y9G&redirect_uri=PAL%3A%2F%2Foauth-callback&scope=activity%20heartrate%20location%20nutrition%20profile%20settings%20sleep%20social%20weight&expires_in=604800"]];
     */
     return [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.fitbit.com/oauth2/authorize?response_type=token&client_id=227Y9G&redirect_uri=PAL%3A%2F%2F&scope=activity%20heartrate%20location%20nutrition%20profile%20settings%20sleep%20social%20weight&expires_in=604800"]];

}
-(BOOL) testFun {
    [[[UIAlertView alloc] initWithTitle:@"It worked!" message: @"testFun!" delegate:nil cancelButtonTitle:@"Okay!" otherButtonTitles:nil] show];
    return true;
}

- (AFOAuthCredential *)getCredential:(NSString*)token: forTokenType:(NSString *)token_type forExpiration:(NSString*)expiration
{
    
    AFOAuthCredential *credential = [AFOAuthCredential credentialWithOAuthToken:token tokenType: token_type];

    // Expiration is optional, but recommended in the OAuth2 spec. It not provide, assume distantFuture === never expires
    NSDate *expireDate = [NSDate distantFuture];
    id expiresIn = expiration;
    if (expiresIn && ![expiresIn isEqual:[NSNull null]]) {
        expireDate = [NSDate dateWithTimeIntervalSinceNow:[expiresIn doubleValue]];
    }
    
    if (expireDate) {
        [credential setExpiration:expireDate];
    }
    return credential;
    /*static NSString *CLIENT_ID = @"227Y9G";
    static NSString *CONSUMER_SECRET = @"28e83c4530d40238ef36fad77bdf6f40";
    NSLog(@"%@", [[NSUserDefaults standardUserDefaults] dictionaryRepresentation]);
    NSString *strCode  = [[NSUserDefaults standardUserDefaults] valueForKey:@"auth_code"];
    NSURL *baseURL = [NSURL URLWithString:@"https://www.fitbit.com/oauth2/authorize"];
    
    AFOAuth2Manager *OAuth2Manager = [AFOAuth2Manager managerWithBaseURL:baseURL clientID:CLIENT_ID secret:CONSUMER_SECRET];
    OAuth2Manager.responseSerializer.acceptableContentTypes = [OAuth2Manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
    //NSDictionary *dict = @{@"client_id":CLIENT_ID, @"grant_type":@"authorization_code",@"redirect_uri":@"Pro-Fit://fitbit",@"code":strCode};
    NSDictionary *dict = @{@"client_id":CLIENT_ID, @"grant_type":@"authorization_code",@"redirect_uri":@"PAL://",@"code":strCode};
    [OAuth2Manager authenticateUsingOAuthWithURLString:@"https://api.fitbit.com/oauth2/token" parameters:dict success:^(AFOAuthCredential *credential) {
        
        // you can save this credential object for further use
        // inside it you can find access token also
        NSLog(@"Token: %@", credential.accessToken);
        
        [[[UIAlertView alloc] initWithTitle:@"It worked!" message:[NSString stringWithFormat:@"Token: %@", credential.accessToken] delegate:nil cancelButtonTitle:@"Okay!" otherButtonTitles:nil] show];
        
    } failure:^(NSError *error) {
        [[[UIAlertView alloc] initWithTitle:@"It didn't work :(" message:[NSString stringWithFormat:@"Sad :( %@", error.userInfo] delegate:nil cancelButtonTitle:@"Okay!" otherButtonTitles:nil] show];
    }];*/
}
                                   
#pragma mark NSURLConnection Delegate


@end
