//
//  HomeCoordinator.swift
//  WeZCast
//
//  Created by Amin on 08/08/2022.
//

import Foundation
import UIKit

protocol HomeCoordinating:Coordinating{
    
}

class HomeCoordinator:HomeCoordinating{
    
    private var nav:UINavigationController!
    init(nav:UINavigationController){
        self.nav = nav
    }
    
    func start() {
        let vc = HomeVC.init(nibName: R.nib.homeVC.name, bundle: nil)
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        nav.present(vc, animated: true)
    }
}
