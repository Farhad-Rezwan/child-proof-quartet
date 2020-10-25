//
//  ParkDataCollectionViewCell.swift
//  Kids Safe Heaven
//
//  Created by Farhad Ullah Rezwan on 13/9/20.
//  Copyright © 2020 Farhad Ullah Rezwan. All rights reserved.
//

import UIKit

class ParkDataCollectionViewCell: UICollectionViewCell {
    
    static var identifier: String = Constants.Identifier.eachParkCell

    @IBOutlet weak var numberingImageView: UIImageView!
    @IBOutlet weak var parkName: UILabel!
    @IBOutlet weak var parkSetImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        /// Adds Blue view when user selects a park from the collection view
        let blueView = UIView(frame: bounds)
        blueView.layer.cornerRadius = 30
        blueView.backgroundColor = .systemBlue
        self.selectedBackgroundView = blueView
    }
    
    override init(frame: CGRect) { super.init(frame: frame) }
    required init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder) }
    override func prepareForReuse() { super.prepareForReuse() }
    

}
