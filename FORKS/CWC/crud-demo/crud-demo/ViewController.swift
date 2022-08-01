//
//  ViewController.swift
//  crud-demo
//
//  This source code is for this tutorial: https://youtu.be/qA9L3_cK9Z0
//  Before using, connect your own Firestore database instead of using mine.
//  I've removed my config file so you'll have to sign up for Firebase and add your own GoogleService-Info.plist to Xcode.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let db = Firestore.firestore()
        
        // Adding a document
        // See: https://firebase.google.com/docs/firestore/manage-data/add-data
        db.collection("wine")
            .addDocument(data: ["year":2017,
                                "type":"pinot-noir",
                                "label":"Peller Estates"])
        
        // Getting the document ID
        let newDocument = db.collection("wine").document()
        newDocument.setData(["year":2017,
                             "type":"pinot-noir",
                             "label":"Peller Estates",
                             "id":newDocument.documentID])
        
        
        // Adding a document with a specific document ID / Or Replacing the data for a specific document ID
        db.collection("wine")
            .document("pinot-noir-2017")
            .setData(["hello":"new data",
                      "newKey":"newValue"], merge: true)
        
        // Updating a specific document ID
        db.collection("wine")
            .document("stoneypath-cab-2017")
            .setData(["year":2017,
                      "type":"cab",
                      "label":"Stoney Path"], merge:true)
        
        // Detecting errors (Use the completion handler)
        db.collection("wine")
            .addDocument(data: ["test":"test"]) { (error) in
            
                if error != nil {
                // There was an error
            }
            else {
                // error is nil.. so operation completed successfully
            }
        }
            
        // Delete a document
        // See: https://firebase.google.com/docs/firestore/manage-data/delete-data
        db.collection("wine")
            .document("stoneypath-cab-2017").delete()
        
        // Delete a field
        db.collection("wine")
            .document("stoneypath-cab-2017")
            .updateData(["type":FieldValue.delete()])
        
        // Detect for errors, use completion parameter
        db.collection("wine")
            .document("pinot-noir-2017")
            .delete { (error) in
            
            if error != nil {
                // We have an error
            }
            else {
                // Delete was sucessful
            }
        }
        
        // Read a specific document
        // See: https://firebase.google.com/docs/firestore/query-data/get-data
        db.collection("wine")
            .document("pinot-noir-2017")
            .getDocument { (document, error) in
            
            // Check for error
            if error == nil {
                
                // Check that this document exists
                if document != nil && document!.exists {
                    
                    let documentData = document!.data()
                    
                }
                
            }
            
        }
        // Getting all documents from a collection
        db.collection("wine")
            .getDocuments { (snapshot, error) in
            
            if error == nil && snapshot != nil {
                
                for document in snapshot!.documents {
                    
                    let documentData = document.data()
                    
                }
                
            }
        }
        
        // Getting a subset of documents
        db.collection("wine").whereField("year", isEqualTo: 2017).getDocuments { (snapshot, error) in
            <#code#>
        }
    }


}

