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
        VStack {
            Text(self.supplier)
                .font(.headline)
//                .alignmentGuide(.leading)
            ForEach (self.engineers, id: \.name) { engineer in
                EngineerRow(engineer: engineer)
            }
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


