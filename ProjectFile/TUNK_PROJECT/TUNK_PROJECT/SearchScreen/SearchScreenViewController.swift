//
//  SearchScreenViewController.swift
//  TUNK_PROJECT
//
//  Created by Raphael A. P. Oliveira on 20/01/21.
//  Copyright © 2021 Paolo Prodossimo Lopes. All rights reserved.
//

import UIKit
import Alamofire

class SearchScreenViewController: UIViewController, UISearchBarDelegate {

    
    
    @IBOutlet weak var searchBarNews: UISearchBar!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var searchTableView: UITableView!
    
    var category: String = "" // "business" // ""
    @IBAction func indexChanged(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            category = ""
        case 1:
            category = "science"
        case 2:
            category = "technology"
        case 3:
            category = "business" // "entertainment"
        default:
            break
        }
        viewDidLoad()
    }
    
    @IBAction func actionButtonHome(_ sender: Any) {
        if let homeScreen = UIStoryboard(name: "HomeScreen", bundle: nil).instantiateInitialViewController() as? HomeScreenViewController {
            
            homeScreen.username = username
            homeScreen.userID = userID
            
            present(homeScreen, animated: true, completion: nil)
        }
    }
    
    @IBAction func actionButtonLibrary(_ sender: Any) {
        if let libraryScreen = UIStoryboard(name: "LibraryScreen", bundle: nil).instantiateInitialViewController() as? LibraryScreenViewController {
            
            libraryScreen.username = username
            libraryScreen.userID = userID
            
            present(libraryScreen, animated: true, completion: nil)
        }
    }
    
    @IBAction func actionButtonProfile(_ sender: Any) {
        if let profileScreen = UIStoryboard(name: "PerfilPage", bundle: nil).instantiateInitialViewController() as? ProfilePageViewController {
            
            profileScreen.username = username
            profileScreen.userID = userID
            
            present(profileScreen, animated: true, completion: nil)
        }
    }
    
    var arrayFavorites = [News]()
    var arrayArticles = [NSDictionary]()
    var filteredData = [NSDictionary]()
    var url: String = ""
    var username: String? = ""
    var userID: String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBarNews.delegate = self
        
        arrayArticles.removeAll()
        searchTableView.delegate = self
        searchTableView.dataSource = self
        searchTableView.reloadData()
        
        let baseUrl = "https://newsapi.org/v2/top-headlines?"
        let country = "country=br"
        //print (category, self.category)
        if self.category != "" {
            self.category = "&category=\(self.category)"
        }
        //print (category, self.category)
        //let category = "&category=technology"
        let API_key = "&apiKey=f2f893b72c364832b1d954df3c9437b7"
        let offsetLimit = "&pageSize=5"
        
        //let url = "https://newsapi.org/v2/top-headlines?country=br&category=technology&apiKey="
        url = baseUrl + country + self.category + API_key + offsetLimit
        
        AF.request(url).responseJSON { (response) in
            //let value: NSDictionary = response.value! as! NSDictionary
            //let articles = value["articles"] as! Array<Any>
            //let first: NSDictionary = articles[0] as! NSDictionary
            if response.value! is NSDictionary {
                DispatchQueue.main.async {
                    //print (url)
                    let value = response.value! as! NSDictionary
                    let articles = value["articles"] as! Array<Any>
                    for item in articles {
                        self.arrayArticles.append(item as! NSDictionary) // append(contentsof: 11.)
                    }
                    //print ("Keys: \(self.arrayArticles[0].allKeys), \(self.arrayArticles.count) items")
                    //print (self.arrayArticles[0]["urlToImage"]!)
                    self.searchTableView.reloadData()
                }
            }
        }
    }
    
    // MARK: Search bar config
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        //print ("AAAAA", self.category) // certo!
        // Carregar dados da API com o texto de entrada...
        
        var newUrl: String = ""
        arrayArticles.removeAll()
        
        if searchText == "" {
            newUrl = url
        } else {
            newUrl = url.replacingOccurrences(of: "?", with: "?q=\(searchText)&")
        }
        
        AF.request(newUrl).responseJSON { (response) in
            //let value: NSDictionary = response.value! as! NSDictionary
            //let articles = value["articles"] as! Array<Any>
            //let first: NSDictionary = articles[0] as! NSDictionary
            if response.value! is NSDictionary {
                DispatchQueue.main.async {
                    //print (url)
                    let value = response.value! as! NSDictionary
                    let articles = value["articles"] as! Array<Any>
                    for item in articles {
                        self.arrayArticles.append(item as! NSDictionary) // append(contentsof: 11.)
                    }
                    //print ("Keys: \(self.arrayArticles[0].allKeys), \(self.arrayArticles.count) items")
                    //print (self.arrayArticles[0]["urlToImage"]!)
                    self.searchTableView.reloadData()
                }
            }
        }
        
        // CHANGE ABOVE EVERYTHING OF SEARCHTABLEVIEW TO FILTEREDDATA...
        // CHANGE TO THE API EVERYTIME!!!
        self.searchTableView.reloadData()
    }
    
}

extension SearchScreenViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //let news = arrayArticles[indexPath.row]
        //print (news)
        
        if let viewDetail = UIStoryboard(name: "NoticeDetail", bundle: nil).instantiateInitialViewController() as? NewsDetailViewController {
        //if let viewDetail = NewsDetailViewController.getViewController() {
            viewDetail.news = arrayArticles[indexPath.row]

            //navigationController?.pushViewController(viewDetail, animated: true)
            present(viewDetail, animated: true)
        }
    }
}

extension SearchScreenViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayArticles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as! SearchCell
        
        cell.setup(news: arrayArticles[indexPath.row])
        
        return cell
    }
    
    
}
