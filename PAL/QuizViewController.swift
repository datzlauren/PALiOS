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
            var moodLevel = moodSlider.value
            var worryLevel = worrySlider.value
            var stressLevel = stressSlider.value
    
            let currentDate = NSDate()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd-HH:mm:ss"
            let convertedDate = dateFormatter.string(from: currentDate as Date)
            
            self.ref.child("users").child(user.uid).child("moods").setValue([convertedDate: moodLevel])
            self.ref.child("users").child(user.uid).child("stress").setValue([convertedDate: stressLevel])
            self.ref.child("users").child(user.uid).child("worry").setValue([convertedDate: worryLevel])
        } else {
            let alertController = UIAlertController(title: "Sorry!", message: "No User Logged in!", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)

        }
        
       // var credential = UserDefaults.standard.value(forKey: "credential")
       // FitbitAPI.sharedObject().getFitbitSleepData(credential as! AFOAuthCredential!)
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
