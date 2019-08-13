import Foundation
import SwiftUI
import Combine


class NetworkManager: ObservableObject {
    
    var willChange = PassthroughSubject<NetworkManager, Never>()
    
    var engineers = [Engineer]() {
        willSet {
            DispatchQueue.main.async {
                self.willChange.send(self)
            }
        }
    }
    var equipments = [Equipment]() {
        
        willSet {
            DispatchQueue.main.async {
                self.willChange.send(self)
            }
        }
    }
    var events = [Event]() {
        willSet {
            DispatchQueue.main.async {
                self.willChange.send(self)
            }
        }
    }
    var searchEngineerResults = [Engineer]() {
        willSet {
            DispatchQueue.main.async {
                self.willChange.send(self)
            }
        }
    }

    init() {
        DispatchQueue.main.async {
            self.fetchEvents()
            self.fetchEngineers()
            self.fetchEquipments()
        }
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
    func fetchEquipments() {
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
            UserDefaults.standard.set(data, forKey: "equipments")
            UserDefaults.standard.synchronize()
            print("save equipments successfully!")

        }
        task.resume()
    }
    func fetchEngineers() {
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
            UserDefaults.standard.set(data, forKey: "engineers")
            UserDefaults.standard.synchronize()
            print("save engineers successfully!")
        }
        task.resume()
    }
    func fetchEvents() {
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
            UserDefaults.standard.set(data, forKey: "events")
            UserDefaults.standard.synchronize()
            print("save events successfully!")
        }
        task.resume()
    }
    
    func getEquipments() {
        print("try get Equipments...")
        if let jsonEquipments = UserDefaults.standard.value(forKey: "euipments") as? Data {
            self.equipments = try! JSONDecoder().decode([Equipment].self, from: jsonEquipments)
        }
    }
    
    func getEngineers() {
        print("try get Engineers...")
        if let jsonEngineers = UserDefaults.standard.value(forKey: "engineers") as? Data {
            self.engineers = try! JSONDecoder().decode([Engineer].self, from: jsonEngineers)
        }
    }

    func getEvents() {
        print("try get Events...")
        if let jsonEvents = UserDefaults.standard.value(forKey: "events") as? Data {
            self.events = try! JSONDecoder().decode([Event].self, from: jsonEvents)
        }
    }

}


class SearchManager: ObservableObject {
    
    var willChange = PassthroughSubject<SearchManager, Never>()

    var searchText = "" {
        willSet {
            DispatchQueue.main.async {
                self.willChange.send(self)
            }
        }
    }
    var results = SearchResults(engineers: [], equipments: []) {
        willSet {
            DispatchQueue.main.async {
                self.willChange.send(self)
            }
        }
    }
    var resultsIsNotEmpty = false {
        willSet {
            DispatchQueue.main.async {
                self.willChange.send(self)
            }
        }
    }
    var engineers = [Engineer]() {
        willSet {
            DispatchQueue.main.async {
                self.willChange.send(self)
            }
        }
    }
    var equipments = [Equipment]() {
        willSet {
            DispatchQueue.main.async {
                self.willChange.send(self)
            }
        }
    }
    var events = [Event]() {
        willSet {
            DispatchQueue.main.async {
                self.willChange.send(self)
            }
        }
    }
    
    func qrSearch(query: String) {
        print("Now qrSearch for\(query)")
    }
    
    func search(query: String) {
        self.engineers = []
        self.equipments = []
        print("try to search...")
        let session = URLSession.shared
        let q = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        guard let url = URL(string: "http://18.179.121.218/search/?query=\(q!))") else { return }
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


//            let filename = "equipments.json"
//            let fullPath = self.getDocumentsDirectory().appendingPathComponent(filename)
//            do {
//                let results = try JSONDecoder().decode([Equipment].self, from: data)
//                let data = try NSKeyedArchiver.archivedData(withRootObject: results, requiringSecureCoding: false)
//                try data.write(to: fullPath)
//            } catch let jsonErr {
//                print(jsonErr)
//            }

//        let filename = "engineers.json"
//        let fullPath = self.getDocumentsDirectory().appendingPathComponent(filename)
//        do {
////            let data = try NSKeyedArchiver.archivedData(withRootObject: fullPath, requiringSecureCoding: false)
//            let data = try NSData(contentsOf: fullPath)
//
//            if let loadFile = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [Engineer]  {
//                DispatchQueue.main.async {
//                    self.engineers = loadFile
//                }
//                print(loadFile[0])
//                print("...get the first engineer")
//            }
//        } catch {
//            print("Couldn't read file.")
//        }

//        let filename = "events.json"
//        let fullPath = self.getDocumentsDirectory().appendingPathComponent(filename)
//        do {
//            let data = try NSKeyedArchiver.archivedData(withRootObject: fullPath, requiringSecureCoding: false)
//            if let loadFile = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [Event]  {
//                DispatchQueue.main.async {
//                    self.events = loadFile
//                }
//            }
//        } catch {
//            print("Couldn't read file.")
//        }

