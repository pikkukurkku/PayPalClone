//
//  BottomNav.swift
//  PayPal_clone
//
//  Created by Natalia Ogorek on 19.03.25.
//

import SwiftUI

struct BottomNav: View {
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                Rectangle()
                    .fill(Color.white)
                    .frame(height: 120)
                    .shadow(color: Color(hex: "#B9BFC5"), radius: 10)
                HStack (spacing: 60) {
                    VStack (spacing: 10) {
                        Image(systemName: "house")
                            .foregroundColor(.black)
                        Text("Home")
                            .font(.caption)
                            .bold()
                    }
                    VStack (spacing: 10) {
                        ZStack {
                            Circle()
                                .fill(.blue)
                                .frame(width: 40)
                            Image(systemName: "arrow.up.arrow.down")
                                .foregroundColor(.white)
                                .font(.subheadline)
                        }
                        Text("Send/Request")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
             
                    VStack(spacing: 10) {
                        Image(systemName: "wallet.pass")
                            .foregroundColor(.black)
                        Text("Wallet")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                  
                }
         
                .font(.title3)
            }
        }
    }
}

#Preview {
    BottomNav()
}
