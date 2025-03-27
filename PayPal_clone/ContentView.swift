//
//  ContentView.swift
//  PayPal_clone
//
//  Created by Natalia Ogorek on 18.03.25.
//

import SwiftUI

//extension UIApplication {
//    var safeAreaInsets: UIEdgeInsets? {
//        guard let windowScene = connectedScenes.first as? UIWindowScene,
//              let window = windowScene.windows.first else { return nil }
//        return window.safeAreaInsets
//    }
//}
//
//var edges = UIApplication.shared.safeAreaInsets

struct ContentView: View {
    
    @State private var showReferral = true
    @State var scrollProxy: ScrollViewProxy?
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                Color(hex: "#E7EFF6").ignoresSafeArea(.all)
                VStack(spacing: 0) {
                    ZStack(alignment: .top, content: {
                        TopMenu()
                            .zIndex(1)
                    })
                    BackToTopScrollView(scrollProxy: $scrollProxy) { proxy in
                        
                        
                        ScrollView(.vertical, showsIndicators: false, content: {
                            HStack{
                                BalanceTile()
                                Spacer(minLength: 20)
                                InfoTile()
                            }
                            .padding()
                            PayLaterTile()
                            ProfilePicturesScrollable()
                            if showReferral {
                                ReferralInfo(showReferral: $showReferral)
                            }
                            SendMoneyInternationally()
                            OutstandingPayments()
                            
                        })
                        .frame(width: rect.width - 20)
                   
                        
                    }
                }
                    BottomNav(scrollProxy: $scrollProxy)
                        .ignoresSafeArea(.all)
            }
        }
    }
}

extension UIApplication {
    var safeAreaInsets: UIEdgeInsets? {
        guard let windowScene = connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first else { return nil }
        return window.safeAreaInsets
    }
}

var edges = UIApplication.shared.safeAreaInsets
var rect = UIScreen.main.bounds



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
