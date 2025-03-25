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
                            Spacer()
                            Button(action: {
                                showReferral = false
                            }) {
                                Image(systemName: "xmark")
                                    .foregroundColor(.black)
                            }
                            .buttonStyle(PlainButtonStyle())

                        }
                        Text("Bis zu 10 Freund*innen. Mindestausgabe:")
                        Text("5€. Bis 30.06.24. S.Bed")
                        Spacer()
                        Button("Jetzt einladen") {
                            showSheet.toggle()
                        }
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
                        .buttonStyle(PlainButtonStyle())
                        Spacer()
                    }
                    .padding()
                    Spacer()
                    Text("Freunde einladen!")
                        .font(.title2)
                   Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                       .background(Color.yellow.ignoresSafeArea())
            }
        }
                
                #Preview {
                   // ContentView()
                   SecondScreen()
                   ReferralInfo(showReferral: .constant(true))
                }

