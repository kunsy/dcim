import Foundation
import SwiftUI
import Combine


class ViewModel: ObservableObject {
    @Published
    var user = User(id: UUID(), name: "", secret: "", accesstoken: "", refreshtoken: "")
    @Published
    var engineers = [Engineer]()
    @Published
    var equipments = [Equipment]()
    @Published
    var events = [Event]()
    @Published
    var knowledges = [Knowledge]()
    
    @Published
    var searchEngineerResults = [Engineer]()
    @Published
    var searchEquipmentResults = [Equipment]()
    @Published
    var searchEventResults = [Event]()
    @Published
    var searchKnowledgeResults = [Knowledge]()
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func qrSearch(search text: String) {
        guard !text.isEmpty else {
            self.searchEquipmentResults = equipments
            return
        }
        self.searchEquipmentResults = self.equipments.filter({ equipment -> Bool in
            return (equipment.sn?.contains(text))!
        })
    }
    func search(search text: String, in target: String) {
        if target == "engineers" {
            guard !text.isEmpty else {
                self.searchEngineerResults = engineers
                return
            }
            self.searchEngineerResults = self.engineers.filter({ engineer -> Bool in
                return engineer.name.contains(text)
            })
        }
        if target == "equipments" {
            guard !text.isEmpty else {
                self.searchEquipmentResults = equipments
                return
            }
            self.searchEquipmentResults = self.equipments.filter({ equipment -> Bool in
                return equipment.name.contains(text)
            })
        }
        if target == "events" {
            guard !text.isEmpty else {
                self.searchEventResults = events
                return
            }
            self.searchEventResults = self.events.filter({ event -> Bool in
                return event.abstract.contains(text)
            })
        }
        
        if target == "knowledge" {
            guard !text.isEmpty else {
                self.searchKnowledgeResults = knowledges
                return
            }
            self.searchKnowledgeResults = self.knowledges.filter({ knowledge -> Bool in
                return knowledge.name.contains(text)
            })
        }
    }
    func fetchEquipments() {
        let session = URLSession.shared
        let url = URL(string: "http://52.199.125.59/equipments/")
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
        let url = URL(string: "http://52.199.125.59/engineers/")
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
        let url = URL(string: "http://52.199.125.59/events/")
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

    func fetchKnowledges() {
        let session = URLSession.shared
        let url = URL(string: "http://52.199.125.59/knowledge/")
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
            UserDefaults.standard.set(data, forKey: "knowledges")
            UserDefaults.standard.synchronize()
            print("save knowledge successfully!")
        }
        task.resume()
    }
    
    func getEquipments() {
        print("Get Equipments...")
        if let jsonEquipments = UserDefaults.standard.value(forKey: "equipments") as? Data {
            self.equipments = try! JSONDecoder().decode([Equipment].self, from: jsonEquipments)
        } else {
            print("Fetch Equips")
            self.fetchEquipments()
        }
        
    }
    
    func getEngineers() {
        print("Get Engineers...")
        if let jsonEngineers = UserDefaults.standard.value(forKey: "engineers") as? Data {
            self.engineers = try! JSONDecoder().decode([Engineer].self, from: jsonEngineers)
        } else {
            print("Fetch Engis")
            self.fetchEngineers()
        }
    }

    func getEvents() {
        print("Get Events...")
        if let jsonEvents = UserDefaults.standard.value(forKey: "events") as? Data {
            self.events = try! JSONDecoder().decode([Event].self, from: jsonEvents)
        } else {
            print("Fetch Events")
            self.fetchEvents()
        }
    }

    func getKnowledge() {
        print("Get Knowledge...")
        if let jsonKnowledge = UserDefaults.standard.value(forKey: "knowledges") as? Data {
            self.knowledges = try! JSONDecoder().decode([Knowledge].self, from: jsonKnowledge)
        } else {
            print("Fetch Knowledge")
            self.fetchKnowledges()
        }
    }
}


class SearchManager: ObservableObject {
    @Published
    var searchText = ""
    @Published
    var results = SearchResults(engineers: [], equipments: [], knowledges: [])
    @Published
    var resultsIsNotEmpty = false
    @Published
    var engineers = [Engineer]()
    @Published
    var equipments = [Equipment]()
    @Published
    var events = [Event]()
    @Published
    var knowledges = [Knowledge]()
    
    func qrSearch(query: String) {
        print("Now qrSearch for\(query)")
    }
    
    func search(query: String) {
        self.engineers = []
        self.equipments = []
        self.knowledges = []
        print("try to search...")
        let session = URLSession.shared
        let q = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        guard let url = URL(string: "http://52.199.125.59/search/?query=\(q!))") else { return }
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
                    if results.knowledges != nil {
                        self.knowledges = results.knowledges!
                    }
                }
            } catch let jsonErr {
                print(jsonErr)
                DispatchQueue.main.async {
                    self.resultsIsNotEmpty = false
                }
                
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

