//
//  SoberDate.swift
//  MySoberData
//
//  Created by Wylan L Neely on 2/23/24.
//

import Foundation


class SoberData {
    
    let soberDate: Date
    let dailyDollarAmount: Int
    
    init(soberDate: Date, dailyDollarAmount: Int) {
        self.soberDate = soberDate
        self.dailyDollarAmount = dailyDollarAmount
    }
    
    func returnFormattedDate()-> String {
        let df = DateFormatter()
        df.dateStyle = .medium
        df.timeStyle = .none
        return df.string(from: self.soberDate)
    }
    
    func calculateMoneySaved()->Int{
        
        let days = returnDaysSober()
        
        return (dailyDollarAmount * days)
    }
    
    func returnDaysSober()->Int{
        let calendar = Calendar.current
       let days = calendar.numberOfDaysBetween(from: soberDate, to: Date())
       return days
    }
    
}

class SoberController {
    
    var soberData: SoberData?
    
    func store(soberData: SoberData){
        self.soberData = soberData
        UserDefaults.standard.setValue(soberData.soberDate, forKey: keySoberDate)
        UserDefaults.standard.setValue(soberData.dailyDollarAmount, forKey: keyDollarAmount)
    }
    
    func getSoberData()->SoberData?{
        guard let soberDate = UserDefaults.standard.object(forKey: keySoberDate) as? Date, let dollarAmount = UserDefaults.standard.object(forKey: keyDollarAmount) as? Int else {
            return nil
        }
        let sData = SoberData(soberDate: soberDate, dailyDollarAmount: dollarAmount)
        return sData
    }
    //MARK: Keys
    
    
    let keySoberDate: String = "SoberDate"
    let keyDollarAmount: String = "DollarAmount"
    
}


