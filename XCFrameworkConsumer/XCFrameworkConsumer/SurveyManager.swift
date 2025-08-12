import UIKit
import QuestionProCXFramework

@MainActor
class SurveyManager : NSObject, QuestionProDelegate {
    func initSDKSuccess() {
        print("init success host app")
    }
    
    func initSDKFailed(error: String) {
        print("init failed host app \(error)")
    }
    
    func getSurveyURL(surveyURL: String) {
        print("launch survey URL \(surveyURL)")
    }
    
    static let shared = SurveyManager()

    let touchPoint = TouchPoint()

    func initializeSurvey(window: UIWindow, showInDialog: Bool) {
        GlobalManager.shared.iQuestionProCXManager.enableLogs(enabledLogs: true)
        let apiKey = "06ad2888-6768-46a0-987f-bda9a0ed7a1f"
        let customVariables = [1: "Prasad", 2: "Bhide"]
        let touchPoint = touchPoint.initTouchPoint(dataCenter: TouchPoint.DataCenter.DATA_CENTER_US, customVariables: customVariables)
        GlobalManager.shared.iQuestionProCXManager.configure(
            apiKey: apiKey,
            touchPoint: touchPoint,
            withWindow: window,
            callbackDelegate: self
        )
    }
}
