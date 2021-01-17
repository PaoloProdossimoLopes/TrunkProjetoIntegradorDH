//
//  HomeScreenViewController.swift
//  TUNK_PROJECT
//
//  Created by Raphael A. P. Oliveira on 24/11/20.
//  Copyright © 2020 Paolo Prodossimo Lopes. All rights reserved.
//

import UIKit
import Alamofire

class HomeScreenViewController: UIViewController {

    @IBOutlet weak var collectionViewFavorites: UICollectionView!
    @IBOutlet weak var techTableView: UITableView!
    
    @IBAction func actionButtonProfile(_ sender: Any) {
        if let profileScreen = UIStoryboard(name: "PerfilPage", bundle: nil).instantiateInitialViewController() as? ProfilePageViewController {
            present(profileScreen, animated: true, completion: nil)
        }
    }
    
    //@IBOutlet weak var collectionViewTecnology: UICollectionView!
    //@IBOutlet weak var collectionViewScience: UICollectionView!
    
    var arrayFavorites = [News]()
    var arrayArticles = [NSDictionary]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewFavorites.delegate = self
        collectionViewFavorites.dataSource = self
        
        techTableView.delegate = self
        techTableView.dataSource = self
        // ...
        techTableView.reloadData()
        
//        collectionViewTecnology.delegate = self
//        collectionViewTecnology.dataSource = self
//
//        collectionViewScience.delegate = self
//        collectionViewScience.dataSource = self
        
        arrayFavorites.append(News(name: "SpaceX", image: "foguete.jpg"))
        arrayFavorites.append(News(name: "Apollo", image: "foguete.jpg"))
        //arrayFavorites.append(News(name: "NASA", image: "foguete.jpg"))
        collectionViewFavorites.reloadData()
        
        let baseUrl = "https://newsapi.org/v2/top-headlines?"
        let country = "country=br"
        let category = "&category=technology"
        let API_key = "&apiKey=f2f893b72c364832b1d954df3c9437b7"
        let offsetLimit = "&pageSize=1"
        
        //let url = "https://newsapi.org/v2/top-headlines?country=us&apiKey="
        
        AF.request(baseUrl + country + category + API_key + offsetLimit).responseJSON { (response) in
            //let value: NSDictionary = response.value! as! NSDictionary
            //let articles = value["articles"] as! Array<Any>
            //let first: NSDictionary = articles[0] as! NSDictionary
            if response.value! is NSDictionary {
                DispatchQueue.main.async {
                    let value = response.value! as! NSDictionary
                    let articles = value["articles"] as! Array<Any>
                    for item in articles {
                        self.arrayArticles.append(item as! NSDictionary) // append(contentsof: 11.)
                    }
                    print ("Keys: \(self.arrayArticles[0].allKeys), \(self.arrayArticles.count) items")
                    print (self.arrayArticles[0]["urlToImage"]!)
                    self.techTableView.reloadData()
                }
            }
        }
    }
}


extension HomeScreenViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let news = arrayFavorites[indexPath.row]
        
        //if let carDetail = UIStoryboard(name: "CarDetail", bundle: nil).instantiateInitialViewController() as? CarDetailViewController {
        //    navigationController?.pushViewController(carDetail, animated: true)
        //    carDetail.car = arrayCars[indexPath.row]
        //}
        
        // IMPORTANT:::
        if let viewDetail = UIStoryboard(name: "NoticeDetail", bundle: nil).instantiateInitialViewController() as? NewsDetailViewController {
        //if let viewDetail = NewsDetailViewController.getViewController() {
            viewDetail.news = arrayArticles[indexPath.row]

            //navigationController?.pushViewController(viewDetail, animated: true)
            present(viewDetail, animated: true)
        }
        
    }
}

extension HomeScreenViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayFavorites.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsCell", for: indexPath) as! NewsCell
        
        cell.setup(news: arrayFavorites[indexPath.row])
        
        return cell
    }
}

extension HomeScreenViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let news = arrayArticles[indexPath.row]
        print (news)
        
        if let viewDetail = UIStoryboard(name: "NoticeDetail", bundle: nil).instantiateInitialViewController() as? NewsDetailViewController {
        //if let viewDetail = NewsDetailViewController.getViewController() {
            viewDetail.news = arrayArticles[indexPath.row]

            //navigationController?.pushViewController(viewDetail, animated: true)
            present(viewDetail, animated: true)
        }
        
//        if let viewControllerDetail = UIStoryboard(name: "Season", bundle: nil).instantiateInitialViewController() as? SeasonViewController {
//
//            viewControllerDetail.idShow = show.id
//
//            // Navigation Controller
//            navigationController?.pushViewController(viewControllerDetail, animated: true)
//
//            // Abre a tela MODAL
//            //viewControllerDetail.employee = arrayPeople[indexPath.row]
//            //present(viewControllerDetail, animated: true, completion: nil)
//
//        }
    }
}

extension HomeScreenViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayArticles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TechTableViewCell", for: indexPath) as! TechTableViewCell
        
        cell.setup(news: arrayArticles[indexPath.row])
        
        return cell
    }
    
    
}
