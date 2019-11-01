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
    var body: some View {
        VStack {
            List {
                SearchBar(text: $searchText, choice: "knowledge").onAppear{
                    self.networkManager.search(search: self.searchText, in: "knowledge")
                }
                ForEach (self.networkManager.searchKnowledgeResults, id: \.name) { knowledge in
                    KnowledgeRow(knowledge: knowledge)
                }
            }
                .navigationBarTitle(Text("事件记录"))
                .navigationBarItems(trailing: Button(action: {
                    print("Refresh Events")
                    self.networkManager.fetchEvents()
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
