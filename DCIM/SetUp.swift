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
    var body: some View {
        
        Form {
            Section (header: Text("Server")) {
                HStack {
                    Text("服务端地址:")
                    TextField("", text: $networkManager.baseUrl, onCommit: {
                        self.searchManager.baseUrl = self.networkManager.baseUrl
//                        print(self.searchManager.baseUrl)
//                        print(self.networkManager.baseUrl)
                    })
                }.font(.body)
            }.navigationBarTitle("设置")
        }
    }
}

struct SetUp_Previews: PreviewProvider {
    static var previews: some View {
        SetUp()
    }
}
