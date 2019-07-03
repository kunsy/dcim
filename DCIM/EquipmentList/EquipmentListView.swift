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
    var body: some View {
        List {
            ForEach (self.networkManager.equipments) { equipment in
                EquipmentRow(equipment: equipment)
            }
            
            }.navigationBarTitle(Text("计算机设备"))
    }
}

#if DEBUG
struct EquipmentsListView_Previews : PreviewProvider {
    static var previews: some View {
        EquipmentListView()
    }
}
#endif
