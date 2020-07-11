//
//  Styles.swift
//  Artist List
//
//  Created by Milo Wyner on 7/10/20.
//  Copyright © 2020 Milo Wyner. All rights reserved.
//

import SwiftUI

fileprivate struct ButtonBackgroundColor: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color("ButtonBackground"))
            
    }
}

struct SmallButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .padding([.top, .bottom], 6)
            .padding([.leading, .trailing], 8)
            .font(.system(size: 15, weight: .semibold))
            .modifier(ButtonBackgroundColor())
            .cornerRadius(10)
    }
}

struct LargeButtonStyle: ViewModifier {
    var disabled: Bool = false
    
    func body(content: Content) -> some View {
        content
            .padding([.top, .bottom], 12)
            .padding([.leading, .trailing], 16)
            .font(.system(size: 17, weight: .semibold))
            .background(disabled ? Color("ButtonBackgroundDisabled") : Color("ButtonBackground"))
            .cornerRadius(15)
    }
}
