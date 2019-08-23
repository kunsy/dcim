//
//  EventListView.swift
//  DCIM
//
//  Created by Anyuting on 2019/7/10.
//  Copyright © 2019 kunsy. All rights reserved.
//

import SwiftUI

struct EventListView : View {
    @EnvironmentObject var networkManager: NetworkManager
    @State private var searchText = ""
    var body: some View {
        VStack {
            List {
                SearchBar(text: $searchText, choice: "events").onAppear{
                    self.networkManager.search(search: self.searchText, in: "events")
                }
                ForEach (self.networkManager.searchEventResults, id: \.abstract) { event in
                    EventRow(event: event)
                }
            }
                .navigationBarTitle(Text("事件记录"))
                .navigationBarItems(trailing: Button(action: {
                    print("Refresh Events")
                    self.networkManager.fetchEvents()
                }, label: {
                    Image(systemName: "arrow.2.circlepath").font(.body)
                }))
        }

    }
}

#if DEBUG
struct EventListView_Previews : PreviewProvider {
    static var previews: some View {
        EventListView()
    }
}
#endif
