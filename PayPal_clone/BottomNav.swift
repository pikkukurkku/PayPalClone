//
//  BottomNav.swift
//  PayPal_clone
//
//  Created by Natalia Ogorek on 19.03.25.
//

import SwiftUI

struct BackToTopScrollView<Content: View>: View {
    let contentView: (ScrollViewProxy) -> Content
    @Binding var scrollProxy: ScrollViewProxy?
    
    init(scrollProxy: Binding<ScrollViewProxy?>, @ViewBuilder contentView: @escaping (ScrollViewProxy) -> Content) {
          self._scrollProxy = scrollProxy
          self.contentView = contentView
      }


  var body: some View {
    ScrollViewReader { proxy in
      ScrollView {
        Color.clear
          .frame(height: 0)
          .id("TOP_ID")

        contentView(proxy)
      }
      .onAppear {
          self.scrollProxy = proxy
      }
    }
  }
}


struct BottomNav: View {
    @Binding var scrollProxy: ScrollViewProxy?
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(Color.white)
                    .frame(height: 120)
                    .shadow(color: Color(hex: "#B9BFC5"), radius: 10)
                HStack(spacing: 60) {
                                   Button(action: {
                                       withAnimation {
                                           scrollProxy?.scrollTo("TOP_ID", anchor: .top)
                                       }
                                   }) {
                                       VStack(spacing: 10) {
                                           Image(systemName: "house")
                                               .foregroundColor(.black)
                                        
                                           Text("Home")
                                               .font(.caption)
                                               .foregroundColor(.gray)
                                       }
                                   
                                       .padding(0)
                                   }
                                   .buttonStyle(PlainButtonStyle())
                    VStack (spacing: 10) {
                        ZStack {
                            Circle()
                                .fill(.blue)
                                .frame(width: 40)
                            Image(systemName: "arrow.up.arrow.down")
                                .foregroundColor(.white)
                                .font(.subheadline)
                        }
                        Text("Send/Request")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
             
                    VStack(spacing: 10) {
                        Image(systemName: "wallet.pass")
                            .foregroundColor(.black)
                        Text("Wallet")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                  
                }
         
                .font(.title3)
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
    }
}



#Preview {
    @State var scrollProxy: ScrollViewProxy? = nil
    return BottomNav(scrollProxy: $scrollProxy)
}

