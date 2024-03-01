//
//  SoberSettingsViewController.swift
//  MySoberDate
//
//  Created by Wylan L Neely on 2/28/24.
//

import UIKit
import SwiftData

class SoberSettingsViewController: UIViewController {
    
    let soberController = SoberController()
    var soberData: SoberData?
    
    var delegate: ReloaderDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        self.soberData = soberController.getSoberData()
        
        setUpDatePicker()
        let dformatter = DateFormatter()
        dformatter.dateStyle = .medium
        dformatter.timeStyle = .none
        
        if let soberData = soberData {
            soberDateLabel.text = dformatter.string(from: soberData.soberDate)
            dailyDollarTextField.text = "\(soberData.dailyDollarAmount)"
            saveUpdateButton.isHidden = true
            buttomImageView.isHidden = true
            let displayDate = soberData.soberDate
            soberDateLabel.text = dformatter.string(from: displayDate)
            soberDatePicker.date = displayDate
            saveUpdateButton.setTitle("Update", for: .normal)
        } else  {
            saveUpdateButton.isHidden = false
            buttomImageView.isHidden = false
            saveUpdateButton.setTitle("Save", for: .normal)
            let todaysDate = Date()
            soberDateLabel.text = dformatter.string(from: todaysDate)
        }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.viewDidLoad()
    }
    
    
    
    func setUpDatePicker(){
        soberDatePicker.tintColor = UIColor(.white)
        soberDatePicker.maximumDate = Date()
    }
    
    
    
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    //MARK: - Outlets
    @IBOutlet weak var soberDateLabel: UILabel!
    @IBOutlet weak var soberDatePicker: UIDatePicker!
    @IBOutlet weak var dailyDollarTextField: UITextField!
    @IBOutlet weak var saveUpdateButton: UIButton!
    @IBOutlet weak var buttomImageView: UIImageView!
    
    @IBAction func datePickerSelected(_ sender: Any) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        let selectedDate = dateFormatter.string(from: soberDatePicker.date)
        soberDateLabel.text = selectedDate
        
        checkHideButton()
        
    }
    
    @IBAction func dollarTextChanged(_ sender: Any) {
        checkHideButton()
    }
    
    @IBAction func infoButtonTapped(_ sender: Any) {
        
        
    }
    
    
    func checkHideButton(){
        let newData = createSoberData()
        if newData.soberDate == self.soberData?.soberDate && newData.dailyDollarAmount == self.soberData?.dailyDollarAmount {
            saveUpdateButton.isHidden = true
            buttomImageView.isHidden = true
        } else {
            saveUpdateButton.isHidden = false
            buttomImageView.isHidden = false
        }    }
    
    @IBAction func saveUpdateButtonTapped(_ sender: Any) {
        let savedSoberData = createSoberData()
        self.soberData = savedSoberData
        soberController.store(soberData:savedSoberData)
        saveUpdateButton.isHidden = true
        buttomImageView.isHidden = true
        delegate?.reloadTableView()
    }
    
    func createSoberData()->SoberData{
        let dollarAmount = getDollarIntFromTextfield()
        let soberDate = soberDatePicker.date
        return SoberData(soberDate: soberDate, dailyDollarAmount: dollarAmount)
    }
    
    
    
    func getDollarIntFromTextfield()->Int{
        guard let dollar = Int(dailyDollarTextField.text ?? "0") else {
            return 0
        }
        return dollar
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let vc = segue.destination as? HomeTableViewController {
            vc.soberData = soberData
        }
        
    }
    
    
}

// Create the protocol
protocol ReloaderDelegate {
    func reloadTableView()
}
