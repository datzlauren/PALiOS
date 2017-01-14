//
//  QuizViewController.swift
//  
//
//  Created by Lauren Datz on 12/18/16.
//
//

import UIKit
import Firebase
import FirebaseAuth

class QuizViewController: UIViewController {
    var ref: FIRDatabaseReference!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = FIRDatabase.database().reference()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var moodSlider: UISlider!
    @IBOutlet weak var worrySlider: UISlider!
    @IBOutlet weak var stressSlider: UISlider!

    @IBAction func submitButton(_ sender: UIButton) {
        if let user =
            FIRAuth.auth()?.currentUser{
            let moodLevel = moodSlider.value
            let worryLevel = worrySlider.value
            let stressLevel = stressSlider.value
    
            let currentDate = NSDate()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd-HH:mm:ss"
            let convertedDate = dateFormatter.string(from: currentDate as Date)
            let userID = user.uid
            self.ref.child("users/\(userID)/moods/\(convertedDate)").setValue(moodLevel)
            self.ref.child("users/\(userID)/worry/\(convertedDate)").setValue(worryLevel)
            self.ref.child("users/\(userID)/stress/\(convertedDate)").setValue(stressLevel)
            //self.ref.child("users").child(user.uid).child("moods").setValue([convertedDate: moodLevel])
            //self.ref.child("users").child(user.uid).child("stress").setValue([convertedDate: stressLevel])
            //self.ref.child("users").child(user.uid).child("worry").setValue([convertedDate: worryLevel])
            // UserDefaults.standard.getValue(forKey:"auth-token");
            
            //move to confirmation page
            /*let alertController = UIAlertController(title: "Thanks!", message: "You have successfully submitted your quiz results; you may exit the app now.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
            
            let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tab") as UIViewController
            self.present(viewController, animated: false, completion: nil)*/
            let alert = UIAlertController(title: "Thanks!", message: "You have successfully submitted your quiz results; you may exit the app now.", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) { (action) -> Void in
                let viewControllerYouWantToPresent = self.storyboard?.instantiateViewController(withIdentifier: "tab")
                self.present(viewControllerYouWantToPresent!, animated: true, completion: nil)
            }
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            
            
        } else {
            let alertController = UIAlertController(title: "Sorry!", message: "No User Logged in!", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)

        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
