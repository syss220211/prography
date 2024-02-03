//
//  File.swift
//  Prography
//
//  Created by 박서연 on 2024/01/31.
//

import SwiftUI
import Kingfisher


struct userDefaultTest: View {
    @State private var inputText: String = ""
    @State private var photosID: [String] = UserDefaults.standard.stringArray(forKey: "Bookmark") ?? []
    
    @State private var dictionaryTest: [String: Any] = UserDefaults.standard.dictionary(forKey: "DictionaryTest") ?? [:]
    @StateObject var bookmark = BookmarkManager()
    var body: some View {
        VStack {
            TextField("Enter a string", text: $inputText)
                .padding()
            
            Button("Add String") {
                addString()
            }
            
            List(bookmark.savedURL, id: \.self) { storedString in
                
                KFImage(URL(string: storedString))
                    .resizable()
                    .scaledToFit()
                    .onTapGesture {
                        removeString(photoID: storedString)
                    }
            }
        }
        .onAppear {
            UserDefaults.standard.removePersistentDomain(forName: "BookmarkURL")
            UserDefaults.standard.removePersistentDomain(forName: "BookmarkID")
            print(bookmark.savedURL)
            print(bookmark.savedPhotoID)
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
