//
//  BookmarkManager.swift
//  Prography
//
//  Created by 박서연 on 2024/02/04.
//

import SwiftUI

class BookmarkManager: ObservableObject {
    @Published var photoURL: String = ""
    @Published var photoID: String = ""
    @Published var savedURL: [String] = UserDefaults.standard.stringArray(forKey: "BookmarkURL") ?? []
    @Published var savedPhotoID: [String] = UserDefaults.standard.stringArray(forKey: "BookmarkID") ?? []
    
    func addString(photoURL: String) {
        // Url 저장
        savedURL.append(photoURL)
        UserDefaults.standard.set(savedURL, forKey: "BookmarkURL")
        
        // ID 저장
        savedPhotoID.append(photoID)
        UserDefaults.standard.set(savedPhotoID, forKey: "BookmarkID")
    }
    
    func removeString(photoURL: String, photoID: String) {
        guard let removeURL = savedURL.firstIndex(of: photoURL) else { return }
        savedURL.remove(at: removeURL)
        
        guard let removeID = savedURL.firstIndex(of: photoID) else { return }
        savedPhotoID.remove(at: removeID)
        
        // 해당 배열 다시 저장
        UserDefaults.standard.set(savedURL, forKey: "BookmarkURL")
        UserDefaults.standard.set(savedPhotoID, forKey: "BookmarkID")
    }
}
