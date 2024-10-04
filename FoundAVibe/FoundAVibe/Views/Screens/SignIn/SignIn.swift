//
//  SignIn.swift
//  FoundAVibe
//
//  Created by Alexander Cleoni on 9/24/24.
//

import SwiftUI

struct SignIn: View {
    @EnvironmentObject var session: Session
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var rememberMe = false
    @State private var isSecure = true
    
    @FocusState private var emailFieldIsFocused: Bool
    
    private func handleSubmit() {
        if email != "" && password != "" {
            session.signIn(email: email, password: password)
        }
    }
    
    var body: some View {
        VStack {
            VStack(spacing: 12) {
                Image("FAVBrandColor")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 302)
                Text("Find Local Events And People To Vibe With In Realtime")
                    .font(.abeezeeItalic(size: 14))
                    .lineSpacing(6)
                    .frame(width: 236, height: 40)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.gray)
            }
            .frame(
                maxWidth: .infinity,
                maxHeight: UIScreen.main.bounds.height <= 568 ? 150 : 200,
                alignment: .center)
            
            LinearGradient(
                gradient: Gradient(colors: [
                    Color("SoftPink"), Color("VibrantPink"),
                    Color("MidnightBlue"),
                ]), startPoint: .top, endPoint: .bottom
            )
            .clipShape(
                .rect(
                    topLeadingRadius: 60,
                    bottomLeadingRadius: 0,
                    bottomTrailingRadius: 0,
                    topTrailingRadius: 60
                )
            )
            .overlay {
                VStack {
                    Text("Login")
                        .font(.abeezee(size: 26))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical)
                    TextFieldView(
                        input: $email, keyboardType: .emailAddress,
                        iconName: "envelope.fill",
                        placeholder: "info@youremail.com"
                    )
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .focused($emailFieldIsFocused)
                    TextFieldView(
                        input: $password, isSecure: $isSecure,
                        keyboardType: .default, iconName: "lock.fill",
                        placeholder: "password"
                    )
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .overlay(alignment: .trailing) {
                        Image(systemName: isSecure ? "eye.slash" : "eye")
                            .resizable()
                            .frame(width: 20, height: 16)
                            .onTapGesture {
                                isSecure.toggle()
                            }
                            .padding()
                    }
                    HStack {
                        Toggle(isOn: $rememberMe) {
                            Text("Remember Me")
                                .font(.custom("ABeeZee-Regular", size: 12))
                        }
                        .toggleStyle(iOSCheckboxToggleStyle())
                        .foregroundStyle(.white)
                        Spacer()
                        Button(action: {}) {
                            Text("Forgot Password?")
                                .font(.custom("ABeeZee-Italic", size: 12))
                        }
                        .buttonStyle(.plain)
                        .foregroundStyle(.white)
                    }
                    .padding(.vertical, 6)
                    Button(
                        action: {
                            handleSubmit()
                        },
                        label: {
                            Text("Login")
                                .font(.custom("ABeeZee-Italic", size: 20))
                                .frame(maxWidth: .infinity, maxHeight: 51)
                                .foregroundStyle(.white)
                        }
                    )
                    .frame(height: 51)
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.roundedRectangle(radius: 8))
                    .tint(Color("MidnightBlue"))
                    .padding(.vertical)
                    
                    HStack {
                        Divider().frame(width: 50, height: 1).background(.white)
                        Text("Or Continue With")
                            .font(.custom("ABeeZee-Regular", size: 16))
                            .foregroundStyle(.white)
                        Divider().frame(width: 50, height: 1).background(.white)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.vertical)
                    HStack(spacing: 16) {
                        Image("SIWFB")
                        Image("SIWA")
                        Image("SIWG")
                    }
                    HStack {
                        Text("Don't have and account?")
                        Text("Sign Up")
                            .underline()
                    }
                    .foregroundStyle(.white)
                    .frame(maxHeight: .infinity, alignment: .center)
                }
                .padding()
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .ignoresSafeArea(.keyboard)
        .navigationBarBackButtonHidden()
        .onAppear {
            emailFieldIsFocused = true
        }
    }
}

#Preview {
    SignIn()
}
