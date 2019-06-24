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
            Text("\(engineer.name)").font(.title)
            HStack {
                Text("手机号：")
                Spacer()
                Text("\(engineer.phone ?? "" )")
                }.font(.body)
            
            HStack {
                Text("身份证/门禁卡：")
                Spacer()
                Text("\(engineer.identity ?? "" )")
                }.font(.body)
            
            HStack {
                Text("供应商：")
                Spacer()
                Text("\(engineer.supplier)")
                }.font(.body)
        }.font(.body)
    }
}


