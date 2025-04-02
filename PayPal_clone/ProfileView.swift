//
//  ProfileView.swift
//  PayPal_clone
//
//  Created by Natalia Ogorek on 19.03.25.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var systemImage: [String] = ["questionmark.circle", "person", "shield", "eye", "bell.badge", "dollarsign.circle"]
    @State var menuText: [String] = ["Help", "Account info", "Login and security", "Data and privacy", "Notification preferences", "Marketing preferences"]
    
    
    var body: some View {
        ZStack {
            Color(hex: "#E7EFF6").ignoresSafeArea(.all)
            ScrollView {
                VStack {
                    ProfileTile()
                    VStack {
                        List {
                            ForEach(Array(zip(systemImage, menuText)), id: \.0) { image, text in
                                HStack {
                                    Image(systemName: image)
                                        .frame(width: 30)
                                        .multilineTextAlignment(.center)
                                        .foregroundColor( .black)
                                    Text(text)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .font(.caption)
                                        .foregroundColor( .black)
                                }
                                .listRowSeparator(.hidden)
                                .padding(.vertical, 6)
                            }
                            .listRowBackground(Color.white)
                        }
                        .scrollContentBackground(.hidden)
                    }
                    .cornerRadius(18)
                    .frame(minHeight: 1000)
                }
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "chevron.left")
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    ToolbarItem(placement: .principal) {
                        Text("Profile")
                            .font(.caption)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink(destination: NotificationsView()) {
                            Image(systemName: "bell")
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding()
                    }
                }
                .foregroundColor(.black)
                .frame(width: UIScreen.main.bounds.width)
            }
        }
    }
}



struct ProfileTile: View {
    
    @State var username: String = "Natalia Ogorek"
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 18)
                .fill(Color.white)
                .frame(height: 280)
                .padding()
                .overlay(
                    VStack {
                        Rectangle()
                            .fill(Color.color2)
                            .frame(height: 210)
                            .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous)
                                .trim(from: 0.5, to: 1.0))
                            .padding()
                    }
                    ,alignment: .top)
            VStack (spacing: 6) {
                ZStack {
                    Image("Unknown4")
                        .resizable()
                        .cornerRadius(150)
                        .frame(width: 65, height: 65)
                        .overlay(
                            Circle()
                                .stroke(Color.white, lineWidth: 3)
                        )
                        .padding(4)
                    ZStack {
                        Circle()
                            .fill(Color.color1)
                            .frame(width: 40)
                            .overlay(
                                Image(systemName: "qrcode")
                                    .foregroundColor(.black)
                                    .bold()
                            )
                            .offset(x: 40)
                    }
                }
                Text(username)
                    .foregroundColor(.black)
                    .font(.title2)
                    .bold()
                Text("@paynataliaa")
                    .font(.caption)
                    .foregroundColor(.blue)
                    .underline()
                Button(action: {
                    // Your action
                }) {
                    Text("Edit")
                        .underline()
                        .foregroundColor(.black)
                        .bold()
                        .font(.caption)
                        .padding(8)
                        .padding(.horizontal, 12)
                        .background(Color.white)
                        .clipShape(Capsule())
                        .overlay(
                            Capsule()
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .padding()
                }
                .buttonStyle(PlainButtonStyle())
                .padding(0)
            }
            .frame(height: 250)
        }
        .frame( maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    ProfileView()
}

