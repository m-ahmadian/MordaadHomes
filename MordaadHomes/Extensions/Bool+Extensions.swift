//
//  Bool+Extensions.swift
//  MordaadHomes
//
//  Created by Mehrdad Behrouz Ahmadian on 2025-01-10.
//

import Foundation

extension Bool {
    static var isRunningUnitTests: Bool {
        ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil
    }
    
    static var isRuuningUITests: Bool {
        ProcessInfo.processInfo.arguments.contains("UITests")
    }
    
    static var isRunningPreviews: Bool {
        ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
    }
    
    static var isRunningOnSimulator: Bool {
        ProcessInfo.processInfo.environment["SIMULATOR"] != nil
    }
    
    static var isRunningOnDevice: Bool {
        !isRunningOnSimulator
    }
    
    static var isDebugBuild: Bool {
        #if DEBUG
                return true
        #else
                return false
        #endif
    }
}
