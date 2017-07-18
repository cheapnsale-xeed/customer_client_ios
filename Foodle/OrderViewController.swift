//
//  OrderViewController.swift
//  Foodle
//
//  Created by devcraft12 on 7/11/17.
//  Copyright © 2017 devcraft50. All rights reserved.
//

import UIKit
import TRON
import SwiftyJSON
import LBTAComponents
import DLRadioButton

class OrderViewController: UIViewController {

    var scrollView: UIScrollView!
    let basicURL = TRON(baseURL: "https://cv47nyx5yl.execute-api.ap-northeast-1.amazonaws.com/prod")
    
    let pickupTimeRadioView: UIView = {
        
        let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 135)
        let pickupView = UIView(frame: frame)
        pickupView.backgroundColor = .white
        
        let titleLabel = UILabel()
        titleLabel.text = "픽업시간"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 14)
        
        let averWaitTimeLabel = UILabel()
        averWaitTimeLabel.text = "메뉴제작 평균시간 : "
        averWaitTimeLabel.font = UIFont.systemFont(ofSize: 12)
        averWaitTimeLabel.textColor = ColorRes.colorDisabledBlack
        
        var radioButton = DLRadioButton(frame: CGRect(x: 0, y: 0, width: pickupView.frame.width, height: 20))
        radioButton.titleLabel!.font = UIFont.boldSystemFont(ofSize: 14)
        radioButton.setTitle("지금 주문", for: .normal)
        radioButton.setTitleColor(ColorRes.colorYamiGreen, for: UIControlState())
        radioButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        radioButton.animationDuration = 0
        radioButton.iconColor = ColorRes.colorYamiGreen
        radioButton.indicatorColor = ColorRes.colorYamiGreen
        radioButton.addTarget(self, action: #selector(pickupTimeClick), for: UIControlEvents.touchUpInside)
        radioButton.isSelected = true
        
        
        var radioButton2 = DLRadioButton(frame: CGRect(x: 0, y: 0, width: pickupView.frame.width, height: 20))
        radioButton2.titleLabel!.font = UIFont.systemFont(ofSize: 14)
        radioButton2.setTitleColor(UIColor.black, for: UIControlState())
        radioButton2.setTitle("당일 예약 주문", for: UIControlState())
        radioButton2.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        radioButton2.animationDuration = 0
        radioButton2.iconColor = .black
        radioButton2.indicatorColor = .black
        radioButton2.addTarget(self, action: #selector(pickupTimeClick), for: UIControlEvents.touchUpInside)
        
        radioButton.otherButtons = [radioButton2]
        
        let descLabel = UILabel()
        descLabel.text = "접수가 완료되면, 매장에서 바로 메뉴제작을 시작합니다.\n메뉴제작 평균시간을 고려하여, 매장에 방문해 주세요."
        descLabel.font = UIFont.systemFont(ofSize: 12)
        descLabel.numberOfLines = 2
        
        pickupView.addSubview(titleLabel)
        pickupView.addSubview(averWaitTimeLabel)
        pickupView.addSubview(radioButton)
        pickupView.addSubview(descLabel)
        pickupView.addSubview(radioButton2)
        
        titleLabel.anchor(pickupView.topAnchor, left: pickupView.leftAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 17, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        averWaitTimeLabel.anchor(pickupView.topAnchor, left: nil, bottom: nil, right: pickupView.rightAnchor, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 10, widthConstant: 0, heightConstant: 0)
        radioButton.anchor(titleLabel.bottomAnchor, left: titleLabel.leftAnchor, bottom: nil, right: nil, topConstant: 15, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 80, heightConstant: 0)
        descLabel.anchor(radioButton.bottomAnchor, left: radioButton.leftAnchor, bottom: nil, right: nil, topConstant: 5, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        radioButton2.anchor(descLabel.bottomAnchor, left: titleLabel.leftAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 110, heightConstant: 0)
        
        return pickupView
    }()
    
    func pickupTimeClick(sender: DLRadioButton) {
        if sender.isSelected {
            sender.iconColor = ColorRes.colorYamiGreen
            sender.indicatorColor = ColorRes.colorYamiGreen
            sender.titleLabel!.font = UIFont.boldSystemFont(ofSize: 14)
            sender.setTitleColor(ColorRes.colorYamiGreen, for: UIControlState())
            
            for otherRadioButton in sender.otherButtons {
                otherRadioButton.iconColor = .black
                otherRadioButton.indicatorColor = .black
                otherRadioButton.titleLabel!.font = UIFont.systemFont(ofSize: 14)
                otherRadioButton.setTitleColor(.black, for: UIControlState())
            }
        }
    }
    
    let userInfoView: UIView = {
        let frame = CGRect(x: 0, y: 137, width: UIScreen.main.bounds.width, height: 90)
        let infoView = UIView(frame: frame)
        infoView.backgroundColor = .white
        
        let titleLabel = UILabel()
        titleLabel.text = "주문자 정보"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 14)
        
        var nameTextField = UITextField()
        nameTextField.placeholder = "your name here"
        nameTextField.font = UIFont.systemFont(ofSize: 12)
        nameTextField.borderStyle = UITextBorderStyle.roundedRect
        nameTextField.keyboardType = UIKeyboardType.default
        nameTextField.returnKeyType = UIReturnKeyType.done
        
        var phoneNumberTextField = UITextField()
        phoneNumberTextField.placeholder = "your phone number here"
        phoneNumberTextField.font = UIFont.systemFont(ofSize: 12)
        phoneNumberTextField.borderStyle = UITextBorderStyle.roundedRect
        phoneNumberTextField.keyboardType = UIKeyboardType.numberPad
        phoneNumberTextField.returnKeyType = UIReturnKeyType.done
        
        
        infoView.addSubview(titleLabel)
        infoView.addSubview(nameTextField)
        infoView.addSubview(phoneNumberTextField)
        
        titleLabel.anchor(infoView.topAnchor, left: infoView.leftAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 17, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        nameTextField.anchor(titleLabel.bottomAnchor, left: infoView.leftAnchor, bottom: nil, right: nil, topConstant: 15, leftConstant: 17, bottomConstant: 0, rightConstant: 0, widthConstant: UIScreen.main.bounds.width / 2 - 22, heightConstant: 0)
        phoneNumberTextField.anchor(titleLabel.bottomAnchor, left: nameTextField.rightAnchor, bottom: nil, right: nil, topConstant: 15, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: UIScreen.main.bounds.width / 2 - 22, heightConstant: 0)
        
        return infoView
        
    }()
    
    let paymentTypeRadioView: UIView = {
        let frame = CGRect(x: 0, y: 229, width: UIScreen.main.bounds.width, height: 80)
        let paymentView = UIView(frame: frame)
        paymentView.backgroundColor = UIColor.white
        
        let titleLabel = UILabel()
        titleLabel.text = "결제 방법"
        titleLabel.font = .boldSystemFont(ofSize: 14)
        
        var radioButton = DLRadioButton(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
        radioButton.titleLabel!.font = UIFont.boldSystemFont(ofSize: 14)
        radioButton.setTitle("신용카드", for: .normal)
        radioButton.setTitleColor(ColorRes.colorYamiGreen, for: UIControlState())
        radioButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        radioButton.animationDuration = 0
        radioButton.iconColor = ColorRes.colorYamiGreen
        radioButton.indicatorColor = ColorRes.colorYamiGreen
        radioButton.addTarget(self, action: #selector(pickupTimeClick), for: UIControlEvents.touchUpInside)
        radioButton.isSelected = true
        
        var radioButton2 = DLRadioButton(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
        radioButton2.titleLabel!.font = UIFont.systemFont(ofSize: 14)
        radioButton2.setTitleColor(UIColor.black, for: UIControlState())
        radioButton2.setTitle("휴대폰", for: UIControlState())
        radioButton2.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        radioButton2.animationDuration = 0
        radioButton2.iconColor = .black
        radioButton2.indicatorColor = .black
        radioButton2.addTarget(self, action: #selector(pickupTimeClick), for: UIControlEvents.touchUpInside)

        var radioButton3 = DLRadioButton(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
        radioButton3.titleLabel!.font = UIFont.systemFont(ofSize: 14)
        radioButton3.setTitleColor(UIColor.black, for: UIControlState())
        radioButton3.setTitle("Toss", for: UIControlState())
        radioButton3.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        radioButton3.animationDuration = 0
        radioButton3.iconColor = .black
        radioButton3.indicatorColor = .black
        radioButton3.addTarget(self, action: #selector(pickupTimeClick), for: UIControlEvents.touchUpInside)
        
        radioButton.otherButtons = [radioButton2, radioButton3]
        
        paymentView.addSubview(titleLabel)
        paymentView.addSubview(radioButton)
        paymentView.addSubview(radioButton2)
        paymentView.addSubview(radioButton3)

        titleLabel.anchor(paymentView.topAnchor, left: paymentView.leftAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 17, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        radioButton.anchor(titleLabel.bottomAnchor, left: paymentView.leftAnchor, bottom: nil, right: nil, topConstant: 15, leftConstant: 17, bottomConstant: 0, rightConstant: 0, widthConstant: UIScreen.main.bounds.width / 3, heightConstant: 0)
        radioButton2.anchor(titleLabel.bottomAnchor, left: radioButton.rightAnchor, bottom: nil, right: nil, topConstant: 15, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: UIScreen.main.bounds.width / 3, heightConstant: 0)
        radioButton3.anchor(titleLabel.bottomAnchor, left: radioButton2.rightAnchor, bottom: nil, right: nil, topConstant: 15, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: UIScreen.main.bounds.width / 3, heightConstant: 0)
        
        return paymentView
    }()
    
    let orderDetailView: UITableView = {
        let frame = CGRect(x: 0, y: 291, width: UIScreen.main.bounds.width, height: 80)
        let detailView = UITableView(frame: frame)
        detailView.backgroundColor = UIColor.white
        
        
        
        return detailView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.hidesBarsOnSwipe = false
        
        self.scrollView = UIScrollView(frame: view.bounds)
        self.scrollView.backgroundColor = ColorRes.colorGrayBar
        self.scrollView.contentSize = CGSize(width: view.frame.width, height: 1000)
        self.scrollView.autoresizingMask = UIViewAutoresizing.flexibleHeight
        
        
        scrollView.addSubview(pickupTimeRadioView)
        scrollView.addSubview(userInfoView)
        scrollView.addSubview(paymentTypeRadioView)

//        pickupTimeRadioView.anchor(scrollView.topAnchor, left: scrollView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: view.frame.width, heightConstant: 170)
//        userInfoView.anchor(pickupTimeRadioView.bottomAnchor, left: pickupTimeRadioView.leftAnchor, bottom: nil, right: nil, topConstant: 5, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        view.addSubview(scrollView)
        
    }
}
