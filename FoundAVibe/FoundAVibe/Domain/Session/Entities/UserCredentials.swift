//
//  UserCredentials.swift
//  FoundAVibe
//
//  Created by Alexander Cleoni on 10/4/24.
//

import Foundation

class UserCredentials {
    let email: String
    let password: String
    
    init(email: String, password: String) throws {
        guard Self.isValidEmail(email) else {
            throw ValidationError.invalidEmail
        }
        guard Self.isValidPassword(password) else {
            throw ValidationError.invalidPassword
        }
        self.email = email
        self.password = password
    }
    
    private static func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Z|a-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    private static func isValidPassword(_ password: String) -> Bool {
        let minLength = 6
        let containsWhitespace = password.rangeOfCharacter(from: .whitespaces) != nil
        return password.count >= minLength && !containsWhitespace
    }
}
