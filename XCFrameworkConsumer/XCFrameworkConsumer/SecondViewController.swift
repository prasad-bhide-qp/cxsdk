//
//  ViewController.swift
//  XCFrameworkConsumer
//
//  Created by Prasad on 30/07/24.
//

import UIKit
import QuestionProCXFramework

class SecondViewController: UIViewController, QuestionProCallbackDelegate {
    func getSurveyURL(surveyURL: String) {
        print("launch survey URL inside SecondViewController :\(surveyURL)")
    }
    
    @IBOutlet weak var nextScreenButton: UIButton?
    @IBOutlet weak var bcakScreenButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GlobalManager.shared.iQuestionProCXManager.setScreenName(screenName: "SecondScreen")
        view.backgroundColor = .white
        GlobalManager.shared.iQuestionProCXManager.setQuestionProCallbackDelegate(questionProCallbackDelegate: self)
        let button = UIButton(type: .system)
        button.setTitle("Show Popup", for: .normal)
        button.addTarget(self, action: #selector(showPopup), for: .touchUpInside)
        button.frame = CGRect(x: 100, y: 300, width: 200, height: 50)
        view.addSubview(button)
    }
    
    @objc func showPopup() {
            // Dimmed background view
            let backgroundView = UIView(frame: self.view.bounds)
            backgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.6)
            backgroundView.tag = 999 // To find and remove later

            // Popup view
            let popupView = UIView(frame: CGRect(x: 40, y: 0, width: view.frame.width - 80, height: 200))
            popupView.center = view.center
            popupView.backgroundColor = .white
            popupView.layer.cornerRadius = 16

            // Label inside popup
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: popupView.frame.width, height: 100))
            label.text = "This is a popup!"
            label.textAlignment = .center
            label.center = CGPoint(x: popupView.frame.width / 2, y: popupView.frame.height / 2 - 20)
            popupView.addSubview(label)

            // Close button
            let closeButton = UIButton(type: .system)
            closeButton.setTitle("Close", for: .normal)
            closeButton.frame = CGRect(x: 0, y: 0, width: 100, height: 44)
            closeButton.center = CGPoint(x: popupView.frame.width / 2, y: popupView.frame.height - 40)
            closeButton.addTarget(self, action: #selector(dismissPopup), for: .touchUpInside)
            popupView.addSubview(closeButton)

            backgroundView.addSubview(popupView)
            self.view.addSubview(backgroundView)
        }

        @objc func dismissPopup() {
            if let popup = self.view.viewWithTag(999) {
                popup.removeFromSuperview()
            }
        }
    
    @IBAction func backButtonTouchUpInside(_ sender: Any?) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextButtonTouchUpInside(_ sender: Any?) {
        let thirdViewController = self.storyboard?.instantiateViewController(withIdentifier: "thirdScreenID") as! ThirdViewController
        self.navigationController?.pushViewController(thirdViewController, animated: true);
    }
    
}

