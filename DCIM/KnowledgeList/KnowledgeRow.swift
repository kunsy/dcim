//
//  KnowledgeRow.swift
//  DCIM
//
//  Created by Anyuting on 2019/11/1.
//  Copyright © 2019 kunsy. All rights reserved.
//

import SwiftUI

struct KnowledgeRow: View {
    var knowledge: Knowledge
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            Section(header: NavigationLink(destination: KnowledgeRow(knowledge: knowledge)) {Text("\(knowledge.name)").font(.headline).foregroundColor(.orange)}) {
                HStack {
                    Text("处理过程：")
                    Spacer()
                    Text("\(knowledge.dispose ?? "" )")
                    }.font(.body)
                HStack {
                    Text("备注：")
                    Spacer()
                    Text("\(knowledge.remark ?? "" )")
                    }.font(.body).lineLimit(nil)
                HStack {
                    Text("分组：")
                    Spacer()
                    Text("\(knowledge.division ?? "" )")
                    }.font(.body)
                Spacer()
//                HStack {
//                    Text("添加时间：")
//                    Spacer()
//                    Text("\(knowledge.add_time ?? "" )")
//                    }.font(.body).lineLimit(nil)
                
            }
//            Text("\(event.abstract)").font(.subheadline).foregroundColor(.orange)

        }
//        .frame(height: 600)
    }
}
//
//struct KnowledgeRow_Previews: PreviewProvider {
//    static var previews: some View {
//        KnowledgeRow()
//    }
//}
