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
    
    var willChange = PassthroughSubject<NetworkManager, Never>()
    
    var engineers = [Engineer]() {
        willSet {
            willChange.send(self)
        }
    }
    var equipments = [Equipment]() {
        
        willSet {
            willChange.send(self)
        }
    }
    var events = [Event]() {
        willSet {
            willChange.send(self)
        }
    }
    var searchEngineerResults = [Engineer]() {
        willSet {
            willChange.send(self)
        }
    }

    init() {
        saveEvents()
        saveEngineers()
        saveEquipments()
        getEngineers()
        getEquipments()
        getEvents()
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func search(search text: String, in target: String) {
        if target == "engineers" {
            guard !text.isEmpty else {
                searchEngineerResults = engineers
                return
            }
            self.searchEngineerResults = self.engineers.filter({ engineer -> Bool in
                
                return engineer.name.contains(text)
            })
        }
    }
    func saveEquipments() {
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
            
            let filename = "equipments.json"
            let fullPath = self.getDocumentsDirectory().appendingPathComponent(filename)
            do {
                let results = try JSONDecoder().decode([Equipment].self, from: data)
                
                let data = try NSKeyedArchiver.archivedData(withRootObject: results, requiringSecureCoding: false)
                try data.write(to: fullPath)
            } catch let jsonErr {
                print(jsonErr)
            }
        }
        task.resume()
    }
    func getEquipments() {
        let filename = "equipments.json"
        let fullPath = self.getDocumentsDirectory().appendingPathComponent(filename)
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: fullPath, requiringSecureCoding: false)
            if let loadFile = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [Equipment]  {
                self.equipments = loadFile
            }
        } catch {
            print("Couldn't read file.")
        }
    }
    func saveEngineers() {
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
            
            let filename = "engineers.json"
            let fullPath = self.getDocumentsDirectory().appendingPathComponent(filename)
            do {
                let results = try JSONDecoder().decode([Engineer].self, from: data)
                
                let data = try NSKeyedArchiver.archivedData(withRootObject: results, requiringSecureCoding: false)
                try data.write(to: fullPath)
                self.engineers = results
            } catch let jsonErr {
                print(jsonErr)
            }
        }
        task.resume()
    }
    func getEngineers() {
        let filename = "engineers.json"
        let fullPath = self.getDocumentsDirectory().appendingPathComponent(filename)
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: fullPath, requiringSecureCoding: false)
            if let loadFile = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [Engineer]  {
                self.engineers = loadFile
            }
        } catch {
            print("Couldn't read file.")
        }
    }
    func saveEvents() {
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
            
            let filename = "events.json"
            let fullPath = self.getDocumentsDirectory().appendingPathComponent(filename)
            do {
                let results = try JSONDecoder().decode([Event].self, from: data)
                let data = try NSKeyedArchiver.archivedData(withRootObject: results, requiringSecureCoding: false)
                try data.write(to: fullPath)
            } catch let jsonErr {
                print(jsonErr)
            }
        }
        task.resume()
    }
    func getEvents() {
        let filename = "events.json"
        let fullPath = self.getDocumentsDirectory().appendingPathComponent(filename)
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: fullPath, requiringSecureCoding: false)
            if let loadFile = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [Event]  {
                self.events = loadFile
            }
        } catch {
            print("Couldn't read file.")
        }
    }
}

class SearchManager: BindableObject {
    
    var willChange = PassthroughSubject<SearchManager, Never>()

    var searchText = "" {
        willSet {
            willChange.send(self)
        }
    }
    var results = SearchResults(engineers: [], equipments: []) {
        willSet {
            willChange.send(self)
        }
    }
    var resultsIsNotEmpty = false {
        willSet {
            willChange.send(self)
        }
    }
    var engineers = [Engineer]() {
        willSet {
            willChange.send(self)
        }
    }
    var equipments = [Equipment]() {
        willSet {
            willChange.send(self)
        }
    }
    var events = [Event]() {
        willSet {
            willChange.send(self)
        }
    }
    
    func search(query: String) {
        self.engineers = []
        self.equipments = []
        print("nice work")
        print(NSHomeDirectory())
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


