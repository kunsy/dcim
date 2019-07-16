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


class NetworkManager: BindableObject {
    var didChange = PassthroughSubject<NetworkManager, Never>()
    
    var engineers = [Engineer]() {
        didSet {
            didChange.send(self)
        }
    }
    var equipments = [Equipment]() {
        didSet {
            didChange.send(self)
        }
    }
    var events = [Event]() {
        didSet {
            didChange.send(self)
        }
    }
    init() {
        getEngineers()
        getEquipments()
        getEvents()
    }
    func getEquipments() {
        let session = URLSession.shared
        let url = URL(string: "http://18.179.121.218/equipments/")
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
                let results = try JSONDecoder().decode([Equipment].self, from: data)
                DispatchQueue.main.async {
                    self.equipments = results
                }
                
            } catch let jsonErr {
                print(jsonErr)
            }
        }
        task.resume()
    }
    func getEngineers() {
        let session = URLSession.shared
        let url = URL(string: "http://18.179.121.218/engineers/")
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
                let results = try JSONDecoder().decode([Engineer].self, from: data)
                DispatchQueue.main.async {
                    self.engineers = results
                }
                
            } catch let jsonErr {
                print(jsonErr)
            }
        }
        task.resume()
    }
    
    func getEvents() {
        let session = URLSession.shared
        let url = URL(string: "http://18.179.121.218/events/")
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
                let results = try JSONDecoder().decode([Event].self, from: data)
                DispatchQueue.main.async {
                    self.events = results
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

    var searchText = "" {
        didSet {
            didChange.send(self)
        }
    }
    var results = SearchResults(engineers: [], equipments: []) {
        didSet {
            didChange.send(self)
        }
    }
    var resultsIsNotEmpty = false {
        didSet {
            didChange.send(self)
        }
    }
    var engineers = [Engineer]() {
        didSet {
            didChange.send(self)
        }
    }
    var equipments = [Equipment]() {
        didSet {
            didChange.send(self)
        }
    }
    var events = [Event]() {
        didSet {
            didChange.send(self)
        }
    }
    
    func search(query: String) {
        self.engineers = []
        self.equipments = []
        print("nice work")
        let session = URLSession.shared
//        print(query)
        let q = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
//        print(q!)
        guard let url = URL(string: "http://18.179.121.218/search/?query=\(q!))") else { return }
//        print(url)
        let task = session.dataTask(with: url) { data, response, error in
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
                let results = try JSONDecoder().decode(SearchResults.self, from: data)
                DispatchQueue.main.async {
                    self.results = results
                    self.resultsIsNotEmpty = true
                    if results.engineers != nil {
                        self.engineers = results.engineers!
                    }
                    if results.equipments != nil {
                        self.equipments = results.equipments!
                    }
                }
            } catch let jsonErr {
                print(jsonErr)
                self.resultsIsNotEmpty = false
            }
        }
        task.resume()
    }
}


