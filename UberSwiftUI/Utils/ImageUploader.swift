//
//  ImageUploader.swift
//  UberSwiftUI
//
//  Created by Joe Vargas on 10/24/22.
//

import UIKit
import FirebaseStorage

struct ImageUploader {
    
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {return}
        
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        ref.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                //TODO: Handle error with UIAlertController and UIAlertAction
                print("DEBUG: failed up upload image with error: ", error.localizedDescription)
                return
            }
            
            print("DEBUG: Successfully uploaded image to firebase storage")
            
            ref.downloadURL { url, error in
                if let error = error {
                    //TODO: Handle error with UIAlertController and UIAlertAction
                    print("DEBUG: error retrieving image url with error message: ", error.localizedDescription)
                    return
                }
                
                guard let imageUrl = url?.absoluteString else {return}
                completion(imageUrl)
            }
        }
        
    }
}
