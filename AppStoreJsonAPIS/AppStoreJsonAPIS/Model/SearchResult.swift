//
//  SearchResult.swift
//  AppStoreJsonAPIS
//
//  Created by 宋超 on 2019/7/11.
//  Copyright © 2019 宋超. All rights reserved.
//

import Foundation


struct SearchResult :Decodable{
    let resultCount :Int
    let results :[Result]
}

struct Result :Decodable{
    let trackName :String
    let primaryGenreName :String
    var averageUserRating: Float?
    let screenshotUrls: [String]
    let artworkUrl100: String
    
    
}
