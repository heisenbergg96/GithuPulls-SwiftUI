//
//  PRListRequest.swift
//  GithubPulls
//
//  Created by Vikhyath Shetty on 19/08/22.
//

import Foundation

class PRListRequest: DataRequest {
        
    typealias Response = PullRequests
    
    private let queryparams: [String: String]
    
    var queryItems: [String : String] {
        
        return queryparams
    }
    
    var url: String {
        
        let baseURL = "https://api.github.com/"
        let path = "repos/airbnb/HorizonCalendar/pulls"
        
        return baseURL + path
        
    }
    
    var method: HTTPMethod {
        .get
    }
    
    init(params: [String: String]) {
        self.queryparams = params
    }
}
