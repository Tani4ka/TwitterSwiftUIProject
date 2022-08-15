//
//  TextArea.swift
//  TwitterProject
//
//  Created by Tatyana Granchenko on 15.08.2022.
//

import SwiftUI

struct TextArea: View {
    @Binding var text: String
    let placeholder: String
    @FocusState var isActive: Bool
    
    init(_ placeholder: String, text: Binding<String>) {
        self.placeholder = placeholder
        self._text = text
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
           
            TextEditor(text: $text)
                .padding(4)
                .focused($isActive)
            
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(Color(.placeholderText))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 12)
                                .onTapGesture {
                        isActive = true
                    }
            }
        }
        .font(.body)
    }
}
