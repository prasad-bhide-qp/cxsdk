//
//  GlobalQuestionProManager.swift
//  XCFrameworkConsumer
//
//  Created by Prasad on 03/04/25.
//
import QuestionProCXFramework

@MainActor
class GlobalManager {
    static let shared = GlobalManager()

    var iQuestionProCXManager = QuestionProCX.getinstance()

    private init() {}
}
