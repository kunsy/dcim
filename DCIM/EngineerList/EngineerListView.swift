//
//  EngineerListView.swift
//  DCIM
//
//  Created by Anyuting on 2019/6/21.
//  Copyright © 2019 kunsy. All rights reserved.
//

import SwiftUI
import Combine



struct EngineerListView : View {
    
    @ObjectBinding var networkManager = NetworkManager()
    @State private var searchText = ""
    var suppliers: [String: [Engineer]] {
        .init(
            grouping: networkManager.engineers,
            by: { String($0.supplierName!) }
        )
    }
    var body: some View {
        VStack {
            TextField($searchText, placeholder: Text("name"), onEditingChanged: { (Bool) in
                self.networkManager.search(search: self.searchText, in: "engineers")
            }).textFieldStyle(.roundedBorder).padding([.horizontal]).padding(.top)
            
            List {
                ForEach (suppliers.keys.sorted().identified(by: \.self)) { key in
                    SupplierRow(supplier: key, engineers: self.suppliers[key]!)
                }
            }
                .navigationBarTitle(Text("工程师"))
                .navigationBarItems(trailing: Image(systemName: "arrow.2.circlepath").tapAction {
                    print("Attempt to save engineers")
                    self.networkManager.saveEngineers()
                    
                })
        }

    }
}

#if DEBUG
struct EngineerListView_Previews : PreviewProvider {
    static var previews: some View {
        EngineerListView()
    }
}
#endif
