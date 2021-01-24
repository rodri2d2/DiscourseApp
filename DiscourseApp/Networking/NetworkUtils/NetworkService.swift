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
 
This class handles all network and delegation process by a unique method fetch which asks for a URlResquest, a Data Type to be decoded and once the task is complete execute a complition closure
  
 - Author: Rodrigo Candido
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
             Si hay un error con el dataTask, retornamos error
             */
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }
            
            /*
             Si el servidor devuelve error (del 400 al 599), decodificar el error y lo devolvemos
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
