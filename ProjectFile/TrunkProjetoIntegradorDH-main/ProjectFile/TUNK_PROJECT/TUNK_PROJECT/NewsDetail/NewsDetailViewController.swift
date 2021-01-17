//
//  NewsDetailViewController.swift
//  TUNK_PROJECT
//
//  Created by Raphael A. P. Oliveira on 24/11/20.
//  Copyright © 2020 Paolo Prodossimo Lopes. All rights reserved.
//

import UIKit

class NewsDetailViewController: UIViewController {
    
    var news: NSDictionary?
    //var news: News?   // Arrumar depois!
    
    //@IBOutlet weak var imageNewsDetail: UIImageView!
    @IBOutlet weak var labelNewsDetail: UILabel!
    @IBOutlet weak var titleNewsDetail: UILabel!
    @IBOutlet weak var imageNewsDetail: UIImageView!
    @IBOutlet weak var dateNewsDetail: UILabel!
    @IBOutlet weak var authorNewsDetail: UILabel!
    
    @IBAction func actionButtonClose(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let news = news {
            //imageNewsDetail?.image = UIImage(named: news.image)
            //title = news.name
            labelNewsDetail.text = ""
            labelNewsDetail.text = news["content"] as? String
            titleNewsDetail.text = ""
            titleNewsDetail.text = news["title"] as? String
            dateNewsDetail.text = ""
            dateNewsDetail.text = news["publishedAt"] as? String
            authorNewsDetail.text = ""
            authorNewsDetail.text = news["author"] as? String
            
            let url = URL(string: news["urlToImage"]! as! String)
            let data = try? Data(contentsOf: url!)
            imageNewsDetail.image = UIImage(data: data!)
            
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
