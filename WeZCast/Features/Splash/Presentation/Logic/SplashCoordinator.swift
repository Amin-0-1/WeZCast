//
//  SplashCoordinator.swift
//  WeZCast
//
//  Created by Amin on 04/08/2022.
//

import Foundation
import UIKit

protocol SplashCoordinating:Coordinating{
    func navigateToHome()
    func navigateToOnboarding()
}
class SplashCoordinator:SplashCoordinating{
    
    private var nav:UINavigationController!
    init(nav:UINavigationController){
        self.nav = nav
    }
    
    func start() {
        let vc = SplashVC.init(nibName: R.nib.splashVC.name, bundle: nil)
        let usecase = SplashUsecase()
        vc.viewModel = SplashViewModel(coordinator: self, usecase: usecase)
        nav.pushViewController(vc, animated: true)
    }
    
    func navigateToHome() {
        let 
    }
    
    func navigateToOnboarding() {
        let onboardCoord = OnboardingCoordinator(nav: nav)
        onboardCoord.start()
    }
    

    
}
