//
//  InstrumentViewController.swift
//  KnowNotes3
//
//  Created by Wylan L Neely on 12/4/23.
//

import UIKit

class InstrumentViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collection: UICollectionView!
       
       override func viewDidLoad() {
           super.viewDidLoad()

           // Do any additional setup after loading the view.
       }

    
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

   

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
