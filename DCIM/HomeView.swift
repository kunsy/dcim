//
//  HomeView.swift
//  DCIM
//
//  Created by Anyuting on 2019/6/19.
//  Copyright © 2019 kunsy. All rights reserved.
//

import SwiftUI
import UIKit


struct HomeView : View {
    
    @State private var searchText = ""
    var results = SearchResults(engineers: [Engineer](), equipments: [Equipment]())
    
    var body: some View {
 
        VStack {
            HStack {
                TextField($searchText)
                    .textFieldStyle(.roundedBorder)
                    .padding()

                Button(action: {
                    self.search { (res) in
                        switch res {
                        case .success(let res):
                            print(res)
                            //results = res
                            if res.engineers != nil {
                                let engineers = res.engineers
                                print(engineers?[0].name)
                            }
                            if res.equipments != nil {
                                let equipments = res.equipments
                                print((equipments?[0].name)!)
                            }
                        case .failure(let err):
                            print(err)
                        }
                    }
                }) { Text("Search") }
            
            }
            
            Text("hello world")
                .color(.orange)
            Spacer()
       }
    }

    private func search(completion: @escaping (Result<SearchResults, Error>) -> ()) {
    
    print("nice work")
    let session = URLSession.shared
    let url = URL(string: "http://18.179.121.218:8000/search/?query=\(searchText)")
    
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
            completion(.success(results))
        } catch let jsonErr {
            completion(.failure(jsonErr))
        }
    }
    task.resume()
}
}

#if DEBUG
struct HomeView_Previews : PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
#endif
