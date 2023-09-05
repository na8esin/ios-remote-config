//
//  ViewController.swift
//  
//  
//  Created by t-watanabe on 2023/09/04.
//

import UIKit
import FirebaseRemoteConfig

class ViewController: UIViewController {
    let welcomeMessageConfigKey = "welcome_message"
    let welcomeMessageCapsConfigKey = "welcome_message_caps"
    let loadingPhraseConfigKey = "loading_phrase"

    var remoteConfig: RemoteConfig!
    @IBOutlet var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        remoteConfig = RemoteConfig.remoteConfig()
        
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
        
        remoteConfig.setDefaults(fromPlist: "RemoteConfigDefaults")
        
        fetchConfig()
    }
    
    func fetchConfig() {
        welcomeLabel.text = remoteConfig[loadingPhraseConfigKey].stringValue

        // [START fetch_config_with_callback]
        remoteConfig.fetch { (status, error) -> Void in
          if status == .success {
            print("Config fetched!")
            self.remoteConfig.activate { changed, error in
              // ...
            }
          } else {
            print("Config not fetched")
            print("Error: \(error?.localizedDescription ?? "No error available.")")
          }
          self.displayWelcome()
        }
        // [END fetch_config_with_callback]
    }
    
    func displayWelcome() {
        // [START get_config_value]
        var welcomeMessage = remoteConfig[welcomeMessageConfigKey].stringValue
        // [END get_config_value]

        if remoteConfig[welcomeMessageCapsConfigKey].boolValue {
          welcomeMessage = welcomeMessage?.uppercased()
        }
        welcomeLabel.text = welcomeMessage
    }
}

