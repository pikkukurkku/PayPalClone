//
//  ProfileView.swift
//  PayPal_clone
//
//  Created by Natalia Ogorek on 19.03.25.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("This is the Profile Page")
                .font(.largeTitle)
                .padding()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
                   ToolbarItem(placement: .navigationBarLeading) {
                       Button(action: {
                           presentationMode.wrappedValue.dismiss()
                       }) {
                           HStack {
                               Image(systemName: "chevron.left")
                               Image(systemName: "chevron.left")
                               Text("Go Back To Homepage")
                                   .font(.caption)
                                   .foregroundColor(.green)
                           }
                       }
                   }
               }
    }
}

#Preview {
    ProfileView()
}

