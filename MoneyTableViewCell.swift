//
//  MoneyTableViewCell.swift
//  MySoberDate
//
//  Created by Wylan L Neely on 2/27/24.
//

import UIKit

class MoneyTableViewCell: UITableViewCell {
    
    let controller = SoberController()
    var soberData: SoberData?

    override func awakeFromNib() {
        super.awakeFromNib()
        self.soberData = controller.getSoberData()
        setUpLabel()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUpLabel(){
        if let soberData = soberData {
            moneyLabel.text = "$\(soberData.calculateMoneySaved())"
        }
    }
    
    @IBOutlet weak var moneyLabel: UILabel!
    
}
