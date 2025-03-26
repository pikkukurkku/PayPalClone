//
//  OutstandingPayments.swift
//  PayPal_clone
//
//  Created by Natalia Ogorek on 26.03.25.
//

import SwiftUI

struct OutstandingPayments: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
                .padding()
            
            VStack (alignment: .leading) {
                PaymentsList(imageName: "Zalando", merchantName:"Zalando Payments GmbH", dueDate: "13 Mar", paymentType:"Bezahlung nach 30 Tagen", amount:"36,65€", isLastItem: false)
                PaymentsList(imageName: "Unknown", merchantName:"Mister Spex", dueDate: "15 Mar", paymentType:"Bezahlt", amount:"48€", isLastItem: false)
                PaymentsList(imageName: "Unknown2", merchantName:"Backwaren GmbH", dueDate: "15 Mar", paymentType:"Bezahlt", amount:"4€", isLastItem: true)
            }
            .padding()
            .foregroundColor(.black)
            .padding(.bottom)
        }    }
}

#Preview {
    OutstandingPayments()
}
