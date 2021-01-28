//
//  LibraryScreenViewController.swift
//  TUNK_PROJECT
//
//  Created by Raphael A. P. Oliveira on 25/01/21.
//  Copyright © 2021 Paolo Prodossimo Lopes. All rights reserved.
//

import UIKit
import Foundation
import Firebase
import FirebaseDatabase

class LibraryScreenViewController: UIViewController {
    
    var username: String? = ""
    var userID: String? = ""
    @IBOutlet weak var libraryCollectionView: UICollectionView!
    @IBOutlet weak var libraryTableView: UITableView!
    
    @IBAction func actionButtonHome(_ sender: Any) {
        if let homeScreen = UIStoryboard(name: "HomeScreen", bundle: nil).instantiateInitialViewController() as? HomeScreenViewController {
            
            homeScreen.username = username
            homeScreen.userID = userID
            
            present(homeScreen, animated: true, completion: nil)
        }
    }
    
    @IBAction func actionButtonSearch(_ sender: Any) {
        if let searchScreen = UIStoryboard(name: "SearchScreen", bundle: nil).instantiateInitialViewController() as? SearchScreenViewController {
            
            searchScreen.username = username
            searchScreen.userID = userID
            
            present(searchScreen, animated: true, completion: nil)
        }
    }
    
    @IBAction func actionButtonProfile(_ sender: Any) {
        if let profileScreen = UIStoryboard(name: "PerfilPage", bundle: nil).instantiateInitialViewController() as? ProfilePageViewController {
            
            profileScreen.username = username
            profileScreen.userID = userID
            
            present(profileScreen, animated: true, completion: nil)
        }
    }
    
//    var signInScreen: UIViewController? = UIStoryboard(name: "SignIn", bundle: nil).instantiateInitialViewController() as? SignInViewController {
//        
//        username = signInScreen?.getUsername()
//        
//    }
    
    var arrayFavorites = [NSDictionary]()
    var arrayArticles = [NSDictionary]()
    var url: String = ""
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        print ("Now on LibraryScreen: \(username), \(userID)")
        
        ref.child("users").child("raphael").child("favoritos").child("book_one").setValue(
            ["name": "Sherlock Holmes"]
        )
        
        libraryTableView.delegate = self
        libraryTableView.dataSource = self
        libraryTableView.reloadData()
        
        libraryCollectionView.delegate = self
        libraryCollectionView.dataSource = self
        libraryCollectionView.reloadData()

    }
}

extension LibraryScreenViewController: UICollectionViewDelegate {

}

extension LibraryScreenViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrayFavorites.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LibraryCollectionViewCell", for: indexPath) as! LibraryCollectionViewCell
        
        cell.setup(news: arrayFavorites[indexPath.row])
        
        return cell
    }
    
    
}

extension LibraryScreenViewController: UITableViewDelegate {
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//
//        let news = arrayArticles[indexPath.row]
//        print (news)
//
//        if let viewDetail = UIStoryboard(name: "NoticeDetail", bundle: nil).instantiateInitialViewController() as? NewsDetailViewController {
//        //if let viewDetail = NewsDetailViewController.getViewController() {
//            viewDetail.news = arrayArticles[indexPath.row]
//
//            //navigationController?.pushViewController(viewDetail, animated: true)
//            present(viewDetail, animated: true)
//        }
//    }
}

extension LibraryScreenViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayArticles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as! SearchCell
        
        cell.setup(news: arrayArticles[indexPath.row])
        
        return cell
    }
}
