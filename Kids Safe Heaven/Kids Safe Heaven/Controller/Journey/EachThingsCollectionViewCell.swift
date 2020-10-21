//
//  EachThingsCollectionViewCell.swift
//  Kids Safe Heaven
//
//  Created by Farhad Ullah Rezwan on 10/10/20.
//  Copyright © 2020 Farhad Ullah Rezwan. All rights reserved.
//

import UIKit

class EachThingsCollectionViewCell: UICollectionViewCell {
    
    static var identifier: String = Constants.Identifier.thingsToCarryCollVC
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
}
