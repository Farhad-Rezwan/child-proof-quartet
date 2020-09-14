//
//  NewUserViewController.swift
//  Kids Safe Heaven
//
//  Created by Farhad Ullah Rezwan on 14/9/20.
//  Copyright © 2020 Farhad Ullah Rezwan. All rights reserved.
//

import UIKit

class NewUserViewController: UIViewController, UITextFieldDelegate {
    
    let userImageArry = [#imageLiteral(resourceName: "q7o2"),#imageLiteral(resourceName: "q10o1"),#imageLiteral(resourceName: "opener")]
    
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
    }
    
    @IBAction func saveUser(_ sender: Any) {
        if userName.text != "" && selected != nil {
            let name = userName.text!
            var avatarName = ""
            if selected == 0 {
                avatarName = "q7o2"
            } else if selected == 1 {
                avatarName = "q10o1"
            } else if selected == 2 {
                avatarName = "opener"
            }
            
            

            let _ = databaseController?.addUser(name: name, avatarName: avatarName)
            
            
            navigationController?.popViewController(animated: true)
            return
        }
        
        var errorMessage = "Please ensure all fields are filled: \n"
        
        if userName.text == "" {
            errorMessage += "-must provide name\n"
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
}
