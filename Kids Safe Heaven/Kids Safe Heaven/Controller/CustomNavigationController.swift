//
//  CustomNavigationController.swift
//  Kids Safe Heaven
//
//  Created by Farhad Ullah Rezwan on 22/10/20.
//  Copyright © 2020 Farhad Ullah Rezwan. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController, UINavigationControllerDelegate {
    
    var navController: UINavigationController?
    var vController: UIViewController?
    var navBarButtonItems: [UIBarButtonItem] = []
    let logoutToAvoid = [ "newExistingResID-1", "createNewResID-0", "existingUserID-0"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /// assigning delegates
        self.delegate = self
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        navController = navigationController
        vController = viewController
        
        let logutBottonName: String = "Log Out"
        let homeButtonName: String = "Home"
        
        setupBackButton()
        setupRightBarButton(buttonImage: Constants.Design.navigationLogoutIcon, buttonName: logutBottonName)
        setupRightBarButton(buttonImage: Constants.Design.navigationHomeIcon, buttonName: homeButtonName)
        vController?.navigationItem.rightBarButtonItems = navBarButtonItems
    }
    
    private func setupBackButton() {
        /// making the navigation bar back button text empty
        let item = UIBarButtonItem(title: Constants.Design.navigationBackTitle, style: .plain, target: nil, action: nil)
        let backArrowImage = UIImage(named: Constants.Design.navigationBack)
        let renderedImage = backArrowImage?.withRenderingMode(.alwaysOriginal)
        
        // Removing "Back" text
        vController?.navigationItem.backBarButtonItem = item
        // Make the navigation bar background clear
        vController?.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        vController?.navigationController?.navigationBar.shadowImage = UIImage()
        vController?.navigationController?.navigationBar.isTranslucent = true
        // using custom back button image
        vController?.navigationController?.navigationBar.backIndicatorImage = renderedImage
        vController?.navigationController?.navigationBar.backIndicatorTransitionMaskImage = renderedImage
    }
    
    private func setupRightBarButton(buttonImage: String, buttonName: String){
        /// making sure the button is not tinted blue
        let rightIcoonImage = UIImage(named: buttonImage)
        let rendImage = rightIcoonImage?.withRenderingMode(.alwaysOriginal)
        let button = UIButton(type: .system)
        /// using button so that the text is there
        button.setImage(rendImage, for: .normal)
        button.setTitle(buttonName, for: .normal)
        button.titleLabel?.backgroundColor = .systemYellow
        button.tintColor = .black
        button.titleLabel?.font = .monospacedSystemFont(ofSize: 10, weight: .black)
        button.largeContentTitle = buttonName
        button.sizeToFit()
        
        /// setting up the action depending on type of button
        if buttonName == "Home" {
            button.addTarget(self, action: #selector(moveHomeController), for: .touchUpInside)
        } else {
            button.addTarget(self, action: #selector(addTapped), for: .touchUpInside)
        }
        

        /// checks if the navigation is in invalid view controller or not. If in invalid view controller than it append otherwise doesnot append
        if let restorationIdentifier = vController?.restorationIdentifier {
            if !logoutToAvoid.contains(restorationIdentifier) {
                if navBarButtonItems.count < 2 {
                    navBarButtonItems.append(UIBarButtonItem(customView: button))
                }
                return
            }
            return
        }
        if navBarButtonItems.count < 2 {
            navBarButtonItems.append(UIBarButtonItem(customView: button))
        }
    }

    @objc func addTapped() {
        
        let alert = UIAlertController(title: "Logout?", message: "Do you want to logout", preferredStyle: .alert)
        let yes = UIAlertAction(title: "YES", style: .default) { (action) in
            self.navBarButtonItems.removeAll()
            self.navController?.popToRootViewController(animated: true)
        }
        let no = UIAlertAction(title: "NO", style: .default) { (action) in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(yes)
        alert.addAction(no)
        present(alert, animated: true, completion: nil)
    }
    
    
    
    @objc func moveHomeController() {
        if let restorationIdentifier = vController?.restorationIdentifier {
            let a = Constants.RestorationID.self
            
            switch restorationIdentifier {
            case a.youtubeViewController:
                navController?.popViewController(animated: false)
                navController?.popViewController(animated: false)
                navController?.popViewController(animated: false)
                navController?.popViewController(animated: false)
                break
            case a.safetyTipsViewController,
                 a.questionViewController,
                 a.scoreBoardViewController:
                navController?.popViewController(animated: false)
                navController?.popViewController(animated: false)
                navController?.popViewController(animated: false)
                break
            case a.singleParkViewController,
                 a.thingsToCarryViewController,
                 a.spotTheDViewController,
                 a.journeyScoreboardVC,
                 a.quizHomeViewController:
                navController?.popViewController(animated: false)
                navController?.popViewController(animated: false)
                break
            case a.journeyViewController,
                 a.recommendedParkViewController:
                navController?.popViewController(animated: false)
                break
            default:
                print("no home button navigation")
                break
            }
        }
        print("no home button navigation")
        
    }
        
}
