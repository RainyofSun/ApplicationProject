//
//  NetworkAPI.swift
//  Living
//
//  Created by Eric on 2023/10/24.
//

import UIKit
import Moya

enum NetworkAPI {
    case cityList
}

extension NetworkAPI: TargetType {
    
    var baseURL: URL {
        return URL.init(string: BASE_URL)!
    }
    
    var path: String {
        switch self {
        case .cityList:
            return "zen"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Moya.Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return ["Content-Type":"application/x-www-form-urlencoded"]
    }
    
    var validationType: ValidationType {
        return .successAndRedirectCodes
    }
}
