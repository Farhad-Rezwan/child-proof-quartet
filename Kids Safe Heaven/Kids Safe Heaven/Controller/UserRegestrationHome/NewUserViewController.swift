//
//  NewUserViewController.swift
//  Kids Safe Heaven
//
//  Created by Farhad Ullah Rezwan on 14/9/20.
//  Copyright © 2020 Farhad Ullah Rezwan. All rights reserved.
//

import UIKit

class NewUserViewController: UIViewController, UITextFieldDelegate {
    
    /// avatar images male
    let userImageArry = [#imageLiteral(resourceName: "zacIntro"),#imageLiteral(resourceName: "krisIntro"),#imageLiteral(resourceName: "rezIntro"), #imageLiteral(resourceName: "miaIntro"), #imageLiteral(resourceName: "emmaIntro")]
    var user: User?
    
    @IBOutlet weak var option1ButtonImage: UIButton!
    @IBOutlet weak var option2ButtonImage: UIButton!
    @IBOutlet weak var option3ButtonImage: UIButton!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var genderSegment: UISegmentedControl!
    weak var databaseController: DatabaseProtocol?
    
    /// Integer that defines which avatar in the userImageArray user selected
    var selected: Int?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Assigning text field delegate.
        /// Making sure that when user presses return button, or presses anywhere else in the screen  keyboard is hidden
        userName.delegate = self
        
        /// Database delegate
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        databaseController = appDelegate.databaseController

        /// Assigning avatar into button for the users to choose from
        option1ButtonImage.setBackgroundImage(userImageArry[0], for: .normal)
        option2ButtonImage.setBackgroundImage(userImageArry[1], for: .normal)
        option3ButtonImage.setBackgroundImage(userImageArry[2], for: .normal)
        
    }
    /// making the text field return button close the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    /// when user presses anywhere else other than keyboard the keyboard will hide
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    /// all the button in the scren assigns users with proper name
    /// - Parameter sender: UIButton is used as parameter so that we can use the tag
    @IBAction func mascotChoosen(_ sender: UIButton) {
        if sender.tag == 0 {
            if genderSegment.selectedSegmentIndex == 0 {
                selected = 0
            } else {
                selected = 3
            }
        } else if sender.tag == 1 {
            selected = 1
        } else if sender.tag == 2 {
            if genderSegment.selectedSegmentIndex == 0 {
                selected = 2
            } else {
                selected = 4
            }
        }
        
        /// making sure user name has no spaces, also validates user name, if empty provides message
        let trimmed = userName.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let userContains = databaseController?.getUser(userName: trimmed ?? " ")
        if trimmed != "" && selected != nil && userContains == nil {
            let name = userName.text!
            var avatarName = ""
            
            /// making sure that user has selected any of the avatar
            if selected == 0 {
                avatarName = Constants.Mascot.saveMascotZac
            } else if selected == 1 {
                avatarName = Constants.Mascot.saveMascotKris
            } else if selected == 2 {
                avatarName = Constants.Mascot.saveMascotRez
            } else if selected == 3 {
                avatarName = Constants.Mascot.saveMascotMia
            } else if selected == 4 {
                avatarName =  Constants.Mascot.saveMascotEmma
            }
            
            /// saving users information in the database, users name and avatar name
            let _ = databaseController?.addUser(name: name, avatarName: avatarName)
            
            
            /// navigating to the home screen view controller
            let viewController = storyboard?.instantiateViewController(identifier: "homeScreenVC") as! HomeScreenViewController
            if let userName = userName.text {
                /// look into database for named user
                self.user = databaseController?.getUser(userName: userName)
            }
            viewController.user = user
            navigationController?.pushViewController(viewController, animated: true)
            
            return
        }
        
        /// error handling message
        var errorMessage = ""
        
        if userContains != nil {
            errorMessage += "- user named \(userName?.text ?? "this") already exist"
        }
        
        if trimmed == "" {
            errorMessage += "-Please Enter Name\n"
        }
        
        if selected == nil {
            errorMessage += "-must must choose Mascot"
        }
        
        displayMessage(title: "Not all fields filled", message: errorMessage)
    }
    

    @IBAction func segmentButtonPressed(_ sender: UISegmentedControl) {
        switch genderSegment.selectedSegmentIndex {
        case 0:
            print("MaleSelected")
            option2ButtonImage.isHidden = false
            option2ButtonImage.isEnabled = true
            option1ButtonImage.setBackgroundImage(userImageArry[0], for: .normal)
            option2ButtonImage.setBackgroundImage(userImageArry[1], for: .normal)
            option3ButtonImage.setBackgroundImage(userImageArry[2], for: .normal)
            break
        case 1:
            option1ButtonImage.setBackgroundImage(userImageArry[3], for: .normal)
            option2ButtonImage.setBackgroundImage(nil, for: .normal)
            option2ButtonImage.isHidden = true
            option2ButtonImage.isEnabled = false
            option3ButtonImage.setBackgroundImage(userImageArry[4], for: .normal)
            print("female")
            break
        default:
            break
        }
    }
    
    
    
    
    /// Diaplay error handling mesasge using Alert Controller
    /// - Parameters:
    ///   - title: Title of the Alert
    ///   - message: Mesage to be shown
    func displayMessage(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
}
