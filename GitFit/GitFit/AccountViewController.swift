//
//  AccountViewController.swift
//  GitFit
//
//  Created by Tim Johnson on 4/24/22.
//

import UIKit
import Parse

class AccountViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func onLogout(_ sender: Any) {
        PFUser.logOut()
        performSegue(withIdentifier: "unwindToLanding", sender: self)
    }
}
