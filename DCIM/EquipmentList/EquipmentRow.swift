//
//  EquipmentRow.swift
//  DCIM
//
//  Created by Anyuting on 2019/6/24.
//  Copyright © 2019 kunsy. All rights reserved.
//

import SwiftUI

struct EquipmentRow : View {
    var equipment: Equipment
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            NavigationLink(destination: EquipmentRow(equipment: equipment)) {
                Text("\(equipment.name)").font(.headline).foregroundColor(.orange)
            }
            HStack {
                Text("序列号：  ")
//                Spacer()
                Text("\(equipment.sn ?? "" )")
                }.font(.body)
            
            HStack {
                Text("资产编号：")
//                Spacer()
                Text("\(equipment.asset_sn ?? "" )")
                }.font(.body)

            HStack {
                Text("档案卡号：")
//                Spacer()
                Text("\(equipment.archive_sn ?? "" )")
                }.font(.body)
            
            HStack {
                Text("位置：      ")
//                Spacer()
                Text("\(equipment.location ?? "" )")
                }.font(.body)

            HStack {
                Text("应用：      ")
//                Spacer()
                Text("\(equipment.application ?? "" )").lineLimit(nil)
                }.font(.body)
            HStack {
                Text("分区：    ")
//                Spacer()
                Text("\(equipment.partition ?? "" )").lineLimit(nil)
                }.font(.body)
            HStack {
                Text("维保商：  ")
//                Spacer()
                Text("\(equipment.supporter ?? "" )")
                }.font(.body)
                Spacer()
        }.padding()

    }
}

//#if DEBUG
//struct EquipmentRow_Previews : PreviewProvider {
//    static var previews: some View {
//        EquipmentRow()
//    }
//}
//#endif
