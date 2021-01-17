//
//  API_News.swift
//  TUNK_PROJECT
//
//  Created by Raphael A. P. Oliveira on 10/01/21.
//  Copyright © 2021 Paolo Prodossimo Lopes. All rights reserved.
//

import Foundation
import Alamofire

class API_News {
    
    typealias completion <T> = (_ result: T, _ failure: Bool) -> Void
    
    func request(APIurl: String, onComplete: @escaping (_ response: Any?) -> Void) {
        AF.request(APIurl).responseJSON { response in
            onComplete(response.value)
        }
    }
}
