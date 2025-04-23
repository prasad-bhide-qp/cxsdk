//
//  ViewController.swift
//  XCFrameworkConsumer
//
//  Created by Prasad on 30/07/24.
//

import UIKit

class ForthViewController: UIViewController {
    @IBOutlet weak var backScreenButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backButtonTouchUpInside(_ sender: Any?) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

