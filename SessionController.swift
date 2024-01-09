//
//  SessionController.swift
//  KnowNotes3
//
//  Created by Wylan L Neely on 1/2/24.
//

import Foundation


class SessionController {
    
    
    func newGameSession(with instrument: String, level: Int)-> GameSession {
        let gameSession = GameSession(instrumentType: instrument, level: level)
        return gameSession
    }


    
}

