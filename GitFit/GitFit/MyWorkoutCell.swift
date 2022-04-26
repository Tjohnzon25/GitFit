//
//  MyWorkoutCell.swift
//  GitFit
//
//  Created by Tim Johnson on 4/24/22.
//

import UIKit

class MyWorkoutCell: UITableViewCell {
    
    @IBOutlet weak var workoutImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var workoutsLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
