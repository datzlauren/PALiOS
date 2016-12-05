//
//  AppDelegate.swift
//  PAL
//
//  Created by Lauren Datz on 11/8/16.
//  Copyright © 2016 happy. All rights reserved.
//

import UIKit
import Firebase
import OAuthSwift

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    
/*    func application(_ application: UIApplication, open url: URL, sourceApplication: String?) -> Bool {
        
        // Override point for customization after application launch.
        /*if (url.host == "oauth-callback") {
            OAuthSwift.handle(url: url)
            print("yes called")
            
        }*/
        
        return true
    }*/
    func application(_ app: UIApplication, open url: URL, sourceApplication: String?) -> Bool {
        
        UIAlertView(title: "please", message: "show up", delegate: nil, cancelButtonTitle: "Okay").show();
        FitbitAPI.sharedObject().getRequestToken(nil)
        return true
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        UIAlertView(title: "did finish please", message: "show up", delegate: nil, cancelButtonTitle: "Okay").show();
        FIRApp.configure()
        return true
    }
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        UIAlertView(title: "please will finish", message: "show up", delegate: nil, cancelButtonTitle: "Okay").show();
        return true
    }
    //LOOK HERE
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        UIAlertView(title: "please", message: "show up", delegate: nil, cancelButtonTitle: "Okay").show();
        FitbitAPI.sharedObject().getRequestToken(nil)
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        UIAlertView(title: "did become active", message: "show up", delegate: nil, cancelButtonTitle: "Okay").show();
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        UIAlertView(title: "please", message: "show up", delegate: nil, cancelButtonTitle: "Okay").show();
    }


}
/*extension AppDelegate {
 
 func applicationHandle(url: URL) {
 if (url.host == "oauth-callback") {
 OAuthSwift.handle(url: url)
 } else {
 // Google provider is the only one wuth your.bundle.id url schema.
 OAuthSwift.handle(url: url)
 }
 }
 }*/

