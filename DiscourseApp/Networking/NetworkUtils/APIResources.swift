//
//  APIResources.swift
//  DiscourseApp
//
//  Created by Rodrigo Candido on 18/1/21.
//



import Foundation


/**
Returns aplication APIResources on demand
 
- Author: Rodrigo Candido
- Version: v1.0
 */
class APIResources {
    
    static let share =  APIResources()
    
    private init() {}
    
    private let resourceFile = "ApiResources"
    private let resourceExt  = "plist"
    
   func apiBaseURL() -> String? {
    
        if let url = Bundle.main.url(forResource: resourceFile, withExtension: resourceExt) {
            do {
                let data = try Data(contentsOf:url)
                guard let apiDictionary = try! PropertyListSerialization.propertyList(from: data, format: nil) as? [String:String] else { return nil}
                return apiDictionary["Base-Url"]
                
            } catch {
                print(error)
            }
        }
        
        return nil
    }
    
    func apiKey() -> String? {
    
        if let url = Bundle.main.url(forResource: resourceFile, withExtension: resourceExt) {
            do {
                let data = try Data(contentsOf:url)
                guard let apiDictionary = try! PropertyListSerialization.propertyList(from: data, format: nil) as? [String:String] else { return nil}
                return apiDictionary["Api-Key"]
                
            } catch {
                print(error)
            }
        }
        
        return nil
    }
    
    func userName() -> String? {
    
        if let url = Bundle.main.url(forResource: resourceFile, withExtension: resourceExt) {
            do {
                let data = try Data(contentsOf:url)
                guard let apiDictionary = try! PropertyListSerialization.propertyList(from: data, format: nil) as? [String:String] else { return nil}
                return apiDictionary["Api-Username"]
                
            } catch {
                print(error)
            }
        }
        
        return nil
    }
    
}
