//
//  File.swift
//  Prography
//
//  Created by 박서연 on 2024/01/31.
//

import SwiftUI


struct userDefaultTest: View {
    @State private var inputText: String = ""
    @State private var storedStrings: [String] = UserDefaults.standard.stringArray(forKey: "StoredStrings") ?? []
    
    var body: some View {
        VStack {
            TextField("Enter a string", text: $inputText)
                .padding()
            
            Button("Add String") {
                addString()
            }
            
            List(storedStrings, id: \.self) { storedString in
                Text(storedString)
            }
        }
        .padding()
    }
    
    private func addString() {
        // Append the input text to the array
        storedStrings.append(inputText)
        
        // Save the updated array to UserDefaults
        UserDefaults.standard.set(storedStrings, forKey: "StoredStrings")
        
        // Clear the input text
        inputText = ""
    }
}


#Preview {
    userDefaultTest()
}
