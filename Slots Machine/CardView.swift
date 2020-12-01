//
//  CardView.swift
//  Slots Machine
//
//  Created by Jeff on 25/11/2020.
//  Copyright © 2020 Jeff Inc. All rights reserved.
//

import SwiftUI

struct CardView: View {
    
    
    @Binding var symbol:String
    
    var body: some View {
        
        Image(symbol)
            .resizable().aspectRatio(1, contentMode: .fit).background(Color.white).opacity(0.8).cornerRadius(20)
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(symbol: Binding.constant("cherry"))
    }
}
