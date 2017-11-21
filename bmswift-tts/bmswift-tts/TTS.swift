//
//  TTS.swift
//  bmswift-tts
//
//  Created by Brent McCoy on 21/11/17.
//  Copyright © 2017 Brent McCoy. All rights reserved.
//

import Foundation
import AppKit

struct TTS {
    
    public static func fromArray(_ json: [NSDictionary]) {
        for i in 0 ..< json.count {
            if let filename = json[i]["filename"] as? String, let text = json[i]["text"] as? String, let voice = json[i]["voice"] as? String {
                let speech = NSSpeechSynthesizer(voice: NSSpeechSynthesizer.VoiceName.init(rawValue: "com.apple.speech.synthesis.voice.\(voice)"))
                speech?.rate = 200.0
                speech?.volume = 0.5
                let url = URL(fileURLWithPath: filename)
                speech?.startSpeaking(text, to: url)
            }
            else {
                print("Unable to generate audio at index: \(i)")
            }
        }
    }
    
}
