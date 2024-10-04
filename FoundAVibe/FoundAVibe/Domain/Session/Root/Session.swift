//
//  Session.swift
//  FoundAVibe
//
//  Created by Alexander Cleoni on 10/3/24.
//

import Combine
import Foundation



@MainActor
class Session: ObservableObject {
    @Published var user: User?
    @Published var status: Status?
    
    private var cancellableBag = Set<AnyCancellable>()
    private let authenticationService: AuthenticationService
    
    init(authenticationService: AuthenticationService) {
        self.authenticationService = authenticationService
    }
    
    public func signIn(email: String, password: String) {
        authenticationService.signIn(email: email, password: password)
            .receive(on: RunLoop.main)
            .map(resultMapper)
            .replaceError(with: Status.errorStatus)
            .assign(to: \.status, on: self)
            .store(in: &cancellableBag)
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
