//
//  UserData.swift
//  KnowNotes3
//
//  Created by Wylan L Neely on 2/2/24.
//

import Foundation


class UserData {
    
    //MARK: - Instruments Unlocked
    
    var isGrandPianoUnlocked: Bool = true
    var isAccousticGuitarUnlocked: Bool = false
    var isViolinUnlocked:Bool = false
    var isElectricGuitarUnlocked: Bool = false
    
    //MARK: - High Scores
    
    var grandPianoHScore: Int = 0
    var accousticGuitarHScore: Int = 0
    var violinHScore: Int = 0
    var electricGuitarHScore: Int = 0
    
    //MARK: - Rounds Unlocked
    
    //Grand Piano
    var isGPRound1Unlocked: Bool = true
    var isGPRound2Unlocked: Bool = false
    var isGPRound3UNlocked: Bool = false
    
    //Accoustic Guitar // if instrument is unlocked, round1 is unlocked
    var isAGRound2Unlocked: Bool = false
    var isAGRound3Unlocked: Bool = false
    //Violin
    var isVRound2Unlocked: Bool = false
    var isVRound3Unlocked: Bool = false
    //Electric Guitar
    var isEGRound2Unlocked: Bool = false
    var isEGROund3Unlocked: Bool = false
    
}

class UserController {
    
    
    
    
    
    //MARK: - UserDefaults Keys
    //instruments
    let accousticGuitarKey: String = "isAccousticGuitarUnlocked"
    let violinKey: String = "isViolinUnlocked"
    let electricGuitarKey: String = "isElectricGuitarKeyUnlocked"
    //scores
    let grandPianoHSKey: String = ""
    
    
}
