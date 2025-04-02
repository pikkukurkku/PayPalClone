//
//  ReferralInfo.swift
//  PayPal_clone
//
//  Created by Natalia Ogorek on 19.03.25.
//

import SwiftUI

struct ReferralInfo: View {
    
    @Binding var showReferral: Bool
    @State var showSheet: Bool = false
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        ZStack (alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
                .frame(height: 140)
                .padding()
            VStack (alignment: .leading, spacing: 2) {
                HStack {
                    Text("10€ für deine Empfehlung")
                    Button(action: {
                        showReferral = false
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                Text("Bis zu 10 Freund*innen. Mindestausgabe:")
                Text("5€. Bis 30.06.24. S.Bed")
                Button("Jetzt einladen") {
                    showSheet.toggle()
                }
                .frame(maxHeight: .infinity, alignment: .bottomLeading)
                .buttonStyle(PlainButtonStyle())
                .sheet(isPresented: $showSheet, content: {
                    SecondScreen()
                })
                .bold()
                .foregroundColor(.black)
            }
            .foregroundColor(.black)
            .font(.caption)
            .padding(30)
            
        }
    }
}


struct SecondScreen: View {
    
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
            }
            .buttonStyle(PlainButtonStyle())
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(maxHeight: .infinity, alignment: .top)
            Text("Freunde einladen!")
                .font(.title2)
                .bold()
                .frame(maxHeight: .infinity, alignment: .top)
        }
        .padding()
        .background(Color.yellow.ignoresSafeArea())
    }
}

#Preview {
    // ContentView()
    SecondScreen()
    //      ReferralInfo(showReferral: .constant(true))
}

