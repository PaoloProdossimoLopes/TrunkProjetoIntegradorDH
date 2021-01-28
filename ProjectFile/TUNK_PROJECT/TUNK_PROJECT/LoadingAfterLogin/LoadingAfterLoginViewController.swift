//
//  LoadingAfterLoginViewController.swift
//  TUNK_PROJECT
//
//  Created by Raphael A. P. Oliveira on 23/11/20.
//  Copyright © 2020 Paolo Prodossimo Lopes. All rights reserved.
//

import UIKit
import SwiftGifOrigin

class LoadingAfterLoginViewController: UIViewController {
    
    
//    private let email:String
//    private let result:String
//    
//    init(email: String, result:String){
//        self.email = email
//        self.result = result
//        super.init(nibName:nil, bundle: nil)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    @IBOutlet weak var LoadingView: UIView!
    @IBOutlet weak var loadingGifImageView: UIImageView!
    @IBOutlet weak var labelLoading: UILabel!
    //@IBOutlet weak var buttonNextScreen: UIButton!
    
    var username: String? = ""
    var userID: String? = ""
    
    @IBAction func actionButtonNextScreen(_ sender: Any) {
        //dismiss(animated: true, completion: nil)
        
        //print ("AAAA")
        if let openHomeScreen = UIStoryboard(name: "HomeScreen", bundle: nil).instantiateInitialViewController() as? HomeScreenViewController {
            //navigationController?.pushViewController(openHomeScreen, animated: true)
            print ("Now on LoadingAfterLogin: \(username), \(userID)")
            openHomeScreen.username = username
            openHomeScreen.userID = userID
            present(openHomeScreen, animated: true, completion: nil)
            
            // Snippet...
            // Navigation Controller
            //navigationController?.pushViewController(viewControllerDetail, animated: true)
            // Abre a tela MODAL
            //viewControllerDetail.employee = arrayPeople[indexPath.row]
            //present(viewControllerDetail, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Testando...
        //view.backgroundColor = .lightGray
        //view.alpha = 0.5
        
        // UI View em código
        //let xCoord = self.view.bounds.width / 2 - 150
        //let yCoord = self.view.bounds.height / 2 - 300
        //let centeredView = UIView(frame: CGRect(x: xCoord, y: yCoord, width: 300, height: 500))
        //centeredView.backgroundColor = .blue
        //centeredView.alpha = 0
        //self.view.addSubview(centeredView)
        
        // Gif downloaded from loading.io
        loadingGifImageView.image = UIImage.gif(name: "Loading")
        labelLoading.text = "Bem vindo de volta!\n \nÉ ótimo te ver por aqui novamente... \n \nAproveite nossas notícias!"
        
        LoadingView.layer.cornerRadius = 12
        
    }
    
}
