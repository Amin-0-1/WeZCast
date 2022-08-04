//
//  MyUserDefaults.swift
//  WezCast
//
//  Created by Amin on 04/08/2022.
//

import Foundation

protocol MyUserDefaultsInterface{
    static func getValue(forkKey key:UDKeys)->Any?
    static func set(value val:Any,forKey key:UDKeys)
}
enum UDKeys:String{
    case onboarding
}
class MyUserDefaults{
    let shared = MyUserDefaults()
    private static let userDefaults:UserDefaults = UserDefaults.standard
    
    private init(){}
    static func getValue(forKey key:UDKeys)->Any?{
        let val = userDefaults.value(forKey:key.rawValue)
        return val
    }
    static func set(value val:Any,forKey key:UDKeys){
        userDefaults.set(val, forKey: key.rawValue)
    }
}
