//
//  SplashVC.swift
//  WeZCast
//
//  Created by Amin on 04/08/2022.
//

import UIKit
import Lottie
class SplashVC: UIViewController {

    @IBOutlet weak var uiAnimationView: LottieAnimationView!
    var viewModel:SplashVMProtocol!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAnimation()
        viewModel.input.onScreenAppeared.onNext(())
    }
    private func setupAnimation(){
        uiAnimationView.backgroundColor = .clear
        uiAnimationView.contentMode = .scaleAspectFill
        uiAnimationView.loopMode = .loop
        uiAnimationView.play()
        uiAnimationView.contentMode = .scaleAspectFit
        uiAnimationView.loopMode = .loop
        uiAnimationView.play()
    }
}
