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
            if showImage {
                NavigationLink(destination: qrSearchView()) {
                    Image("abc")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .aspectRatio(contentMode: .fit)
                }
            }
            HStack {
                TextField("hello", text: $searchText).textFieldStyle(.roundedBorder).padding(.leading).padding(.top)
                Button("Go") {
                    self.showImage = false
                    self.searchManager.search(query: self.searchText)
                }.padding(.trailing)
                
            }
            HStack(spacing: 40) {
                NavigationLink(destination: EquipmentListView()) {
                    Text("设备信息").foregroundColor(.orange)
                }
                NavigationLink(destination: EngineerListView()) {
                    Text("工程师").foregroundColor(.orange)
                }
                NavigationLink(destination: EventListView()) {
                    Text("事件记录").foregroundColor(.orange)
                }
            }.font(.body)
            SearchResultsView(searchManager: self.searchManager)
        }.navigationBarTitle(Text("DCOM"), displayMode: .inline).accentColor(Color.blue)
    }
}

#if DEBUG
struct HomeView_Previews : PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
#endif
