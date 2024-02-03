//
//  CommonView.swift
//  Prography
//
//  Created by 박서연 on 2024/02/02.
//

import SwiftUI

struct NavigationRectangleView: View {
    var body: some View {
        Rectangle()
            .frame(maxWidth: .infinity)
            .foregroundStyle(Color(UIColor.systemGray5))
            .frame(maxHeight: 1)
    }
}

#Preview {
    NavigationRectangleView()
}
