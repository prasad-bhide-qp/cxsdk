//
//  ViewController.swift
//  XCFrameworkConsumer
//
//  Created by Prasad on 30/07/24.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var nextScreenButton: UIButton?
    @IBOutlet weak var bcakScreenButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GlobalManager.shared.iQuestionProCXManager.setScreenName(screenName: "SecondScreen")
    }
    
    @IBAction func backButtonTouchUpInside(_ sender: Any?) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextButtonTouchUpInside(_ sender: Any?) {
        let thirdViewController = self.storyboard?.instantiateViewController(withIdentifier: "thirdScreenID") as! ThirdViewController
        self.navigationController?.pushViewController(thirdViewController, animated: true);
    }
    
}

