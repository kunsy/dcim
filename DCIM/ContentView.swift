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
        
        TabView {
            NavigationView {
                HomeView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .padding()
            .font(.title)
            .tabItem {
                Image(systemName: "house.fill")
                Text("首页")
            }
            .tag(0)

            NavigationView {
                EventView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .padding()
            .font(.title)
            .tabItem {
                Image(systemName: "flame.fill")
                Text("事件")
            }
            .tag(1)
            
            NavigationView {
                ReportView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .padding()
            .font(.title)
            .tabItem {
                Image(systemName: "paperplane.fill")
                Text("报告")
            }
            .tag(2)
            
            NavigationView {
                MoiView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .padding()
            .font(.title)
            .tabItem {
                Image(systemName: "heart.fill")
                Text("我的")
            }
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
