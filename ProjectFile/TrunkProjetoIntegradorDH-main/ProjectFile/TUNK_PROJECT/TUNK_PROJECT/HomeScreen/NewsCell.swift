//
//  NewsCell.swift
//  TUNK_PROJECT
//
//  Created by Raphael A. P. Oliveira on 24/11/20.
//  Copyright © 2020 Paolo Prodossimo Lopes. All rights reserved.
//

import UIKit

class NewsCell: UICollectionViewCell {
    
    @IBOutlet weak var imageViewPhoto: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    
    func setup(news: News) {
        labelName?.text = news.name
        imageViewPhoto?.image = UIImage(named: news.image)
        imageViewPhoto.layer.cornerRadius = 10
    }
    
}
