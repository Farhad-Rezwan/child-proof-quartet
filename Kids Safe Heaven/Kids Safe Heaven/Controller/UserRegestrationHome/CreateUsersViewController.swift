//
//  CreateUsersViewController.swift
//  Kids Safe Heaven
//
//  Created by Farhad Ullah Rezwan on 27/8/20.
//  Copyright © 2020 Farhad Ullah Rezwan. All rights reserved.
//

import UIKit

class CreateUsersViewController: UIViewController, DatabaseListener {


    @IBOutlet weak var userTableViewCell: UITableView!
    
    weak var databaseController: DatabaseProtocol?
    let userImageArry = [#imageLiteral(resourceName: "zac"),#imageLiteral(resourceName: "kris"),#imageLiteral(resourceName: "rez")]
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
    }
    
    @IBAction func addUserBarButton(_ sender: UIBarButtonItem) {

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let backArrowImage = UIImage(named: "quizBack")
        let renderedImage = backArrowImage?.withRenderingMode(.alwaysOriginal)
        
//         Make the navigation bar background clear
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.backIndicatorImage = renderedImage
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = renderedImage

        databaseController?.addListener(listener: self)
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
    
}


extension CreateUsersViewController: UITableViewDataSource, UITableViewDelegate {
    
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
        viewController.userName = users[indexPath.row].name
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    
}
