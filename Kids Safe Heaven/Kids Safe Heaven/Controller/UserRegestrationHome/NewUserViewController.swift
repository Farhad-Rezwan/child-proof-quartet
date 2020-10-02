//
//  NewUserViewController.swift
//  Kids Safe Heaven
//
//  Created by Farhad Ullah Rezwan on 14/9/20.
//  Copyright © 2020 Farhad Ullah Rezwan. All rights reserved.
//

import UIKit

class NewUserViewController: UIViewController, UITextFieldDelegate {
    
    let userImageArry = [#imageLiteral(resourceName: "zacIntro"),#imageLiteral(resourceName: "krisIntro"),#imageLiteral(resourceName: "rezIntro")]
    
    @IBOutlet weak var option1ButtonImage: UIButton!
    @IBOutlet weak var option2ButtonImage: UIButton!
    @IBOutlet weak var option3ButtonImage: UIButton!
    
    @IBOutlet weak var userName: UITextField!
    weak var databaseController: DatabaseProtocol?
    var selected: Int?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        userName.delegate = self
        
        option1ButtonImage.setBackgroundImage(userImageArry[0], for: .normal)
        option2ButtonImage.setBackgroundImage(userImageArry[1], for: .normal)
        option3ButtonImage.setBackgroundImage(userImageArry[2], for: .normal)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        databaseController = appDelegate.databaseController
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    @IBAction func mascotChoosen(_ sender: UIButton) {
        if sender.tag == 0 {
            selected = 0
        } else if sender.tag == 1 {
            selected = 1
        } else if sender.tag == 2 {
            selected = 2
        }
        let trimmed = userName.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        if trimmed != "" && selected != nil {
            let name = userName.text!
            var avatarName = ""
            if selected == 0 {
                avatarName = "zacIntro"
            } else if selected == 1 {
                avatarName = "krisIntro"
            } else if selected == 2 {
                avatarName = "rezIntro"
            }
            

            let _ = databaseController?.addUser(name: name, avatarName: avatarName)
            
            
            let viewController = storyboard?.instantiateViewController(identifier: "homeScreenVC") as! HomeScreenViewController
            viewController.userName = name
            
            navigationController?.pushViewController(viewController, animated: true)
            
            return
        }
        
        var errorMessage = ""
        
        if trimmed == "" {
            errorMessage += "-Please Enter Name\n"
        }
        
        if selected == nil {
            errorMessage += "-must must choose Mascot"
        }
        
        displayMessage(title: "Not all fields filled", message: errorMessage)
    }
    

    func displayMessage(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let backArrowImage = UIImage(named: "quizBack")
        let renderedImage = backArrowImage?.withRenderingMode(.alwaysOriginal)
        
        // Make the navigation bar background clear
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.backIndicatorImage = renderedImage
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = renderedImage
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
}
