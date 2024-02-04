//
//  Instrument.swift
//  KnowNotes3
//
//  Created by Wylan L Neely on 12/4/23.
//

import Foundation
import UIKit

class Instrument {
    
    var type: InstrumentType = .grandPiano
    var notes: [Note] = []
    
    func instrumentImage()-> UIImage? {
        
        switch self.type {
        case .accousticGuitar : return UIImage(named: "AcousticGuitar")
        case .electricGuitar : return UIImage(named: "ElectricGuitar")
        case .grandPiano : return UIImage(named: "GrandPiano")
        case .violin : return UIImage(named: "Violin")
        }
    }
    
}

class GrandPiano: Instrument {
    
    override init() {
        super.init()
        self.type = .grandPiano
        self.notes = [A_note,
                      Bb_note,
                      B_note,
                      C_note,
                      Cs_note,
                      D_note,
                      Eb_note,
                      E_note,
                      F_note,
                      Fs_note,
                      G_note,
                      Gs_note]
    }
    
    fileprivate let A_note = Note(name: "A", id: 0, soundPath: "piano_A.wav")
    fileprivate let Bb_note = Note(name: "B♭", id: 1, soundPath: "piano_A#.wav")
    fileprivate let B_note = Note(name: "B", id: 2, soundPath: "piano_B.wav")
    fileprivate let C_note = Note(name: "C", id: 3, soundPath: "piano_C.wav")
    fileprivate let Cs_note = Note(name: "C#", id: 4, soundPath: "piano_C#.wav")
    fileprivate let D_note = Note(name: "D", id: 5, soundPath: "piano_D.wav")
    fileprivate let Eb_note = Note(name: "E♭", id: 6, soundPath: "piano_D#.wav")
    fileprivate let E_note = Note(name: "E", id: 7, soundPath: "piano_E.wav")
    fileprivate let F_note = Note(name: "F", id: 8, soundPath: "piano_F.wav")
    fileprivate let Fs_note = Note(name: "F#", id: 9,  soundPath: "piano_F#.wav")
    fileprivate let G_note = Note(name: "G", id: 10, soundPath: "piano_G.wav")
    fileprivate let Gs_note = Note(name: "G#", id: 11, soundPath: "piano_G#.wav")
    
}

class AcousticGuitar: Instrument {
        
    override init() {
        super.init()
        self.type = .accousticGuitar
        self.notes = [AChord,
                      BChord,
                      CChord,
                      DChord,
                      EChord,
                      FChord,
                      GChord]
    }
    
    fileprivate let AChord = Note(name: "A", id: 0, soundPath: "AcouGuitar_A_Major.wav")
    fileprivate let BChord = Note(name: "B", id: 1, soundPath: "AcouGuitar_B_Major.wav")
    fileprivate let CChord = Note(name: "C", id: 2, soundPath: "AcouGuitar_C_Major.wav")
    fileprivate let DChord = Note(name: "D", id: 3, soundPath: "AcouGuitar_D_Major.wav")
    fileprivate let EChord = Note(name: "E", id: 4, soundPath: "AcouGuitar_E_Major.wav")
    fileprivate let FChord = Note(name: "F", id: 5, soundPath: "AcouGuitar_F_Major.wav")
    fileprivate let GChord = Note(name: "G", id: 6, soundPath: "AcouGuitar_G_Major.wav")

}

class ElectricGuitar: Instrument {
    
    let name = "ElectricPiano"
    
}
class Violin: Instrument {
    
    let name = "Violin"
}

enum InstrumentType: String {
    case grandPiano = "GrandPiano"
    case accousticGuitar = "AccousticGuitar"
    case electricGuitar = "ElectricGuitar"
    case violin = "Violin"
}



