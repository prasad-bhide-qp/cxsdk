import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

//    var window: UIWindow?
//
//    func scene(_ scene: UIScene,
//               willConnectTo session: UISceneSession,
//               options connectionOptions: UIScene.ConnectionOptions) {
//
//        guard let windowScene = (scene as? UIWindowScene) else { return }
//
//        let window = UIWindow(windowScene: windowScene)
//        let rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
//        window.rootViewController = rootVC
//        window.makeKeyAndVisible()
//        self.window = window
//
//        // Add observer for language change
//        NotificationCenter.default.addObserver(
//            self,
//            selector: #selector(reloadRootViewController),
//            name: .languageChanged,
//            object: nil
//        )
//
//        // Initialize your SDK
//        SurveyManager.shared.initializeSurvey(window: window, showInDialog: true)
//    }
//
//    @objc private func reloadRootViewController() {
//        guard let window = self.window else { return }
//
//        let rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
//        window.rootViewController = rootVC
//        window.makeKeyAndVisible()
//    }
}

