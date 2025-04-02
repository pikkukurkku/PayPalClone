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
    @StateObject var headerData = HeaderViewModel()
    
    init() {
        UIScrollView.appearance().bounces = false
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "#E7EFF6").ignoresSafeArea(.all)
                VStack(spacing: 0) {
                    TopMenu()
                      // .offset(y: headerData.headerOffset)
                    BackToTopScrollView(scrollProxy: $scrollProxy) { proxy in
                        ScrollView(.vertical, showsIndicators: false) {
                            VStack {
                                HStack(spacing: 20){
                                    BalanceTile()
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
                                SendMoneyInternationally()
                                SendMoneyInternationally()
                            }
                            .overlay(
                                GeometryReader {proxy -> Color in
                                    let minY = proxy.frame(in: .global).minY

                                    DispatchQueue.main.async {
                                        if headerData.startMinY == 0 || minY < headerData.startMinY {
                                            headerData.startMinY = minY
                                        }
                                        let offset = headerData.startMinY - minY
//                                        print("startMinY: \(headerData.startMinY), minY: \(minY), offset: \(offset), headerOffset: \(headerData.headerOffset)")
                                        
                                        if offset > headerData.offset {
                                            //// THIUS IS THE SCROLL DOWN, WHICH IS NOT WORKING CORRECTLY
                                         headerData.bottomScrollOffset = 0
                                            if headerData.topScrollOffset == 0 {
                                                headerData.topScrollOffset = offset
                                            }
                                            let progress = (headerData.topScrollOffset +
                                                            getMaxOffset()) - offset
                                            let offsetCondition = (headerData.topScrollOffset + getMaxOffset()) >= getMaxOffset() && getMaxOffset() - progress <= getMaxOffset()
                                            let headerOffset = offsetCondition ? -(getMaxOffset() - progress) : -getMaxOffset()
                                            if headerData.headerOffset == 0 {
                                                headerData.headerOffset = min(0, headerOffset)
                                            } else {
                                                headerData.headerOffset = headerOffset
                                            }
                                        }
                                        if offset < headerData.offset {
                                            
                                            headerData.topScrollOffset = 0
                                            if headerData.bottomScrollOffset == 0 {
                                                headerData.bottomScrollOffset = offset
                                            }
                                            withAnimation(.easeOut(duration: 0.25)) {
                                                let headerOffset = headerData.headerOffset
                                                headerData.headerOffset =
                                                headerData.bottomScrollOffset > offset + 40
                                                ? 0 : (headerOffset != -getMaxOffset() ? 0 : headerOffset)
                                            }
                                        }
                                        headerData.offset = offset
                                    }
                                    return Color.clear
                                }
                            )
                        }
             
                    }
                    .frame(width: rect.width - 20)
                }
                BottomNav(scrollProxy: $scrollProxy)
                    .ignoresSafeArea(.all)
            }
        }
    }
        
    
    func getMaxOffset() -> CGFloat{
        return headerData.startMinY + (edges?.top ?? 0) + 10
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

