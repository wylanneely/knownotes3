//
//  GameSession.swift
//  KnowNotes3
//
//  Created by Wylan L Neely on 1/3/24.
//

import Foundation

class GameSession {
    
    let instrumentType: String
    
    var score: Int = 0
    var lifes: Int = 5
    var level: Int = 1
    
    var previousNote: Note?
    var currentNote: Note?
    
    init(instrumentType: String, score: Int, lifes: Int, level: Int) {
        self.instrumentType = instrumentType
        self.score = score
        self.lifes = lifes
        self.level = level
    }
    
    init(instrumentType: String, level:Int){
        self.instrumentType = instrumentType
        self.level = level
    }
    
    func resetSession(){
        score = 0
        lifes = 5
        previousNote = nil
        currentNote = nil
    }
    
    
}
