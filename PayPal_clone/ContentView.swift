//
//  ContentView.swift
//  PayPal_clone
//
//  Created by Natalia Ogorek on 18.03.25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showReferral = true
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "#E7EFF6").ignoresSafeArea(.all)
                ScrollView {
                    VStack  {
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
                        HStack{
                            BalanceTile()
                            Spacer(minLength: 20)
                            InfoTile()
                        }
                        .padding()
                        PayLaterTile()
                        ProfilePicturesScrollable(
                            profileImages:
                                ["Unknown",
                                 "Unknown2",
                                 "Unknown3",
                                 "Unknown4",
                                 "Unknown5",
                                 "Unknown6",
                                 "Unknown7"],
                            names:
                                ["Saman", "Matthieu", "Leon", "Samantha B.", "Leszek M.", "Mario", "Tobi"])
                    }
                    if showReferral {
                        ReferralInfo(showReferral: $showReferral)
                    }
                    SendMoneyInternationally(
                        systemImages: ["building.columns.fill", "banknote.fill","wallet.pass.fill","circle.filled.iphone.fill"],
                        textContent: ["Direct to bank", "Cash pickup", "Mobile money", "Reload phones"]
                    )
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.white)
          
                        VStack (alignment: .leading) {
                            PaymentsList(imageName: "Zalando", merchantName:"Zalando Payments GmbH", dueDate: "13 Mar", paymentType:"Bezahlung nach 30 Tagen", amount:"36,65€", isLastItem: false)
                            PaymentsList(imageName: "Unknown", merchantName:"Mister Spex", dueDate: "15 Mar", paymentType:"Bezahlt", amount:"48€", isLastItem: false)
                            PaymentsList(imageName: "Unknown2", merchantName:"Backwaren GmbH", dueDate: "15 Mar", paymentType:"Bezahlt", amount:"4€", isLastItem: true)
                        }
                        .foregroundColor(.black)
                        .padding(.bottom)
                    }
                    .padding()
                }
                .padding()
                .padding(.horizontal)
                .frame(width: UIScreen.main.bounds.width)
                BottomNav()
                    .ignoresSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.width)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.light)
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}

