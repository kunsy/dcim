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
    @State var searchNotEmpty = false
    @State var searchManager = SearchManager()
    
    var body: some View {
 
        VStack {

            TextField($searchText, placeholder: Text("Search"), onEditingChanged: { (isChange) in
                Networking.search(query: self.searchText) { (res) in
                    switch res {
                    case .success(let res):
                        //print(res)
                        self.searchManager.results = res
                        self.searchNotEmpty = true
                        print(self.searchManager.results)
                    case .failure(let err):
                        print(err)
                        self.searchNotEmpty = false
                    }
                }
            }).textFieldStyle(.roundedBorder).padding()
            //            ScrollView {
            HStack(alignment: .center, spacing: 40) {
                Text("设备信息").color(.orange)
                NavigationButton(destination: EngineerListView()) {
                    Text("工程师").color(.orange)
                }
                Text("事件记录").color(.orange)
                }.font(.body)
            //            }.frame(height: 40)
            if searchNotEmpty {
                SearchResultsView(results: self.searchManager.results)
            }
            if !searchNotEmpty {
                Spacer()
            }
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
