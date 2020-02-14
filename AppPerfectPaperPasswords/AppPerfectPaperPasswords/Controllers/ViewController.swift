//
//  ViewController.swift
//  AppPerfectPaperPasswords
//
//  Created by Luis Gachuz Trabajo on 04/02/20.
//  Copyright © 2020 Luis Gachuz Trabajo. All rights reserved.
//

import UIKit
import UInt128
import CryptoKit




// UInt128

class ViewController: UIViewController {
    
    
    var textSequenceKey : String = ""
    var counter : UInt128 = 0
    var key = SymmetricKey(size: .bits256)
    var tag = "com.key.lagm.mykey".data(using: .utf8)
    var characterSet = "!#%+23456789:=?@ABCDEFGHJKLMNPRSTUVWXYZabcdefghijkmnopqrstuvwxyz"
    var passcodeLength: Int = 4
    
    @IBOutlet weak var SequenceKey: UILabel!
    @IBOutlet weak var CounterLabel: UILabel!
    @IBOutlet weak var CharacterSetLabel: UILabel!
    @IBOutlet weak var PassCodeLengthLabel: UILabel!
    @IBAction func UpdSequenceKey(_ sender: Any) {
        
        self.key = SymmetricKey(size: .bits256)
        textSequenceKey = key.serialize()
        SequenceKey.text = textSequenceKey
        SaveUserDefaults(text: textSequenceKey,forKey: "SequenceKey")
        //savekeychain(key: key)
    }
   

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if UserDefaults.standard.string(forKey: "SequenceKey") != nil{
            SequenceKey.text = UserDefaults.standard.string(forKey: "SequenceKey")
            self.key = SymmetricKey(size: .bits256)
           // CounterLabel.text = "Counter: " + String(UserDefaults.standard.integer(forKey: "Counter"))
            
            
        }
        else {
            
            textSequenceKey = key.serialize()
            SequenceKey.text = textSequenceKey
            SaveUserDefaults(text: textSequenceKey,forKey: "SequenceKey")
            counter =  0
            CounterLabel.text = "Counter: " + String(counter)
            SaveUserDefaults(text: counter,forKey: "Counter")
            //savekeychain(key: key)
            
        }
        
        PassCodeLengthLabel.text = String(passcodeLength)
        CharacterSetLabel.text = characterSet
        
    }
    
    @IBAction func createPassCards(_ sender: UIButton) {
        
        _ = [[String]]()
        
        
    }

    func savekeychain(key : SymmetricKey)  {
        let tag = "com.key.lagm.mykey".data(using: .utf8)!
        let addquery: [String: Any] = [kSecClass as String: kSecClassKey,
                                       kSecAttrApplicationTag as String: tag,
                                       kSecValueRef as String: key]
        _ = SecItemAdd(addquery as CFDictionary, nil)
    }
    
    func getKeychain() -> SymmetricKey {
        return SymmetricKey(size: .bits256)
    }
    
   
    
}

