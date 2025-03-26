//
//  ProfilePicturesScrollable.swift
//  PayPal_clone
//
//  Created by Natalia Ogorek on 18.03.25.
//

import SwiftUI

struct ProfilePicturesScrollable: View {
    
    let profileImages: [String] =  [
        "Unknown", "Unknown2", "Unknown3", "Unknown4", "Unknown5", "Unknown6", "Unknown7"
    ]
        
    let names: [String] = [
        "Saman", "Matthieu", "Leon", "Samantha B.", "Leszek M.", "Mario", "Tobi"
    ]
    
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
