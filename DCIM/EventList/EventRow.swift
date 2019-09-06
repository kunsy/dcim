//
//  EventRow.swift
//  DCIM
//
//  Created by Anyuting on 2019/7/10.
//  Copyright © 2019 kunsy. All rights reserved.
//

import SwiftUI

struct EventRow : View {
    var event: Event
    var body: some View {
        VStack  {
            Section(header: Text("\(event.abstract)").font(.headline).foregroundColor(.orange)) {
                HStack {
                    Text("发生日期：")
                    Spacer()
                    Text("\(event.date ?? "" )")
                    }.font(.body)
                HStack {
                    Text("事件处理：")
                    Spacer()
                    Text("\(event.dispose ?? "" )")
                    }.font(.body).lineLimit(nil)
                HStack {
                    Text("故障确认时间：")
                    Spacer()
                    Text("\(event.confirmTime ?? "" )")
                    }.font(.body)
                HStack {
                    Text("状态：")
                    Spacer()
                    Text("\(event.status ?? "" )")
                    }.font(.body)
                HStack {
                    Text("故障原因：")
                    Spacer()
                    Text("\(event.causes ?? "" )")
                    }.font(.body)
                HStack {
                    Text("备忘：")
                    Spacer()
                    Text("\(event.remark ?? "" )")
                    }.font(.body).lineLimit(nil)
            }
//            Text("\(event.abstract)").font(.subheadline).foregroundColor(.orange)

        }
//        .frame(height: 600)
    }
}

//#if DEBUG
//struct EventRow_Previews : PreviewProvider {
//    static var previews: some View {
//        EventRow()
//    }
//}
//#endif
