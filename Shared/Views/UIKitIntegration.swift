//
//  UIKitIntegration.swift
//  100Days
//
//  Created by 叶思凡 on 2022/4/3.
//

import SwiftUI

struct UIKitIntegration: View {
    @State var image: Image?
    @State var uiImage: UIImage?
    @State var showPicker = false
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(.secondary)
                
                Text("Tap to select a picture")
                    .foregroundColor(.white)
                    .font(.headline)
                
                image?.resizable().scaledToFit()
            }
            .onTapGesture {
                showPicker = true
            }
            .sheet(isPresented: $showPicker){
                PhotoPicker(image: $uiImage)
                    .onChange(of: uiImage){ _ in
                        showPicker = false
                        guard let uiImage = uiImage else {
                            image = nil
                            return
                        }
                        image = Image(uiImage: uiImage)
                    }
            }
    
        }.navigationTitle("PhotoPicker")
    }
}

struct UIKitIntegration_Previews: PreviewProvider {
    static var previews: some View {
        UIKitIntegration()
    }
}
