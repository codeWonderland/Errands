//
//  ErrandsTableViewCell.swift
//  Errands
//
//  Created by Alice Easter on 4/2/17.
//  Copyright © 2017 Alice Easter. All rights reserved.
//

import UIKit

class ErrandsTableViewCell: UITableViewCell {

    @IBOutlet weak var messageView: UILabel!
    @IBOutlet weak var authorView: UILabel!
    @IBOutlet weak var timeView: UILabel!
    var uid: String?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
