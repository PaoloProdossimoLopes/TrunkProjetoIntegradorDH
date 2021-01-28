//
//  AppDelegate.swift
//  TUNK_PROJECT
//
//  Created by Paolo Prodossimo Lopes on 19/11/20.
//  Copyright © 2020 Paolo Prodossimo Lopes. All rights reserved.
//

// Tutorial Firebase:
// https://firebase.google.com/docs/ios/setup?hl=pt-br
// 

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseCore
import GoogleSignIn
import FBSDKCoreKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Use Firebase library to configure APIs
        //firebase
        FirebaseApp.configure()
        
//        var ref: DatabaseReference!
//        ref = Database.database().reference
        
        //google auth
        GIDSignIn.sharedInstance()?.clientID = FirebaseApp.app()?.options.clientID
        
        return true
    }

    
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return  GIDSignIn.sharedInstance()?.handle(url) ?? false
            ||  ApplicationDelegate.shared.application( app, open: url, sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String, annotation: options[UIApplication.OpenURLOptionsKey.sourceApplication])
    }
    
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

