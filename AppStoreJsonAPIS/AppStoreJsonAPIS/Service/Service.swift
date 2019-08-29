//
//  Service.swift
//  AppStoreJsonAPIS
//
//  Created by 宋超 on 2019/7/11.
//  Copyright © 2019 宋超. All rights reserved.
//

import Foundation

class Service {
    static let shared = Service()
    
    func fetchApps(searchTerm:String, completion: @escaping ([Result], Error?) -> ()) {
        print("Fetching apps")
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        guard let url = URL(string: urlString) else{return}
        
        //从网络加载数据
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error{
                print("Fail to get data",error)
                completion([],nil)
                return
            }
            print(String(data: data!, encoding: .utf8)!)
            guard let data = data else{return}
            do{
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                print(searchResult.results)
                completion(searchResult.results,nil)

            }catch{
                print("Failed to decode JSON error is :",error)
                completion([],error)
            }
            
            }.resume()
    }
}
