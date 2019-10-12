//
//  Login.swift
//  DCIM
//
//  Created by Anyuting on 2019/9/6.
//  Copyright © 2019 kunsy. All rights reserved.
//

import SwiftUI


struct CircleImage: View {
    var body: some View {
        Image("abc")
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
    }
}

struct Login: View {
    @EnvironmentObject var viewModel: ViewModel
    var body: some View {
            VStack {
                
                CircleImage().offset(x: 0, y: -100).padding(.bottom, -130).padding(40)
                TextField("name", text: $viewModel.user.name)
                    .padding()
                    .padding(5)
//                    .border(Color.white, width: 3, cornerRadius: 100)
                    .padding()
                
                
//                TextField(.constant("PASSWORD"))
//                    .padding()
//                    .padding(5)
//                    .border(Color.white, width: 3, cornerRadius: 100)
//                    .padding()
                
                
                HStack{
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {Text("Login")}.padding(15)
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {Text("Register")}.padding()

                      }
                
//                VStack{
//                    Group {
//                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
//                        Text("Facebook")
//                            .foregroundColor(.white)
//                            .padding()
//                            .padding(2)
//                            .border(Color.blue, width: 3)
//                            .background(Color.blue)
//                            .cornerRadius(100)
//                        }
//
//                    }
//
//
//                    Button(action: {}) {
//                        Text("  Google ")
//                        .color(.white)}
//                        .padding()
//                        .padding(2)
//                        .border(Color.red, width: 3)
//                        .background(Color.red)
//                        .cornerRadius(100)
//                        .padding(4)
//                    }
                
            }

        }
//                .background(Image("Background"))

}

#if DEBUG
struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
#endif
