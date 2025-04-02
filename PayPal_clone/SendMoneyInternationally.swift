//
//  SendMoneyInternationally.swift
//  PayPal_clone
//
//  Created by Natalia Ogorek on 19.03.25.
//

import SwiftUI

struct SendMoneyInternationally: View {
    
    
    let systemImages: [String] = ["building.columns.fill", "banknote.fill","wallet.pass.fill","circle.filled.iphone.fill"]
    let textContent: [String] = ["Direct to bank", "Cash pickup", "Mobile money", "Reload phones"]
    
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Send money internationally")
                .font(.headline)
                .foregroundColor(.black)
                .padding()
            HStack (spacing: 30) {
                ForEach(Array(zip(systemImages, textContent)), id: \.0) { systemImageIcon, textContentItem in
                    VStack {
                        ZStack {
                            Circle()
                                .fill(Color(hex: "#f6f4e8"))
                                .frame(width: 60)
                            Image(systemName: systemImageIcon)
                        }
                        .bold()
                        .foregroundColor(.blue)
                        Text(textContentItem)
                            .font(.caption)
                            .foregroundColor(.black)
                            .frame(width: 50)
                            .multilineTextAlignment(.center)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

#Preview {
    // SendMoneyInternationally()
}
