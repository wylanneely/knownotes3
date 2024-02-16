//
//  InstrumentCollectionViewCell.swift
//  KnowNotes3
//
//  Created by Wylan L Neely on 1/18/24.
//

import UIKit

class InstrumentCollectionViewCell: UICollectionViewCell {
    
    var image: UIImage?
    var instrumentType: InstrumentType?
    var isUnlocked: Bool = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if let image {
                instrumentImageView.image = image
        }
    }
    
    @IBOutlet weak var instrumentImageView: UIImageView!
    @IBOutlet weak var instrumentLabel: UILabel!

}
