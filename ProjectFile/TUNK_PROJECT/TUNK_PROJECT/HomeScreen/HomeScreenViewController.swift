//
//  HomeScreenViewController.swift
//  TUNK_PROJECT
//
//  Created by Raphael A. P. Oliveira on 24/11/20.
//  Copyright © 2020 Paolo Prodossimo Lopes. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController {

    @IBOutlet weak var collectionViewFavorites: UICollectionView!
    
    @IBAction func actionButtonProfile(_ sender: Any) {
        if let profileScreen = UIStoryboard(name: "PerfilPage", bundle: nil).instantiateInitialViewController() as? ProfilePageViewController {
            present(profileScreen, animated: true, completion: nil)
        }
    }
    
    //@IBOutlet weak var collectionViewTecnology: UICollectionView!
    //@IBOutlet weak var collectionViewScience: UICollectionView!
    
    var arrayFavorites = [News]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewFavorites.delegate = self
        collectionViewFavorites.dataSource = self
        
//        collectionViewTecnology.delegate = self
//        collectionViewTecnology.dataSource = self
//
//        collectionViewScience.delegate = self
//        collectionViewScience.dataSource = self
        
        arrayFavorites.append(News(name: "SpaceX", image: "foguete.jpg"))
        arrayFavorites.append(News(name: "Apollo", image: "foguete.jpg"))
        //arrayFavorites.append(News(name: "NASA", image: "foguete.jpg"))
        collectionViewFavorites.reloadData()
        
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
            viewDetail.news = arrayFavorites[indexPath.row]

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
