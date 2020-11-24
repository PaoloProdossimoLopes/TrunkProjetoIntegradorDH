//
//  ViewController.swift
//  TUNK_PROJECT
//
//  Created by Paolo Prodossimo Lopes on 19/11/20.
//  Copyright © 2020 Paolo Prodossimo Lopes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    

    
    
//MARK:Open View

    
    @IBAction func OpenSignInSceen(_ sender: Any) {
        if let OpenSignInSceen = UIStoryboard(name: "SignIn", bundle: nil).instantiateInitialViewController() as? SignInViewController {
                 
            present(OpenSignInSceen, animated: true, completion: nil)
        }
    }
    @IBAction func OpenSignUpScreen(_ sender: Any) {
        
            if let OpenSignUpSceen = UIStoryboard(name: "SignUp", bundle: nil).instantiateInitialViewController() as? SignUpViewController {

                present(OpenSignUpSceen, animated: true, completion: nil)
    

        }
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

