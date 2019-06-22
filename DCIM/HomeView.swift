//
//  HomeView.swift
//  DCIM
//
//  Created by Anyuting on 2019/6/19.
//  Copyright © 2019 kunsy. All rights reserved.
//

import SwiftUI
import UIKit
import Combine


struct HomeView : View {
    
    @State private var searchText = ""
    //var results = SearchResults(engineers: [Engineer](), equipments: [Equipment]())

    @State var searchManager = SearchManager()
    
    var body: some View {
 
        VStack {
            HStack {
                TextField($searchText, placeholder: Text("ID or Name"))
                    .textFieldStyle(.roundedBorder)
                    .padding()
                Button(action: {
                    Networking.search(query: self.searchText) { (res) in
                        switch res {
                        case .success(let res):
                            print(res)
                            self.searchManager.results = res
                        case .failure(let err):
                            print(err)
                        }
                    }
                }) { Text("Search") }
                }
            ScrollView {
                HStack {
                    Text("设备信息").color(.orange)
                    NavigationButton(destination: EngineerListView()) {
                        Text("工程师").color(.orange)
                    }
                    Text("事件记录").color(.orange)
                }.font(.body).padding()
            }.frame(height: 40)
            
            //SearchResultsView(results: self.searchManager.results)
            Spacer()
       }.navigationBarTitle(Text("DCOM"), displayMode: .inline)
    }
}

#if DEBUG
struct HomeView_Previews : PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
#endif
