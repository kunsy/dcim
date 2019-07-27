//
//  SearchResultsView.swift
//  DCIM
//
//  Created by Anyuting on 2019/6/21.
//  Copyright © 2019 kunsy. All rights reserved.
//

import SwiftUI

struct SearchResultsView : View {
    @EnvironmentObject var searchManager: SearchManager
    var body: some View {
        List {
            
            Section {
                ForEach(self.searchManager.equipments) {equipment in
                    EquipmentRow(equipment: equipment)
                }
            }
            Section {

                ForEach(self.searchManager.engineers) { engineer in
                    EngineerRow(engineer: engineer)
                }

            }
        }
    }
}

//#if DEBUG
//struct SearchResultsView_Previews : PreviewProvider {
//    static var previews: some View {
//        SearchResultsView()
//    }
//}
//#endif

