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
            TextField($searchText, placeholder: Text("name"), onEditingChanged: { (Bool) in
                
            }).textFieldStyle(.roundedBorder).padding([.horizontal]).padding(.top)
            
            List {
                ForEach (self.networkManager.events) { event in
                    EventRow(event: event)
                }
            }
                .navigationBarTitle(Text("事件记录"))
                .navigationBarItems(trailing: Image(systemName: "arrow.2.circlepath").tapAction {
                    print("Attempt to save events")
                    self.networkManager.fetchEvents()
                })
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
