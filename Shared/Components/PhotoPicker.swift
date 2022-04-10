//
//  PhotoPicker.swift
//  100Days
//
//  Created by 叶思凡 on 2022/4/5.
//

import PhotosUI
import SwiftUI

class Coordinator: NSObject, PHPickerViewControllerDelegate {
    var parent: PhotoPicker

    init(_ parent: PhotoPicker) {
        self.parent = parent
    }

    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        // Tell the picker to go away
        picker.dismiss(animated: true)

        // Exit if no selection was made
        guard let provider = results.first?.itemProvider else { return }

        // If this has an image we can use, use it
        if provider.canLoadObject(ofClass: UIImage.self) {
            provider.loadObject(ofClass: UIImage.self) { image, _ in
                self.parent.image = image as? UIImage
            }
        }
    }
}

struct PhotoPicker: UIViewControllerRepresentable {
    typealias UIViewControllerType = PHPickerViewController

    @Binding var image: UIImage?

    // swiftUI 会自动应用该方法
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> UIViewControllerType {
        var config = PHPickerConfiguration()
        config.filter = .images

        let picker = PHPickerViewController(configuration: config)
        // 将 UIKit delegate(委托) 给 coordinator(协调器)
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // code
    }
}
