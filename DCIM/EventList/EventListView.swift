//
//  EventListView.swift
//  DCIM
//
//  Created by Anyuting on 2019/7/10.
//  Copyright © 2019 kunsy. All rights reserved.
//

import SwiftUI

struct EventListView : View {
    @ObjectBinding var networkManager = NetworkManager()
    var body: some View {
        List {
            ForEach (self.networkManager.events) { event in
                EventRow(event: event)
            }
        }.navigationBarTitle(Text("事件记录"))
    }
}

#if DEBUG
struct EventListView_Previews : PreviewProvider {
    static var previews: some View {
        EventListView()
    }
}
#endif
