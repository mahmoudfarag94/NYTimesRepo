//
//  EndPointsd.swift
//  NYTimes
//
//  Created by Mahmoud Farag on 3/8/22.
//  

import Foundation
import Alamofire

let baseUrl = "api.nytimes.com/svc/mostpopular/v2/viewed/"
let key = ".json?api-key=FOMLnFXG9GImFd4GEVlaWATdHLwZnTet"
enum EndPoints: APIConfigurations {

    
    
    case getArticlesList(numOfDays: Days)
    
    var method: HTTPMethod {
        return .get
    }
    
    internal var encoding: ParameterEncoding {
        switch method {
            case .get:
                return URLEncoding.default
            case .post:
                return  JSONEncoding.default
            default:
                return JSONEncoding.default
        }
    }
    
    var path: String {
        switch self {
            case .getArticlesList(let numOfdays):
                return "\(numOfdays.day)\(key)"
        }
    }
    
    var parameters: Parameters? {
        return nil 
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = "https://\(baseUrl)\(path)"
        let finalURl = url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        let urlRequest = URLRequest(url: URL(string: finalURl)!)
        print(finalURl)
        return urlRequest
    }
    
    func getValue(forKey key: String) -> String {
        return (Bundle.main.infoDictionary?[key] as? String)!
    }
}
