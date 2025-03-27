//
//  CircleButton.swift
//  PayPal_clone
//
//  Created by Natalia Ogorek on 18.03.25.
//

import SwiftUI

struct CircleButton: View {
    let systemImage: String
    
    var body: some View {
            Circle()
                .fill(Color.white)
                .frame(width: 50)
                .overlay(
            Image(systemName: systemImage)
                .foregroundColor(.blue)
                .bold()
            )
    }
}


struct TopMenu: View {
  //  @Binding var tabState: Visibility
 //   @State private var tabState: Visibility = .visible
   // @State private var lastOffset: CGFloat = 0
    //@State private var isTopMenuVisible: Bool = true
    
    var body: some View {
        HStack {
            CircleButton(systemImage: "line.3.horizontal")
            Spacer()
            CircleButton(systemImage: "questionmark")
            CircleButton(systemImage: "qrcode")
            NavigationLink(destination: ProfileView()) {
                CircleButton(systemImage: "person")
            }
            .buttonStyle(PlainButtonStyle())
        }
        .padding()
    }
}
