//
//  APICoonfigration.swift
//  NYTimes
//
//  Created by Mahmoud Farag on 3/8/22.
//  
//

import Alamofire
protocol APIConfigurations: URLRequestConvertible {
    var method: HTTPMethod {get}
    var path: String {get}
    var parameters: Parameters? {get}
}
