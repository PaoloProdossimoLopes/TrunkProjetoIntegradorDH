//
//  SignInViewController.swift
//  TUNK_PROJECT
//
//  Created by Paolo Prodossimo Lopes on 22/11/20.
//  Copyright © 2020 Paolo Prodossimo Lopes. All rights reserved.
//

import UIKit
import FirebaseAuth
import GoogleSignIn
import FBSDKLoginKit

class SignInViewController: UIViewController {
    
    var username: String? = ""
    var userID: String? = ""
    
    @IBAction func closeViewSignIn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var emailTextLabel: UITextField!
    @IBOutlet weak var passwordTextLabel: HideShowPasswordTextField!
    @IBOutlet weak var imageViewGoogle: UIImageView!
    @IBOutlet weak var imageViewFacebook: UIImageView!
    @IBOutlet weak var imageViewApple: UIImageView!
    
    @IBAction func openViewTest(_ sender: Any) {
        if let openRecoveryAccount = UIStoryboard(name: "RecoveryAccount", bundle: nil).instantiateInitialViewController() as? RecoveryAccountViewController {
            
            present(openRecoveryAccount, animated: true, completion: nil)
        }
    }
    
    @IBAction func actionButtonLogin(_ sender: Any) {
        
        if let email = emailTextLabel.text, let password = passwordTextLabel.text {
            
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                if let result = result, error == nil{
                    
                    //guardar dados dos usuarios
                    let defaults = UserDefaults.standard
                    defaults.set(email, forKey: "email")
                    defaults.synchronize()
                    
                    if let openLoadingAfterLogin = UIStoryboard(name: "LoadingAfterLogin", bundle: nil).instantiateInitialViewController() as? LoadingAfterLoginViewController {
                        //openLoadingAfterLogin.modalPresentationStyle = .overCurrentContext
                        openLoadingAfterLogin.username = email
                        openLoadingAfterLogin.userID = result.user.uid
                        openLoadingAfterLogin.modalTransitionStyle = .crossDissolve
                        self.present(openLoadingAfterLogin, animated: true, completion: nil)
                    }
                    
                }else{
                    let alert = UIAlertController(title: "Erro", message: "Ocorreu um erro no processo de Login", preferredStyle: .alert)
                    
                    let okAction = UIAlertAction(title: "OK", style: .cancel) { (UIAlertAction) in
                    }
                    alert.addAction(okAction)
                    self.present(alert, animated: true) {
                        
                    }
                    
                }
            }
            
            /*
             if let openLoadingAfterLogin = UIStoryboard(name: "LoadingAfterLogin", bundle: nil).instantiateInitialViewController() as? LoadingAfterLoginViewController {
             //openLoadingAfterLogin.modalPresentationStyle = .overCurrentContext
             openLoadingAfterLogin.modalTransitionStyle = .crossDissolve
             present(openLoadingAfterLogin, animated: true, completion: nil)
             }
             */
            
        }
    }
    
    @IBAction func buttonRegisterGoogle(_ sender: Any) {
        
        GIDSignIn.sharedInstance()?.signOut() //por garantia
        GIDSignIn.sharedInstance()?.signIn()
        
        
        
        
        /*
         let alert = UIAlertController(title: "Atenção", message: "Funcionalidade em desenvolvimento", preferredStyle: .alert)
         
         let okAction = UIAlertAction(title: "OK", style: .cancel) { (UIAlertAction) in
         }
         alert.addAction(okAction)
         self.present(alert, animated: true) {
         
         }
         */
    }
    @IBAction func buttonRegisterFacebook(_ sender: Any) {
        
        
        let loginManager = LoginManager()
        loginManager.logOut()
        loginManager.logIn(permissions: [.email], viewController: self) { (result) in
            switch result {
            
            case .success(granted: let granted, declined: let declined, token: let token):
                
                guard let tokenString = token?.tokenString else { return }
                let credential = FacebookAuthProvider.credential(withAccessToken: tokenString)
                Auth.auth().signIn(with: credential) { (result, error) in
                    if let openLoadingAfterLogin = UIStoryboard(name: "LoadingAfterLogin", bundle: nil).instantiateInitialViewController() as? LoadingAfterLoginViewController {
                        //openLoadingAfterLogin.modalPresentationStyle = .overCurrentContext
                        print (result?.user.email)
                        print (result?.user.uid)
                        self.username = result?.user.email
                        openLoadingAfterLogin.username = result?.user.email
                        openLoadingAfterLogin.userID = result?.user.uid
                        openLoadingAfterLogin.modalTransitionStyle = .crossDissolve
                        self.present(openLoadingAfterLogin, animated: true, completion: nil)
                    }
                }
            case .cancelled:
                break
            case .failed(_):
                let alert = UIAlertController(title: "ERRO!", message: "Ocorreu um erro na vinculação com o facebook", preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "OK", style: .cancel) { (UIAlertAction) in
                }
                alert.addAction(okAction)
                self.present(alert, animated: true) {
                    
                }
            }
        }
        
        
        /*
         let alert = UIAlertController(title: "Atenção", message: "Funcionalidade em desenvolvimento", preferredStyle: .alert)
         
         let okAction = UIAlertAction(title: "OK", style: .cancel) { (UIAlertAction) in
         }
         alert.addAction(okAction)
         self.present(alert, animated: true) {
         
         }
         */
    }
    @IBAction func buttonRegisterApple(_ sender: Any) {
        let alert = UIAlertController(title: "Atenção", message: "Funcionalidade em desenvolvimento", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .cancel) { (UIAlertAction) in
        }
        alert.addAction(okAction)
        self.present(alert, animated: true) {
            
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageViewGoogle?.image = UIImage(named: "GmailLogo-SignIn.png")
        imageViewFacebook?.image = UIImage(named: "FacebookLogo-SignIn.png")
        imageViewApple?.image = UIImage(named: "AppleLogo-SignIn.png")
        
        let defaults = UserDefaults.standard
        if let email = defaults.value(forKey: "email") as? String{
            if let openLoadingAfterLogin = UIStoryboard(name: "LoadingAfterLogin", bundle: nil).instantiateInitialViewController() as? LoadingAfterLoginViewController {
                //openLoadingAfterLogin.modalPresentationStyle = .overCurrentContext
                openLoadingAfterLogin.modalTransitionStyle = .crossDissolve
                self.present(openLoadingAfterLogin, animated: true, completion: nil)
            }
        }
        
        //google auth
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.delegate = self
        
        
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    // PAOLO: CONTINUAR DAQUI :::
    func getUsername() -> String {
        return username!
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

extension SignInViewController: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!){
        if error == nil && user.authentication != nil{
            let credential = GoogleAuthProvider.credential(withIDToken: user.authentication.idToken, accessToken: user.authentication.accessToken)
            
            Auth.auth().signIn(with: credential) { (result, error) in
                if let result = result, error == nil{
                    
                    if let openLoadingAfterLogin = UIStoryboard(name: "LoadingAfterLogin", bundle: nil).instantiateInitialViewController() as? LoadingAfterLoginViewController {
                        //openLoadingAfterLogin.modalPresentationStyle = .overCurrentContext
                        openLoadingAfterLogin.modalTransitionStyle = .crossDissolve
                        //print (user.authentication.clientID)
                        print (user.profile.email)
                        print (user.userID)
                        openLoadingAfterLogin.username = user.profile.email
                        openLoadingAfterLogin.userID = user.userID
                        self.present(openLoadingAfterLogin, animated: true, completion: nil)
                    }
                    
                }else{
                    let alert = UIAlertController(title: "Erro", message: "Ocorreu um erro no processo de Login", preferredStyle: .alert)
                    
                    let okAction = UIAlertAction(title: "OK", style: .cancel) { (UIAlertAction) in
                    }
                    alert.addAction(okAction)
                    self.present(alert, animated: true) {
                        
                    }
                    
                }
            }
        }
    }
}
