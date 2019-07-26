//
//  EventView.swift
//  DCIM
//
//  Created by Anyuting on 2019/7/10.
//  Copyright © 2019 kunsy. All rights reserved.
//

import SwiftUI

struct EventView : View {
    var body: some View {
        List {
            Section (header: Text("处理中")){
                NavigationLink (destination: Text("事件单API接口")) {
                    Text("发起事件").font(.body)
                }
                NavigationLink (destination: Text("变更单API接口")) {
                    Text("发起变更").font(.body)
                }
            }.foregroundColor(.orange)
            Spacer()
            Section (header: Text("已解决")){
                NavigationLink (destination: Text("事件单API接口")) {
                    Text("事件").font(.body)
                }
                NavigationLink (destination: Text("变更单API接口")) {
                    Text("变更").font(.body)
                }
            }.foregroundColor(.orange)
            
        }.navigationBarTitle(Text("事件处理").foregroundColor(.orange), displayMode: .inline)
       
    }
}

#if DEBUG
struct EventView_Previews : PreviewProvider {
    static var previews: some View {
        EventView()
    }
}
#endif
