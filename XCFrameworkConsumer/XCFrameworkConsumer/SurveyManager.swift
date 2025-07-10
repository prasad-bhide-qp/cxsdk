import UIKit
import QuestionProCXFramework

@MainActor
class SurveyManager : NSObject, QuestionProDelegate {
    func initSDKSuccess() {
        print("init success host app")
    }
    
    func initSDKFailed(error: Error) {
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
//        let surveyId = 12174640
        let touchPoint = touchPoint.initTouchPoint(dataCenter: TouchPoint.DataCenter.DATA_CENTER_US)
        GlobalManager.shared.iQuestionProCXManager.configure(
            apiKey: apiKey,
            touchPoint: touchPoint,
            withWindow: window,
            callbackDelegate: self
        )

//        touchPoint.firstName = "Prasad"
//        touchPoint.lastName = "Bhide"
//        touchPoint.customVariable1 = "Pune"
//        touchPoint.customVariable2 = "India"
//        touchPoint.customVariable3 = "Wakad"
//        touchPoint.ShowInDialog = showInDialog
//        touchPoint.transactionLanguage = "English"

//        iQuestionProCXManager.launchFeedbackSurvey(touchPoint: touchPoint)
    }
}
