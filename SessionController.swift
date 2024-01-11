//
//  SessionController.swift
//  KnowNotes3
//
//  Created by Wylan L Neely on 1/2/24.
//

import Foundation


class SessionController {
    
    var session: GameSession?
    
    func newGameSession(with instrument: String, level: Int)-> GameSession {
        let gameSession = GameSession(instrumentType: instrument, level: level)
        self.session = gameSession
        return gameSession
    }
    
    
}

