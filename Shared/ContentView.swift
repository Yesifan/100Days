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
        TabView(selection: $selection) {
            UnitConver()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.Unit)
            RockPaperScissors()
                .tabItem {
                    Label("RockPaperScissors", systemImage: "star")
                }
                .tag(Tab.RockPaperScissors)
        }
    }}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
