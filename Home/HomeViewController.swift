

//
//  HomeViewController.swift
//  YKLive
//
//  Created by Mr_Jia on 2017/11/16.
//  Copyright © 2017年 Mr_Jia. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher
import SkeletonView
import MJRefresh
class HomeViewController: UIViewController {

    let mainTableView = UITableView(frame: CGRect.init(x: 0, y: 0, width:kScreenWidth, height: kScreenHeight), style: .plain)
    var list:[YKModel] = []
    let header = MJRefreshNormalHeader()
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        //下拉刷新
        self.view.backgroundColor = .white;
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.register(YKCell.self, forCellReuseIdentifier: "cellId")
//        mainTableView.windless.start()
        mainTableView.separatorStyle = .none
        view.addSubview(mainTableView)
        mainTableView.mj_header = MJRefreshNormalHeader.init(refreshingBlock: {
            self.mainTableView.mj_header.beginRefreshing()

            self.getData()
        })
        getData()

    }
    
    @objc func getData() {
        Alamofire.request(URL.init(string: "http://116.211.167.106/api/live/aggregation?uid=133825214&interest=1")!).responseJSON { (response) in
            guard let JSON = response.result.value as? NSDictionary else { return }
            
            let lives = YKRootClass(fromDictionary: JSON as! [String : Any]).lives!
            self.list = lives.map({ (live) -> YKModel in
                YKModel(portrait: live.creator.portrait, addr: live.city, cover: live.creator.nick, viewers: live.onlineUsers, caster: "", url: live.streamAddr)
            })
            
            OperationQueue.main.addOperation({
               self.mainTableView.reloadData()
                self.mainTableView.mj_header.endRefreshing()
//                self.mainTableView.windless.end()
            })
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension HomeViewController: UITableViewDataSource {
//    func collectionSkeletonView(_ skeletonView: UITableView, cellIdenfierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
//        return "cellId"
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId") as! YKCell?
        cell?.nickLabel.text = self.list[indexPath.row].cover
        cell?.viewersLabel.text = "\(self.list[indexPath.row].viewers)" + "人在看"
        cell?.locationLabel.text = self.list[indexPath.row].addr
        cell?.headImageView.kf.setImage(with:URL.init(string: self.list[indexPath.row].portrait))
        cell?.bigImageView.kf.setImage(with: URL.init(string: self.list[indexPath.row].portrait))
        // --cell选中样式
        cell?.selectionStyle = .none
        return cell!
    }
}
extension HomeViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let liveViewCtrl = LiveViewController()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        liveViewCtrl.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(liveViewCtrl, animated: true)
        
        let model = self.list[indexPath.row]
        liveViewCtrl.live = model
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 600
    }
}
