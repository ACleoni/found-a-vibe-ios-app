//
//  Status.swift
//  FoundAVibe
//
//  Created by Alexander Cleoni on 10/3/24.
//

import Foundation

struct Status {
    let title: String
    let message: String
    
    init(title: String = "", message: String = "") {
        self.title = title
        self.message = message
    }
    
    static var signInSuccessStatus: Status {
        return Status(title: "Successful", message: "Your account has been logged in successfully.")
    }
    
    static var errorStatus: Status {
        return Status(title: "Error", message: "Oops! Something went wrong. Please try again.")
    }
}
