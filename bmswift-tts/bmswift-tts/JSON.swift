//
//  JSON.swift
//  bmswift-tts
//
//  Created by Brent McCoy on 21/11/17.
//  Copyright © 2017 Brent McCoy. All rights reserved.
//

import Foundation

struct JSON {
    
    public static func parseObject(_ jsonPath: String) -> NSDictionary? {
        if jsonPath.isEmpty {
            print("Path required to parse JSON data.")
            return nil
        }
        var json: NSDictionary?
        do {
            let path = URL(fileURLWithPath: jsonPath)
            let decodedString = try String(contentsOf: path)
            guard let data = decodedString.data(using: String.Encoding.utf8, allowLossyConversion: false) else { return nil }
            json = try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary
        } catch let error as NSError {
            print("Failed to load: \(error.localizedDescription)")
            exit(1)
        }
        print("JSON parsed successfully...")
        return json
    }
    
    public static func parseArray(_ jsonPath: String) -> [NSDictionary]? {
        if jsonPath.isEmpty {
            print("Path required to parse JSON data.")
            return nil
        }
        var json: [NSDictionary]?
        do {
            let path = URL(fileURLWithPath: jsonPath)
            let decodedString = try String(contentsOf: path)
            guard let data = decodedString.data(using: String.Encoding.utf8, allowLossyConversion: false) else { return nil }
            json = try JSONSerialization.jsonObject(with: data, options: []) as? [NSDictionary]
        } catch let error as NSError {
            print("Failed to load: \(error.localizedDescription)")
            exit(1)
        }
        print("JSON parsed successfully...")
        return json
    }
    
}
