//
//  EquipmentsListView.swift
//  DCIM
//
//  Created by Anyuting on 2019/7/3.
//  Copyright © 2019 kunsy. All rights reserved.
//

import SwiftUI

struct EquipmentListView : View {
    @ObjectBinding var networkManager = NetworkManager()
    @State private var searchText = ""
    var body: some View {
        VStack {
            TextField($searchText, placeholder: Text("name"), onEditingChanged: { (Bool) in
                
            }).textFieldStyle(.roundedBorder).padding([.horizontal]).padding(.top)
            List {
                ForEach (self.networkManager.equipments) { equipment in
                    EquipmentRow(equipment: equipment)
                }
            }
                .navigationBarTitle(Text("计算机设备"))
                .navigationBarItems(trailing: Image(systemName: "arrow.2.circlepath").tapAction {
                    print("Attempt to save equipments")
                    self.networkManager.fetchEquipments()
                })
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
