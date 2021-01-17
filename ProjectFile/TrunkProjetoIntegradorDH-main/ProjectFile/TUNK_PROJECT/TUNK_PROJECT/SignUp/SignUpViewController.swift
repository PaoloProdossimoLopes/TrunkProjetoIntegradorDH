//
//  SignUpViewController.swift
//  TUNK_PROJECT
//
//  Created by Paolo Prodossimo Lopes on 22/11/20.
//  Copyright © 2020 Paolo Prodossimo Lopes. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {
    
    @IBAction func OpenSignInSceen(_ sender: Any) {
        if let OpenSignInSceen = UIStoryboard(name: "SignIn", bundle: nil).instantiateInitialViewController() as? SignInViewController {
                 
            present(OpenSignInSceen, animated: false, completion: nil)
  
        }
    }

    @IBAction func closeViewSignUp(_ sender: Any) {
          dismiss(animated: true, completion: nil)
    }
    
    

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNametextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var registerButton: UIButton!
    @IBAction func registerButtonAction(_ sender: Any) {
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            
            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                if let result = result, error == nil{
                    
                    if let openLoadingAfterLogin = UIStoryboard(name: "LoadingAfterLogin", bundle: nil).instantiateInitialViewController() as? LoadingAfterLoginViewController {
                               //openLoadingAfterLogin.modalPresentationStyle = .overCurrentContext
                               openLoadingAfterLogin.modalTransitionStyle = .crossDissolve
                        self.present(openLoadingAfterLogin, animated: true, completion: nil)
                            }
                    
                }else{
                    let alertController = UIAlertController(title: "ERRO", message: "Ocorreu um erro ao registrar o usuario", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title:"Aceitar", style: .default))
                }
            }
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
