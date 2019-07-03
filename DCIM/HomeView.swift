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

    @ObjectBinding var searchManager = SearchManager()
    @ObjectBinding var networkManager = NetworkManager()
    var body: some View {
 
        VStack {
            TextField($searchText, placeholder: Text("search"), onEditingChanged: { (Bool) in
                self.searchManager.search(query: self.searchText)
            }).textFieldStyle(.roundedBorder).padding([.horizontal]).padding(.top)
            //ScrollView {
            HStack(spacing: 40) {
                NavigationButton(destination: EquipmentListView()) {
                    Text("设备信息").foregroundColor(.orange)
                }
                
                NavigationButton(destination: EngineerListView()) {
                    Text("工程师").color(.orange)
                }
                Text("事件记录").color(.orange)
            }.font(.body)

            SearchResultsView(searchManager: self.searchManager)

            if !searchManager.resultsIsNotEmpty {
                Spacer()
            }
            
    }.navigationBarTitle(Text("DCOM"), displayMode: .inline)
        .accentColor(Color.blue)
        
}
}

#if DEBUG
struct HomeView_Previews : PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
#endif
