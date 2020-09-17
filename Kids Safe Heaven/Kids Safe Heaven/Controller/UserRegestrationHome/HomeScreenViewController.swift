//
//  HomeScreenViewController.swift
//  Kids Safe Heaven
//
//  Created by Farhad Ullah Rezwan on 30/8/20.
//  Copyright © 2020 Farhad Ullah Rezwan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class HomeScreenViewController: UIViewController, DatabaseListener{
    
    
    
    @IBOutlet weak var openerAvater: UIImageView!
    @IBAction func quizButton(_ sender: Any) {
    }
    @IBAction func locationButton(_ sender: Any) {
    }
    
    weak var databaseController: DatabaseProtocol?
    var listenerType: ListenerType = .all
    var userName: String?
    var user: User?
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        databaseController = appDelegate.databaseController
        user = databaseController?.getUser(userName: userName!)
        
        var openerStr = user?.avatarName
        openerStr! += "HC"
        openerAvater.image = UIImage(named: openerStr ?? " ")
        
                let backButton = UIBarButtonItem()
                backButton.title = "" //in your case it will be empty or you can put the title of your choice
                self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }

    func onUserScoreChange(change: DatabaseChange, userScore: [Score]) {
    }
    
    func onUserListChange(change: DatabaseChange, users: [User]) {
        print("user choosen")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSendUserData" {
            let destination = segue.destination as! SearhParkCollectionViewController
            destination.userName = user?.avatarName
        }
    }
}
