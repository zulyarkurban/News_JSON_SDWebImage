//
//  customCellTableViewCell.swift
//  news
//
//  Created by Zulyar Kurban on 28/12/2017.
//  Copyright © 2017 Zulyar Kurban. All rights reserved.
//

import UIKit
import SDWebImage
class customCellTableViewCell: UITableViewCell {

    @IBOutlet weak var Customimage: UIImageView!
    @IBOutlet weak var CustomTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
