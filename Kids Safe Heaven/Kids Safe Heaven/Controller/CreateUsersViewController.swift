//
//  CreateUsersViewController.swift
//  Kids Safe Heaven
//
//  Created by Farhad Ullah Rezwan on 27/8/20.
//  Copyright © 2020 Farhad Ullah Rezwan. All rights reserved.
//

import UIKit

class CreateUsersViewController: UIViewController {

    @IBOutlet weak var usersTableView: UITableView!
    var userNames: [String] = []
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usersTableView.delegate = self
        usersTableView.dataSource = self
        
        if let userArray = defaults.array(forKey: "usersTableViewCell") as? [String] {
            self.userNames = userArray
            
        }

        

    }
    
    @IBAction func addUserBarButton(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add a new user today", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add User", style: .default) { (action) in
            self.userNames.append(textField.text!)
            
            self.defaults.set(self.userNames, forKey: "userLists")
            self.usersTableView.reloadData()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Write your name"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}

extension CreateUsersViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "usersTableViewCell", for: indexPath)
        cell.textLabel?.text = userNames[indexPath.row]
        return cell
    }
    
    
}
