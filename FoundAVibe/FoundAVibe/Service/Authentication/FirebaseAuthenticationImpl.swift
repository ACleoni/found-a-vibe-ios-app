//
//  FirebaseAuthenticationImpl.swift
//  FoundAVibe
//
//  Created by Alexander Cleoni on 10/3/24.
//

import Combine
import FirebaseAuth

class FirebaseAuthenticationImpl: AuthenticationService {
    func signIn(email: String, password: String) -> Future<User?, Never> {
        return Future<User?, Never> { promise in
            Auth.auth().signIn(withEmail: email, password: password) {(authResult, _) in
                guard let id = authResult?.user.providerID,
                    let email = authResult?.user.email else {
                        promise(.success(nil))
                        return
                }
                let user = User(id: id, email: email, photoUrl: "")
                promise(.success(user))
            }
        }
    }
}
