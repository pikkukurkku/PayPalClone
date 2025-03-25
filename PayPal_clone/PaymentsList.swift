//
//  PaymentsList.swift
//  PayPal_clone
//
//  Created by Natalia Ogorek on 19.03.25.
//

import SwiftUI

struct PaymentsList: View {
    
    let imageName: String
    let merchantName: String
    let dueDate: String
    let paymentType: String
    let amount: String
    let isLastItem: Bool
    
    
    var body: some View {
       
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .scaledToFit()
                    .frame(width: 50, height: 30)
                Spacer()
                VStack(alignment: .leading) {
                    Text(merchantName)
                        .font(.headline)
                        .bold()
                    Text(dueDate)
                        .foregroundColor(.gray)
                        .font(.caption)
                }
            }
            .padding(.horizontal)
            HStack {
                Text(paymentType)
                Spacer()
                Text(amount)
                    .font(.headline)
                    .bold()
            }
            .foregroundColor(.gray)
            .font(.caption)
            .padding(.horizontal)
            if !isLastItem {
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.gray)
                    .padding(.top)
            }
        }
                           .padding(.top, 10)
                       }
                   }

