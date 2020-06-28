//
//  CardSelectionCell.swift
//  Fundall UI
//
//  Created by Aboyeji Tolulope on 24/06/2020.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

protocol didSelectCard {
    func selectionRow(indexPath: Int)
}

class CardSelectionCell: UITableViewCell {

    @IBOutlet weak var cardSelectionCollectionView: UICollectionView!
    
    var delegate: didSelectCard?
    let cardName = ["Lifestyle Pro","Lifestyle Premium", "Lifestyle Business"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cardSelectionCollectionView.delegate = self
        cardSelectionCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension CardSelectionCell : UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
}

func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 3
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardSelectionCollectionCell", for: indexPath) as! CardSelectionCollectionCell
    cell.cardName.text = cardName[indexPath.row]
    
    return cell
}
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.selectionRow(indexPath: indexPath.row)
    }
}

class CardSelectionCollectionCell: UICollectionViewCell {

    @IBOutlet weak var cardName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

  
    

}
