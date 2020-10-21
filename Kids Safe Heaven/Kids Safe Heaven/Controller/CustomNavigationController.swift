//
//  CustomNavigationController.swift
//  Kids Safe Heaven
//
//  Created by Farhad Ullah Rezwan on 22/10/20.
//  Copyright © 2020 Farhad Ullah Rezwan. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        /// assigning delegates
        self.delegate = self
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        
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
    }
}
