//
//  ViewController.swift
//  XCFrameworkConsumer
//
//  Created by Prasad on 30/07/24.
//



import UIKit
import QuestionProCXFramework

class ViewController: UIViewController, QuestionProCallback {
    func refreshToken(completion: @escaping (String?) -> Void) {
        print("Host App: Refresh token requested by SDK")
        let newToken = "newlyGeneratedAccessToken123";
        print("Returning new token: \(newToken)")
        DispatchQueue.main.async {
            completion(newToken)
        }
    }
    
    func encryptData(data: String, completion: @escaping (String, [String : String]) -> Void) {
        guard let results = getEncryptData(data) else {
            print("SDK Error: Failed to encrypt data – possibly empty or invalid input")
            return
        }
        
        DispatchQueue.main.async {
            completion(results.0, results.1)
        }
    }
    
    func decryptData(apiResponse: (String, [String : String]), completion: @escaping (String?) -> Void) {
        let result = getDecryptedData(apiResponse)
        
        DispatchQueue.main.async {
            if let decrypted = result {
                completion(decrypted)
            } else {
                print("SDK Error: Failed to decrypt data")
                completion(nil)
            }
        }
    }

    private func getEncryptData(_ dataToEncrypt: String) -> (String, [String: String])? {
        guard !dataToEncrypt.isEmpty else { return nil }

        let encryptedData = dataToEncrypt // In real case, do actual encryption

        let headers: [String: String] = [
            "Content-Type": "application/json; charSet=UTF-8",
            "api-key": "04d4d48a-37b9-4c08-8638-9b50744ac32e",
            "access-token": "access_token"
        ]

        return (encryptedData, headers)
    }
    
    private func getDecryptedData(_ apiResponse: (String, [String: String])) -> String? {
        let (encryptedData, headers) = apiResponse

        guard !encryptedData.isEmpty else {
            print("Test app: Empty encrypted data. Aborting decryption.")
            return nil
        }

        print("Test app: data decryption started... \(encryptedData)")

        let headerString = headers.map { "\($0): \($1)" }.joined(separator: ", ")
        print("Test app: Headers received: \(headerString)")

        let decryptedData = encryptedData // In real case, perform decryption here
        print("Test app: data decryption ended: \(decryptedData)")

        return decryptedData
    }
    
    
    var window: UIWindow?
    @IBOutlet weak var popupSurveyButton: UIButton?
    @IBOutlet weak var fullScreenSurveyButton: UIButton?
    public var iQuestionProCXManager = QuestionProCXManager.sharedManager
    let touchPoint = TouchPoint()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.window = AppDelegate.shared.window!
    }
    
    @IBAction func popupSurveyButtonTouchUpInside(_sender: Any) {
        self.initializeSDK(window: self.window!);
        self.launchSurveyPopup(surveyId: 13143865)
    }
        
    @IBAction func fullScreenSurveyButtonTouchUpInside(_sender: Any) {
        self.initializeSDK(window: self.window!);
        self.launchSurvey(surveyId: 6927573)
    }
    
    func initializeSDK(window: UIWindow) {
        let apiKey = "04d4d48a-37b9-4c08-8638-9b50744ac32e";
        iQuestionProCXManager.initWithAPIKey(
            apiKey: apiKey,
            apiBaseUrl: "https://api.questionpro.com",
            accessToken: "Initial Access Token",
            port: "",
            callback: self,
            withWindow: window
        )
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            self.iQuestionProCXManager.closeSurveyWindow()
        }
    }
        
    func launchSurvey(surveyId: Int) {
        let touchPoint = TouchPoint().initTouchPoint(surveyId: surveyId)
        touchPoint.firstName = "Mobile"
        touchPoint.lastName = "QuestionPro"
        touchPoint.customVariables?[4] = "Prasad"
        touchPoint.customVariables?[6] = "Datta"
        touchPoint.ShowInDialog = false
        touchPoint.themeColor = "#4df0d7"
        touchPoint.email = "mobile@questionpro.com"
        touchPoint.segmentCode = "android"
        touchPoint.transactionLanguage = "en"
        iQuestionProCXManager.launchFeedbackSurvey(touchPoint: touchPoint)
    }
    
    func launchSurveyPopup(surveyId: Int) {
        let touchPoint = TouchPoint().initTouchPoint(surveyId: surveyId)
        touchPoint.firstName = "Mobile"
        touchPoint.lastName = "QuestionPro"
        touchPoint.customVariables?[4] = "Prasad"
        touchPoint.customVariables?[6] = "Datta"
        touchPoint.ShowInDialog = true
        touchPoint.themeColor = "#ddee33"
        touchPoint.segmentCode = "ios"
        touchPoint.transactionLanguage = "en"
        touchPoint.email = "mobile@questionpro.com"
        iQuestionProCXManager.launchFeedbackSurvey(touchPoint: touchPoint)
    }
}
