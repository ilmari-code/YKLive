
//
//  SearchViewController.swift
//  YKLive
//
//  Created by Mr_Jia on 2017/11/16.
//  Copyright © 2017年 Mr_Jia. All rights reserved.
//

import UIKit
import Alamofire
import MJRefresh
import WebKit
class SearchViewController: UIViewController{

    var list:[NewsModel] = []
  
    lazy var newsTableView:UITableView = {
         let newsTableView = UITableView(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight - kNavHeight), style: .plain)
        return newsTableView
    }()
    var localArray:[NewsModel] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "科技"
        getData()
        newsTableView.dataSource = self
        newsTableView.delegate   = self
        newsTableView.register(NewsCell.self, forCellReuseIdentifier: "identify")
        newsTableView.mj_header = MJRefreshNormalHeader.init(refreshingBlock: {
            self.newsTableView.mj_header.beginRefreshing()
            self.getData()
        })
        self.view.addSubview(newsTableView)
        
        
    }
    @objc func getData() {
        let stringUrl = "http://is.snssdk.com/api/news/feed/v51/?category=news_tech&refer=1&count=20&min_behot_time=1491981025&last_refresh_sub_entrance_interval=1491981165&loc_mode=&loc_time=1491981000&latitude=&longitude=&city=&tt_from=pull&lac=&cid=&cp=&iid=0123456789&device_id=12345678952&ac=wifi&channel=&aid=&app_name=&version_code=&version_name=&device_platform=&ab_version=&ab_client=&ab_group=&ab_feature=&abflag=3&ssmix=a&device_type=&device_brand=&language=zh&os_api=&os_version=&openudid=1b8d5bf69dc4a561&manifest_version_code=&resolution=&dpi=&update_version_code=&_rticket="
        
        Alamofire.request(URL.init(string: stringUrl)!).responseJSON { (response) in
            guard let JSON = response.result.value as? NSDictionary else { return }
            
            let lives = RootClass(fromDictionary: JSON as! [String : Any]).data!
            self.list = lives.map({ (live) -> NewsModel in
                let jsonData = live.content.data(using: .utf8)
                let decoder = JSONDecoder()
                let content = try! decoder.decode(Content.self, from: jsonData!)
               return NewsModel(abstract:  content.abstract, title: content.title, shareUrl: content.share_url)
                
            })
            
            OperationQueue.main.addOperation({
                self.localArray.insert(contentsOf: self.list, at: 0)
                self.newsTableView.mj_header.endRefreshing()
                self.newsTableView.reloadData()
            })
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension SearchViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return self.localArray.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "identify", for: indexPath) as! NewsCell
        cell.textLabel?.text = self.localArray[indexPath.row].title
        cell.detailTextLabel?.text = self.localArray[indexPath.row].abstract
        cell.selectionStyle = .none
        return cell
    }
}
extension SearchViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contentViewController = ContentViewController()
        contentViewController.shareUrl = self.localArray[indexPath.row].shareUrl
        contentViewController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(contentViewController, animated: true)
    }
}
class NewsCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
class ContentViewController: UIViewController {
    
    /// 创建WKWebView
    lazy var contentWebView:WKWebView = {
        let config = WKWebViewConfiguration()
        let contentWebView = WKWebView(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight - kNavHeight), configuration: config)
        contentWebView.navigationDelegate = self
        contentWebView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
        return contentWebView
    }()
    
    /// 创建进度条
    lazy var progressView:UIProgressView = {
        let progressView = UIProgressView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 0))
        progressView.tintColor = .orange
        self.view.addSubview(progressView)
        return progressView
    }()
    var shareUrl = ""
    enum OperationError : Error {
        case ErrorOne
        case ErrorTwo
        case ErrorThree(String)
        case ErrorOther
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setSubViews()
    }
    fileprivate func setSubViews (){
        self.view.addSubview(contentWebView)
//        var cachesPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0];
//        cachesPath =  cachesPath + "/cachesPath/\(shareUrl).html"
//        var htmlString = ""
//        htmlString =  try! String(contentsOf:URL.init(string: shareUrl)! , encoding: .utf8)
//        if FileManager.default.fileExists(atPath: cachesPath) {
//            contentWebView.loadFileURL(URL.init(fileURLWithPath: cachesPath), allowingReadAccessTo: URL.init(fileURLWithPath: cachesPath))
//            try! htmlString.write(to: URL(fileURLWithPath: cachesPath), atomically: true, encoding: .utf8)
//        }else{
//            contentWebView.load(URLRequest(url: URL(string: shareUrl)!))
//        }
        contentWebView.load(URLRequest(url: URL(string: shareUrl)!))

        
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {

        if  keyPath == "estimatedProgress" {
            let newporgress:Float = change?[NSKeyValueChangeKey.newKey] as! Float
            if newporgress == 1{
                self.progressView.setProgress(newporgress, animated: true)
                self.progressView.isHidden = true
            }else{
                self.progressView.setProgress(newporgress, animated: true)
                self.progressView.isHidden = false
            }
            
        }
    }
    deinit {
        contentWebView.removeObserver(self, forKeyPath: "estimatedProgress")
    }
}
extension ContentViewController : WKNavigationDelegate{
 
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if (webView.url?.absoluteString.hasPrefix("https://itunes.apple.com"))! {
            UIApplication.shared.canOpenURL(navigationAction.request.url!)
            decisionHandler(.cancel)
        }else{
            decisionHandler(.allow)
        }
    }
}
