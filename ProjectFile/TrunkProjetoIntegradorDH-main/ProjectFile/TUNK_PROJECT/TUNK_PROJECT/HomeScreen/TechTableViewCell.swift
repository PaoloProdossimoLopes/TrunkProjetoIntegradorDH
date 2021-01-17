//
//  TechTableViewCell.swift
//  TUNK_PROJECT
//
//  Created by Raphael A. P. Oliveira on 11/01/21.
//  Copyright © 2021 Paolo Prodossimo Lopes. All rights reserved.
//

import UIKit

class TechTableViewCell: UITableViewCell {
    
    @IBOutlet weak var techImageView: UIImageView!
    @IBOutlet weak var techLabel: UILabel!
    
    //func setup(news: News) {
    func setup(news: NSDictionary) {
        //arrayArticles[0]["urlToImage"]!
        //print (news)
        let url = URL(string: news["urlToImage"]! as! String)
        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        techImageView.image = UIImage(data: data!)
        
        techLabel?.text = news["title"] as! String
        //techImageView?.image = UIImage(named: news["urlToImage"])
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        techImageView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
