//
//  FirstVC.swift
//  WeZCast
//
//  Created by Amin on 31/07/2022.
//

import UIKit
import Lottie
class FirstVC: UIViewController {

    @IBOutlet weak var uiAnimationLogo: AnimationView!
    @IBOutlet weak var uiAnimationView: AnimationView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uiAnimationView.contentMode = .scaleAspectFill
        uiAnimationView.loopMode = .loop
        uiAnimationView.play()
        uiAnimationLogo.contentMode = .scaleAspectFit
        uiAnimationLogo.loopMode = .loop
        uiAnimationLogo.play()
        uiAnimationLogo.backgroundColor = .clear
    }
}
