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
    var storeId:String = "shop016"
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
    
    var store: Store?
    
    override func viewWillAppear(_ animated: Bool) {
        Service.sharedInstance.fetchStoreDetail(id: storeId).perform(withSuccess: { store in
            self.storeNameLabel.text = store.name
            //self.foodleTimeLabel.text = ""  $$ 푸들 가능시간 뽑아서 셋팅 요망
            self.addressLabel.text = store.address
            
            // $$ 뷰가 로드되기 전에 Store 정보가 셋업되야 하는데 뷰가 로딩 후 Store가 셋업되다 보니 store 정보를 할당하지 못해서 하위 뷰에서 store를 참조시 nil 이 나오게 된다. 뷰 로드 전에 store 정보를 셋팅할 수 있게 변경이 필요함
            if store is Store {
                print("Yes Store")
            } else {
                print("No Store")
            }
            
            self.store = store
            let tempStore:Store = store
            myStore = tempStore
        })
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.hidesBarsOnSwipe = false
        
        print("Address : \(self.store?.address)")
        
        self.scrollView = UIScrollView(frame: view.bounds)
        self.scrollView.backgroundColor = .white
        self.scrollView.contentSize = CGSize(width: view.frame.width, height: 1000)
        self.scrollView.autoresizingMask = UIViewAutoresizing.flexibleHeight
        
        storeTabMenuDetailView.tabBar = storeTabBar
        
        scrollView.addSubview(storeImageView)
        scrollView.addSubview(storeNameLabel)
        scrollView.addSubview(foodleTimeLabel)
        scrollView.addSubview(addressLabel)
        scrollView.addSubview(crossBarView)
        scrollView.addSubview(storeTabBar)
        scrollView.addSubview(storeTabMenuDetailView)
        view.addSubview(scrollView)
      
        storeImageView.anchor(scrollView.topAnchor, left: scrollView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: view.frame.width, heightConstant: 170)
        storeNameLabel.anchor(storeImageView.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: nil, topConstant: 22, leftConstant: 15, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        foodleTimeLabel.anchor(storeNameLabel.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: nil, topConstant: 8, leftConstant: 15, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        addressLabel.anchor(foodleTimeLabel.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: nil, topConstant: 8, leftConstant: 15, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        crossBarView.anchor(addressLabel.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: view.frame.width, heightConstant: 1.5)
        storeTabBar.anchor(crossBarView.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: view.frame.width, heightConstant: 28)
        storeTabMenuDetailView.anchor(storeTabBar.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: view.frame.width, heightConstant: 300)
    }
    
    // 탭메뉴 클릭 했을때 아래 내용이 자동 스크롤
    func scrollToMenuIndex(_ menuIndex: Int) {
        let indexPath = NSIndexPath(item: menuIndex, section: 0)
        storeTabMenuDetailView.collectionView.scrollToItem(at: indexPath as IndexPath, at: [], animated: true)
    }
    
    
} // END OF CLASS
