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
                ForEach(self.searchManager.equipments, id: \.name) {equipment in
                    EquipmentRow(equipment: equipment)
                }
            }
            Section {
                ForEach(self.searchManager.engineers, id: \.name) { engineer in
                    EngineerRow(engineer: engineer)
                }
            }
            Section {
                ForEach(self.searchManager.knowledges, id: \.name) { knowledge in
                    KnowledgeRow(knowledge: knowledge)
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

