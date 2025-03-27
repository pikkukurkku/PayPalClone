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
        NavigationStack {
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
                            ProfilePicturesScrollable()
                        }
                        if showReferral {
                            ReferralInfo(showReferral: $showReferral)
                        }
                        SendMoneyInternationally()
                        OutstandingPayments()
                    }
                
                BottomNav(scrollProxy: $scrollProxy)
                    .ignoresSafeArea(.all)
            }
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
