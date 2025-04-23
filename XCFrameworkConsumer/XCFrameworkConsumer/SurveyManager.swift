import UIKit
import QuestionProCXFramework

@MainActor
class SurveyManager : NSObject, QuestionProDelegate {
    func initSDKSuccess() {
        print("init success host app")
    }
    
    func initSDKFailed(error: any Error) {
        print("init failed host app \(error)")
    }
    
    func getSurveyURL(surveyURL: String) {
        print("launch survey URL \(surveyURL)")
    }
    
    static let shared = SurveyManager()

    let touchPoint = TouchPoint()

    func initializeSurvey(window: UIWindow, showInDialog: Bool) {
        GlobalManager.shared.iQuestionProCXManager.enableLogs(enabledLogs: true)
        let apiKey = "c14d4e28-ab40-4c99-9426-8dac3c42725b"
//        let surveyId = 12174640
        let touchPoint = touchPoint.initTouchPoint(dataCenter: TouchPoint.DataCenter.DATA_CENTER_EU)
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
