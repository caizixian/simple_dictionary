//
//  ViewController.swift
//  Simple Dictionary
//
//  Created by Ivan Cai on 5/10/16.
//  Copyright © 2016 Ivan Cai. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func lookUpWord(sender: AnyObject) {
        if let termToLookUp = textField.text{
            if UIReferenceLibraryViewController.dictionaryHasDefinitionForTerm(termToLookUp){
                let referenceLibraryViewController = UIReferenceLibraryViewController(term: termToLookUp)
                self.presentViewController(referenceLibraryViewController, animated: true, completion: nil)
            }
            else{
                let alert = UIAlertController(title: "", message: "No Definition Found", preferredStyle: .Alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: .Cancel, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func backgroundTapped(sender: AnyObject) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        lookUpWord(textField)
        return true
    }

}

