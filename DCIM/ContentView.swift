//
//  ContentView.swift
//  DCIM
//
//  Created by Anyuting on 2019/6/18.
//  Copyright © 2019 kunsy. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @State private var selection = 0
 
    var body: some View {
        
        TabbedView(selection: $selection){

            NavigationView {
                HomeView()
            } 
            .font(.title)
            .tabItemLabel(VStack {
                Image("first")
                Text("首页")
            })
            .tag(0)

            Text("事件")
                .font(.title)
                .tabItemLabel(VStack {
                    Image("first")
                    Text("事件")
                })
                .tag(1)
            Text("报告")
                .font(.title)
                .tabItemLabel(VStack {
                    Image("first")
                    Text("报告")
                })
                .tag(2)
            Text("我的")
                .font(.title)
                .tabItemLabel(VStack {
                    Image("first")
                    Text("我的")
                })
                .tag(3)
        }
            

    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
