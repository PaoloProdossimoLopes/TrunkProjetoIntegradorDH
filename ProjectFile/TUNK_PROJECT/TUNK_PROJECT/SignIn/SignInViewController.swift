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
