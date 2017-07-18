//
//  StoreMenuListCell.swift
//  Foodle
//
//  Created by devcraft50 on 06/07/2017.
//  Copyright © 2017 devcraft50. All rights reserved.
//
//  메뉴 리스트 보여주기
//
//
import UIKit
import LBTAComponents

class StoreMenuListCell: DatasourceCell, UITableViewDelegate, UITableViewDataSource, ExpandableHeaderViewDelegate {
    
    let categoryCellId = "categoryCellId"
    let menuCellId = "menuCellId"
    let subMenuCellId = "subMenuCellId"
    let subTotalCellId = "subTotalCellId"
    
    var storeMenus: [Menu] = []
    var categoryAddedStoreMenus: NSMutableArray = [] // Category를 String으로 저장하기 위해 NSMutableArray로 생성
    
    private var storeMenuTableView: UITableView!
    
    override func setupViews() {
        super.setupViews()
        
        storeMenus = (myStore?.menus)!
        categoryAddedStoreMenus = Service.sharedInstance.arrangeStoreMenu(storeMenus) // Category 데이터 정리
        
        for menu in categoryAddedStoreMenus {
            if menu is String {
                print(menu)
            } else if menu is Menu {
                let tempMenu = menu as! Menu
                print("\(tempMenu.menuCategory) : \(tempMenu.menuName)")
            }
        }
        
        storeMenuTableView = UITableView()
        storeMenuTableView.register(StoreMenuCategoryCell.self, forHeaderFooterViewReuseIdentifier: categoryCellId)
        storeMenuTableView.register(StoreMenuCell.self, forHeaderFooterViewReuseIdentifier: menuCellId)
        storeMenuTableView.register(StoreMenuSubCell.self, forCellReuseIdentifier: subMenuCellId)
        //storeMenuTableView.register(StoreMenuSubTotalCell.self, forCellReuseIdentifier: subTotalCellId)
        storeMenuTableView.dataSource = self
        storeMenuTableView.delegate = self 
        
        addSubview(storeMenuTableView)
        storeMenuTableView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: frame.width, heightConstant: 500)
    }
    
    // 전체 row 갯수
    func numberOfSections(in tableView: UITableView) -> Int {
        return categoryAddedStoreMenus.count
    }
 
    // 메뉴별 서브 메뉴 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let menu = categoryAddedStoreMenus[section]
        
        if menu is String {
            return 0
        } else if menu is Menu {
            let tempMenu = menu as! Menu
            return tempMenu.subMenus.count // + 1 // 주문 Cell 갯수 한개 더하기
        } else {
            return 0
        }
    }
    
    // Category, 메뉴 클래스 매핑
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var viewId: String!
        let menu = categoryAddedStoreMenus[section]
        
        if menu is String {
            viewId = categoryCellId
        } else if menu is Menu {
            viewId = menuCellId
        }
        
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: viewId)
        
        if menu is String {
            let view = headerView as! StoreMenuCategoryCell
            view.categoryLabel.text = (menu as! String)
        } else if menu is Menu {
            let m = menu as! Menu
            let view = headerView as! StoreMenuCell
            view.menuNameLabel.text = m.menuName
            view.priceLabel.text = "\(m.menuPrice)원"
        }
        
        return headerView
    }
    
    // 서브메뉴 클래스 매핑
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: subMenuCellId, for: indexPath as IndexPath) as? StoreMenuSubCell
        
        return cell!
    }
    
    // Cell 클릭시
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        print("Value: \(storeMenus[indexPath.row].menuName)")
    }
    
    // section row별 height
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let menu = categoryAddedStoreMenus[section]
        
        if menu is String {
            return 23 // 카테고리 높이
        } else if menu is Menu {
            return 40 // 메뉴 높이
        } else {
            return 0
        }
    }
    
    // 서브 메뉴 높이
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       /* if datas[indexPath.section].expanded {
            return 44
        } else {
            return 0
        }
         */
        
        return 25
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    
    func toggleSection(header: StoreMenuCell, section: Int) {
/*
        datas[section].expanded = !datas[section].expanded
        tableView.beginUpdates()
        tableView.reloadSections([section], with: .automatic)
        tableView.endUpdates()
*/
    }
    
}




////////////////////////////////////////////////////////////////////// Cell //////////////////////////////////////////////////////////////////////////////////////////


