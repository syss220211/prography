//
//  File.swift
//  Prography
//
//  Created by 박서연 on 2024/01/31.
//

import SwiftUI


struct userDefaultTest: View {
    @State private var inputText: String = ""
    @State private var photosID: [String] = UserDefaults.standard.stringArray(forKey: "Bookmark") ?? []
    
    var body: some View {
        VStack {
            TextField("Enter a string", text: $inputText)
                .padding()
            
            Button("Add String") {
                addString()
            }
            
            List(photosID, id: \.self) { storedString in
                Image(storedString)
                    .resizable()
                    .scaledToFit()
                    .onTapGesture {
                        removeString(photoID: storedString)
//                        guard let test = photosID.firstIndex(of: storedString) else { return }
//                        self.photosID.remove(at: Int(test))
//                        UserDefaults.standard.set(photosID, forKey: "Bookmark")
                    }
            }
        }
        .padding()
    }
    
    private func addString() {
        photosID.append(inputText)
        UserDefaults.standard.set(photosID, forKey: "Bookmark")
        inputText = ""
    }
    
    private func removeString(photoID: String) {
        guard let removeID = photosID.firstIndex(of: photoID) else { return }
        photosID.remove(at: removeID)
        
        // 해당 배열 다시 저장
        UserDefaults.standard.set(photosID, forKey: "Bookmark")
    }
}


#Preview {
    userDefaultTest()
}
