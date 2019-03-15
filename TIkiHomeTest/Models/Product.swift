//
//  Product.swift
//  TIkiHomeTest
//
//  Created by Nguyen Hoan on 3/15/19.
//  Copyright © 2019 com.hoan. All rights reserved.
//

import Foundation

class Product:NSObject {
    var name:String?
    var icon:String?
    
    init (dictionary: [String: AnyObject]) {
        self.name = dictionary["keyword"] as? String
        self.icon = dictionary["icon"] as? String
    }
}


