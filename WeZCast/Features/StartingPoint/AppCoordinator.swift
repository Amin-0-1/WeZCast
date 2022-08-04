//
//  AppCoordinator.swift
//  WeZCast
//
//  Created by Amin on 31/07/2022.
//

import Foundation
import UIKit

protocol Coordinating{
    func start()
}

struct AppCoordinatore:Coordinating{
    private var window:UIWindow!
    init(window:UIWindow) {
        self.window = window
    }
    func start() {
        let nav = UINavigationController()
        let onboardingCoordinator = OnboardingCoordinator(nav: nav)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        onboardingCoordinator.start()
    }
}
