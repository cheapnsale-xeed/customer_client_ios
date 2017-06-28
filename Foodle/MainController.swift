//
//  ViewController.swift
//  Foodle
//
//  Created by devcraft50 on 02/06/2017.
//  Copyright © 2017 devcraft50. All rights reserved.
//
//  Store 리스트 - 메인화면
//

import LBTAComponents
import TRON
import SwiftyJSON

let apiGatewayUrl = "https://cv47nyx5yl.execute-api.ap-northeast-1.amazonaws.com/prod/"

class MainController: DatasourceController {
    
    final let urlString = apiGatewayUrl + "stores"
    
    /*
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
    }
 */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBarItems()
        
        Service.sharedInstance.fetchMainFeed{ (mainDatasource, err) in
            if let err = err {
                //self.errorMessageLabel.isHidden = false
                
                if let apiError = err as? APIError<Service.JSONError> {
                    if apiError.response?.statusCode != 200 {
                        //self.errorMessageLabel.text = "Status code was not 200"
                    }
                }
                
                return
            }
            
            self.datasource = mainDatasource
        }

    }
    
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 175)
    }
   
    // Header 셋팅
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 190)
    }
    
    
    
    func setupNavigationBarItems() {
        setupRemainingNavItems()
        setupLeftNavItem()
        setupRightNavItems()
    }
    
    private func setupRemainingNavItems() {
        
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        
        // 헤더와 메인 화면 사이의 바를 없애줌
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        // 회색바를 헤더 밑에 생성
        let navBarSeparatorView = UIView()
        navBarSeparatorView.backgroundColor = ColorRes.colorGrayBar
        view.addSubview(navBarSeparatorView)
        navBarSeparatorView.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)
    }
    
    private func setupLeftNavItem() {
        let hambugerButton = UIButton(type: .system)
        hambugerButton.setImage(#imageLiteral(resourceName: "ico_list").withRenderingMode(.alwaysOriginal), for: .normal)
        hambugerButton.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: hambugerButton)
    }
    
    private func setupRightNavItems() {
        let mapButton = UIButton(type: .system)
        mapButton.setImage(#imageLiteral(resourceName: "ico_map").withRenderingMode(.alwaysOriginal), for: .normal)
        mapButton.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: mapButton)]
    }

    
    
    
    
}

