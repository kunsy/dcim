//
//  SearchResultsView.swift
//  DCIM
//
//  Created by Anyuting on 2019/6/21.
//  Copyright © 2019 kunsy. All rights reserved.
//

import SwiftUI

struct SearchResultsView : View {
    
    var results: SearchResults
    @State var hasEngineer = false
    @State var hasEquipment = false
    
    var body: some View {
        List {
            Section {
                if results.equipments?.count != 0 {
                    ForEach((self.results.equipments?.identified(by: \.name))!) {equipment in
                        EquipmentRow(equipment: equipment)
                    }
                }
            }
//            Section {
                
//                if results.engineers?.count == 0 {
//
//                    ForEach((self.results.engineers?.identified(by: \.name))!) { engineer in
//                        Text("Engineer:\(engineer.name )")
//                    }
//                }
//            }
            }//.frame(height: 600)
    }
}

//#if DEBUG
//struct SearchResultsView_Previews : PreviewProvider {
//    static var previews: some View {
//        SearchResultsView()
//    }
//}
//#endif

