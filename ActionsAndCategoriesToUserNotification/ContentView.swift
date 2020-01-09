//
//  ContentView.swift
//  ActionsAndCategoriesToUserNotification
//
//  Created by Ramill Ibragimov on 09.01.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        ZStack {
            Button(action: {
                self.send()
            }) {
                Text("Send Notification")
            }
        }
    }
    
    func send() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (_, _) in
            
        }
        
        let content = UNMutableNotificationContent()
        content.title = "Message"
        content.body = "New Tutorial from SwiftUI"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let req = UNNotificationRequest(identifier: "req", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(req, withCompletionHandler: nil)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
