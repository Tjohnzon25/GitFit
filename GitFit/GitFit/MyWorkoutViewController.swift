//
//  MyWorkoutViewController.swift
//  GitFit
//
//  Created by Tim Johnson on 4/18/22.
//

import UIKit
import Parse

class MyWorkoutViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var username: String = ""
    
    @IBOutlet weak var tableView: UITableView!
    
    var myWorkouts = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let query = PFQuery(className: "MyWorkouts")
        query.whereKey("User", equalTo: PFUser.current()!)
        
        do{
            myWorkouts = try query.findObjects()
        }catch {}
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyWorkoutCell") as! MyWorkoutCell

        if indexPath.row == 0 {
            cell.titleLabel.text = "Arms"
            let arms: [String] = self.myWorkouts[0]["Arms"] as! Array
            
            var stringOutput: String = ""
            for workout in arms {
                stringOutput += "- \(workout) \n"
            }
            
            cell.workoutsLabel.text = stringOutput
            cell.workoutImageView.image = UIImage(named: "arms")

        } else if indexPath.row == 1 {
            cell.titleLabel.text = "Chest"
            let chest: [String] = self.myWorkouts[0]["Chest"] as! Array
            
            var stringOutput: String = ""
            for workout in chest {
                stringOutput += "- \(workout) \n"
            }
            
            cell.workoutsLabel.text = stringOutput
            cell.workoutImageView.image = UIImage(named: "chest")
        } else if indexPath.row == 2 {
            cell.titleLabel.text = "Back"
            let back: [String] = self.myWorkouts[0]["Back"] as! Array
            
            var stringOutput: String = ""
            for workout in back {
                stringOutput += "- \(workout) \n"
            }
            
            cell.workoutsLabel.text = stringOutput
            cell.workoutImageView.image = UIImage(named: "back")
        } else if indexPath.row == 3 {
            cell.titleLabel.text = "Legs"
            let legs: [String] = self.myWorkouts[0]["Legs"] as! Array
            
            var stringOutput: String = ""
            for workout in legs {
                stringOutput += "- \(workout) \n"
            }
            
            cell.workoutsLabel.text = stringOutput
            cell.workoutImageView.image = UIImage(named: "leg")
        } else if indexPath.row == 4 {
            cell.titleLabel.text = "Triceps"
            let triceps: [String] = self.myWorkouts[0]["Triceps"] as! Array
            
            var stringOutput: String = ""
            for workout in triceps {
                stringOutput += "- \(workout) \n"
            }
            
            cell.workoutsLabel.text = stringOutput
            cell.workoutImageView.image = UIImage(named: "triceps")
        } else if indexPath.row == 5 {
            cell.titleLabel.text = "Biceps"
            let biceps: [String] = self.myWorkouts[0]["Biceps"] as! Array
            
            var stringOutput: String = ""
            for workout in biceps {
                stringOutput += "- \(workout) \n"
            }
            
            cell.workoutsLabel.text = stringOutput
            cell.workoutImageView.image = UIImage(named: "bicep")
        }

        return cell
    }
}
