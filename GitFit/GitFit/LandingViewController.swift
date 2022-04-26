//
//  LandingViewController.swift
//  GitFit
//
//  Created by Tim Johnson on 4/18/22.
//

import UIKit
import Parse

class LandingViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func onLogin(_ sender: Any) {
        
        let username = usernameTextField.text!
        let password = passwordTextField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password) { user, error in
            if user != nil {
                self.performSegue(withIdentifier: "landingToMain", sender: nil)
            } else {
                print("ERROR: \(String(describing: error?.localizedDescription))")
            }
        }
    }
    
    
    @IBAction func onSignUp(_ sender: Any) {
        
        let user = PFUser()
        user.username = usernameTextField.text
        user.password = passwordTextField.text
        
        user.signUpInBackground{ (success, error) in
            if success {
                
                let MyWorkouts = PFObject(className: "MyWorkouts")
                MyWorkouts["Arms"] = []
                MyWorkouts["Chest"] = []
                MyWorkouts["Back"] = []
                MyWorkouts["Legs"] = []
                MyWorkouts["Biceps"] = []
                MyWorkouts["Triceps"] = []
                MyWorkouts["User"] = PFUser.current()!
                
                MyWorkouts.saveInBackground {
                    (success: Bool, error: Error?) in
                    if (success) {
                        
                        let schedule = PFObject(className: "Schedule")
                        schedule["Monday"] = []
                        schedule["Tuesday"] = []
                        schedule["Wednesday"] = []
                        schedule["Thursday"] = []
                        schedule["Friday"] = []
                        schedule["Saturday"] = []
                        schedule["Sunday"] = []
                        schedule["User"] = PFUser.current()!
                        
                        schedule.saveInBackground {
                            (success: Bool, error: Error?) in
                            if (success) {
                                self.performSegue(withIdentifier: "landingToMain", sender: nil)
                            } else {
                                print("ERROR: \(String(describing: error))")
                            }
                        }
                        
                    } else {
                        print("ERROR: \(String(describing: error?.localizedDescription))")
                    }
                }
            }
        }
    }
    
    @IBAction func unwind( _ seg: UIStoryboardSegue) {
    }
}
