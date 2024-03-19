//
//  GratefulListViewController.swift
//  MySoberDate
//
//  Created by Wylan L Neely on 2/28/24.
//

import UIKit
import SwiftData

class GratefulListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    let service = SwiftDatabaseService.shared
    var notes = [GratefulNote]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.viewDidLoad()
        tableView.reloadData()
    }
    
    //MARK: - SwiftData
    
    func fetchData(){
        notes.removeAll()
        service.fetchTasks { data , error in
            if let error {
                print(error)
            }
            
            if let data {
                self.notes = data.reversed()
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            
        }
    }
    
    
    //MARK: - TableView
    
    @IBOutlet weak var tableView: UITableView!
    
    func setUpTableView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "NoteTableViewCell", bundle: nil), forCellReuseIdentifier: "NoteTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let note = notes[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NoteTableViewCell", for: indexPath) as? NoteTableViewCell else {
            return UITableViewCell()
        }
        cell.isSaved = true
        cell.note = note
        cell.awakeFromNib()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 420
    }

}
