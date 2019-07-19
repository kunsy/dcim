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

import AVFoundation //for scan QR code

struct HomeView : View {
    
    @State private var searchText = ""
    @State private var showImage = true
    @ObjectBinding var searchManager = SearchManager()
    @ObjectBinding var networkManager = NetworkManager()
    var body: some View {
 
        VStack {
            
            
            Image("abc")
                .resizable()
                .clipShape(Circle())
                .aspectRatio(contentMode: .fit)
                .animation(.fluidSpring())
            HStack {
                TextField($searchText, placeholder: Text("sn"), onCommit: {
                    //                self.showImage = false
                    self.searchManager.search(query: self.searchText)
                })
                    .textFieldStyle(.roundedBorder)
                    .padding()
                Image(systemName: "viewfinder.circle").tapAction {
                    
                }.padding(.trailing)
            }

 
            //ScrollView {
            HStack(spacing: 40) {
                NavigationLink(destination: EquipmentListView()) {
                    Text("设备信息").foregroundColor(.orange)
                }
                
                NavigationLink(destination: EngineerListView()) {
                    Text("工程师").color(.orange)
                }
                
                NavigationLink(destination: EventListView()) {
                    Text("事件记录").color(.orange)
                }
                
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
