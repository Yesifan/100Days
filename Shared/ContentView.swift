//
//  ContentView.swift
//  Shared
//
//  Created by 叶思凡 on 2022/3/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    UnitConver()
                }label: {
                    Text("UnitConver")
                }
                NavigationLink {
                    RockPaperScissors()
                }label: {
                    Text("RockPaperScissors")
                }
                NavigationLink {
                    BookStore()
                }label: {
                    Text("BookStore")
                }
                NavigationLink {
                    UIKitIntegration()
                }label: {
                    Text("PhotoPicker")
                }
                NavigationLink {
                    LayoutAndGeometry()
                }label: {
                    Text("LayoutAndGeometry")
                }
            }
            .navigationTitle("Projects")
            .navigationBarItems(trailing: Image(systemName: "person.crop.circle"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.portrait)
    }
}
