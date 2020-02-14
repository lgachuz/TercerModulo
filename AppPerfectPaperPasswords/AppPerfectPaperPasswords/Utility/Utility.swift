//
//  Utility.swift
//  AppPerfectPaperPasswords
//
//  Created by Luis Gachuz Trabajo on 05/02/20.
//  Copyright © 2020 Luis Gachuz Trabajo. All rights reserved.
//

import Foundation
import CryptoKit


// Se declara la Extension del metodo String y se agrega la opcion de poder extraer elementos random

func SaveUserDefaults (text: Any,forKey: String) {
    UserDefaults.standard.set(text,forKey: forKey)
    UserDefaults.standard.synchronize()
    
}

extension SymmetricKey {
    init?(base64EncodedString: String) {
        guard let data = Data(base64Encoded: base64EncodedString) else {
            return nil
        }

        self.init(data: data)
    }

    // MARK: - Instance Methods

    /// Serializes a `SymmetricKey` to a Base64-encoded `String`.
    func serialize() -> String {
        return self.withUnsafeBytes { body in
            Data(body).base64EncodedString()
        }
    }
}
