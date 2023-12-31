//
//  SearchFriendViewViewModel.swift
//  LDR
//
//  Created by Shihang Wei on 12/28/23.
//

import Foundation
import FirebaseFirestore
import SwiftUI

@Observable class SearchFriendViewViewModel{
    var queriedUsers: [User] = []
    
    private let db = Firestore.firestore()
    
    func fetchUsers(from keyword: String) {
        db.collection("users").whereField("keywordsForLookup", arrayContains: keyword).getDocuments { snapshot, error in
            guard let documents = snapshot?.documents, error == nil else { return }
            self.queriedUsers = documents.compactMap({ QueryDocumentSnapshot in
                do {
                    let userResult = try QueryDocumentSnapshot.data(as: User.self)
                    print("Successfully converted data to User")
                    return userResult
                } catch {
                    print("Cannot convert data to User")
                    return nil
                }
            })
        }
    }
    
}
