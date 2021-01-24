//
//  NetworkService.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 18/1/21.
//

import Foundation
import UIKit


/**
 This class handles all Network requests
 
This class handles all network and delegation process by a method **fetch** which asks for a URlResquest, a Data Type to be decoded and once the task is complete execute a complition closure

To fetch image use **fetchImage**
  
 - Attention: This class was first created by Roberto Garrido. At the time this project was created he teach me how to user this type of class to improve my habilities with networking. **Thank you very much Roberto Garrido**
 - Author: Roberto Garrido
 - Version: v1.0
 */
class NetworkService: NSObject{
    
    private lazy var session: URLSession = {
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        return session
    }()
    
    
    func fetch<T: APIRequest>(this request: T, for completion: @escaping(Result<T.Response?, Error>) -> ()) {
        let request = request.request()
        
        let task = session.dataTask(with: request) { data, response, error in
            /*
                If there is a error with dataTask
             */
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            
            /*
                If return valur from server is from 400 to 599
             */
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode >= 400, let data = data {
              
                do {
                    let serverError = try JSONDecoder().decode(DiscourseAPIError.self, from: data)
                    let errorString = serverError.errors?.joined(separator: ", ") ?? "Unknown error"
                    let domainError = NSError(domain: "request", code: httpResponse.statusCode, userInfo: [NSLocalizedDescriptionKey: errorString])
                    DispatchQueue.main.async {
                        completion(.failure(domainError))
                    }
                    return
                } catch {
                    let errorDecodingError: NSError = NSError(domain: "request", code: 0, userInfo: [NSLocalizedDescriptionKey: "Error decoding the error"])
                    DispatchQueue.main.async {
                        completion(.failure(errorDecodingError))
                    }
                    return
                }
            }
            
            if let data = data {
             
                do {
                    let model = try JSONDecoder().decode(T.Response.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(model))
                    }
                } catch {
                    
                    /*
                     In some case data does not need an exact answer type but instead is just empty if 200 return code
                     */
                    if data.isEmpty{
                        DispatchQueue.main.async {
                            completion(.success(nil))
                        }
                    }
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                }

            } else {
                DispatchQueue.main.async {
                    completion(.success(nil))
                }
            }
        }
        task.resume()
    }
    
    func fetchImage(imageURL: URL, completion: @escaping (_ image: UIImage)-> ()) {
        
        DispatchQueue.global(qos: .utility).async {
            if let data = try? Data(contentsOf: imageURL) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        completion(image)
                    }
                   
                }
            }
        }
        
    }
    
}


struct DiscourseAPIError: Codable {
    let action: String?
    let errors: [String]?
}
