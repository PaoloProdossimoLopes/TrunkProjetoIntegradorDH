//
//  NewsDetailViewController.swift
//  TUNK_PROJECT
//
//  Created by Raphael A. P. Oliveira on 24/11/20.
//  Copyright © 2020 Paolo Prodossimo Lopes. All rights reserved.
//

import UIKit

class NewsDetailViewController: UIViewController {
    
    var news: News?
    
    //@IBOutlet weak var imageNewsDetail: UIImageView!
    @IBOutlet weak var labelNewsDetail: UILabel!
    
    
    @IBAction func actionButtonClose(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let news = news {
            //imageNewsDetail?.image = UIImage(named: news.image)
            //title = news.name
            labelNewsDetail.text = ""
            labelNewsDetail.text = news.name
        }
        
        // Do any additional setup after loading the view.
    }
    
//    static func getViewController() -> NewsDetailViewController? {
//        if let viewDetail = UIStoryboard(name: "NewsDetail", bundle: nil).instantiateInitialViewController() as? NewsDetailViewController {
//            return viewDetail
//        }
//        return nil
//    }
    
}
