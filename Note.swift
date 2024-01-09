//
//  Note.swift
//  KnowNotes3
//
//  Created by Wylan L Neely on 12/12/23.
//

import Foundation

class Note {
    let name: String
    let id: Int
    let soundPath: String?
    var isShuffledExtraNote: Bool = false
    var isRandomlySelected: Bool = false
    
    init(name: String, id: Int, soundPath: String) {
        self.name = name
        self.id = id
        self.soundPath = soundPath
    }
}
