//
//  SearchResultsView.swift
//  DCIM
//
//  Created by Anyuting on 2019/6/21.
//  Copyright © 2019 kunsy. All rights reserved.
//

import SwiftUI

struct SearchResultsView : View {
    
    var results: SearchResults
 
    var body: some View {
        List {
//            Section {
//                if results.engineers?.count != 0 {
//                    ForEach((self.results.engineers?.identified(by: \.name))!) { engineer in
//                        Text("Engineer:\(engineer.name ?? "")")
//                    }
//                }
//            }

            Section {
                if results.equipments?.count != 0 {
                    ForEach((self.results.equipments?.identified(by: \.name))!) {equipment in
                        Text("Equipment:\(equipment.location ?? "" )")
                    }
                }
            }

        }


        
    }
}

//#if DEBUG
//struct SearchResultsView_Previews : PreviewProvider {
//    static var previews: some View {
//        SearchResultsView()
//    }
//}
//#endif

