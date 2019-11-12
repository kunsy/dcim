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
        VStack (alignment: .leading) {
            
            List {
              Text("一共搜索到\(searchManager.total)条结果").font(.body)
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
//            .listStyle(GroupedListStyle())
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

