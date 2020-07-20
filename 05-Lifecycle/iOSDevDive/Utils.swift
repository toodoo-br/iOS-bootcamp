//
//  Utils.swift
//  iOSDevDive
//
//  Created by Paulo Antonio Cerávolo on 12/07/20.
//  Copyright © 2020 TooDoo. All rights reserved.
//

import Foundation

class Utils {
    // Return Dictonary of PLIST
    static func getPlist(withName name: String) -> NSDictionary?
    {
        if let path = Bundle.main.path(forResource: name, ofType: "plist") {
           return NSDictionary(contentsOfFile: path)
        }
        return nil
    }
}
