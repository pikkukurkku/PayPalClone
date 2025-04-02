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
                
                VStack(alignment: .trailing) {
                    Text(merchantName)
                        .font(.subheadline)
                        .bold()
                    Text(dueDate)
                        .foregroundColor(.gray)
                        .font(.caption)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding(.horizontal)
            HStack {
                Text(paymentType)
                
                Text(amount)
                    .font(.headline)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .foregroundColor(.gray)
            .font(.caption)
            .padding(.horizontal)
            
        }
        
        .padding(.top, 10)
        .padding(.horizontal, 5)
        if !isLastItem {
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color(hex: "#E7EFF6"))
        }
    }
}



#Preview {
    PaymentsList(
        imageName: "Zalando",
        merchantName:"vregvcecwewcecewcewc",
        dueDate: "fewfcwe",
        paymentType: "cewcfwe",
        amount: "cewcfew",
        isLastItem: false
    )
}
