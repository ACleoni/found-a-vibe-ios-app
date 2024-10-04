//
//  Session.swift
//  FoundAVibe
//
//  Created by Alexander Cleoni on 10/3/24.
//

import Combine
import Foundation
import os



@MainActor
class Session: ObservableObject {
    let logger = Logger(subsystem: Bundle.main.bundleIdentifier ?? "FoundAVibe", category: "Session")
    
    @Published var user: User?
    @Published var status: Status?
    @Published var error: Error?
    
    private var cancellableBag = Set<AnyCancellable>()
    private let authenticationService: AuthenticationService
    
    init(authenticationService: AuthenticationService) {
        self.authenticationService = authenticationService
    }
    
    public func signIn(email: String, password: String) {
        do {
            let credentials = try UserCredentials(email: email, password: password)
            authenticationService.signIn(withCredentials: credentials)
                .receive(on: RunLoop.main)
                .map(resultMapper)
                .replaceError(with: Status.errorStatus)
                .assign(to: \.status, on: self)
                .store(in: &cancellableBag)
        } catch let error as ValidationError {
            logger.error("Failed to authenticate the user: \(error.localizedDescription)")
            self.error = error
        } catch {
            logger.error("An unknown error has occured: \(error)")
            self.error = error
        }
    }
}

extension Session {
    private func resultMapper(with user: User?) -> Status {
        if user != nil {
            self.user = user
            return Status.signInSuccessStatus
        } else {
            return Status.errorStatus
        }
    }
}
