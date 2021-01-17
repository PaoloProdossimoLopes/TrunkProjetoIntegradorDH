//
//  SignInViewController.swift
//  TUNK_PROJECT
//
//  Created by Paolo Prodossimo Lopes on 22/11/20.
//  Copyright © 2020 Paolo Prodossimo Lopes. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    @IBAction func closeViewSignIn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func openViewTest(_ sender: Any) {
        if let openRecoveryAccount = UIStoryboard(name: "RecoveryAccount", bundle: nil).instantiateInitialViewController() as? RecoveryAccountViewController {
            
            present(openRecoveryAccount, animated: true, completion: nil)
        }
    }
    
    @IBAction func actionButtonLogin(_ sender: Any) {
        
        if let openLoadingAfterLogin = UIStoryboard(name: "LoadingAfterLogin", bundle: nil).instantiateInitialViewController() as? LoadingAfterLoginViewController {
            //openLoadingAfterLogin.modalPresentationStyle = .overCurrentContext
            openLoadingAfterLogin.modalTransitionStyle = .crossDissolve
            present(openLoadingAfterLogin, animated: true, completion: nil)
            
        }
    }
    
    @IBAction func buttonRegisterGoogle(_ sender: Any) {
        let alert = UIAlertController(title: "Atenção", message: "Funcionalidade em desenvolvimento", preferredStyle: .alert)

        let okAction = UIAlertAction(title: "OK", style: .cancel) { (UIAlertAction) in
        }
        alert.addAction(okAction)
        self.present(alert, animated: true) {
           
        }
    }
    @IBAction func buttonRegisterFacebook(_ sender: Any) {
        let alert = UIAlertController(title: "Atenção", message: "Funcionalidade em desenvolvimento", preferredStyle: .alert)

        let okAction = UIAlertAction(title: "OK", style: .cancel) { (UIAlertAction) in
        }
        alert.addAction(okAction)
        self.present(alert, animated: true) {
           
        }
    }
    @IBAction func buttonRegisterApple(_ sender: Any) {
        let alert = UIAlertController(title: "Atenção", message: "Funcionalidade em desenvolvimento", preferredStyle: .alert)

        let okAction = UIAlertAction(title: "OK", style: .cancel) { (UIAlertAction) in
        }
        alert.addAction(okAction)
        self.present(alert, animated: true) {
           
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
