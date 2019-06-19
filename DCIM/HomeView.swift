//
//  HomeView.swift
//  DCIM
//
//  Created by Anyuting on 2019/6/19.
//  Copyright © 2019 kunsy. All rights reserved.
//

import SwiftUI
import UIKit


struct HomeView : View {
    var body: some View {
        NavigationView {
            VStack{
                SearchbarView()
                Text("hello world").color(.orange)
            }
        }
        .navigationBarTitle(Text("DCOM"), displayMode: .inline)

    }
}

#if DEBUG
struct HomeView_Previews : PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
#endif
