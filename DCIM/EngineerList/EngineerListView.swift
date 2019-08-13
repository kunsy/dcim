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
    @EnvironmentObject var networkManager: NetworkManager
    @State private var searchText = ""
    var suppliers: [String: [Engineer]] {
        .init(
            grouping: networkManager.engineers,
            by: { String($0.supplierName!) }
        )
    }
    var body: some View {
        VStack {
            TextField("name", text: $searchText, onEditingChanged: { (Bool) in
                self.networkManager.search(search: self.searchText, in: "engineers")
            }).padding([.horizontal]).padding(.top)
            
            List {
                ForEach (suppliers.keys.sorted(), id: \.self) { key in
                    SupplierRow(supplier: key, engineers: self.suppliers[key]!)
                }
            }
                .navigationBarTitle(Text("工程师"))
                .navigationBarItems(trailing: Button(action: {
                    print("Attempt to save engineers")
                    self.networkManager.fetchEngineers()
                }, label: {
                    Image(systemName: "arrow.2.circlepath").font(.body)
                }))

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
