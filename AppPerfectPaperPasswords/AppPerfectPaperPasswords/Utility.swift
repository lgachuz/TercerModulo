//
//  Utility.swift
//  AppPerfectPaperPasswords
//
//  Created by Luis Gachuz Trabajo on 05/02/20.
//  Copyright © 2020 Luis Gachuz Trabajo. All rights reserved.
//

import Foundation


// Se declara la Extension del metodo String y se agrega la opcion de poder extraer elementos random
extension String {
    func randomStr(_ length: Int) -> String {
    let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    return String((0..<length).map{ _ in letters.randomElement()! })
        
    }
}

func SaveUserDefaults (text: Any,forKey: String) {
    UserDefaults.standard.set(text,forKey: forKey)
    UserDefaults.standard.synchronize()
}
