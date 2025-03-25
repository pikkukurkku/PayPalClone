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
