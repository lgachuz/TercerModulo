//
//  ViewController.swift
//  AppPerfectPaperPasswords
//
//  Created by Luis Gachuz Trabajo on 04/02/20.
//  Copyright © 2020 Luis Gachuz Trabajo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var textSequenceKey : String = ""
    var counter : Int = 0
    @IBOutlet weak var SequenceKey: UILabel!
    @IBOutlet weak var CounterLabel: UILabel!
    
    @IBAction func UpdSequenceKey(_ sender: Any) {
        textSequenceKey = textSequenceKey.randomStr(64)
        SequenceKey.text = textSequenceKey
        SaveUserDefaults(text: textSequenceKey,forKey: "SequenceKey")
        
        
    }
   

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        if UserDefaults.standard.string(forKey: "SequenceKey") != nil{
            SequenceKey.text = UserDefaults.standard.string(forKey: "SequenceKey")
            
            CounterLabel.text = "Counter: " + String(UserDefaults.standard.integer(forKey: "Counter"))
        }
        else {
            textSequenceKey = textSequenceKey.randomStr(64)
            SequenceKey.text = textSequenceKey
            SaveUserDefaults(text: textSequenceKey,forKey: "SequenceKey")
            counter =  0
            CounterLabel.text = "Counter: " + String(counter)
            SaveUserDefaults(text: counter,forKey: "Counter")
        }
        
    }
    

    
    
}

