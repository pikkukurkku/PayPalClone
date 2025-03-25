//
//  ContentView.swift
//  PayPal_clone
//
//  Created by Natalia Ogorek on 18.03.25.
//

import SwiftUI


struct ContentView: View {
    
    @State private var showReferral = true
    @State var scrollProxy: ScrollViewProxy?
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Color(hex: "#E7EFF6").ignoresSafeArea(.all)
                BackToTopScrollView(scrollProxy: $scrollProxy) { proxy in
                    VStack  {
                        TopMenu()
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
                            .padding()
                        
                        VStack (alignment: .leading) {
                            PaymentsList(imageName: "Zalando", merchantName:"Zalando Payments GmbH", dueDate: "13 Mar", paymentType:"Bezahlung nach 30 Tagen", amount:"36,65€", isLastItem: false)
                            PaymentsList(imageName: "Unknown", merchantName:"Mister Spex", dueDate: "15 Mar", paymentType:"Bezahlt", amount:"48€", isLastItem: false)
                            PaymentsList(imageName: "Unknown2", merchantName:"Backwaren GmbH", dueDate: "15 Mar", paymentType:"Bezahlt", amount:"4€", isLastItem: true)
                        }
                        .padding()
                        .foregroundColor(.black)
                        .padding(.bottom)
                    }
                    
                }
                //   .frame(width: UIScreen.main.bounds.width)
                
                BottomNav(scrollProxy: $scrollProxy)
                    .ignoresSafeArea(.all)
                //    .frame(width: UIScreen.main.bounds.width)
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

