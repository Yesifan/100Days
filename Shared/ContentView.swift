//
//  ContentView.swift
//  Shared
//
//  Created by 叶思凡 on 2022/3/27.
//

import SwiftUI

struct ContentView: View {
    enum Tab {
        case Unit, RockPaperScissors
    }
    
    @State private var selection: Tab = .Unit
    
  
    
    var body: some View {
        NavigationView{
            List{
                NavigationLink{
                    UnitConver()
                }label: {
                    Text("UnitConver")
                }
                NavigationLink{
                    RockPaperScissors()
                }label: {
                    Text("RockPaperScissors")
                }
                NavigationLink{
                    BookStore()
                }label: {
                    Text("BookStore")
                }
            }.navigationTitle("Projects")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
