//
//  threadRepliesCell.swift
//  Channer
//
//  Created by x on 3/24/19.
//  Copyright © 2019 x. All rights reserved.
//

import UIKit

class threadRepliesCell: UITableViewCell {

    @IBOutlet weak var threadImage: UIButton!
    @IBOutlet weak var replyText: UITextView!
    @IBOutlet weak var boardReplyCount: UILabel!
    @IBOutlet weak var threadReplyCount: UILabel!
    @IBOutlet weak var replyTextNoImage: UITextView!
    @IBOutlet weak var thread: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
