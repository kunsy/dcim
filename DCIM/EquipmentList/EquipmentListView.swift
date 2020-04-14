//
//  EquipmentsListView.swift
//  DCIM
//
//  Created by Anyuting on 2019/7/3.
//  Copyright © 2019 kunsy. All rights reserved.
//

import SwiftUI

struct EquipmentListView : View {
    init()
    {
        UITableView.appearance().tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: Double.leastNonzeroMagnitude))
    }
    @EnvironmentObject var networkManager: ViewModel
    @State private var searchText = ""
    var body: some View {
        VStack {
            SearchBar(text: $searchText, choice: "equipments").onAppear{
                self.networkManager.search(search: "", in: "equipments")
            }
            List {
                ForEach (self.networkManager.searchEquipmentResults, id: \.name) { equipment in
                    EquipmentRow(equipment: equipment)
                }
            }.id(UUID())
                .listStyle(GroupedListStyle())
                .navigationBarTitle(Text("计算机设备"))
                .navigationBarItems(trailing: Button(action: {
                    print("Refresh equipments")
                    self.networkManager.fetchEquipments()
                }, label: {
                    Image(systemName: "arrow.2.circlepath").font(.body)
                }))
        }
    }
}

#if DEBUG
struct EquipmentsListView_Previews : PreviewProvider {
    static var previews: some View {
        EquipmentListView()
    }
}
#endif
