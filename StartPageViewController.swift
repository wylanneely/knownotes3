//
//  StartPageViewController.swift
//  KnowNotes3
//
//  Created by Wylan L Neely on 12/4/23.
//

import UIKit

class StartPageViewController: UIViewController {
    
    let UserDataController = UserController()
    var userData: UserData?

    override func viewDidLoad() {
        super.viewDidLoad()
        //set the initial userdefault data keys and values, should only be ran one time upon opening app
        UserDataController.setDefaultDataValues()
    }
    
    @IBAction func startButtonTapped(_ sender: Any) {
        //ifdoestwork, change code below to viewDidLoad()
        if let savedUserData = UserDataController.getUserData() {
                    self.userData = savedUserData
                }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? InstrumentViewController {
            if let userData = self.userData {
                vc.userData = userData
            }
        }
    }

}
