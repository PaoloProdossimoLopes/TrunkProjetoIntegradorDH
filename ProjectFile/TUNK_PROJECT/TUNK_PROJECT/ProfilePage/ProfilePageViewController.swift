//
//  ProfilePageViewController.swift
//  TUNK_PROJECT
//
//  Created by Raphael A. P. Oliveira on 25/11/20.
//  Copyright © 2020 Paolo Prodossimo Lopes. All rights reserved.
//

import UIKit
import FirebaseAuth

class ProfilePageViewController: UIViewController {
    
    
    var username: String? = ""
    var userID: String? = ""

    @IBOutlet weak var emailTextLabelRecover: UILabel!
    
    @IBAction func actionButtonHome(_ sender: Any) {
        if let HomeScreen = UIStoryboard(name: "HomeScreen", bundle: nil).instantiateInitialViewController() as? HomeScreenViewController {
            
            HomeScreen.username = username
            HomeScreen.userID = userID
            
            present(HomeScreen, animated: true, completion: nil)
        }
    }
    
    @IBAction func actionButtonSearch(_ sender: Any) {
        if let searchScreen = UIStoryboard(name: "SearchScreen", bundle: nil).instantiateInitialViewController() as? SearchScreenViewController {
            
            searchScreen.username = username
            searchScreen.userID = userID
            
            present(searchScreen, animated: true, completion: nil)
        }
    }
    
    @IBAction func actionButtonLibrary(_ sender: Any) {
        if let libraryScreen = UIStoryboard(name: "LibraryScreen", bundle: nil).instantiateInitialViewController() as? LibraryScreenViewController {
            
            libraryScreen.username = username
            libraryScreen.userID = userID
            
            present(libraryScreen, animated: true, completion: nil)
        }
    }
    
    @IBAction func actionButtonExit(_ sender: Any) {
        
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "email")
        defaults.synchronize()
        
        if let MainScreen = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as? ViewController {
            present(MainScreen, animated: false, completion: nil)
            }
    }
    
//    private let email:String
//
//    init(email: String){
//        self.email = email
//        super.init(nibName:nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //guardar dados dos usuarios
        let defaults = UserDefaults.standard
//        defaults.set(email, forKey: "email")
        defaults.synchronize()
        
    }
}
