//
//  NewsDetailViewController.swift
//  TUNK_PROJECT
//
//  Created by Raphael A. P. Oliveira on 24/11/20.
//  Copyright © 2020 Paolo Prodossimo Lopes. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class NewsDetailViewController: UIViewController {
    
    var news: NSDictionary?
    //var news: News?   // Arrumar depois!
    
    //@IBOutlet weak var imageNewsDetail: UIImageView!
    @IBOutlet weak var labelNewsDetail: UILabel!
    @IBOutlet weak var titleNewsDetail: UILabel!
    @IBOutlet weak var imageNewsDetail: UIImageView!
    @IBOutlet weak var dateNewsDetail: UILabel!
    @IBOutlet weak var authorNewsDetail: UILabel!
    
    
   
    
    @IBAction func actionButtonDownload(_ sender: Any) {
        rootRef.child("Email do usuario").child("Noticias salvas").child("\(randonNumberForNoticeId) - \(news?["title"])").setValue(
            ["urlToImage":"\(news?["urlToImage"])",
             "title":"\(news?["title"])",
             "author":"\(news?["author"])",
             "content":"\(news?["content"] as? String)"]
        )
    }
    
    @IBAction func actionButtonBrowser(_ sender: Any) {
        let url = URL(string: news!["url"] as! String)
        UIApplication.shared.open(url!)
    }
     
    var randonNumberForNoticeId = Int.random(in: 0...1000)
    var username: String? = ""
    var userID: String? = ""
    
    
    let usertest = Auth.auth().currentUser?.email
    
    
    
    
    let rootRef = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(usertest) //teste
        
        if let news = news {
            
            if !(news["urlToImage"] is NSNull) {
                //print ("Test:")   // in case it goes wrong
                //print (news["urlToImage"]!)
                let aux = news["urlToImage"] as! String
                let urlString = aux.replacingOccurrences(of: "ç", with: "%C3%A7")
                let url = URL(string: urlString.replacingOccurrences(of: "http:", with: "https:"))
                let data = try? Data(contentsOf: url!)
                if data != nil {
                    imageNewsDetail.image = UIImage(data: data!)
                }
            }
            //let url = URL(string: news["urlToImage"]! as! String)
            //let data = try? Data(contentsOf: url!)
            //imageNewsDetail.image = UIImage(data: data!)
            
            titleNewsDetail.text = ""
            let title = news["title"] as? String
            let titleArray = title?.components(separatedBy: " - ")
            titleNewsDetail.text = titleArray?[0]
            
            authorNewsDetail.text = ""
            let author = news["author"] as? String
            let authorTitle = titleArray?[1].trimmingCharacters(in: .whitespaces)
            //print (author?.lowercased())
            //print (authorTitle!.lowercased())
            //print (author?.lowercased() == authorTitle!.lowercased())
            if author == nil || author?.lowercased() == authorTitle!.lowercased() {
                authorNewsDetail.text = (authorTitle)!
            } else {
                authorNewsDetail.text = (authorTitle)! + "\npor " + (author)!
            }
            
            dateNewsDetail.text = ""
            let published = news["publishedAt"] as! String
            let comp = published.components(separatedBy: "T")
            let rawDate = comp[0].components(separatedBy: "-")
            let rawTime = comp[1].components(separatedBy: ":")
            var gmt: Int { return TimeZone.current.secondsFromGMT() }
            var hour = String(format: "%02d", Int(rawTime[0])! + gmt/3600)
            var date: String = "\(rawDate[2])/\(rawDate[1])/\(rawDate[0])"
            
            if Int(hour)! < 3 {
                hour = String(format: "%02d", Int(rawTime[0])! + 24 - 3)
                let day = String(format: "%02d", Int(rawDate[2])!-1)
                date = "\(day)/\(rawDate[1])/\(rawDate[0])"
            }
            let time: String = "\(hour):\(rawTime[1]):\(rawTime[2].dropLast())"
            dateNewsDetail.text = "\(date)\n\(time)"
            
            labelNewsDetail.text = ""
            let content = news["content"] as? String
            labelNewsDetail.text = content?.replacingOccurrences(of: "chars", with: "caracteres")
            
        }
    }
    
    // To call this ViewController :::
//    static func getViewController() -> NewsDetailViewController? {
//        if let viewDetail = UIStoryboard(name: "NewsDetail", bundle: nil).instantiateInitialViewController() as? NewsDetailViewController {
//            return viewDetail
//        }
//        return nil
//    }
    
}
