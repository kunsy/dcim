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
            Text("\(equipment.name!)").font(.subheadline).foregroundColor(.orange)
            HStack {
                Text("序列号：")
                Spacer()
                Text("\(equipment.sn ?? "" )")
                }.font(.body)
            
            HStack {
                Text("位置：")
                Spacer()
                Text("\(equipment.location ?? "" )")
                }.font(.body)
            
            HStack {
                Text("应用：")
                Spacer()
                Text("\(equipment.application ?? "" )")
                }.font(.body)
            HStack {
                Text("分区：")
                Spacer()
                Text("\(equipment.partition ?? "" )")
                }.font(.body)
            HStack {
                Text("维保商：")
                Spacer()
                Text("\(equipment.supporter ?? "" )")
                }.font(.body)
        }
    }
}

//#if DEBUG
//struct EquipmentRow_Previews : PreviewProvider {
//    static var previews: some View {
//        EquipmentRow()
//    }
//}
//#endif
