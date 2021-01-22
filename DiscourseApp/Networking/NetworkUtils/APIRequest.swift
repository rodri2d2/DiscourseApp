//
//  APIRequest.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 18/1/21.
//

import Foundation


protocol APIRequest {
    
    associatedtype  Response:           Codable
    var baseURL:    URL                 { get }
    var path:       String              { get }
    var httpMethod: HTTPMethod          { get }
    var headers:    [String: String]    { get }
    var body:       [String: Any]       { get }
    var parameters: [String: String]    { get }
  
}


extension APIRequest {
    
    var baseURL: URL {
        guard let baseURL = URL(string: APIResources.share.apiBaseURL()!) else {
            fatalError("URL not valid")
        }
        
        return baseURL
    }
    
    
    
    func request() -> URLRequest {
        
        let url = baseURL.appendingPathComponent(path)
        print(url)
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            fatalError("Not able to create components")
        }
        
        if !parameters.isEmpty{
            components.queryItems = parameters.map{ (key, value) in
                URLQueryItem(name: key, value: value)
            }
        }
        
        guard let urlToResquest = components.url else {
            fatalError("Unable to retrieve final URL")
        }
        
        var request = URLRequest(url: urlToResquest)
        request.httpMethod = httpMethod.rawValue
        
        if !body.isEmpty {
            let jsonData = try? JSONSerialization.data(withJSONObject: body)
            request.httpBody = jsonData
        }
        
        for keyValue in headers {
            request.addValue(keyValue.value, forHTTPHeaderField: keyValue.key)
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let apiKey   = APIResources.share.apiKey(),
              let userName = APIResources.share.userName() else {
            return request
        }
        
        request.addValue(apiKey,   forHTTPHeaderField: "Api-Key")
        request.addValue(userName, forHTTPHeaderField: "Api-Username")
        
        return request
        
    }
    
}
