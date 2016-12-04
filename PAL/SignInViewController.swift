//
//  SignInViewController.swift
//  PAL
//
//  Created by Lauren Datz on 11/12/16.
//  Copyright © 2016 happy. All rights reserved.
//
import UIKit
import Firebase
import FirebaseAuth
import SafariServices

class SignInViewController: UIViewController {
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signOutButton: UIButton!
    private var urlString:String = "https://google.com"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let user =
            FIRAuth.auth()?.currentUser {
            self.signOutButton.alpha = 1.0
            self.userNameLabel.text = user.email
        } else {
            self.signOutButton.alpha = 0.0
            self.userNameLabel.text = "Please sign in or create an account!"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func createAccountAction(_ sender: Any) {
        if self.emailTextField.text! == "" || self.passwordTextField.text == "" {
            let alertController = UIAlertController(title: "Sorry!", message: "Please enter email and password", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        } else {
            FIRAuth.auth()?.createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: { (user, error) in
                if error == nil {
                    self.signOutButton.alpha = 1.0
                    self.userNameLabel.text = user!.email
                    self.emailTextField.text = ""
                    self.passwordTextField.text = ""
                } else {
                    let alertController = UIAlertController(title: "Sorry!", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            })
        }

    }

    @IBAction func signInAction(_ sender: Any) {
        
        let fitbitAPI = FitbitAPI.sharedObject()
        fitbitAPI?.authorizeFitbitAPI()
        
        
        /*if self.emailTextField.text! == "" || self.passwordTextField.text == "" {
            let alertController = UIAlertController(title: "Sorry!", message: "Please enter email and password", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        } else {
            FIRAuth.auth()?.signIn(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: { (user, error) in
                if error == nil {
                    print ("sign in success")
                    self.signOutButton.alpha = 1.0
                    self.userNameLabel.text = user!.email
                    self.emailTextField.text = ""
                    self.passwordTextField.text = ""
                    
                    print ("about to show safari view")
                    //attempt to show google.com in a safari viewer
                    let svc = SFSafariViewController(url: NSURL(string: self.urlString)! as URL)
                    self.present(svc, animated: true, completion: nil)
                } else {
                    let alertController = UIAlertController(title: "Sorry!", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            })
            
        }*/

    }
    
    
    
    @IBAction func signOutAction(_ sender: Any) {
        try! FIRAuth.auth()?.signOut()
        self.userNameLabel.text = "Please sign in or create an account!"
        self.emailTextField.text = ""
        self.passwordTextField.text = ""
        self.signOutButton.alpha = 0.0
    }
    
    
    
}
