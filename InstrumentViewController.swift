//
//  InstrumentViewController.swift
//  KnowNotes3
//
//  Created by Wylan L Neely on 12/4/23.
//

import UIKit

class InstrumentViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    var userData: UserData?
        
    
       override func viewDidLoad() {
           super.viewDidLoad()
           self.collectionView.dataSource = self
                  // register the cells, so the collectionView will "know" which cell you are referring to.
           self.collectionView.register(UINib(nibName: "InstrumentCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "InstrumentCell")       }
    
    //MARK: - Outlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - CollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //if this doesnt work then change instrumentsCollectionView to collectionView
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customReuseIdentifier", for: indexPath) as! InstrumentCollectionViewCell
        guard let userData = userData else {
            printContent("Error unwrapping userdata")
            return cell
        }
        
        switch indexPath.row {
        case 0: cell.instrumentType = userData.grandPiano
        case 1: cell.instrumentType = userData.accousticGuitar
        case 2: cell.instrumentType = userData.violin
        case 3: cell.instrumentType = userData.electricGuitar
        default:
            break
        }
               return cell    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }

}
