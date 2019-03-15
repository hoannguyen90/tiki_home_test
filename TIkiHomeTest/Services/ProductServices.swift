//
//  ProductServices.swift
//  TIkiHomeTest
//
//  Created by Nguyen Hoan on 3/15/19.
//  Copyright © 2019 com.hoan. All rights reserved.
//

import Foundation

let colorsBox = ["#16702e", "#005a51", "#996c00", "#5c0a6b", "#006d90", "#974e06", "#99272e", "#89221f", "#00345d"]
class ProductServices {
    
    
    class func fetchProducts(finish: ((_ producs:[Product]?,_ message:String?)-> Void)?) {
        HttpServices.httpRequest(method: .GET, path: API_HOT_PRODUCTS, params: nil) { (responeObj) in
            if responeObj.isSuccess{
                if let responseData:[String: AnyObject] = responeObj.data as? [String: AnyObject], let productDic = responseData["keywords"] as? [[String: AnyObject]] {
                    var products = [Product]()
                    for item in productDic {
                        let product = Product(dictionary: item)
                        products.append(product)
                    }
                    finish?(products, nil)
                }else{
                    finish?(nil, responeObj.message)
                }
                
            }else{
                finish?(nil, responeObj.message)
            }
        }
    }
}
