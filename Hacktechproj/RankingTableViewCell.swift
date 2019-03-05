//
//  RankingTableViewCell.swift
//  Hacktechproj
//
//  Created by Mohit on 03/03/19.
//  Copyright © 2019 Mohit D. All rights reserved.
//

import UIKit

class RankingTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var Avtrimg: UIImageView!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var ScoreLabel: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
