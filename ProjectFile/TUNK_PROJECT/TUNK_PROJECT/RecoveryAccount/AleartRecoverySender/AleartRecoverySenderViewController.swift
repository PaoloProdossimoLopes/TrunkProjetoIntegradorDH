//
//  AleartRecoverySenderViewController.swift
//  TUNK_PROJECT
//
//  Created by Paolo Prodossimo Lopes on 20/11/20.
//  Copyright © 2020 Paolo Prodossimo Lopes. All rights reserved.
//

import UIKit

class AleartRecoverySenderViewController: UIViewController {

    @IBOutlet weak var viewSucess: UIView!
    @IBOutlet weak var buttonSucess: UIButton!
    
    @IBAction func ButtonActionClose(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func buttonActionSucess(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewSucess.layer.cornerRadius = 15
        buttonSucess.layer.cornerRadius = 5
        
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
