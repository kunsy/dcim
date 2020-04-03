//
//  KnowledgeListView.swift
//  DCIM
//
//  Created by Anyuting on 2019/11/1.
//  Copyright © 2019 kunsy. All rights reserved.
//

import SwiftUI

struct KnowledgeListView: View {
    @EnvironmentObject var networkManager: ViewModel
    @State private var searchText = ""
    @State private var currentIndex = 0
    var categorys: [String: [Knowledge]] {
        .init(
            grouping: networkManager.searchKnowledgeResults,
            by: { String($0.category_sub!) }
        )
    }
    var body: some View {
        VStack {
//            Picker(selection: $currentIndex) {
//                Text("全部").tag(0)
//                Text("主机平台").tag(1)
//                Text("开放平台").tag(2)
//            }.pickerStyle(SegmentedPickerStyle()).tapAction {
//                print("ok")
//            }
            List {
                SearchBar(text: $searchText, choice: "knowledge").onAppear{
                    self.networkManager.search(search: self.searchText, in: "knowledge")
                }

                ForEach (categorys.keys.sorted(), id: \.self) { key in
                    CategoryRow(category: key, knowledges: self.categorys[key]!)
                }
            }
                .listStyle(GroupedListStyle())
                .navigationBarTitle(Text("知识库"))
                .navigationBarItems(trailing: Button(action: {
                    print("Refresh Knowledge")
                    self.networkManager.fetchKnowledges()
                }, label: {
                    Image(systemName: "arrow.2.circlepath").font(.body)
                }))
        }

    }
}

struct KnowledgeListView_Previews: PreviewProvider {
    static var previews: some View {
        KnowledgeListView()
    }
}
