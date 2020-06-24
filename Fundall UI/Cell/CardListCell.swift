//
//  CardListCell.swift
//  Fundall UI
//
//  Created by Aboyeji Tolulope on 24/06/2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class CardListCell: UITableViewCell {

    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var cardName: UILabel!
    @IBOutlet weak var cardAmount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
