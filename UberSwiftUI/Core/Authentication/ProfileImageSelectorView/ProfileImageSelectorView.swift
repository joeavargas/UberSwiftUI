//
//  ProfileImageSelectorView.swift
//  UberSwiftUI
//
//  Created by Joe Vargas on 10/23/22.
//

import SwiftUI

struct ProfileImageSelectorView: View {
    @State private var imagePickerPresented = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @EnvironmentObject var authVM: AuthViewModel
    
    var body: some View {
        ZStack {
            Color.theme.customGrayColor
            
            VStack(spacing: 32) {
                Button(action: {
                    imagePickerPresented.toggle()
                }, label: {
                    if let profileImage = profileImage {
                        profileImage
                            .resizable()
                            .scaledToFill()
                            .frame(width: 180, height: 180)
                            .clipped()
                            .clipShape(Circle())
                    } else {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .renderingMode(.template)
                            .scaledToFill()
                            .frame(width: 180, height: 180)
                            .clipped()
                            .padding(.top, 44)
                    }
                })
                .sheet(isPresented: $imagePickerPresented,
                       onDismiss: loadImage, content: {
                    ImagePicker(image: $selectedImage)
                })
                
                Text(profileImage == nil ? "Upload a profile image" : "Great! Tap below to continue")
                    .font(.system(size: 20, weight: .semibold))
                
                if let image = selectedImage {
                    //MARK: handle selecting and uploading image now
                    Button(action: {
                        authVM.uploadProfileImage(image)
                    }, label: {
                        Text("Continue")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 340, height: 50)
                            .background(Color.blue)
                            .clipShape(Rectangle())
                            .padding()
                    })
                    .padding(.top, 24)
                } else {
                    //MARK: upload image later
                    Button(action: {
                        //TODO: handle moving on to HomeView
                        print("DEBUG: Upload image later")
                    }, label: {
                        Text("Upload image later")
                            .font(.callout)
                            .foregroundColor(.blue)
                            .padding()
                    })
                    .padding(.top, 24)
                }
                
                Spacer()
            }
            .foregroundColor(.white)
            .padding(.top, 100)
            .navigationBarBackButtonHidden(true)
        }
        .ignoresSafeArea()
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else {return}
        profileImage = Image(uiImage: selectedImage)
    }
}

struct ProfileImageSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImageSelectorView()
    }
}
