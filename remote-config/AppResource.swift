//
//  AppResource.swift
//  remote-config
//  
//  Created by t-watanabe on 2023/09/06.
//

import Foundation
import FirebaseRemoteConfig

struct AppResource {
    struct API {
        static let isNewApi = "is_new_api"
        static var baseUrl: String {
            let remoteConfig = RemoteConfig.remoteConfig()
            if remoteConfig[isNewApi].boolValue == true {
                return "https://new.example.com"
            } else {
                return "https://old.example.com"
            }
        }
    }
}
