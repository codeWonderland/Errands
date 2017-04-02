//
//  MessageViewController.swift
//  Errands
//
//  Created by Alice Easter on 3/30/17.
//  Copyright © 2017 Alice Easter. All rights reserved.
//

import UIKit
import os.log


class MessageViewController: UIViewController {

    @IBOutlet weak var message: UITextView!
    @IBOutlet weak var author: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.isEnabled = false
        
        author.delegate = self as? UITextFieldDelegate
        message.delegate = self as? UITextViewDelegate
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
    }
    
    
    // MARK: Private Methods
    
    private func updateSaveButtonState() {
        // Disable the Save button if the text field is empty.
        let text = message.text ?? ""
        let name = author.text ?? ""
        saveButton.isEnabled = !(text.isEmpty || name.isEmpty)
    }

    
    // MARK: - Navigation

    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
}
