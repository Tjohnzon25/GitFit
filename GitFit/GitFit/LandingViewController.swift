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
                self.performSegue(withIdentifier: "landingToMain", sender: nil)
            } else {
                print("ERROR: \(String(describing: error?.localizedDescription))")
            }
        }
    }
    
}
