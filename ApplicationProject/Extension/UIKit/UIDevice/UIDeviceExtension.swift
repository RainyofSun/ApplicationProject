//
//  UIDeviceExtension.swift
//  Living
//
//  Created by Eric on 2023/10/25.
//

import UIKit
import Alamofire

extension UIDevice {
    static var isNetworkConnect: Bool {
        let network = NetworkReachabilityManager()
        return network?.isReachable ?? true
    }
}

extension UIDevice {
    /// 顶部安全区高度
    static func xp_safeDistanceTop() -> CGFloat {
        if #available(iOS 13.0, *) {
            let scene = UIApplication.shared.connectedScenes.first
            guard let windowScene = scene as? UIWindowScene else { return 0 }
            guard let window = windowScene.windows.first else { return 0 }
            return window.safeAreaInsets.top
        }
        return 0;
    }
    /// 底部安全区高度
    static func xp_safeDistanceBottom() -> CGFloat {
        if #available(iOS 13.0, *) {
            let scene = UIApplication.shared.connectedScenes.first
            guard let windowScene = scene as? UIWindowScene else { return 0 }
            guard let window = windowScene.windows.first else { return 0 }
            return window.safeAreaInsets.bottom
        }
        return 0;
    }
    /// 顶部状态栏高度（包括安全区）
    static  func xp_statusBarHeight() -> CGFloat {
        var statusBarHeight: CGFloat = 0
        if #available(iOS 13.0, *) {
            let scene = UIApplication.shared.connectedScenes.first
            guard let windowScene = scene as? UIWindowScene else { return 0 }
            guard let statusBarManager = windowScene.statusBarManager else { return 0 }
            statusBarHeight = statusBarManager.statusBarFrame.height
        } else {
            statusBarHeight = UIApplication.shared.statusBarFrame.height
        }
        return statusBarHeight
    }
    /// 导航栏高度
    static func xp_navigationBarHeight() -> CGFloat {
        return 44.0
    }
    /// 状态栏+导航栏的高度
    static func xp_navigationFullHeight() -> CGFloat {
        return UIDevice.xp_statusBarHeight() + UIDevice.xp_navigationBarHeight()
    }
    
    /// 底部导航栏高度
    static func xp_tabBarHeight() -> CGFloat {
        return 49.0
    }
    
    /// 底部导航栏高度（包括安全区）
    static func xp_tabBarFullHeight() -> CGFloat {
        return UIDevice.xp_tabBarHeight() + UIDevice.xp_safeDistanceBottom()
    }
    
    /// 限制 iOS15.0 以上
    static func iOSUpVersion(_ version: Int = 15) -> Bool {
        /*majorVersion：主版本号；minorVersion:次版本号;patchVersion:最后一位小版本号*/
        let systemVersion = OperatingSystemVersion(majorVersion: version, minorVersion: 0, patchVersion: 0)
        return ProcessInfo.processInfo.isOperatingSystemAtLeast(systemVersion)
    }
}
