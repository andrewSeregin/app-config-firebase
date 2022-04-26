//
//  RemoteConfig+JSON.swift
//  
//
//  Created by Andrew Seregin on 11.02.2022.
//

import Foundation
import FirebaseRemoteConfig

public extension RemoteConfig {
    func jsonValue(
        for source: RemoteConfigSource = .default
    ) -> [AnyHashable: Any] {
        .init(
            uniqueKeysWithValues: allKeys(from: source)
                .compactMap { key in
                    let configValue = configValue(forKey: key, source: source)
                    if let jsonValue = configValue.jsonValue {
                        return (key, jsonValue)
                    }
                    if let stringValue = configValue.stringValue, !stringValue.isEmpty {
                        if let boolValue = Bool(stringValue.lowercased()) {
                            return (key, boolValue)
                        }
                        if let doubleValue = Double(stringValue), !doubleValue.isInfinite {
                            return (key, configValue.numberValue)
                        }
                        return (key, stringValue)
                    }
                    return nil
                }
        )
    }
    
    func setDefaults(
        fromJSON fileName: String,
        in bundle: Bundle = .main
    ) {
        guard
            let jsonPath = bundle.path(forResource: fileName, ofType: "json"),
            let jsonValues = NSDictionary(contentsOfFile: jsonPath) as? [String: NSObject]
        else {
            return
        }
        self.setDefaults(fromJSON: jsonValues)
    }
    
    func setDefaults(
        fromJSON json: [String: NSObject]
    ) {
        let jsonValues: [String: NSObject] = json
            .compactMapValues { object in
                guard
                    JSONSerialization.isValidJSONObject(object),
                    let data = try? JSONSerialization.data(withJSONObject: object)
                else {
                    return object
                }
                return data as NSData
            }
        self.setDefaults(jsonValues)
    }
}
