//
//  HTTP.swift
//  TodayKh
//
//  Created by MengheangRat on 2/18/16.
//  Copyright Â© 2016 QFirst. All rights reserved.

import Foundation
import SwiftyJSON
import Alamofire

let status500 = "Server Unreachable"
//var mainUrl = "http://54.218.71.38:8080/api/"
var mainUrl = "http://54.201.189.220:4000/api/"
var imageUrl = "http://54.201.189.220:4000"
//var mainUrl = "http://localhost/brewhouse/lrv/public/api/"
var userToken = ""

var head:HTTPHeaders = ["secure-code":"secureCode-cdaMVC42NT-YNN","Content-Type":"application/json", "appid":"application-cdaMVC42NT-YNN","deviceid":"test","device-type":"ios","Authorization":"Basic dXNlcjoxMjM="]

let user = "user"
let password = "123"

let credential = URLCredential(user: user, password: password, persistence: .forSession)

/*
 appid                  : application-cdaMVC42NT-YNN
 secure-code           	: secureCode-cdaMVC42NT-YNN
 Content-Type        	: application/json
 deviceid                  	: ID OF PHONE DEVICE
 device-type           	: TYPE OF PHONE DEVICE (android/ios …..)
 */

open class http{
    open class func get(_ url:String, parameter: [String: AnyObject]!, callback:@escaping (Bool, JSON?, JSON?) -> Void){
        print("===================#########", mainUrl+url)
        Alamofire.request(mainUrl + url, parameters: parameter, headers: head)
            //  .authenticate(usingCredential: credential)
            .responseJSON { response in
                if response.result.error == nil{
                    if let data = response.result.value{
                        DispatchQueue.main.async {
                            callback(true, JSON(data), JSON((response.response?.statusCode)!))
                        }
                    }
                }else{
                    DispatchQueue.main.async {
                        if let status = response.response?.statusCode{
                            callback(false, JSON(status),JSON((response.response?.statusCode)!))
                        }else{
                            callback(false,JSON(self.getStatusCodeString(408)),JSON(408))
                        }
                    }
                }
                //                print(response.result.value)
        }
    }
    
    open class func post(_ url:String, parameter: [String: AnyObject], callback:@escaping (Bool, JSON?,JSON?) -> Void){
        Alamofire.request(mainUrl + url,method: .post ,headers: head)
            .authenticate(user:"user", password:"123")
            .responseJSON { response in
                if response.result.error == nil{
                    if let data = response.result.value{
                        DispatchQueue.main.async {
                            callback(true, JSON(data), JSON((response.response?.statusCode)!))
                        }
                    }
                }else{
                    DispatchQueue.main.async {
                        if let status = response.response?.statusCode{
                            callback(false, JSON(status),JSON((response.response?.statusCode)!))
                        }else{
                            callback(false,JSON(self.getStatusCodeString(408)),JSON(408))
                        }
                    }
                }
        }
    }
    
    
    open class func upload(_ url:String, parameter: [String:AnyObject], callback:(Bool, JSON?,JSON?) -> Void){
        print("############# upload", head, mainUrl+url)
        
    }
    
    open class func getStatusCodeString(_ status: Int) -> String {
        switch status{
        case 400:
            return "\(status) Bad Request"
        case 401:
            return "\(status) Unauthorized"
        case 402:
            return "\(status) Payment Required"
        case 403:
            return "\(status) Forbidden"
        case 404:
            return "\(status) Not Found"
        case 405:
            return "\(status) Method Not Allowed"
        case 406:
            return "\(status) Not Acceptable"
        case 407:
            return "\(status) Proxy Authentication Required"
        case 408:
            return "\(status) Request Timeout"
        case 409:
            return "\(status) Conflict"
        case 410:
            return "\(status) Gone"
        case 411:
            return "\(status) Length Required"
        case 412:
            return "\(status) Precondition Failed"
        case 413:
            return "\(status) Request Entity Too Large"
        case 414:
            return "\(status) Request-URI Too Long"
        case 415:
            return "\(status) Unsupported Media Type"
        case 416:
            return "\(status) Requested Range Not Satisfiable"
        case 417:
            return "\(status) Expectation Failed"
        case 500:
            return "\(status) Internal Server Error"
        case 501:
            return "\(status) Not Implemented"
        case 502:
            return "\(status) Bad Gateway"
        case 503:
            return "\(status) Service Unavailable"
        case 504:
            return "\(status) Gateway Timeout"
        case 505:
            return "\(status) HTTP Version Not Supported"
        default:
            return "\(status) Connection Timeout"
        }
    }
}
