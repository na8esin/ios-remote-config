//
//  ViewController.swift
//  
//  
//  Created by t-watanabe on 2023/09/04.
//

import UIKit
import FirebaseRemoteConfig

// ボタンを押すたびにuiを更新でもいいな
class ViewController: UIViewController {
  @IBOutlet var urlLabel: UILabel!
  @IBOutlet var fetchButton: UIButton!
    
  override func viewDidLoad() {
    super.viewDidLoad()
    urlLabel.text = AppResource.API.baseUrl
  }
  
  @IBAction func buttonTapped(_ sender: UIButton) {
    urlLabel.text = AppResource.API.baseUrl
  }
}

