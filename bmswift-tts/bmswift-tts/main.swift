//
//  main.swift
//  bmswift-tts
//
//  Created by Brent McCoy on 21/11/17.
//  Copyright © 2017 Brent McCoy. All rights reserved.
//

import Foundation

print("Please enter the JSON audio metadata path:")
let file = readLine()
if let file = file {
    let json = JSON.parseArray(file)
    if let json = json {
        TTS.fromArray(json)
    }
}





