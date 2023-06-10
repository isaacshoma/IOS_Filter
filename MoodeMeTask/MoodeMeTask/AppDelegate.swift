//
//  AppDelegate.swift
//  MoodeMeTask
//
//  Created by Isaac Shoma on 2023-05-21.
//

import UIKit
import AVFoundation
import ARKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
    func checkCameraAuthorization() {
        let authorizationStatus = AVCaptureDevice.authorizationStatus(for: .video)
        switch authorizationStatus {
        case .authorized:
            // Camera access is already authorized.
            configureARSession()
        case .notDetermined:
            // Request camera access permission.
            AVCaptureDevice.requestAccess(for: .video) { granted in
                if granted {
                    DispatchQueue.main.async {
                        self.configureARSession()
                    }
                } else {
                    // Camera access denied by the user.
                }
            }
        case .denied, .restricted:
            // Camera access is denied or restricted.
            break
        @unknown default:
            break
        }
    }
    
    func configureARSession() {
        guard ARFaceTrackingConfiguration.isSupported else {
            // Face tracking is not supported on this device.
            return
        }
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Pause your AR session here if needed.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Stop your AR session here if needed.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Resume or restart your AR session here if needed.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Start or resume your AR session here if needed.
        checkCameraAuthorization()
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Save any necessary data or perform cleanup tasks here.
    }
}


