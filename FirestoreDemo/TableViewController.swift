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

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
            //here's where the Firebase magic happens
        }))
        
        present(composeAlert, animated: true, completion: nil)
        
    }
    

}

