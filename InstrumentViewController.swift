//
//  InstrumentViewController.swift
//  KnowNotes3
//
//  Created by Wylan L Neely on 12/4/23.
//

import UIKit

class InstrumentViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    var userData: UserData?
    
    @IBOutlet weak var instrumentsCollectionView: UICollectionView!
    
    
       override func viewDidLoad() {
           super.viewDidLoad()
           self.instrumentsCollectionView.dataSource = self
                  // register the cells, so the collectionView will "know" which cell you are referring to.
           self.instrumentsCollectionView.register(UINib(nibName: "InstrumentCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "InstrumentCell")       }
    
    //MARK: - Outlets
    
    @IBOutlet weak var collection: UICollectionView!
    
    //MARK: - CollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            return UICollectionViewCell()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }

}
