//
//  FruitTableViewCell.swift
//  fruitsTableExample
//
//  Created by user on 9/15/16.
//  Copyright © 2016 ASU. All rights reserved.
//

import UIKit

class FruitTableViewCell: UITableViewCell {

    @IBOutlet weak var fruitDescription: UILabel!
    @IBOutlet weak var fruitTitle: UILabel!
    @IBOutlet weak var fruitImage: UIImageView!{
       didSet {
        fruitImage.layer.cornerRadius = fruitImage.bounds.width / 2
        fruitImage.clipsToBounds = true
        }
    }
 
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
