//
//  ViewController.swift
//  Silly Song
//
//  Created by Carlos Lee on 2017-09-11.
//  Copyright © 2017 Udacity. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let bananaFanaTemplate = [
        "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
        "Banana Fana Fo F<SHORT_NAME>",
        "Me My Mo M<SHORT_NAME>",
        "<FULL_NAME>"].joined(separator: "\n")

    
    @IBOutlet weak var lyricsView: UITextView!
    @IBOutlet weak var nameField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
    }


    @IBAction func reset(_ sender: Any) {
        lyricsView!.text = ""
        nameField!.text = ""

    }

    @IBAction func displayLyris(_ sender: Any) {
        if nameField.text! == ""{
            return
        }
        else{
            lyricsView!.text = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: nameField.text!)
        }
    }
    
    func shortNameForName(name: String) -> String{
        let vowelSet = CharacterSet(charactersIn: "aeiou")
        
        guard let index = name.lowercased().rangeOfCharacter(from: vowelSet)?.lowerBound else{
            return name.lowercased()
        }
        
        return name.lowercased().substring(from: index)
    }
    
    
    func lyricsForName(lyricsTemplate: String, fullName: String) -> String{
        let shortName = shortNameForName(name: fullName)
        
        let lyrics = lyricsTemplate.replacingOccurrences(of: "<FULL_NAME>", with: fullName).replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
        
        return lyrics
    }
    


}    // MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

