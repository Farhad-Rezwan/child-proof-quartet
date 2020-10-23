//
//  NewExistingViewController.swift
//  Kids Safe Heaven
//
//  Created by Farhad Ullah Rezwan on 17/9/20.
//  Copyright © 2020 Farhad Ullah Rezwan. All rights reserved.
//

import UIKit



class NewExistingViewController: UIViewController {
    
    var presentTransition: UIViewControllerAnimatedTransitioning?
    var dismissTransition: UIViewControllerAnimatedTransitioning?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

//    @IBAction func barButton(_ sender: UIBarButtonItem) {
//        /// for presenting menu view controller
//        guard let menuViewController = storyboard?.instantiateViewController(withIdentifier: Constants.Identifier.menuViewController) as? MenuViewController else { return  }
//        
//        menuViewController.didTapMenuType = { menuType in
//            self.transitionToOther(menuType)
//        }
//        
//        presentTransition = RightToLeftTransition()
//        dismissTransition = LeftToRightTransition()
//        menuViewController.modalPresentationStyle = .custom
//        menuViewController.transitioningDelegate = self
//        present(menuViewController, animated: true, completion: { [weak self] in
//                self?.presentTransition = nil
//            })
//    }
//    func transitionToOther(_ menuType: MenuType) {
//        switch menuType {
//        case .home:
//            guard let newUserVC = storyboard?.instantiateViewController(withIdentifier: "newUserVC") as? NewUserViewController else { return  }
//            present( newUserVC, animated: true)
//            break
//        case .signOut:
//            break
//        case .sound:
//            break
//        }
//    }
}

extension NewExistingViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
            return presentTransition
        }

        func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
            return dismissTransition
    }
}
