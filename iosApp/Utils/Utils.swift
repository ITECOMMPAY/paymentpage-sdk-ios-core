//
//  Utils.swift
//  iosApp
//
//  Created by a.khrameev on 05.05.2022.
//

import UIKit
import CommonCrypto

class Utils: NSObject {
    class func signature(paramsToSign: String, secret: String) -> String {
        return paramsToSign.sha512(secret: secret)!.base64EncodedString();
    }
    
    class func getRandomPaymentNumber() -> String {
        let randomInt = Int.random(in: 0..<9999) + 1000
        return "msdk_core_payment_id_\(randomInt)"
    }
}

extension String {
    func sha512(secret: String = "") -> Data? {
        guard let secretData = secret.data(using: .utf8),
            let selfData = self.data(using: .utf8) else { return nil }
        
        var macData = Data(count: Int(CC_SHA512_DIGEST_LENGTH))
        macData.withUnsafeMutableBytes { macBytes in
            selfData.withUnsafeBytes { selfBytes in
                secretData.withUnsafeBytes { secretBytes in
                    CCHmac(CCHmacAlgorithm(kCCHmacAlgSHA512), secretBytes, secretData.count, selfBytes, selfData.count, macBytes)
                }
            }
        }
        
        return macData
    }
}
