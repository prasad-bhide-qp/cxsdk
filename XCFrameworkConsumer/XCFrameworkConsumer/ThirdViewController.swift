//
//  ViewController.swift
//  XCFrameworkConsumer
//
//  Created by Prasad on 30/07/24.
//

import UIKit

class ThirdViewController: UIViewController {
    @IBOutlet weak var nextScreenButton: UIButton?
    @IBOutlet weak var bcakScreenButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GlobalManager.shared.iQuestionProCXManager.setScreenName(screenName: "ThirdScreen")
    }
    
    @IBAction func backButtonTouchUpInside(_ sender: Any?) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextButtonTouchUpInside(_ sender: Any?) {
        let forthViewController = self.storyboard?.instantiateViewController(withIdentifier: "forthScreenID") as! ForthViewController
        self.navigationController?.pushViewController(forthViewController, animated: true);
    }
    
}

