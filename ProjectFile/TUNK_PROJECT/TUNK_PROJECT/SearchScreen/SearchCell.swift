//
//  SearchCell.swift
//  TUNK_PROJECT
//
//  Created by Raphael A. P. Oliveira on 21/01/21.
//  Copyright © 2021 Paolo Prodossimo Lopes. All rights reserved.
//

import UIKit

class SearchCell: UITableViewCell {

    @IBOutlet weak var searchImageView: UIImageView!
    @IBOutlet weak var searchLabel: UILabel!
    
    // 1 - Get which category in the segmentedControl
    // 2 - Get the resultant array of dictionaries
    // 3 - Put image view and label of each News
    
    //    @IBOutlet weak var techImageView: UIImageView!

//    //func setup(news: News) {
    func setup(news: NSDictionary) {
        //arrayArticles[0]["urlToImage"]!
        //print (news)
        //print (news["urlToImage"])
        if !(news["urlToImage"] is NSNull) {
            //print ("Test:")
            //print (news["urlToImage"]!)
            let aux = news["urlToImage"] as! String
            let urlString = aux.replacingOccurrences(of: "ç", with: "%C3%A7") // check others...
            let url = URL(string: urlString.replacingOccurrences(of: "http:", with: "https:"))
            //print (url)
            let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            if data != nil {
                searchImageView.image = UIImage(data: data!)
            }
        }
        
        searchLabel?.text = news["title"] as? String
        //techImageView?.image = UIImage(named: news["urlToImage"])
    }
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
