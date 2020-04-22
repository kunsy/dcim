//
//  EngineerRow.swift
//  DCIM
//
//  Created by Anyuting on 2019/6/19.
//  Copyright © 2019 kunsy. All rights reserved.
//

import SwiftUI

struct EngineerRow : View {
    var engineer: Engineer
    
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            NavigationLink(destination: EngineerRow(engineer: engineer)) {
                Text("\(engineer.name)").font(.subheadline).foregroundColor(.orange)
            }
            HStack {
                Text("手机号：")
//                Spacer()
                Text("\(engineer.phone ?? "" )")
                }.font(.body)
            
            HStack {
                Text("ID：         ")
//                Spacer()
                Text("\(engineer.identity ?? "" )")
                }.font(.body)
            
            HStack {
                Text("供应商：")
//                Spacer()
                Text("\(engineer.supplierName!)")
                }.font(.body)
            Spacer()
            }.font(.body).padding()
    }
}


