//
//  ParkDataCollectionViewCell.swift
//  Kids Safe Heaven
//
//  Created by Farhad Ullah Rezwan on 13/9/20.
//  Copyright © 2020 Farhad Ullah Rezwan. All rights reserved.
//

import UIKit

class ParkDataCollectionViewCell: UICollectionViewCell {
    static var identifier: String = "eachParkCell"

    @IBOutlet weak var numberingImageView: UIImageView!
    @IBOutlet weak var parkName: UILabel!
    @IBOutlet weak var parkSetImage: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.parkName.text = "This is the text"
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }

}
