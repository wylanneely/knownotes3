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
    var isAccGuitarUnlocked: Bool = false
    var isViolinUnlocked:Bool = false
    var isElectricGuitarUnlocked: Bool = false
    
    //MARK: - High Scores
    
    var grandPianoHScore: Int = 0
    var accGuitarHScore: Int = 0
    var violinHScore: Int = 0
    var electricGuitarHScore: Int = 0
    
    //MARK: - Rounds Unlocked
    
    //Grand Piano
    var isGPRound1Unlocked: Bool = true
    var isGPRound2Unlocked: Bool = false
    var isGPRound3Unlocked: Bool = false
    
    //Accoustic Guitar // if instrument is unlocked, round1 is unlocked
    var isAGRound2Unlocked: Bool = false
    var isAGRound3Unlocked: Bool = false
    //Violin
    var isVRound2Unlocked: Bool = false
    var isVRound3Unlocked: Bool = false
    //Electric Guitar
    var isEGRound2Unlocked: Bool = false
    var isEGRound3Unlocked: Bool = false
    
    init(isGrandPianoUnlocked: Bool, isAccGuitarUnlocked: Bool, isViolinUnlocked: Bool, isElectricGuitarUnlocked: Bool, grandPianoHScore: Int, accGuitarHScore: Int, violinHScore: Int, electricGuitarHScore: Int) {
        self.isGrandPianoUnlocked = isGrandPianoUnlocked
        self.isAccGuitarUnlocked = isAccGuitarUnlocked
        self.isViolinUnlocked = isViolinUnlocked
        self.isElectricGuitarUnlocked = isElectricGuitarUnlocked
        self.grandPianoHScore = grandPianoHScore
        self.accGuitarHScore = accGuitarHScore
        self.violinHScore = violinHScore
        self.electricGuitarHScore = electricGuitarHScore
        if grandPianoHScore < 10 {
            self.isGPRound1Unlocked = true
            self.isGPRound2Unlocked = false
            self.isGPRound3Unlocked = false
        } else if grandPianoHScore > 10 && grandPianoHScore < 25 {
            self.isGPRound1Unlocked = true
            self.isGPRound2Unlocked = true
            self.isGPRound3Unlocked = false
        } else {
            self.isGPRound1Unlocked = true
            self.isGPRound2Unlocked = true
            self.isGPRound3Unlocked = true
        }
        if accGuitarHScore < 10 {
            self.isAGRound2Unlocked = false
            self.isAGRound3Unlocked = false
        } else if accGuitarHScore > 10 && accGuitarHScore < 25 {
            self.isAGRound2Unlocked = true
            self.isAGRound3Unlocked = false
        } else {
            self.isAGRound2Unlocked = true
            self.isAGRound3Unlocked = true
        }
        if violinHScore < 10 {
            self.isVRound2Unlocked = false
            self.isVRound3Unlocked = false
        } else if violinHScore > 10 && violinHScore < 25 {
            self.isVRound2Unlocked = true
            self.isVRound3Unlocked = false
        } else {
            self.isVRound2Unlocked = true
            self.isVRound3Unlocked = true
        }
        
        if electricGuitarHScore < 10 {
            self.isEGRound2Unlocked = false
            self.isEGRound3Unlocked = false
        } else if electricGuitarHScore > 10 && electricGuitarHScore < 25 {
            self.isEGRound2Unlocked = true
            self.isEGRound3Unlocked = false
        } else {
            self.isEGRound2Unlocked = true
            self.isEGRound3Unlocked = true
        }
    }
    
}

class UserController {
    
    //MARK: - Create
    
    func getUserData()->UserData? {
        guard let gPianoScore = UserDefaults.standard.object(forKey: keyGrandPianoHS) as? Int,
              let accouGuitarScore = UserDefaults.standard.object(forKey: keyAccGuitarHS) as? Int,
              let violinScore = UserDefaults.standard.object(forKey: keyViolinHS) as? Int,
              let eGuitarScore = UserDefaults.standard.object(forKey: keyEGuitarHS) as? Int,
              let isAccGuitarUnlocked = UserDefaults.standard.object(forKey: keyIsAccGuitar) as? Bool,
              let isViolinUnlocked = UserDefaults.standard.object(forKey: keyIsViolin) as? Bool,
              let isElecGuitarUnlocked = UserDefaults.standard.object(forKey: keyIsEGuitar) as? Bool
        else {
            return nil
        }
        let userData = UserData(isGrandPianoUnlocked: true, isAccGuitarUnlocked: isAccGuitarUnlocked, isViolinUnlocked: isViolinUnlocked, isElectricGuitarUnlocked: isElecGuitarUnlocked, grandPianoHScore: gPianoScore, accGuitarHScore: accouGuitarScore, violinHScore: violinScore, electricGuitarHScore: eGuitarScore)
                return userData
    }
    
    //MARK: - Save
    func saveHighScore(score:Int, type: InstrumentType){
        switch type {
            //if scoreis higher than 30 it will unlock the next instrument
        case .grandPiano:
            UserDefaults.standard.setValue(score, forKey: keyGrandPianoHS)
            if score >= 40 { UserDefaults.standard.setValue(true, forKey: keyIsAccGuitar) }
        case .accousticGuitar:
            UserDefaults.standard.setValue(score, forKey: keyAccGuitarHS)
            if score >= 40 { UserDefaults.standard.setValue(true, forKey: keyIsViolin) }
        case .violin:
            UserDefaults.standard.setValue(score, forKey: keyViolinHS)
            if score >= 40 { UserDefaults.standard.setValue(true, forKey: keyIsEGuitar) }
        case .electricGuitar:
            UserDefaults.standard.setValue(score, forKey: keyEGuitarHS)
        }
    }
    
    func setDefaultDataValues(){
        //function to set the default values of the main UDerData components
        if UserDefaults.standard.object(forKey: keyGrandPianoHS) == nil {
            //user high scores
            let score: Int = 0
            UserDefaults.standard.setValue(score, forKey: keyGrandPianoHS)
            UserDefaults.standard.setValue(score, forKey: keyAccGuitarHS)
            UserDefaults.standard.setValue(score, forKey: keyViolinHS)
            UserDefaults.standard.setValue(score, forKey: keyEGuitarHS)
            //unlocked instruments
            UserDefaults.standard.setValue(false, forKey: keyIsAccGuitar)
            UserDefaults.standard.setValue(false, forKey: keyIsViolin)
            UserDefaults.standard.setValue(false, forKey: keyIsEGuitar)
        }
    }

    
    
    
    //MARK: - UserDefaults Keys
    //instruments
    let keyIsAccGuitar: String = "isAccousticGuitarUnlocked"
    let keyIsViolin: String = "isViolinUnlocked"
    let keyIsEGuitar: String = "isElectricGuitarKeyUnlocked"
    //scores
    let keyGrandPianoHS: String = "GrandPianoHS"
    let keyAccGuitarHS: String = "AccousticGuitarHS"
    let keyViolinHS: String = "ViolinHS"
    let keyEGuitarHS: String = "ElectricGuitarHS"
    
}
