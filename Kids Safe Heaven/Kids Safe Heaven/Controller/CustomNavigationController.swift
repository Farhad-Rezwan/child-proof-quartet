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
    override func viewDidLoad() {
        super.viewDidLoad()
        /// assigning delegates
        self.delegate = self
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        navController = navigationController
        vController = viewController
        /// making the navigation bar back button text empty
        let item = UIBarButtonItem(title: Constants.Design.navigationBackTitle, style: .plain, target: nil, action: nil)
        let backArrowImage = UIImage(named: Constants.Design.navigationBack)
        let renderedImage = backArrowImage?.withRenderingMode(.alwaysOriginal)
        
        // Removing "Back" text
        viewController.navigationItem.backBarButtonItem = item
        // Make the navigation bar background clear
        viewController.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        viewController.navigationController?.navigationBar.shadowImage = UIImage()
        viewController.navigationController?.navigationBar.isTranslucent = true
        // using custom back button image
        viewController.navigationController?.navigationBar.backIndicatorImage = renderedImage
        viewController.navigationController?.navigationBar.backIndicatorTransitionMaskImage = renderedImage
        
        let rightIcoonImage = UIImage(named: Constants.Design.navigationLogoutIcon)
        let rendImage = rightIcoonImage?.withRenderingMode(.alwaysOriginal)
        
        viewController.navigationItem.rightBarButtonItem?.image = rendImage
        
        let add = UIBarButtonItem(title: "logout", style: .plain, target: self, action: #selector(addTapped))
        add.image = rendImage
        viewController.navigationItem.rightBarButtonItems = [add]
    }
    
    @objc func addTapped() {
        
        let alert = UIAlertController(title: "Logout?", message: "Do you want to logout", preferredStyle: .alert)
        let yes = UIAlertAction(title: "YES", style: .default) { (action) in
            self.navController?.popToRootViewController(animated: true)
        }
        let no = UIAlertAction(title: "NO", style: .default) { (action) in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(yes)
        alert.addAction(no)
        present(alert, animated: true, completion: nil)
    }
    
}
