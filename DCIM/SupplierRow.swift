//
//  SupplierRow.swift
//  DCIM
//
//  Created by Anyuting on 2019/6/21.
//  Copyright © 2019 kunsy. All rights reserved.
//

import SwiftUI

struct SupplierRow : View {
    
    var supplier: String
    var engineers: [Engineer]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(self.supplier)
            ForEach (self.engineers.identified(by: \.name)) { engineer in
                VStack (alignment: .leading, spacing: 0) {
                    HStack {
                        Text(engineer.name)
                        Spacer()
                        Text("手机号：\(engineer.phone)")
                        }.padding()
                    Text("身份证/ID号：\(engineer.identity)")
                }
                    .font(.body)
            }.padding()
        }

    }
}

//#if DEBUG
//struct SupplierRow_Previews : PreviewProvider {
//    static var previews: some View {
//        
//    }
//}
//#endif


