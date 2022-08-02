//
//  ButtonArrow.swift
//  WeZCast
//
//  Created by Amin on 01/08/2022.
//

import UIKit
import Lottie


@IBDesignable
class XButton: UIButton {
    
    @IBOutlet var uiContentView: UIView!{
        didSet{
            self.uiBackgroundColor = uiContentView.backgroundColor
        }
    }
    @IBOutlet weak var uiImage: UIImageView!
    @IBOutlet weak var uiLabel: UILabel!
    private var uiBackgroundColor:UIColor?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSub()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initSub()
    }
    
    private func initSub(){
        let bundle = Bundle.init(for: self.classForCoder)
        bundle.loadNibNamed(R.nib.xButton.name, owner: self, options: nil)
        addSubview(uiContentView)
        uiContentView.frame = self.bounds
        uiContentView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        uiLabel.textAlignment = .center
        
        self.animateArrowImage()
    }
    @IBInspectable var title:String?{
        get {return uiLabel.text}
        set {uiLabel.text = newValue}
    }
    @IBInspectable var titleColor:UIColor{
        get {return uiLabel.textColor}
        set {uiLabel.textColor = newValue}
    }
    @IBInspectable var image:UIImage?{
        get {return uiImage.image}
        set {uiImage.image = newValue}
    }
    @IBInspectable var imageTintColor: UIColor!{
        get {return uiImage.tintColor}
        set {uiImage.tintColor = newValue}
    }
    @IBInspectable override var backgroundColor: UIColor? {
        get {return uiContentView.backgroundColor}
        set {self.uiContentView.backgroundColor = newValue}
    }
    @IBInspectable var cornerRadius:CGFloat{
        get {return layer.cornerRadius}
        set {layer.cornerRadius = newValue}
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor: UIColor? = .clear{
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    override var isEnabled: Bool{
        willSet{
            if newValue == true{
                self.uiContentView.backgroundColor = .tintColor
                self.layer.opacity = 1
                
            }else{
                self.uiContentView.backgroundColor = .darkGray
                self.layer.opacity = 0.5
            }
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.onPressed()
        
        
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.onFinishPressed()
    }
    
    private func onPressed(){
        self.layer.opacity = 0.4
    }
    private func onFinishPressed(){
        self.layer.opacity = 1
    }
    private func animateArrowImage(){
        DispatchQueue.global(qos: .userInteractive).async { [weak self] in
            guard let self = self else {return}
                self.translate(withPoint: CGPoint(x: 20, y: 0))
        }
    }
    private func translate(withPoint point:CGPoint){
        DispatchQueue.main.async {
            UIView.animate(withDuration: 1, delay: 0.1) { [weak self] in
                guard let self = self else {return}
                self.uiImage.transform = CGAffineTransform(translationX: point.x, y: point.y)
            }completion: { _ in
                self.translate(withPoint: CGPoint(x: point.x * -1, y: point.y))
            }
        }
    }
}

