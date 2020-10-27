//
//  CreateUsersViewController.swift
//  Kids Safe Heaven
//
//  Created by Farhad Ullah Rezwan on 27/8/20.
//  Copyright © 2020 Farhad Ullah Rezwan. All rights reserved.
//

import UIKit

class ChooseUserViewController: UIViewController, DatabaseListener {


    @IBOutlet weak var userTableViewCell: UITableView!
    @IBOutlet weak var addUserButton: UIButton!
    
    weak var databaseController: DatabaseProtocol?
    var users: [User] = []
    var listenerType: ListenerType = .user

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// prints out the database location
        print(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! as String)
        
        /// assigning table view delegates
        userTableViewCell.dataSource = self
        userTableViewCell.delegate = self
        
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        databaseController = appDelegate.databaseController
        /// when view controller appear again the navigation bar is hidden also
        self.navigationController?.navigationBar.isHidden = false
        addUserButton.isHidden = true
        /// validating if the user is empty
        self.title = "You can select from the list of users below"
        if users.count == 0 {
            self.title = "User list empty, click add user button below"
            addUserButton.isHidden = false
        }
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        /// validating if the user is empty
        databaseController?.addListener(listener: self)
        
        self.title = "You can select from the list of users below"
        addUserButton.isHidden = true
        if users.count == 0 {
            self.title = "User list is empty, click on \"add user\" button below"
            addUserButton.isHidden = false
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        databaseController?.removeListener(listener: self)
    }
    
    func onUserScoreChange(change: DatabaseChange, userScore: [Score]) {
        // do nothing
    }
    
    func onUserListChange(change: DatabaseChange, users: [User]) {
        // set the users
        self.users = users
        userTableViewCell.reloadData()
    }
    
    @IBAction func addUserbuttonAction(_ sender: Any) {
        let viewController = storyboard?.instantiateViewController(identifier: Constants.Identifier.newUserViewController) as! NewUserViewController
        navigationController?.popViewController(animated: true)
        navigationController?.pushViewController(viewController, animated: true)
    }
}


extension ChooseUserViewController: UITableViewDataSource, UITableViewDelegate {
    
    /// Returns number of users as cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    /// populating the cell with users information
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        
        cell.textLabel?.text = users[indexPath.row].name
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.highlightedTextColor = .black
        cell.textLabel?.font = .boldSystemFont(ofSize: 25)
        
        if let mascotImage = users[indexPath.row].avatarName {
            
            /// making sure proper mascot is shown
            let mascotToShow = mascotImage + "Intro"
            cell.imageView?.image = UIImage(named:  mascotToShow)
        }
        return cell
    }
    
    /// user selection is proceed to Home Screen View Controller
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = storyboard?.instantiateViewController(identifier: "homeScreenVC") as! HomeScreenViewController
        viewController.user = users[indexPath.row]
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        self.databaseController!.deleteUser(user: users[indexPath.row])
    }
    
    
}
