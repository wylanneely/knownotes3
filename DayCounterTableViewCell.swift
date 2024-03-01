//
//  DayCounterTableViewCell.swift
//  MySoberDate
//
//  Created by Wylan L Neely on 2/27/24.
//

import UIKit

class DayCounterTableViewCell: UITableViewCell {
    
    let controller = SoberController()
    var soberData: SoberData?

    override func awakeFromNib() {
        super.awakeFromNib()
        self.soberData = controller.getSoberData()
        setUpLabels()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUpLabels(){
        if let soberData = soberData {
            timeLabel.text = "\(soberData.returnDaysSober())"
            timeTypeLabel.text = "Days"
        }
        
    }
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timeTypeLabel: UILabel!
    
    
}
