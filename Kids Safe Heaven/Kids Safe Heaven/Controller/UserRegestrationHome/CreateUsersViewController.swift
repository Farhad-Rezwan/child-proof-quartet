//
//  CreateUsersViewController.swift
//  Kids Safe Heaven
//
//  Created by Farhad Ullah Rezwan on 27/8/20.
//  Copyright © 2020 Farhad Ullah Rezwan. All rights reserved.
//

import UIKit

class CreateUsersViewController: UIViewController, DatabaseListener {
    
    
    
    let userImageArry = [#imageLiteral(resourceName: "zacIntro"),#imageLiteral(resourceName: "krisIntro"),#imageLiteral(resourceName: "rezIntro")]


//    @IBOutlet weak var userCollectionView: UICollectionView!
    @IBOutlet weak var userTableViewCell: UITableView!
    
    var users: [User] = []
    weak var databaseController: DatabaseProtocol?
    var listenerType: ListenerType = .user

    override func viewDidLoad() {
        super.viewDidLoad()
        print(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! as String)
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        cell.textLabel?.text = users[indexPath.row].name
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.highlightedTextColor = .black
        cell.textLabel?.font = .boldSystemFont(ofSize: 25)
        cell.imageView?.image = UIImage(named: users[indexPath.row].avatarName ?? "avatarBoy")

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let viewController = storyboard?.instantiateViewController(identifier: "homeScreenVC") as! HomeScreenViewController
        
        viewController.userName = users[indexPath.row].name
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    
}
