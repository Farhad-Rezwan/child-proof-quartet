//
//  CreateUsersViewController.swift
//  Kids Safe Heaven
//
//  Created by Farhad Ullah Rezwan on 27/8/20.
//  Copyright © 2020 Farhad Ullah Rezwan. All rights reserved.
//

import UIKit

class CreateUsersViewController: UIViewController, DatabaseListener {
    
    
    
    let userImageArry = [#imageLiteral(resourceName: "q7o2"),#imageLiteral(resourceName: "q10o1"),#imageLiteral(resourceName: "opener")]


    @IBOutlet weak var userCollectionView: UICollectionView!
    
    var users: [User] = []
    weak var databaseController: DatabaseProtocol?
    var listenerType: ListenerType = .user

    override func viewDidLoad() {
        super.viewDidLoad()
        print(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! as String)
        userCollectionView.dataSource = self
        userCollectionView.delegate = self
        
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        databaseController = appDelegate.databaseController


        

    }
    
    @IBAction func addUserBarButton(_ sender: UIBarButtonItem) {

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
        userCollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(users[indexPath.row].name)
    }
    
    
    
    
    
}

extension CreateUsersViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "eachUserCell", for: indexPath) as! UserCollectionViewCell
        
        cell.userName.text = users[indexPath.row].name
        
        let userAvatarImage = users[indexPath.row].avatarName
        
        if userAvatarImage == "q7o2" {
            
            let uiUserImage = userImageArry[0]
            cell.userAvatar.image = uiUserImage
            
        } else if userAvatarImage == "q10o1" {
            
            let uiUserImage = userImageArry[1]
            cell.userAvatar.image = uiUserImage
            
        } else if userAvatarImage == "opener" {
            
            let uiUserImage = userImageArry[2]
            cell.userAvatar.image = uiUserImage
        }

        
        
        return cell
    }
    

    
}
