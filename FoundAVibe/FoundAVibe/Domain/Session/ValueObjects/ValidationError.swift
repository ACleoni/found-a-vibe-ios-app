//
//  ValidationError.swift
//  FoundAVibe
//
//  Created by Alexander Cleoni on 10/4/24.
//

import Foundation

struct ValidationError: Error {
    let title: String
    let message: String
    
    init(title: String = "", message: String = "") {
        self.title = title
        self.message = message
    }
    
    static var invalidEmail: ValidationError {
        return ValidationError(title: "Error", message: "Email address is invalid.")
    }
    
    static var invalidPassword: ValidationError {
        return ValidationError(title: "Error", message: "Password is invalid.")
    }
}
