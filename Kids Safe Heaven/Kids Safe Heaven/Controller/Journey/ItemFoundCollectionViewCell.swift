//
//  ItemFoundCollectionViewCell.swift
//  Kids Safe Heaven
//
//  Created by Farhad Ullah Rezwan on 16/10/20.
//  Copyright © 2020 Farhad Ullah Rezwan. All rights reserved.
//

import UIKit

class ItemFoundCollectionViewCell: UICollectionViewCell {
    static var identifier: String = "itemFoundCell"
    
    @IBOutlet weak var itemFoundImage: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        itemFoundImage.image = UIImage(named: "spotTheDHintChoosen")
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
