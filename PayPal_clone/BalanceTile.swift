//
//  BalanceTile.swift
//  PayPal_clone
//
//  Created by Natalia Ogorek on 19.03.25.
//

import SwiftUI

struct BalanceTile: View {
    
    var body: some View {
        ZStack (alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
            VStack  (alignment: .leading)  {
                Text("PayPal balance")
                    .font(.caption)
                    .foregroundColor(.gray)
                Text("0,00 EUR")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.black)
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    BalanceTile()
}
