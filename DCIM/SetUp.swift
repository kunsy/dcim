//
//  SetUp.swift
//  DCIM
//
//  Created by Anyuting on 2019/11/27.
//  Copyright © 2019 kunsy. All rights reserved.
//

import SwiftUI

struct SetUp: View {
    @EnvironmentObject var searchManager: SearchManager
    @EnvironmentObject var networkManager: ViewModel
    var servers = ["内网", "外网"]

    @State var chosednet = 0
    var body: some View {
        Form {
            Section (header: Text("Server: \(networkManager.baseUrl)")) {
                HStack {
                    Text("服务端地址:")
                    TextField("", text: $networkManager.baseUrl, onCommit: {
                        self.searchManager.baseUrl = self.networkManager.baseUrl
                    })
                }.font(.body)

                Picker("Favorite Color", selection: $chosednet) {
                    ForEach(0 ..< servers.count) { index in
                        Text(self.servers[index])
                            .tag(index)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                Text("参考地址：\(networkManager.nets[chosednet])").font(.body)
//                .onReceive([self.favoriteColor].publisher.first()) { (value) in
//                    if value == 0 {
//                        self.networkManager.baseUrl = "http://10.237.130.45/"
//                    }
//                    if value == 1 {
//                        self.networkManager.baseUrl = "http://202.182.114.239/"
//                    }
//                    self.searchManager.baseUrl = self.networkManager.baseUrl
//                }
                
            }.navigationBarTitle("设置")
        }
    }
}

struct SetUp_Previews: PreviewProvider {
    static var previews: some View {
        SetUp()
    }
}
