//
//  Networking.swift
//  DCIM
//
//  Created by Anyuting on 2019/6/19.
//  Copyright © 2019 kunsy. All rights reserved.
//

import Foundation
import SwiftUI
import Combine


class Networking {
    
   static func search(query: String, completion: @escaping (Result<SearchResults, Error>) -> ()) {
        
        print("nice work")
        let session = URLSession.shared
        let url = URL(string: "http://18.179.121.218:8000/search/?query=\(query)")
        
        let task = session.dataTask(with: url!) { data, response, error in
            //check error
            if error != nil || data == nil {
                completion(.failure(error!))
                //print("Client error!")
                return
            }
            //check server error
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Server error!")
                return
            }
            guard let mime = response.mimeType, mime == "application/json" else {
                print("Wrong MIME type!")
                return
            }
            guard let data = data else { return }
            
            do {
                let results = try JSONDecoder().decode(SearchResults.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(results))
                }
            } catch let jsonErr {
                completion(.failure(jsonErr))
            }
        }
        task.resume()
    }
    
    static func getEngineers(completion: @escaping (Result<[Engineer], Error>) -> ()) {
        
        print("Engineers getting")
        let session = URLSession.shared
        let url = URL(string: "http://18.179.121.218:8000/engineers")
        
        let task = session.dataTask(with: url!) { data, response, error in
            //check error
            if error != nil || data == nil {
                completion(.failure(error!))
                //print("Client error!")
                return
            }
            //check server error
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Server error!")
                return
            }
            guard let mime = response.mimeType, mime == "application/json" else {
                print("Wrong MIME type!")
                return
            }
            guard let data = data else { return }
            
                do {
                    let results = try JSONDecoder().decode([Engineer].self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(results))
                    }
                } catch let jsonErr {
                    completion(.failure(jsonErr))
                }
            
        }
        task.resume()
    }
}

class NetworkManager: BindableObject {
    var didChange = PassthroughSubject<NetworkManager, Never>()
    
    var engineers = [Engineer]() {
        didSet {
            didChange.send(self)
        }
    }
    
    init() {
        let session = URLSession.shared
        let url = URL(string: "http://18.179.121.218:8000/engineers")
        
        let task = session.dataTask(with: url!) { data, response, error in
            //check error
            if error != nil || data == nil {
                print("Client error!")
                return
            }
            //check server error
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Server error!")
                return
            }
            guard let mime = response.mimeType, mime == "application/json" else {
                print("Wrong MIME type!")
                return
            }
            guard let data = data else { return }
            
            do {
                let results = try JSONDecoder().decode(EngineersAPI.self, from: data)
                DispatchQueue.main.async {
                    self.engineers = results.results!
                }
                
            } catch let jsonErr {
                print(jsonErr)
            }
        }
        task.resume()
    }
    
}

class SearchManager: BindableObject {
    var didChange = PassthroughSubject<SearchManager, Never>()
    
    var results = SearchResults() {
        didSet {
            didChange.send(self)
        }
    }  
}
