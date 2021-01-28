//
//  RecoveryAccountViewController.swift
//  TUNK_PROJECT
//
//  Created by Paolo Prodossimo Lopes on 20/11/20.
//  Copyright © 2020 Paolo Prodossimo Lopes. All rights reserved.
//

import UIKit

class RecoveryAccountViewController: UIViewController {
    
    //MARK:View Recovery
    @IBOutlet weak var viewRecovery: UIView!
    
    //MARK:Button Recovery
    @IBOutlet weak var actionButtonRecovery: UIButton!
    @IBAction func actionButtonRecovery(_ sender: Any) {
        
        
//        let alert = UIAlertController(title: "Sucesso", message: "Email de recuperação enviado com sucesso", preferredStyle: .alert)
//
//        let okAction = UIAlertAction(title: "OK", style: .cancel) { (UIAlertAction) in
//        }
//        alert.addAction(okAction)
//        self.present(alert, animated: true) {
//
//        }
    
        
         
        if let openAleartRecoverySender = UIStoryboard(name: "AleartRecoverySender", bundle: nil).instantiateInitialViewController() as? AleartRecoverySenderViewController {
            
            present(openAleartRecoverySender, animated: true, completion: nil)

        }
    
        
    }
    
    //MARK:Text field account recovery
    @IBOutlet weak var textFieldEmail: UITextField!
    
    //MARK:Button Close
    @IBAction func buttonClose(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        //MARK:Setting Border Radius
        viewRecovery.layer.cornerRadius = 15
        actionButtonRecovery.layer.cornerRadius = 5
        textFieldEmail.layer.cornerRadius = 5
    }
    

}
