//
//  ReportView.swift
//  DCIM
//
//  Created by Anyuting on 2019/7/10.
//  Copyright © 2019 kunsy. All rights reserved.
//

import SwiftUI

struct ReportView : View {
    var body: some View {
        List {
            Section (header: Text("故障记录")){
                NavigationButton (destination: Text("事件单API接口")) {
                    Text("值班事件").font(.body)
                }
                NavigationButton (destination: Text("事件单API接口")) {
                    Text("遗留事件").font(.body)
                }
                }.foregroundColor(.orange)
            Spacer()
            Section (header: Text("问题报告")){
                NavigationButton (destination: Text("事件单API接口")) {
                    Text("重大事件").font(.body)
                }
                NavigationButton (destination: Text("事件单API接口")) {
                    Text("宕机事件").font(.body)
                }
                }.foregroundColor(.orange)
            }.navigationBarTitle(Text("报告").color(.orange), displayMode: .inline)
    }
}

#if DEBUG
struct ReportView_Previews : PreviewProvider {
    static var previews: some View {
        ReportView()
    }
}
#endif
