//
//  MoiView.swift
//  DCIM
//
//  Created by Anyuting on 2019/7/10.
//  Copyright © 2019 kunsy. All rights reserved.
//

import SwiftUI

struct MoiView : View {
    var body: some View {
        VStack {
            Image("sunrise")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipped()
//                .edgesIgnoringSafeArea(.all)

            List {
                
                Section (header: Text("个人信息")){
                    NavigationLink (destination: Text("基础信息API接口")) {
                        Text("基础信息").font(.body)
                    }
                    NavigationLink (destination: Text("事件单API接口")) {
                        Text("已处理事件").font(.body)
                    }
                    }.foregroundColor(.orange)
//                Spacer()
                Section (header: Text("工作内容")){
                    NavigationLink (destination: Text("事件单API接口")) {
                        Text("待处理事件").font(.body)
                    }
                    NavigationLink (destination: Text("事件单API接口")) {
                        Text("值班交接").font(.body)
                    }
                    }.foregroundColor(.orange)
                
            }.navigationBarTitle(Text("我的").foregroundColor(.orange), displayMode: .inline)
        }

    }
}

#if DEBUG
struct MoiView_Previews : PreviewProvider {
    static var previews: some View {
        MoiView()
    }
}
#endif
