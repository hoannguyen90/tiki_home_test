//
//  HttpServices.swift
//  TIkiHomeTest
//
//  Created by Nguyen Hoan on 3/15/19.
//  Copyright © 2019 com.hoan. All rights reserved.
//

import Foundation
import AFNetworking

let STATUS_CODE_SUCCESS:Int = 200

let API_DOMAIN = "https://tiki-mobile.s3-ap-southeast-1.amazonaws.com"
let API_HOT_PRODUCTS = "/ios/keywords.json"

class HttpServices {
    
    static var shareSessionManager:AFHTTPSessionManager? = AFHTTPSessionManager(baseURL: URL(string: API_DOMAIN))
    enum Method:Int {
        case POST = 1
        case GET = 2
        case DELETE = 3
    }
    
    class func httpRequest(method:Method,path:String, params: Any?,imgData:Data? = nil, respone:((_ responseData:ResponseObject)->())?) {
        
        if method == .GET{
            shareSessionManager?.get(path, parameters: params, progress: nil, success: { (operation, responseData) in
                successProcess(responseObject: responseData, respone: respone)
            }) { (operation, error) in
                failureProcess(error: error, respone: respone)
            }
        }else if method == .POST{
            shareSessionManager?.post(path, parameters: params, progress: nil, success: { (operation, responseData) in
                successProcess(responseObject: responseData, respone: respone)
            }) { (operation, error) in
                failureProcess(error: error, respone: respone)
            }
        }else if method == .DELETE{
            shareSessionManager?.delete(path, parameters: params, success: { (operation, responseData) in
                successProcess(responseObject: responseData, respone: respone)
            }, failure: { (operation, error) in
                failureProcess(error: error, respone: respone)
            })
        }
        
        // private functions
        func successProcess(responseObject: Any?, respone:((_ responseData:ResponseObject)->())?){
            if let responseData: [String: AnyObject] = responseObject as? [String: AnyObject]{
                let responseObj = ResponseObject()
                responseObj.isSuccess = true
                responseObj.data = responseData as AnyObject
                respone?(responseObj)
            }else{
                let responeObj = ResponseObject()
                responeObj.isSuccess = false
                responeObj.message = "Unknow error."
                respone?(responeObj)
            }
        }
        func failureProcess(error:Any, respone:((_ responseData:ResponseObject)->())?){
            let responeObj = ResponseObject()
            responeObj.isSuccess = false
            respone?(responeObj)
            if let err = error as? NSError, let errorData = err.userInfo["com.alamofire.serialization.response.error.data"] as? Data, let errorString = String(data: errorData, encoding: String.Encoding.utf8){
                responeObj.message = errorString
            }else{
                responeObj.message = "Could not connect to the server."
            }
            respone?(responeObj)
        }
    }
    
}


class ResponseObject: NSObject {
    var isSuccess = true
    var message:String = "Unknow error."
    var data:AnyObject?
    // status code
    
    override init() {
        super.init()
    }
    
    init(dictionary: [String: AnyObject]) {
        // ...parse from respone dictionary
    }
}

