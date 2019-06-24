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
    
    @State var networkManager = NetworkManager()
    var suppliers: [String: [Engineer]] {
        .init(
            grouping: networkManager.engineers,
            by: { String($0.supplier) }
        )
    }
    var body: some View {
//        List (networkManager.engineers.identified(by: \.name)) { engineer in
//            EngineerRow(engineer: engineer)
//        }
        List {
            ForEach (suppliers.keys.sorted().identified(by: \.self)) { key in
                
                SupplierRow(supplier: key, engineers: self.suppliers[key]!)
            
            }
    
        }.navigationBarTitle(Text("工程师"))
    }
}

#if DEBUG
struct EngineerListView_Previews : PreviewProvider {
    static var previews: some View {
        EngineerListView()
    }
}
#endif
