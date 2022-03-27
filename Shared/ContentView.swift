//
//  ContentView.swift
//  Shared
//
//  Created by 叶思凡 on 2022/3/27.
//

import SwiftUI

struct ContentView: View {
    enum Tab {
        case unit
    }
    
    @State private var selection: Tab = .unit
    
  
    
    var body: some View {
        TabView(selection: $selection) {
            UnitConver()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.unit)
        }
    }}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
