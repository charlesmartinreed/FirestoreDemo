//
//  Message.swift
//  FirestoreDemo
//
//  Created by Charles Martin Reed on 1/29/19.
//  Copyright © 2019 Charles Martin Reed. All rights reserved.
//

import UIKit
import Firebase

protocol DocumentSerializable {
    init?(dictionary: [String: Any])
}

struct Message {
    var name: String
    var content: String
    var timeStamp: Date
    
    var dictionary: [String: Any] {
        //computed property so we can call it later, to give Firestore what it needs - JSON
        return [
            "name": name,
            "content": content,
            "timeStamp": timeStamp
        ]
    }
}

extension Message : DocumentSerializable {
    init?(dictionary: [String : Any]) {
        guard let name = dictionary["name"] as? String,
            let content = dictionary["content"] as? String,
            let timeStamp = dictionary["timeStamp"] as? Date else { fatalError("Could not serialize document!") }
        
         self.init(name: name, content: content, timeStamp: timeStamp)
    }
}

