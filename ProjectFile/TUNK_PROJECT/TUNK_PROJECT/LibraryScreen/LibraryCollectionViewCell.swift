//
//  LibraryCollectionViewCell.swift
//  TUNK_PROJECT
//
//  Created by Raphael A. P. Oliveira on 26/01/21.
//  Copyright © 2021 Paolo Prodossimo Lopes. All rights reserved.
//

import UIKit

class LibraryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var libraryImageView: UIImageView!
    @IBOutlet weak var libraryLabel: UILabel!
    
    // 1 - Get which category in the segmentedControl
    // 2 - Get the resultant array of dictionaries
    // 3 - Put image view and label of each News
    
    //    @IBOutlet weak var techImageView: UIImageView!

//    //func setup(news: News) {
    func setup(news: NSDictionary) {
        //arrayArticles[0]["urlToImage"]!
        //print (news)
        //print (news["urlToImage"])
    }
}
