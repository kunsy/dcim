//
//  CategoryRow.swift
//  DCIM
//
//  Created by Anyuting on 2020/4/3.
//  Copyright © 2020 kunsy. All rights reserved.
//

import SwiftUI

struct CategoryRow: View {
    var category: String
    var knowledges: [Knowledge]
    var body: some View {
        VStack {
            Text(self.category)
                .font(.headline)
            ForEach (self.knowledges, id: \.name) { knowledge in
                KnowledgeRow(knowledge: knowledge)
            }.padding()
        }
    }
}

//struct CategoryRow_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryRow()
//    }
//}
