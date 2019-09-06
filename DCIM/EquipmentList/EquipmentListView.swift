//
//  EquipmentsListView.swift
//  DCIM
//
//  Created by Anyuting on 2019/7/3.
//  Copyright © 2019 kunsy. All rights reserved.
//

import SwiftUI

struct EquipmentListView : View {
    @EnvironmentObject var networkManager: ViewModel
    @State private var searchText = ""
    var body: some View {
        VStack {
            List {
                SearchBar(text: $searchText, choice: "equipments").onAppear{
                    self.networkManager.search(search: "", in: "equipments")
                }
                ForEach (self.networkManager.searchEquipmentResults, id: \.name) { equipment in
                    EquipmentRow(equipment: equipment)
                }
            }
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
