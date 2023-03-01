//
//  NetworkAPI.swift
//  Ecommerce
//
//  Created by Константин Козлов on 25.10.2022.
//

import Foundation
import Alamofire

protocol NetworkingService{
    func getHotSalesCategory(url: String, completion: @escaping (HotSales)-> ())
    func getBestSellerCategory(url: String, completion: @escaping (BestSeller)-> ())
}


final class NetworkingAPI: NetworkingService{
    
   func getHotSalesCategory(url: String, completion: @escaping (HotSales)-> ()){
        
         AF.request(url).responseDecodable(of: HotSales.self){
            response in
            
            switch response.result {
            case let .success(data):
                
                completion(data)
                
            case let .failure(error):
                print(error)
            }
        }
    }
    
    func getBestSellerCategory(url: String, completion: @escaping (BestSeller)-> ()){
         
         AF.request(url).responseDecodable(of: BestSeller.self){
             response in
             
             switch response.result {
             case let .success(data):
                 
                 completion(data)
                 
             case let .failure(error):
                 print(error)
             }
         }
     }
}





