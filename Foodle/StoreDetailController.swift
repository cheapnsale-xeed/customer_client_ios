//
//  StoreController.swift
//  Foodle
//
//  Created by devcraft50 on 26/06/2017.
//  Copyright © 2017 devcraft50. All rights reserved.
//  
//  Store 상세 화면
//

import LBTAComponents
import TRON
import SwiftyJSON

class StoreDetailController: UIViewController {
    
    var scrollView: UIScrollView!
    let basicURL = TRON(baseURL: "https://cv47nyx5yl.execute-api.ap-northeast-1.amazonaws.com/prod")
    var store: Store?
    var storeDetailDatasource: StoreDetailDatasource!
    
    let storeImageView : CachedImageView = {
        let imageView = CachedImageView()
        imageView.image = #imageLiteral(resourceName: "img_store_29")
        return imageView
    }()
    
    let storeNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    let foodleTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "푸들가능시간 : 07:00~10:00"
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    let addressLabel: UILabel = {
        let label = UILabel()
        //label.text = "안드로메다 옆 갤럭시 태양계 지구 대한민국 서울"
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    // 탭바 위에 회색 가로 Bar
    let crossBarView: UIView = {
        let bar = UIView()
        bar.backgroundColor = ColorRes.colorGrayBar
        return bar
    }()
    
    // 가게 메뉴와 가게정보를 보여주는 탭
    lazy var storeTabBar: StoreTabBar = {
        let tabBar = StoreTabBar()
        tabBar.storeDetailController = self
        return tabBar
    }()
    
    // 메뉴 리스트
    /*
    let menuTableView: StoreMenuListCell = {
        let tableView = StoreMenuListCell()
        return tableView
    }()
    */
 
    // 메뉴탭의 내용
    lazy var storeTabMenuDetailView: StoreTabMenuDetailView = {
        let detailView = StoreTabMenuDetailView()
        return detailView
    }()
    
    /*
    override func viewWillAppear(_ animated: Bool) {
        Service.sharedInstance.fetchStoreDetail(id: (store?.id)!).perform(withSuccess: { store in
     
        })
    }
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.hidesBarsOnSwipe = false
        
        self.scrollView = UIScrollView(frame: view.bounds)
        self.scrollView.backgroundColor = .white
        self.scrollView.contentSize = CGSize(width: view.frame.width, height: 1500)
        self.scrollView.autoresizingMask = UIViewAutoresizing.flexibleHeight
        
        storeTabMenuDetailView.tabBar = storeTabBar
        
        scrollView.addSubview(storeImageView)
        scrollView.addSubview(storeNameLabel)
        scrollView.addSubview(foodleTimeLabel)
        scrollView.addSubview(addressLabel)
        scrollView.addSubview(crossBarView)
        scrollView.addSubview(storeTabBar)
        view.addSubview(scrollView)
      
        storeImageView.anchor(scrollView.topAnchor, left: scrollView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: view.frame.width, heightConstant: 170)
        storeNameLabel.anchor(storeImageView.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: nil, topConstant: 22, leftConstant: 15, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        foodleTimeLabel.anchor(storeNameLabel.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: nil, topConstant: 8, leftConstant: 15, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        addressLabel.anchor(foodleTimeLabel.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: nil, topConstant: 8, leftConstant: 15, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        crossBarView.anchor(addressLabel.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: view.frame.width, heightConstant: 1.5)
        storeTabBar.anchor(crossBarView.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: view.frame.width, heightConstant: 28)
        
        
        // 가게 기본 정보 셋팅
        self.storeNameLabel.text = store?.name
        //self.foodleTimeLabel.text = ""  $$ 푸들 가능시간 뽑아서 셋팅 요망
        self.addressLabel.text = store?.address
        
        setupMenuList()
    }
    
    // 메뉴 리스트 셋팅
    func setupMenuList() {
        Service.sharedInstance.fetchStoreDetail(id: (store?.id)!).perform(withSuccess: { store in
            myStore = store
            self.setupMeuListView() // store 데이터가 시스템 변수(myStore)에 셋팅된 후에 뷰를 셋업한다
        })
    }
    
    func setupMeuListView() {
        scrollView.addSubview(storeTabMenuDetailView)
        storeTabMenuDetailView.anchor(storeTabBar.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: view.frame.width, heightConstant: 500)
    }
    
    
    // 탭메뉴 클릭 했을때 아래 내용이 자동 스크롤
    func scrollToMenuIndex(_ menuIndex: Int) {
        let indexPath = NSIndexPath(item: menuIndex, section: 0)
        storeTabMenuDetailView.collectionView.scrollToItem(at: indexPath as IndexPath, at: [], animated: true)
    }
    
    
} // END OF CLASS
