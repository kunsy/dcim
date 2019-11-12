import SwiftUI
import UIKit
import Combine

import AVFoundation //for scan QR code

struct HomeView : View {
    
    @State private var searchText = ""
    @State private var showImage = true
    @EnvironmentObject var searchManager: SearchManager
    @EnvironmentObject var networkManager: ViewModel
    var body: some View {
 
        VStack {
            if showImage {
                NavigationLink(destination: qrSearchView()) {
                    Image("abc")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .aspectRatio(contentMode: .fit)
                }
            }
            HStack {

                TextField("search", text: $searchText, onCommit: {
                     self.showImage = false
                     self.searchManager.search(query: self.searchText)
                }).padding([.leading, .trailing]).padding(.top).textFieldStyle(RoundedBorderTextFieldStyle())
                    
//                Button("Go") {
//                    self.showImage = false
//                    self.searchManager.search(query: self.searchText)
//                }
//                .padding(.trailing)
                
            }
            HStack(spacing: 20) {
                NavigationLink(destination: EquipmentListView()) {
                    Text("设备信息").foregroundColor(.orange)
                }
                NavigationLink(destination: EngineerListView()) {
                    Text("工程师").foregroundColor(.orange)
                }
                NavigationLink(destination: KnowledgeListView()) {
                    Text("知识库").foregroundColor(.orange)
                }
                NavigationLink(destination: EventListView()) {
                    Text("事件记录").foregroundColor(.orange)
                }
            }.onAppear{
                self.networkManager.getEngineers()
                self.networkManager.getEquipments()
                self.networkManager.getEvents()
                self.networkManager.getKnowledge()
                }.font(.body).padding()
            if searchManager.resultsIsNotEmpty {
                SearchResultsView()
                
            }
            Spacer()
            
        }.navigationBarTitle(Text("DCIM"), displayMode: .inline).accentColor(Color.orange)
            
//            .navigationBarHidden(true)
        
    }
}

#if DEBUG
struct HomeView_Previews : PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
#endif
