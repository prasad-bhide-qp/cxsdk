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
//        let apiKey = "c14d4e28-ab40-4c99-9426-8dac3c42725b" //eu dc
        let apiKey = "06ad2888-6768-46a0-987f-bda9a0ed7a1f" //us dc
//        let apiKey = "e37da3ff-858c-4358-af11-a727377dfac2" //us dc staging
//        let apiKey = "3a1a6c70-12c9-4a98-8571-bdf563331449" //momentum
        //Core survey key
//        let apiKey = "5350a2b4-90f5-4078-9ce4-8df1247b46cc"
        
        let touchPoint = TouchPoint.initTouchPoint(dataCenter: TouchPoint.DataCenter.DATA_CENTER_US)
        touchPoint.platform = TouchPoint.PLATFORM.FLUTTER.rawValue
        
        
        QuestionProCX.getinstance().configure(
            apiKey: apiKey,
            touchPoint: touchPoint,
            withWindow: window,
            initCallbackDelegate: self
        )
        
        
//        QuestionProCX.getinstance().setDataMappings(dataMappings: [" First name ": "Datta", "mobile": "9028507904", "email": "datta.kunde@questionpro.com"])
//        QuestionProCX.getinstance().launchFeedbackSurvey(surveyId: 7165860)
    }
}
