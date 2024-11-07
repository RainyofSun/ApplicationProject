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
