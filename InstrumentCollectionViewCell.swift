//
//  InstrumentCollectionViewCell.swift
//  KnowNotes3
//
//  Created by Wylan L Neely on 1/18/24.
//

import UIKit

class InstrumentCollectionViewCell: UICollectionViewCell {

    
    var selectedInstrument: Instrument?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if let selectedInstrument {
            let instrumentImage = selectedInstrument.instrumentImage()
            if (instrumentImage != nil) {
                instrumentImageView.image = instrumentImage
            }
        }
    }
    
    
    @IBOutlet weak var instrumentImageView: UIImageView!
    @IBOutlet weak var instrumentLabel: UILabel!
    
    
}
