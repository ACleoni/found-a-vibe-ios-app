//
//  FirebaseConfig.swift
//  FoundAVibe
//
//  Created by Alexander Cleoni on 9/28/24.
//

import Foundation
import Firebase

enum Environment {
    case development
    case production
}

class FirebaseConfig {
    static public func configure() {
        let environment: Environment = {
            #if DEBUG
            return .development
            #else
            return .production
            #endif
        }()
        
        let plistFileName: String
        switch environment {
        case .development:
            plistFileName = "GoogleServiceNonProd-Info"
        case .production:
            plistFileName = "GoogleServiceProd-Info"
        }
        
        guard let plistPath = Bundle.main.path(forResource: plistFileName, ofType: "plist") else {
            fatalError("Could not find plist file name with \(plistFileName).")
        }
        
        guard let options = FirebaseOptions(contentsOfFile: plistPath) else {
            fatalError("Could not load Firebase options from \(plistPath).")
        }
        
        FirebaseApp.configure(options: options)
        print("Firebase successfully configured for \(environment) environment.")
    }
}
