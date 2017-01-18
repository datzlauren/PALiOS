//
//  FitbitAPI.h
//  PAL
//
//  Created by Lauren Datz on 12/4/16.
//  Copyright © 2016 happy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFOAuth2Manager.h"
@import Firebase;

@interface FitbitAPI : NSObject

#pragma mark Class Functions
+ (instancetype)sharedObject;

#pragma mark Instance Functions
- (BOOL)authorizeFitbitAPI;
//- (void)getRequestToken:(id)sender;
//- (BOOL)testFun;
- (AFOAuthCredential *)getCredential: (NSString*)token forTokenType: (NSString *)token_type forExpiration: (NSString*)expiration;
-(void)getFitbitUserProfile:(AFOAuthCredential*)credential;
-(NSMutableString*)getFitbitSleepData:(AFOAuthCredential*)credential forFirebaseRef: (FIRDatabaseReference*)ref forUser: (NSString*) userID;
-(NSMutableString*)getFitbitActivityData:(AFOAuthCredential*)credential forFirebaseRef: (FIRDatabaseReference*)ref forUser: (NSString*) userID;

@end
