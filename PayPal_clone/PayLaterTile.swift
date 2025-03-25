//
//  PayLaterTile.swift
//  PayPal_clone
//
//  Created by Natalia Ogorek on 19.03.25.
//

import SwiftUI

struct PayLaterTile: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
                .frame(height: 90)
            HStack(spacing:40) {
                Image("Zalando")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .scaledToFit()
                    .frame(width: 50, height: 30)
                VStack(alignment: .leading, spacing: 2) {
                    Text("PayLater")
                    Text("Upcoming: Zalando payments Gmbh")
                        .font(.caption)
                }
                .foregroundColor(.black)
                .frame(alignment: .leading)
            }
        }
        .padding()
    }
}

#Preview {
    PayLaterTile()
}
