//
//  AppDelegate.swift
//  XCFrameworkConsumer
//
//  Created by Prasad on 30/07/24.
//

import UIKit
import QuestionProCXFramework

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    public var window: UIWindow?
//    let touchPoint = TouchPoint()

    static var shared: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if #available(iOS 13.0, *) {
            SurveyManager.shared.initializeSurvey(window: self.window!, showInDialog: true)
        } else {
            if (self.window != nil) {
                SurveyManager.shared.initializeSurvey(window: self.window!, showInDialog: true)
            }
        }
        
        NotificationCenter.default.addObserver(
            forName: .languageChanged,
            object: nil,
            queue: .main
        ) { _ in
            let rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
            UIApplication.shared.windows.first?.rootViewController = rootVC
            UIApplication.shared.windows.first?.makeKeyAndVisible()
        }
        
        return true
    }
}

