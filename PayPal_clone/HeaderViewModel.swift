//
//  HeaderViewModel.swift
//  PayPal_clone
//
//  Created by Natalia Ogorek on 27.03.25.
//

import SwiftUI

class HeaderViewModel: ObservableObject {
    
    
    @Published var startMinY : CGFloat = 0
    @Published var offset : CGFloat = 0
    
    //Header View Properties ...
    
    @Published var headerOffset: CGFloat = 0
    
    @Published var topScrollOffset: CGFloat = 0
    @Published var bottomScrollOffset: CGFloat = 0
}
