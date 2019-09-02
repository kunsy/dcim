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
    @EnvironmentObject var networkManager: NetworkManager
    var body: some View {
        ZStack {
//            Color.orange
            HStack {
                TextField("search", text: $text, onEditingChanged: {_ in 
                    self.networkManager.search(search: self.text, in: self.choice)
                })
                    .padding([.leading, .trailing], 8)
                    .frame(height: 32)
                    .background(Color.gray.opacity(0.5))
                    .cornerRadius(8)
                }
//                  .padding([.leading, .trailing], 16)
            }
            .frame(height: 40)
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
