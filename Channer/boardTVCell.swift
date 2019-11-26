//
//  boardTVCell.swift
//  Channer
//
//  Created by x on 3/23/19.
//  Copyright © 2019 x. All rights reserved.
//

import UIKit

class boardTVCell: UITableViewCell {
    
    @IBOutlet weak var topicImage: UIImageView!
    @IBOutlet weak var topicTextTitle: UILabel!
    @IBOutlet weak var topicTextNoTitle: UILabel!
    @IBOutlet weak var topicStats: UILabel!
    @IBOutlet weak var topicTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
