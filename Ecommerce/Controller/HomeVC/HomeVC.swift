//
//  ViewController.swift
//  Ecommerce
//
//  Created by Константин Козлов on 31.08.2022.
//

import UIKit
import SnapKit
import Alamofire
import Kingfisher


class HomeVC: UIViewController{
    
    private var hotSales: HotSales!
    private var bestSeller: BestSeller!
    private let stringUrl = Configs.App.homeVCApi
    private let networkingApi: NetworkingService!
    private var countOfCellBestSellerCollection: Int!
    
    
    
    init(networkingApi: NetworkingService = NetworkingAPI()) {
        self.networkingApi = networkingApi
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(taped))
        self.view.addGestureRecognizer(tapGesture)
        self.bestSellerCollection.register(BestSellerCollectionViewCell.self, forCellWithReuseIdentifier: "collectionCell")
        self.bestSellerCollection.delegate = self
        self.bestSellerCollection.dataSource = self
        searchContainerView.search.delegate = self
        
        view.backgroundColor = .white
        
        getData()
        setupMainScrollVeiw()
    }
    
    @objc func taped(){
        self.view.endEditing(true)
    }
    
    
    //MARK: createUI
    
    private lazy var mainScrollVeiw: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var topView: TopView = {
        let view = TopView()
        return view
    }()
    
    private lazy var selectCategoryScroll: CategoryScroll = {
        let scroll = CategoryScroll()
        scroll.showsHorizontalScrollIndicator = false
        return scroll
    }()
    
    private lazy var searchContainerView: SearchContainerView = {
        let view = SearchContainerView()
        return view
    }()
    
    private lazy var hotSalesLabelsView: BlockHeaderView = {
        let view = BlockHeaderView(leftLabelText: "Hot sales", rightLabelText: "see more")
        return view
    }()
    
    private lazy var bestSellerCollection: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        return collection
    }()
    
    private lazy var hotSalesСarousel: BannersView = {
        let view = BannersView(hotSales: hotSales)
        return view
    }()
    
    private lazy var bestSellerLabelsView: BlockHeaderView = {
        let view = BlockHeaderView(leftLabelText: "Best Seller", rightLabelText: "see more")
        return view
    }()
    
    //MARK: getData
    func getData(){
        networkingApi.getHotSalesCategory(url: stringUrl, completion: { [weak self]
            sales in
            guard let self = self else {return}
            
            self.hotSales = sales
            DispatchQueue.main.async {
                self.setupHotSalesСarousel()
            }
        })
        
        networkingApi.getBestSellerCategory(url: stringUrl) { [weak self]
            sellers in
            guard let self = self else {return}
            
            self.bestSeller = sellers
            DispatchQueue.main.async {
                self.setupBestSellerCollection(bestSel: self.bestSeller)
            }
        }
    }
    
    
    //MARK: setupUI
    private func setupSearchBlock(){
        
        contentView.addSubview(searchContainerView)
        
        searchContainerView.snp.makeConstraints { make in
            make.left.equalTo(contentView).offset(30)
            make.right.equalTo(contentView).offset(-30)
            make.top.equalTo(selectCategoryScroll.snp.bottom)
            make.height.equalTo(50)
        }
        setupHotSalesLabelsView()
    }
    
    
    private func setupBestSellerLabelsView(){
        
        contentView.addSubview(bestSellerLabelsView)
        
        bestSellerLabelsView.snp.makeConstraints { make in
            make.left.equalTo(contentView.snp.left).offset(10)
            make.right.equalTo(contentView.snp.right).offset(-10)
            make.top.equalTo(hotSalesLabelsView.snp.bottom).offset(180)
            make.height.equalTo(34)
        }
    }
    
    
    private func setupHotSalesLabelsView(){
        contentView.addSubview(hotSalesLabelsView)
        
        hotSalesLabelsView.snp.makeConstraints { make in
            make.left.equalTo(contentView.snp.left).offset(10)
            make.right.equalTo(contentView.snp.right).offset(-10)
            make.top.equalTo(searchContainerView.snp.bottom).offset(10)
            make.height.equalTo(34)
        }
        setupBestSellerLabelsView()
    }
    
    
    private func setupHotSalesСarousel(){
        contentView.addSubview(hotSalesСarousel)
        
        hotSalesСarousel.snp.makeConstraints { make in
            make.top.equalTo(hotSalesLabelsView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(170)
        }
    }
    
    private func setupBestSellerCollection(bestSel: BestSeller){
        var height = 0
        guard let countCell = bestSel.bestSeller?.count else {return}
        
        if countCell <= 2 {
            height =  227 + 20
        }
        if countCell % 2 == 0 {
            height = (227 + 35) * countCell / 2
        }else{
            height = ((227 + 35) * countCell / 2) + 1
        }
        
        contentView.addSubview(bestSellerCollection)
        
        bestSellerCollection.snp.makeConstraints { make in
            make.right.left.equalToSuperview()
            make.top.equalTo(bestSellerLabelsView.snp.bottom).offset(10)
            make.bottom.equalTo(contentView.snp.bottom).offset(30)
            make.height.equalTo(height)
        }
    }
    
    
    private func setupSelectCategoryScroll(){
        contentView.addSubview(selectCategoryScroll)
        
        selectCategoryScroll.snp.makeConstraints { make in
            make.left.right.equalTo(contentView)
            make.top.equalTo(topView.snp.bottom).offset(0)
            make.height.equalTo(150)
        }
        setupSearchBlock()
    }
    
    
    private func setupMainScrollVeiw(){
        view.addSubview(mainScrollVeiw)
        
        mainScrollVeiw.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-100)
        }
        setupContentView()
    }
    
    
    private func setupContentView(){
        mainScrollVeiw.addSubview(contentView)
        
        contentView.snp.makeConstraints { make in
            make.top.equalTo(self.mainScrollVeiw)
            make.bottom.equalTo(self.mainScrollVeiw)
            make.left.right.equalTo(self.view)
            make.width.equalTo(self.mainScrollVeiw)
            //   make.height.equalTo( 1050)
        }
        setUpTopView()
    }
    
    
    private func setUpTopView(){
  
        contentView.addSubview(topView)
        topView.filterButton.addTarget(self, action: #selector(showMiracle), for: .touchUpInside)
        
        topView.snp.makeConstraints { make in
            make.right.equalTo(contentView).offset(-10)
            make.left.equalTo(contentView).offset(10)
            make.top.equalTo(contentView)
            make.height.equalTo(80)
        }
        setupSelectCategoryScroll()
    }
    
    @objc func showMiracle() {
        let slideVC = OverlayView()
        slideVC.view.backgroundColor = .white
        slideVC.modalPresentationStyle = .custom
        slideVC.transitioningDelegate = self
      self.present(slideVC, animated: true, completion: nil)
 }

}




//MARK: extensions
extension HomeVC: UICollectionViewDelegate{
    
}

extension HomeVC: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let count = bestSeller.bestSeller else {return 1}
        return count.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let dataArray = bestSeller.bestSeller else {return UICollectionViewCell()}
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as? BestSellerCollectionViewCell else {return UICollectionViewCell()}
        cell.setupData(model: dataArray[indexPath.row])
        
        
        return cell
    }
}

extension HomeVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: contentView.frame.width / 2 - 27, height: 227)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 17, bottom: 10, right: 17)
    }
}

extension HomeVC: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
    }
}

extension HomeVC: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        PresentationController(presentedViewController: presented, presenting: presenting)
    }
}


