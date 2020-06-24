//
//  TodayTableViewCell.swift
//  Fundall UI
//
//  Created by Aboyeji Tolulope on 24/06/2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class TodayTableViewCell: UITableViewCell {

    @IBOutlet weak var transactionImage: UIImageView!
    @IBOutlet weak var transactionAmount: UILabel!
    @IBOutlet weak var transactionName: UILabel!
    @IBOutlet weak var transactionTime: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
