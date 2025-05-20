//
//  PhotoPicker.swift
//  CashInHangOut
//
//  Created by Gabriel Ferraz Fontes on 19/05/25.
//

import SwiftUI
import PhotosUI

struct PhotoPicker: View {
    
    @ObservedObject var viewModel: PhotoPickerViewModel
    @State var selectedPhoto: PhotosPickerItem?
    
    var body: some View {
        CircularProfileImage(imageState: viewModel.imageState)
            .overlay(alignment: .bottomTrailing) {
                PhotosPicker(selection: $viewModel.imageSelection, matching: .images, photoLibrary: .shared()) {
                    Image(systemName: "pencil.circle.fill")
                        .symbolRenderingMode(.multicolor)
                        .font(.system(size: 50))
                        .foregroundColor(.accentColor)
                }
                .buttonStyle(.borderless)
            }
    }
}

struct CircularProfileImage: View {
    let imageState: PhotoPicker.PhotoPickerViewModel.ImageState
    
    var body: some View {
        ProfileImage(imageState: imageState)
            .frame(width: 200, height: 200)
            .clipShape(Circle())
            .background {
                Circle().fill(LinearGradient(colors: [.blue, .red], startPoint: .top, endPoint: .bottom))
            }
    }
}

struct ProfileImage: View {
    let imageState: PhotoPicker.PhotoPickerViewModel.ImageState
    
    var body: some View {
        switch imageState {
        case .success(let image):
            image.resizable().scaledToFill().frame(width: 200, height: 200)
        case .loading:
            ProgressView()
        case .empty:
            Image(systemName: "person.fill")
                .font(.system(size: 40))
                .foregroundColor(.white)
        case .failure:
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.system(size: 40))
                .foregroundColor(.white)
        }
    }
}

#Preview {
    PhotoPicker(viewModel: PhotoPicker.PhotoPickerViewModel())
}
