//
//  PhotoPickerViewModel.swift
//  CashInHangOut
//
//  Created by Gabriel Ferraz Fontes on 19/05/25.
//

import PhotosUI
import SwiftUI

extension PhotoPicker {
    class PhotoPickerViewModel: ObservableObject {
        enum ImageState {
            case empty, loading(Progress), success(Image), failure(Error)
        }
        @Published private(set) var imageState: ImageState = .empty
        
        private(set) var imageData: Data?
        
        @Published var imageSelection: PhotosPickerItem? = nil {
            didSet {
                if let imageSelection = imageSelection {
                    let progress = loadTransferable(from: imageSelection)
                    imageState = .loading(progress)
                } else {
                    imageState = .empty
                }
            }
        }
        
        init(imageData: Data?) {
            loadImage(data: imageData)
        }

        init() { }

        func loadTransferable(from imageSelection: PhotosPickerItem) -> Progress {
            return imageSelection.loadTransferable(type: Image.self) { result in
                DispatchQueue.main.async {
                    guard imageSelection == self.imageSelection else { return }
                    switch result {
                    case .success(let image?):
                        self.imageData = ImageRenderer(content: image).uiImage?.jpegData(compressionQuality: 1.0)
                        print("loadTransferable --- \(self.imageData)")
                        self.imageState = .success(image)
                    case .success(nil):
                        self.imageState = .empty
                    case .failure(let error):
                        self.imageState = .failure(error)
                    }
                }
            }
        }

        func loadImage(data: Data?) {
            print("loadImage --- \(data)")
            guard let imageData = data else { return }
            print("imageData")
            guard let image = UIImage(data: imageData) else { return }
            print("Image")
            self.imageState = .success(Image(uiImage: image))
        }
    }
}
