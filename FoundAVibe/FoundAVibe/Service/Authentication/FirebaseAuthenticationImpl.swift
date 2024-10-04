//
//  FirebaseAuthenticationImpl.swift
//  FoundAVibe
//
//  Created by Alexander Cleoni on 10/3/24.
//

import Combine
import FirebaseAuth

class FirebaseAuthenticationImpl: AuthenticationService {
    func signIn(withCredentials credentials: UserCredentials) -> Future<User?, Never> {
        return Future<User?, Never> { promise in
            Auth.auth().signIn(withEmail: credentials.email, password: credentials.password) {(authResult, _) in
                guard let id = authResult?.user.providerID,
                      let email = authResult?.user.email else {
                    promise(.success(nil))
                    return
                }
                var user = User(id: id, email: email)
                if let photoURL = authResult?.user.photoURL?.absoluteString {
                    user.photoUrl = photoURL
                }
                promise(.success(user))
            }
        }
    }
}
