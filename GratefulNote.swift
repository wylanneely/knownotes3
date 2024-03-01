//
//  GratefulNote.swift
//  MySoberDate
//
//  Created by Wylan L Neely on 2/28/24.
//

import Foundation
import SwiftData


@Model
class GratefulNote {
    
    let date: Date
    var good: String
    var grateful: String
    var goal: String
    
    init(date: Date, good: String, grateful: String, goal: String) {
        self.date = date
        self.good = good
        self.grateful = grateful
        self.goal = goal
    }
    
    
}
