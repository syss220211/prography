//
//  popSample.swift
//  Prography
//
//  Created by 박서연 on 2024/02/01.
//

import SwiftUI

struct popSample: View {
    @State private var isPopupVisible = false
    @State private var userName: String = "userName"
    @State private var title: String = "Title"
    @State private var desc: String = "Desc"
    @State private var tag: [String] = ["hi"]
    
    var body: some View {
        ZStack {
            // Background content
            Color.yellow
                .edgesIgnoringSafeArea(.all)
                .blur(radius: isPopupVisible ? 10 : 0)

            VStack {
                Text("Main Content")
                    .foregroundColor(.white)
                    .padding()

                // Button to show the popup
                Button("Show Popup") {
                    isPopupVisible.toggle()
                }
            }
            

            // Popup view
            if isPopupVisible {
                PhotoPopup(userName: $userName, isPopup: $isPopupVisible, title: $title, desc: $desc, tags: $tag)
            }
        }
        
    }
}

struct PopupView: View {
    @Binding var isVisible: Bool

    var body: some View {
        VStack {
            // Translucent background
            Color.black.opacity(0.5)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    // Close the popup when tapping outside it
                    isVisible = false
                }
        }
    }
}


#Preview {
    popSample()
}
