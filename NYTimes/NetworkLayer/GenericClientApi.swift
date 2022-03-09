//
//  APIClient.swift
//  NYTimes
//
//  Created by Mahmoud Farag on 3/8/22.
//  
//

import Foundation
import Alamofire

class GenericClientApi {
    typealias HandleResponse<T: Decodable> = (_ results: T?, _ error: Error?, _ code: Int ) -> Void

    @discardableResult
    private static func performRequest<T: Decodable>(route: EndPoints, completion:@escaping (T?, Error?,Int?) -> Void) -> DataRequest {
        
        return AF.request(route).responseJSON(completionHandler: { (response) in
            switch response.result {
                case .success( _):
                    do {
                        let DataResponsed = try JSONDecoder().decode(T.self, from: response.data!)
                        completion(DataResponsed, nil, response.response?.statusCode)
                    } catch {
                        completion(nil, error,response.response?.statusCode)
                }
                case .failure(let error):
                    print(error)
                    completion(nil, error, response.response?.statusCode)
            }
        }
        ) }
    // func Generic post // get
    static func CallApi<T: Decodable> (endPoint: EndPoints, completion:@escaping (HandleResponse<T>)  ) {
        performRequest(route: endPoint) { (results, error,code) in
            completion(results, error,code ?? 1001 )
        }
    }
}



