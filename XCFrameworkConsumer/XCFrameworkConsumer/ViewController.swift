//
//  ViewController.swift
//  XCFrameworkConsumer
//
//  Created by Prasad on 30/07/24.
//

import UIKit
import QuestionProCXFramework

@available(iOS 13.0, *)
class ViewController: UIViewController, QuestionProCallbackDelegate {
    func getSurveyURL(surveyURL: String) {
        print("launch survey URL inside ViewController: \(surveyURL)")
    }
    
    @IBOutlet weak var popupSurveyButton: UIButton?
    @IBOutlet weak var fullScreenSurveyButton: UIButton?
    @IBOutlet weak var nextScreenButton: UIButton?
    @IBOutlet weak var localizedLabel: UILabel!
    @IBOutlet weak var changeLanguageButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.localizedLabel.text = NSLocalizedString("welcome_message", comment: "")
        GlobalManager.shared.iQuestionProCXManager.setQuestionProCallbackDelegate(questionProCallbackDelegate: self)
    }
    
    @IBAction func changeLanguageButtonTouchUpInside(_sender: Any) {
        LocalizationManager.shared.changeLanguage()
    }
    
    @IBAction func popupSurveyButtonTouchUpInside(_sender: Any) {
        let window = AppDelegate.shared.window!
        SurveyManager.shared.initializeSurvey(window: window, showInDialog: true)
    }
    
    @IBAction func fullScreenSurveyButtonTouchUpInside(_sender: Any) {
        let window = AppDelegate.shared.window!
        SurveyManager.shared.initializeSurvey(window: window, showInDialog: false)
    }
    
    @IBAction func nextScreenButtonTouchUpInside(_sender: Any) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewID") as! SecondViewController
        self.navigationController?.pushViewController(secondViewController, animated: true);
    }
    
}

