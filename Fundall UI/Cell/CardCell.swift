//
//  CardCell.swift
//  Fundall UI
//
//  Created by Aboyeji Tolulope on 24/06/2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class CardCell: UITableViewCell {
    let cardName = ["Fundall Lifestyle Card","Rave Dollar Card", "Providus Card"]


    @IBOutlet weak var cardCollectionView: UICollectionView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.cardCollectionView.delegate = self
        self.cardCollectionView.dataSource = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension CardCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
}

func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 3
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCollectionCell", for: indexPath) as! CardCollectionCell
    cell.cardsName.text = cardName[indexPath.row]
    
    
    return cell
}
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
class CardCollectionCell: UICollectionViewCell {

    @IBOutlet weak var cards: UIView!
    @IBOutlet weak var cardsName: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

