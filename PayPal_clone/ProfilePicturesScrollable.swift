//
//  ProfilePicturesScrollable.swift
//  PayPal_clone
//
//  Created by Natalia Ogorek on 18.03.25.
//

import SwiftUI

struct ProfilePicturesScrollable: View {
    
    let profileImages: [String]
    let names: [String]
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Send again")
                .font(.headline)
                .foregroundColor(.black)
                .padding()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack (spacing: 20) {
                    ForEach(Array(zip(profileImages, names)), id: \.0) { imageName, name in
                        VStack {
                            Image(imageName)
                                .resizable()
                                .cornerRadius(150)
                                .frame(width: 70, height: 70)
                            Text(name)
                                .font(.caption)
                                .foregroundColor(.black)
                        }
                        
                    }
                }
                .padding()
            }
        }
    }
}
