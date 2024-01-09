//
//  InstrumentSelectViewController.swift
//  KnowNotes3
//
//  Created by Wylan L Neely on 12/4/23.
//

import UIKit

class SelectedInstrumentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
   
        // Do any additional setup after loading the view.
    }
    
  
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    

    
    //MARK: - Buttons
    @IBOutlet weak var startButton: UIButton!
    
    @IBAction func backButtonPressed(_ sender: Any) {
    }
    
    
    @IBOutlet weak var levelChangeButton: UISegmentedControl!
    
    @IBAction func levelChangerSelected(_ sender: Any) {
        if levelChangeButton.selectedSegmentIndex == 0 {
           
            
        } else if levelChangeButton.selectedSegmentIndex == 1 {
            
        } 
        else if levelChangeButton.selectedSegmentIndex == 2 {
            
        }
        
    }
    @IBAction func startButtonPressed(_ sender: Any) {
        
    }
    
    
    
    //MARK: - Images
    
    @IBOutlet weak var instrumentImage: UIImageView!
    @IBOutlet weak var ANoteImage: UIImageView!
    @IBOutlet weak var BNoteImage: UIImageView!
    @IBOutlet weak var CNoteImage: UIImageView!
    @IBOutlet weak var DNoteImage: UIImageView!
    @IBOutlet weak var ENoteImage: UIImageView!
    @IBOutlet weak var FNoteImage: UIImageView!
    @IBOutlet weak var GNoteImage: UIImageView!
    @IBOutlet weak var GSNoteImage: UIImageView!
    @IBOutlet weak var ASNoteImage: UIImageView!
    @IBOutlet weak var CSNoteImage: UIImageView!
    @IBOutlet weak var DSNoteImage: UIImageView!
    @IBOutlet weak var FSNoteImage: UIImageView!
    
    
    
    
}
