//
//  WelcomeTwo.swift
//  FoundAVibe
//
//  Created by Alexander Cleoni on 9/23/24.
//

import SwiftUI

struct WelcomeTwo: View {
    var body: some View {
        VStack {
            Image("FAVLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 174)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            VStack(spacing: 12) {
                Text("How It Works")
                    .font(.abeezee(size: 36))
                    .foregroundStyle(.white)
                Image("FAVBrandWhite")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 338)
                Text("Swipe to find local events happening in real time. Swipe right, it's added to your liked events list for future reference. Swipe left and it's gone. Connect with users attending the same events")
                    .font(.abeezeeItalic(size: 14))
                    .foregroundStyle(.white)
                    .frame(width: 326)
                    .lineSpacing(6)
                    .multilineTextAlignment(.center)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            HStack {
                NavigationLink(destination: SignIn()) {
                    Text("Skip")
                        .font(.abeezeeItalic(size: 14))
                        .foregroundStyle(.white)
                }
                Spacer()
                NavigationLink(destination: SignIn()) {
                    Text("Next")
                        .font(.abeezeeItalic(size: 14))
                        .frame(width: 80, height: 34)
                        .foregroundStyle(.white)
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.roundedRectangle(radius: 8))
                .tint(Color("MidnightBlue"))
            }
            .frame(maxWidth: 300, maxHeight: .infinity, alignment: .bottom)
            .padding(.bottom)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(gradient: Gradient(colors: [Color("MidnightBlue"), Color("SoftPink")]), startPoint: .top, endPoint: .bottom))
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    NavigationView {
        WelcomeTwo()
    }
}
