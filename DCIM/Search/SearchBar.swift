//
//  SearchBar.swift
//  DCIM
//
//  Created by Anyuting on 2019/8/19.
//  Copyright © 2019 kunsy. All rights reserved.
//

import SwiftUI

struct SearchBar : View {
    @Binding var text: String
    var choice: String
    @EnvironmentObject var networkManager: ViewModel
    var body: some View {
        VStack {
            TextField("search", text: $text) {
                self.networkManager.search(search: self.text, in: self.choice)
            }
//            TextField("search", text: $text, onEditingChanged: {_ in
//                self.networkManager.search(search: self.text, in: self.choice)
//            })
                .frame(height: 40)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
        }.padding(.top, 8)
    }
}

#if DEBUG
struct SearchBar_Previews : PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""), choice: "events")
            .previewLayout(.fixed(width: 300, height: 60))
    }
}
#endif
