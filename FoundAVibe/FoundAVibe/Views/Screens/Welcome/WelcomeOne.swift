//
//  WelcomeOne.swift
//  FoundAVibe
//
//  Created by Alexander Cleoni on 9/23/24.
//

import SwiftUI

struct WelcomeOne: View {
    var body: some View {
        VStack {
            Image("FAVLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 174)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            VStack(spacing: 12) {
                Text("Welcome to")
                    .font(.abeezee(size: 36))
                    .foregroundStyle(.white)
                Image("FAVBrandWhite")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 338)
                Text("Find culture, connection and creativity at the swipe of your finger")
                    .font(.abeezeeItalic(size: 14))
                    .foregroundStyle(.white)
                    .frame(width: 258)
                    .lineSpacing(6)
                    .multilineTextAlignment(.center)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            HStack {
                NavigationLink(destination: EmptyView()) {
                    Text("Skip")
                        .font(.abeezeeItalic(size: 14))
                        .foregroundStyle(.white)
                }
                Spacer()
                NavigationLink(destination: WelcomeTwo()) {
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
    }
}

#Preview {
    NavigationView {
        WelcomeOne()
    }
}
