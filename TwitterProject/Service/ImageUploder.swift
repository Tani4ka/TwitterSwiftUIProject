//
//  ImageUploder.swift
//  TwitterProject
//
//  Created by Tatyana Granchenko on 19.08.2022.
//

import Firebase
import FirebaseStorage
import UIKit

struct ImageUploader {
    
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void) {
        
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        
        
        let filename = NSUUID().uuidString // unic file name for image path
        let ref = Storage.storage().reference(withPath: "/profile_image/\(filename)") // create a path reference
        
        ref.putData(imageData) { _, error in
            if let error = error {
                print("DEBUG: Failed to upload image with error: \(error.localizedDescription)")
            }
            
            ref.downloadURL { imageUrl, _ in
                
                guard let imageUrl = imageUrl?.absoluteString else { return }
                completion(imageUrl)
            }
        }
    }
}
