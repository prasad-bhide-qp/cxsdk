import UIKit
import QuestionProCXFramework

@MainActor
class SurveyManager : NSObject, QuestionProInitDelegate {
    func initSDKSuccess() {
        print("init success host app")
    }
    
    func initSDKFailed(error: String) {
        print("init failed host app \(error)")
    }
    
    static let shared = SurveyManager()

//    let touchPoint = TouchPoint()

    func initializeSurvey(window: UIWindow, showInDialog: Bool) {
        GlobalManager.shared.iQuestionProCXManager.enableLogs(enabledLogs: false)
        //Intercept api key
        let apiKey = "06ad2888-6768-46a0-987f-bda9a0ed7a1f"
        //Core survey key
//        let apiKey = "5350a2b4-90f5-4078-9ce4-8df1247b46cc"
        let customVariables = [1: "Prasad", 2: "Bhide"]
        
        let touchPoint = TouchPoint.initTouchPoint(dataCenter: TouchPoint.DataCenter.DATA_CENTER_US)
        
        QuestionProCX.getinstance().configure(
            apiKey: apiKey,
            touchPoint: touchPoint,
            withWindow: window,
            initCallbackDelegate: self
        )
        
//        QuestionProCX.getinstance().launchFeedbackSurvey(surveyId: 7165860)
    }
}
