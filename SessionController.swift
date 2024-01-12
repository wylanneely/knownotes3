//
//  SessionController.swift
//  KnowNotes3
//
//  Created by Wylan L Neely on 1/2/24.
//

import Foundation


class SessionController {
    
    var gameSession: GameSession?
    
    func newGameSession(with instrument: String, level: Int)-> GameSession {
        let gameSession = GameSession(instrumentType: instrument, level: level)
        self.gameSession = gameSession
        return gameSession
    }
    
    func resetGameSession(){
        gameSession = nil
    }
    
}

