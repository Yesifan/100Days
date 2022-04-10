//
//  LayoutAndGeometry.swift
//  100Days
//
//  Created by 叶思凡 on 2022/4/8.
//

import SwiftUI

struct LayoutAndGeometry: View {
    var body: some View {
        Section {
            Text("Hello, world!")
                .position(x: 100, y: 100)
                .background(.red)
        }
        .position(x: 410, y: 100)
        .navigationTitle("LayoutAndGeometry")

    }
}

struct LayoutAndGeometry_Previews: PreviewProvider {
    static var previews: some View {
        LayoutAndGeometry()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
