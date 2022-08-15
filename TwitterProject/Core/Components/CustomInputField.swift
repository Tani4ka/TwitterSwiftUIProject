//
//  CustomInputField.swift
//  TwitterProject
//
//  Created by Tatyana Granchenko on 15.08.2022.
//

import SwiftUI

struct CustomInputField: View {
    let imageName: String
    let placehlderText: String
    @Binding var text: String
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.darkGray))
                
                TextField(placehlderText, text: $text)
            }
            
            Divider()
                .background(Color(.darkGray))
        }
    }
}

struct CustomInputField_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputField(imageName: "envelope", placehlderText: "Email", text: .constant(""))
    }
}
