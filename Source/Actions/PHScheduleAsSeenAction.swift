//
//  PHSheduleAsSeenAction.swift
//  Product Hunt
//
//  Created by Vlado on 4/15/16.
//  Copyright © 2016 ProductHunt. All rights reserved.
//

import Cocoa

class PHScheduleAsSeenAction {

    private class var delegate: AppDelegate {
        return NSApplication.sharedApplication().delegate as! AppDelegate
    }

    class func performSchedule() {
        performCancel()

        delegate.countdownToMarkAsSeen = NSTimer.after(30.seconds, {
            guard let posts = store.state.posts.todayPosts else {
                return
            }

            PHMarkAsSeenOperation.perform( posts )
        })
    }

    class func performCancel() {
        delegate.countdownToMarkAsSeen?.invalidate()
        delegate.countdownToMarkAsSeen = nil
    }
}