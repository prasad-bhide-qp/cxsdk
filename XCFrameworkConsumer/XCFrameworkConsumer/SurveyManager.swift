import UIKit
import QuestionProCXFramework

@MainActor
class SurveyManager {
    static let shared = SurveyManager()

    private init() {}
    public var iQuestionProCXManager = QuestionProCXManager.sharedManager
    let touchPoint = TouchPoint()

    func initializeSurvey(window: UIWindow, showInDialog: Bool) {
        let apiKey = "9c27338d-2f3c-44ef-a47f-5d8515bf4aea"
        let surveyId = 10871

        iQuestionProCXManager.initwithAPIKey(
            apiKey: apiKey,
            dataCenter: TouchPoint.DataCenter.DATA_CENTER_KSA,
            withWindow: window
        )

        let touchPoint = touchPoint.initTouchPoint(surveyId: surveyId)
        touchPoint.firstName = "Mobile"
        touchPoint.lastName = "QuestionPro"
        touchPoint.customVariables?[4] = "Prasad"
        touchPoint.customVariables?[6] = "Datta"
        touchPoint.ShowInDialog = showInDialog
        touchPoint.themeColor = "#4df0d7"
        touchPoint.email = "mobile@questionpro.com"
        touchPoint.segmentCode = "android"
        touchPoint.transactionLanguage = "en"

        iQuestionProCXManager.launchFeedbackSurvey(touchPoint: touchPoint)
    }
}
