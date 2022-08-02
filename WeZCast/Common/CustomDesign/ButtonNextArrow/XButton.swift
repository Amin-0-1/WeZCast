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
    
    @IBOutlet var uiTopView: UIView!
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
        addSubview(uiTopView)
        uiTopView.frame = self.bounds
        uiTopView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        uiLabel.textAlignment = .center
        
//        uiContentView.layer.shadowRadius = 1
//        uiContentView.layer.shadowColor = UIColor.green.cgColor
//        uiContentView.layer.shadowOffset = CGSize(width: 2, height: 2)
//        uiContentView.layer.shadowOpacity = 0.5
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
        get {return uiContentView?.backgroundColor}
        set {self.uiContentView?.backgroundColor = newValue}
    }
    @IBInspectable var cornerRadius:CGFloat{
        get {return uiContentView.layer.cornerRadius}
        set {uiContentView.layer.cornerRadius = newValue}
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            uiContentView.layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor: UIColor? = .clear{
        didSet {
            uiContentView.layer.borderColor = borderColor?.cgColor
        }
    }
    @IBInspectable var shadowColor:UIColor?{
        get {return UIColor(cgColor: uiContentView.layer.shadowColor ?? UIColor.clear.cgColor)}
        set {uiContentView.layer.shadowColor = newValue?.cgColor}
    }
    @IBInspectable var shadowRadius:CGFloat{
        get {return uiContentView.layer.shadowRadius}
        set {uiContentView.layer.shadowRadius = newValue}
    }
    @IBInspectable var shadowOffset:CGFloat{
        get {return uiContentView.layer.shadowOffset.height}
        set {uiContentView.layer.shadowOffset = CGSize(width: newValue, height: newValue)}
    }
    @IBInspectable var shadowOpacity:Float{
        get {return uiContentView.layer.shadowOpacity}
        set {self.uiContentView.layer.shadowOpacity = newValue}
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
        UIView.animate(withDuration: 0.5, delay: 0) {
            self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }
        self.layer.opacity = 0.4
    }
    private func onFinishPressed(){
        UIView.animate(withDuration: 0.5, delay: 0) {
            self.transform = .identity
        }
        self.layer.opacity = 1
    }
    private func animateArrowImage(){
        DispatchQueue.global(qos: .userInteractive).async { [weak self] in
            guard let self = self else {return}
                self.translate(withPoint: CGPoint(x: 15, y: 0))
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

