//
//  AuthenticationService.swift
//  FoundAVibe
//
//  Created by Alexander Cleoni on 10/3/24.
//

import Foundation
import Combine

protocol AuthenticationService {
    func signIn(withCredentials credentials: UserCredentials) -> Future<User?, Never>
}
