//
//  ViewController.swift
//  FirestoreDemo
//
//  Created by Charles Martin Reed on 1/29/19.
//  Copyright © 2019 Charles Martin Reed. All rights reserved.
//

import UIKit
import Firebase

class TableViewController: UITableViewController {
    
    //MARK:- Properties
    var db: Firestore!
    var messagesArray = [Message]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        initializeFirestoreDB()
    }
    
    func initializeFirestoreDB() {
        db = Firestore.firestore()
    }
    
    //MARK:- IBActions
    @IBAction func composeMessage(_ sender: UIBarButtonItem) {
        let composeAlert = UIAlertController(title: "Compose New Message", message: "Enter your name and message", preferredStyle: .alert)
        composeAlert.addTextField { (textField) in
            textField.placeholder = "Your name"
        }
        composeAlert.addTextField { (textField) in
            textField.placeholder = "Your message"
        }
        
        composeAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        composeAlert.addAction(UIAlertAction(title: "Send", style: .default, handler: { (action) in
            //MARK:- Firebase magic happens here
            if let name = composeAlert.textFields?.first?.text, let content = composeAlert.textFields?.last?.text {
                
                //create a new message
                let newMessage = Message(name: name, content: content, timeStamp: Date())
                
                var ref: DocumentReference? = nil //refers to document location in Firebase - allows firebase to generate an ID for us.
                
                //using our dictionary property here
                ref = self.db.collection("messages").addDocument(data: newMessage.dictionary) {
                    error in
                    if let error = error {
                        print("error adding document: \(error.localizedDescription)")
                    } else {
                        print("Document added with ID: \(ref!.documentID)")
                    }
                }
            }
        }))
        
        present(composeAlert, animated: true, completion: nil)
        
    }
    
    //MARK:- Table view delegate methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messagesArray.count
    }
    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//    }
}



