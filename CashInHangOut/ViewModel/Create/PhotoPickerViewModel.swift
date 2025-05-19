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
        
        func loadTransferable(from imageSelection: PhotosPickerItem) -> Progress {
            return imageSelection.loadTransferable(type: Image.self) { result in
                DispatchQueue.main.async {
                    guard imageSelection == self.imageSelection else { return }
                    switch result {
                    case .success(let image?):
                        self.imageState = .success(image)
                    case .success(nil):
                        self.imageState = .empty
                    case .failure(let error):
                        self.imageState = .failure(error)
                    }
                }
            }
        }
    }
}
