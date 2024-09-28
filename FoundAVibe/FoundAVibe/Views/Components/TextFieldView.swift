//
//  TextFieldView.swift
//  Found A Vibe
//
//  Created by Alexander Cleoni on 9/13/24.
//

import SwiftUI

struct TextFieldView: View {
    @Binding var input: String
    @Binding var isSecure: Bool
    
    let keyboardType: UIKeyboardType
    let iconName: String
    let placeholder: String
    
    init(
        input: Binding<String>,
        isSecure: Binding<Bool>? = nil,
        keyboardType: UIKeyboardType = .default,
        iconName: String = "magnifyingglass",
        placeholder: String = "Search"
    ) {
        _input = input
        _isSecure = isSecure ?? .constant(false)
        self.keyboardType = keyboardType
        self.iconName = iconName
        self.placeholder = placeholder
    }
    
    @ViewBuilder
    private var inputField: some View {
        if isSecure {
            SecureField(placeholder, text: $input)
        } else {
            TextField(placeholder, text: $input)
        }
    }
    
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: iconName)
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
            inputField
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray, lineWidth: 1)
        )
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    TextFieldView(input: .constant(""), keyboardType: .emailAddress, iconName: "envelope.fill", placeholder: "info@youremail.com")
        .padding()
}