// 카테고리 Cell
class StoreMenuCategoryCell: UITableViewHeaderFooterView {
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "메뉴 카테고리가 여기 나옵니다"
        label.font = UIFont.systemFont(ofSize: 11)
        label.textColor = UIColor(rgb:0xCC4a4a4a)
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = UIColor(rgb:0xeeeeee)
        
        addSubview(categoryLabel)
        
        categoryLabel.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 6, leftConstant: 15, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

protocol ExpandableHeaderViewDelegate {
    func toggleSection(header: StoreMenuCell, section: Int)
}

// 메뉴 Cell
class StoreMenuCell:  UITableViewHeaderFooterView {
    
    var delegate: ExpandableHeaderViewDelegate?
    var section: Int!
    
    // 회색 Bar
    let barView: UIView = {
        let bar = UIView()
        bar.backgroundColor = ColorRes.colorGrayBar
        return bar
    }()
    
    let menuNameLabel: UILabel = {
        let label = UILabel()
        label.text = "메뉴명"
        label.font = UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "원래가격"
        label.font = UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    
    let discountPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "할인가격"
        label.font = UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectHeaderView)))
        
        contentView.backgroundColor = .white
        
        addSubview(barView)
        addSubview(menuNameLabel)
        addSubview(priceLabel)
        
        barView.anchor(topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: frame.width, heightConstant: 0.5)
        menuNameLabel.anchor(topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 13, leftConstant: 15, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        priceLabel.anchor(topAnchor, left: nil, bottom: nil, right: rightAnchor, topConstant: 13, leftConstant: 0, bottomConstant: 0, rightConstant: 15, widthConstant: 0, heightConstant: 0)
    }
    
    
    func selectHeaderView(gesture: UITapGestureRecognizer) {
        let cell = gesture.view as! StoreMenuCell
        delegate?.toggleSection(header: self, section: cell.section)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectHeaderView)))
    }
    
}

// 서브 메뉴 Cell
class StoreMenuSubCell: UITableViewCell {
    
    let subLabel: UILabel = {
        let label = UILabel()
        label.text = "서브 메뉴"
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = ColorRes.colorWhite
        
        addSubview(subLabel)
        
        subLabel.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 5, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


// 메뉴 수량 및 주문용 Cell
class StoreMenuSubTotalCell : UITableViewCell {
    
    // 회색 Bar
    let barView: UIView = {
        let bar = UIView()
        bar.backgroundColor = ColorRes.colorGrayBar
        return bar
    }()

    // 수량 빼기
    let minusButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "ico_minus").withRenderingMode(.alwaysOriginal), for: .normal)
        //button.frame = CGRect(x: 0, y: 0, width: 23, height: 23)
        return button
    }()
    
    // 수량 더하기
    let plusButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "ico_minus").withRenderingMode(.alwaysOriginal), for: .normal)
        //button.frame = CGRect(x: 0, y: 0, width: 23, height: 23)
        return button
    }()
    
    // 주문 수량
    let countLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "1"
        return label
    }()
    
    // 총 가격
    let totalPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = ColorRes.colorDarkRed
        return label
    }()

    // 담기 버튼
    let addButton: UIButton = {
        let button = UIButton()
        button.setTitle("담기", for: .normal)
        button.setTitleColor(ColorRes.colorBlack, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.layer.borderColor = ColorRes.colorGray.cgColor
        button.layer.cornerRadius = 20
        return button
    }()
    
    // 바로주문 버튼
    let orderButton: UIButton = {
        let button = UIButton()
        button.setTitle("바로주문", for: .normal)
        button.setTitleColor(ColorRes.colorYamiGreen, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.layer.borderColor = ColorRes.colorDeepYamiGreen.cgColor
        button.layer.cornerRadius = 20
        return button
    }()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = ColorRes.colorWhite
        
        addSubview(barView)
        addSubview(minusButton)
        addSubview(plusButton)
        addSubview(countLabel)
        addSubview(totalPriceLabel)
        addSubview(addButton)
        addSubview(orderButton)
        
        barView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 1)
        minusButton.anchor(barView.bottomAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        countLabel.anchor(barView.bottomAnchor, left: minusButton.rightAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        plusButton.anchor(barView.bottomAnchor, left: countLabel.rightAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        totalPriceLabel.anchor(barView.bottomAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        addButton.anchor(nil, left: self.leftAnchor, bottom: self.bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 10, rightConstant: 0, widthConstant: frame.width-5, heightConstant: 20)
        orderButton.anchor(nil, left: nil, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 10, rightConstant: 0, widthConstant: frame.width-5, heightConstant: 20)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}

