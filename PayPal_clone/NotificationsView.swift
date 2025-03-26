//
//  NotificationsView.swift
//  PayPal_clone
//
//  Created by Natalia Ogorek on 26.03.25.
//

import SwiftUI

struct NotificationsView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            Color(hex: "#E7EFF6").ignoresSafeArea(.all)
            VStack (spacing: 30) {
                Spacer()
                Image(systemName: "checkmark.bubble")
                    .foregroundColor(Color.blue)
                    .font(.largeTitle)
                    .bold()
            Text("All done for now")
                    .font(.title)
                    .bold()
                Text("Check back later for handy tips for keeping your account in tip top shape")
                    .font(.caption)
                    .multilineTextAlignment(.center)
                Spacer()
                Spacer()
            }
            .padding(.horizontal)
            .foregroundColor(.black)
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                }
            }
                ToolbarItem(placement: .principal) {
                    Text("Notifications")
                        .font(.caption)
                        .foregroundColor(.black)
                        .buttonStyle(PlainButtonStyle())
                }
            }
        }
                  
          //          .frame(width: UIScreen.main.bounds.width)
                }
            
        
#Preview {
    NotificationsView()
}
