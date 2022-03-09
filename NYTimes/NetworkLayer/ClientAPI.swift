//
//  NetworkManager.swift
//  NYTimes
//
//  Created by Mahmoud Farag on 3/8/22.
//  

import Foundation

protocol ClientAPIType {
    func getArticlesList(numOfDays: Days, completion: @escaping (_ list: [Article]) -> Void)
}

class ClientAPI: ClientAPIType {
    func getArticlesList(numOfDays: Days, completion: @escaping (_ list: [Article]) -> Void){
        let endPoint = EndPoints.getArticlesList(numOfDays: numOfDays)
        print("---", endPoint)
        GenericClientApi.CallApi(endPoint: endPoint) { (result: Articles?, error: Error?, code) in
            guard let resultList = result?.results else { return }
            completion(resultList)
        }
    }
    
}
