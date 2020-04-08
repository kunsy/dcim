import SwiftUI
import UIKit
import Combine

import AVFoundation //for scan QR code

struct HomeView : View {
    
    @State private var searchText = ""
    @State private var showImage = true
    @EnvironmentObject var searchManager: SearchManager
    @EnvironmentObject var networkManager: ViewModel
    
    @State private var isShowingScanner = false
    
    func handleScan(result: Result<String, CodeScannerView.ScanError>) {
        self.isShowingScanner = false
        switch result {
        case .success(let code):
            print(code)
            self.showImage = false
            self.searchManager.search(query: code)
       case .failure(let error):
           print("Scanning failed")
       }
    }
    var body: some View {
 
        VStack {
            if showImage {
                NavigationLink(destination: SetUp()) {
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
//        .navigationBarItems(trailing: NavigationLink(destination: qrSearchView()) {Image(systemName: "qrcode.viewfinder").font(.body)})
            .navigationBarItems(trailing: Image(systemName: "qrcode.viewfinder").font(.body).onTapGesture {
                self.isShowingScanner = true
            })
        .sheet(isPresented: $isShowingScanner) {
            CodeScannerView(codeTypes: [.qr], simulatedData: "Paul Hudson\npaul@hackingwithswift.com", completion: self.handleScan)
        }
//        .navigationBarHidden(true)
        
    }
}

#if DEBUG
struct HomeView_Previews : PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
#endif
