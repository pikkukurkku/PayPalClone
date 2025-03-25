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
                    .frame(height: 1) // Make the rectangle visible by setting a reasonable height
                    .foregroundColor(.gray)
                    .padding(.top) // You can adjust this padding to control space between items
            }
        }
                           .padding(.top, 10) // Add padding to the top to ensure space from the top edge of the rectangle
                       }
                   }

