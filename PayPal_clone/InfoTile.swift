//
//  InfoTile.swift
//  PayPal_clone
//
//  Created by Natalia Ogorek on 19.03.25.
//

import SwiftUI

struct InfoTile: View {
    

    @State var showSheet: Bool = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
            VStack(alignment: .leading, content: {
                Text("Pools")
                    .font(.caption)
                    .foregroundColor(.gray)
                Text("Track money with friends for gifts, trips, and more")
                    .font(.caption)
                    .foregroundColor(.black)
                Spacer()
                Button("Create a pool") {
                    showSheet.toggle()
                }
                .foregroundColor(.blue)
                .buttonStyle(PlainButtonStyle())
                    .sheet(isPresented: $showSheet) {
                        PoolScreen()
                    }
                .font(.caption)
            }
                )
            .padding()
            .frame(height: 130, alignment: .topLeading)
        }
    }
}

    struct PoolScreen: View {
                       
        @Environment(\.presentationMode) var presentationMode
                       
            var body: some View {
                           VStack {
                               HStack {
                                   Button(action: {
                                       presentationMode.wrappedValue.dismiss()
                                   }) {
                                       Image(systemName: "xmark")
                                           .foregroundColor(.black)
                                           .padding()
                                           .font(.title)
                                   }
                                   Spacer()
                               }
                               .padding()
                               Spacer()
                               Text("Create a pool!")
                                   .font(.title2)
                                   .bold()
                              Spacer()
                           }
                           .frame(maxWidth: .infinity, maxHeight: .infinity)
                                  .background(Color.yellow.ignoresSafeArea())
                       }
                   }
                   
#Preview {
    InfoTile()
    PoolScreen()
}
