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
        
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return } // 5880 bytes
        let filename = NSUUID().uuidString // unic file name, like 0A6FDFBC-7B85-4ADF-ACFD-7AA38BC860B3
        let ref = Storage.storage().reference(withPath: "/profile_image/\(filename)") // create a path reference
       // gs://twitterproject-e3c71.appspot.com/profile_image/0A6FDFBC-7B85-4ADF-ACFD-7AA38BC860B3
        
        ref.putData(imageData) { _, error in
            if let error = error {
                print("DEBUG: Failed to upload image with error: \(error.localizedDescription)")
            }
            
            ref.downloadURL { imageUrl, _ in
                guard let imageUrl = imageUrl?.absoluteString else { return }
                completion(imageUrl) // вернет url картинки что мы выбрали
            }
        }
    }
}
