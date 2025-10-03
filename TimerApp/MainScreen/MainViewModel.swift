//
//  MainViewModel.swift
//  TimerApp
//
//  Created by Faki Doosuur Doris on 16.04.2024.
//

import Foundation
import UserNotifications

final class MainViewModel {
    @Published var timerLabel: String?
    var timer : Timer?

    init () {
        requestNotificationAuthorization()
    }

    func startButtonTapped(selectedSegmentIndex: Int) {
        print("startButtontapped")
        var timeRemaining = 0

        switch selectedSegmentIndex {
        case 0: // for Pomodoro selctor segment 0
            timeRemaining = 25 * 60
        case 1: // for Short Break selector segment 1
            timeRemaining = 5 * 60
        case 2: // for Long Break selector segment 2
            timeRemaining = 15 * 60
        default:
            timeRemaining = 25 * 60
        }

        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { [weak self] timer in
            guard let self = self else {return}
            let minutes = timeRemaining / 60
            let seconds = timeRemaining % 60
            self.timerLabel = String(format: "%02d:%02d", minutes, seconds)

            timeRemaining -= 1
            if timeRemaining == 0 {
                timer.invalidate()
                self.timer = nil
                self.timerLabel = "00:00"
                self.callNotification()

            }
        }
    }

    func resetButtonTapped() {
        timer?.invalidate()
        timer = nil
    }

    func callNotification() {
        if self.timerLabel == "00:00" {
            print("timer ended")
            scheduleNotification()
        }
    }


    func scheduleNotification() {
        print("notification called")
        let content = UNMutableNotificationContent()
        content.title = "Timer Expired"
        content.body = "Your timer has finished."
        content.sound = .defaultRingtone

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let request = UNNotificationRequest(identifier: "timerExpired",
                                            content: content,
                                            trigger: trigger)

        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error.localizedDescription)")
            }
        }

    }


    func requestNotificationAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                print("Notification authorization granted")
            } else {
                print("Notification authorization denied")
            }
        }
       
    }
}
