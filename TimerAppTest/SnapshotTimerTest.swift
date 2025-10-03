//
//  SnapshotTimerTest.swift
//  TimerAppTest
//
//  Created by Faki Doosuur Doris on 16.04.2024.
//

import XCTest
import SnapshotTesting

@testable import TimerApp

final class SnapshotTimerTest: XCTestCase {

    override func setUpWithError() throws {
    }

    func test_login_screen() throws {
        let loginViewController = LoginViewController()
        assertSnapshot(of: loginViewController, as: .image)
    }

    func test_main_screen_on_iPad() throws {
        let mainViewController = LoginViewController()
        assertSnapshot(of: mainViewController, as: .image(on: .iPadPro11(.portrait)))
    }
}
