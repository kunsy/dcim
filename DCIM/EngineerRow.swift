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

        HStack{
            Text(engineer.name).font(.headline)
            Spacer()
            Text(engineer.phone)
        }

    }
}


