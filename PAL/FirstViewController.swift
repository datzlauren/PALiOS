//
//  FirstViewController.swift
//  PAL
//
//  Created by Lauren Datz on 11/8/16.
//  Copyright © 2016 happy. All rights reserved.
//

import UIKit
import OAuthSwift

class FirstViewController: OAuthViewController {
    // oauth swift object (retain)
    var oauthswift: OAuthSwift?
    
    var currentParameters = [String: String]()
    
//    let formData = Semaphore<FormViewControllerData>()
    
    
}

extension FirstViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print ("hello from firstviewcontroller")
        currentParameters = [
            "consumerKey" : "227Y9G",
            "consumerSecret" : "28e83c4530d40238ef36fad77bdf6f40"
        ]
       // doOAuthFitbit2(currentParameters)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    /*func doOAuthFitbit2(_ serviceParameters: [String:String]) {
        print("In Auth fitbit2")
        let oauthswift = OAuth2Swift(
            consumerKey:    serviceParameters["consumerKey"]!,
            consumerSecret: serviceParameters["consumerSecret"]!,
            authorizeUrl:   "https://www.fitbit.com/oauth2/authorize",
            accessTokenUrl: "https://api.fitbit.com/oauth2/token",
            responseType:   "code"
        )
        print("created oauthswift")
        oauthswift.accessTokenBasicAuthentification = true
        
        self.oauthswift = oauthswift
        print("about to create handler")
        let handler = SafariURLHandler(viewController: self, oauthSwift: self.oauthswift!)
        oauthswift.authorizeURLHandler = handler
        let state = generateState(withLength: 20)
        print("about to authorize")
        let _ = oauthswift.authorize(
            withCallbackURL: URL(string: "PAL://oauth-callback")!, scope: "profile weight", state: state,
            success: { credential, response, parameters in
                //self.showTokenAlert(name: serviceParameters["name"], credential: credential)
                //self.testFitbit2(oauthswift)
                print("authorize succes")
        },
            failure: { error in
                print("authorize failed")
                print(error.description)
        }
        )
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*func getURLHandler() -> OAuthSwiftURLHandlerType {
            
                if #available(iOS 9.0, *) {
                    let handler = SafariURLHandler(viewController: self, oauthSwift: self.oauthswift!)
                    handler.presentCompletion = {
                        print("Safari presented")
                    }
                    handler.dismissCompletion = {
                        print("Safari dismissed")
                    }
                    return handler
                }
           
            return OAuthSwiftOpenURLExternally.sharedInstance
        }*/
        
    }
struct FormViewControllerData {
    var key: String
    var secret: String
}
extension FirstViewController {
    
    var key: String? { return self.currentParameters["consumerKey"] }
    var secret: String? {return self.currentParameters["consumerSecret"] }
    
    func didValidate(key: String?, secret: String?) {
        self.dismissForm()
        
        self.formData.publish(data: FormViewControllerData(key: key ?? "", secret: secret ?? ""))
    }
    
    func didCancel() {
        self.dismissForm()
        
        self.formData.cancel()
    }
    
    func dismissForm() {
        #if os(iOS)
            /*self.dismissViewControllerAnimated(true) { // without animation controller
             print("form dismissed")
             }*/
            let _ = self.navigationController?.popViewController(animated: true)
        #endif
    }
}

// Little utility class to wait on data
class Semaphore<T> {
    let segueSemaphore = DispatchSemaphore(value: 0)
    var data: T?
    
    func waitData(timeout: DispatchTime? = nil) -> T? {
        if let timeout = timeout {
            let _ = segueSemaphore.wait(timeout: timeout) // wait user
        } else {
            segueSemaphore.wait()
        }
        return data
    }
    
    func publish(data: T) {
        self.data = data
        segueSemaphore.signal()
    }
    
    func cancel() {
        segueSemaphore.signal()
    }*/
}

