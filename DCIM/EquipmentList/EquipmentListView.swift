//
//  EquipmentsListView.swift
//  DCIM
//
//  Created by Anyuting on 2019/7/3.
//  Copyright © 2019 kunsy. All rights reserved.
//

import SwiftUI

struct EquipmentListView : View {
    @EnvironmentObject var networkManager: NetworkManager
    @State private var searchText = ""
    var body: some View {
        VStack {
            
            TextField("name", text: $searchText, onEditingChanged: { (Bool) in
                
            }).textFieldStyle(.roundedBorder).padding([.horizontal]).padding(.top)
            List {
                ForEach (self.networkManager.equipments) { equipment in
                    EquipmentRow(equipment: equipment)
                }
            }
                .navigationBarTitle(Text("计算机设备"))
                .navigationBarItems(trailing: Button(action: {
                    print("Attempt to refresh equipments")
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
