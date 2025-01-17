//
//  ParkEquipmmentCollectionViewCell.swift
//  Kids Safe Heaven
//
//  Created by Farhad Ullah Rezwan on 15/9/20.
//  Copyright © 2020 Farhad Ullah Rezwan. All rights reserved.
//

import UIKit

class ParkEquipmmentCollectionViewCell: UICollectionViewCell {
    
    static var identifier: String = Constants.Identifier.eachEquipmentCell

    @IBOutlet weak var parkEquipmentImage: UIImageView!
    @IBOutlet weak var parkEquipmentNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        /// makes the cell highlighted blue once user clicks it
        let blueView = UIView(frame: bounds)
        blueView.layer.cornerRadius = 15
        blueView.backgroundColor = .systemBlue
        self.selectedBackgroundView = blueView
    }
    
    override init(frame: CGRect) { super.init(frame: frame) }
    required init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder) }
    override func prepareForReuse() { super.prepareForReuse() }
}


