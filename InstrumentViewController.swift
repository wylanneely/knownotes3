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
               // cast the cell as CustomCollectionViewCell to access any property you set inside the custom cell.
               // dequeue cell by the reuseIdentifier, "explain" to the collectionView which cell you are talking about.
               return cell    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }

}
