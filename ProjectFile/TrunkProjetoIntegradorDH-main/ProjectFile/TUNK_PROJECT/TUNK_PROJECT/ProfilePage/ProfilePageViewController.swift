//
//  ProfilePageViewController.swift
//  TUNK_PROJECT
//
//  Created by Raphael A. P. Oliveira on 25/11/20.
//  Copyright © 2020 Paolo Prodossimo Lopes. All rights reserved.
//

import UIKit

class ProfilePageViewController: UIViewController {
    
    @IBAction func actionButtonHome(_ sender: Any) {
        if let HomeScreen = UIStoryboard(name: "HomeScreen", bundle: nil).instantiateInitialViewController() as? HomeScreenViewController {
            present(HomeScreen, animated: true, completion: nil)
        }
    }
    
    @IBAction func actionButtonExit(_ sender: Any) {
        if let MainScreen = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as? ViewController {
            present(MainScreen, animated: false, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
