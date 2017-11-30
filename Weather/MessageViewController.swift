
//
//  MessageViewController.swift
//  YKLive
//
//  Created by Mr_Jia on 2017/11/16.
//  Copyright © 2017年 Mr_Jia. All rights reserved.
//

import UIKit
import SkeletonView
import Windless
import Alamofire
class MessageViewController: UIViewController {

    var  weaLists:[WeatherModel]  = []
    let searchTextField = UITextField()
    let titleLabel = UILabel()
    let valueLabel = UILabel()
    var citys:[CityModel] = []
    var searchArray:[CityModel] = []

    let searchTableView = UITableView(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0), style: .plain)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getWeatherData()
        self.setSubViews()
        
    }
    func setSubViews() {
        self.view.addSubview(searchTextField)
        searchTextField.placeholder = "查询城市"
        searchTextField.delegate = self
        searchTextField.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(30)
        }
        searchTextField.keyboardType = .webSearch
        
        self.view.addSubview(titleLabel)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .red
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        titleLabel.snp.makeConstraints { (make) in
            make.left.right.equalTo(searchTextField)
            make.height.equalTo(50)
            make.top.equalTo(searchTextField.snp.bottom).offset(20)
        }
        self.view.addSubview(valueLabel)
        valueLabel.textAlignment = .center
        valueLabel.textColor = .orange
        valueLabel.font = UIFont.boldSystemFont(ofSize: 30)
        valueLabel.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.height.equalTo(50)
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
        }
    }
    func getWeatherData(){
        
//        NSString *mainBundleDirectory=[[NSBundle mainBundle] bundlePath];
//        NSString *path=[mainBundleDirectory stringByAppendingPathComponent:@"route_points_demo.json"];
//        NSURL *url=[NSURL fileURLWithPath:path];
//        NSData *data = [[NSData alloc] initWithContentsOfURL:url];
//        jsonStr=[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        var mainBundleDirectory = Bundle.main.bundlePath
        mainBundleDirectory.append("/City.json")
        let data = NSData.init(contentsOfFile: mainBundleDirectory)
        let jsonDic:NSDictionary = try! JSONSerialization.jsonObject(with: data as! Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
        let lives = WeaCitys(fromDictionary: jsonDic as! [String : Any]).cities!

        self.citys = lives.map { (live) -> CityModel in
            CityModel(city: live.city, cityid: live.cityid)
        }
        for cityModel in citys {
            if cityModel.cityid == "101240101" {
                print(cityModel.city)
            }
        }
        
        let urlString = "http://aider.meizu.com/app/weather/listWeather?cityIds=101240101"
        Alamofire.request(URL(string:urlString)!).responseJSON { (response) in
            guard let JSON = response.result.value as? NSDictionary else { return }
            
            let lives = WeaRootClass(fromDictionary: JSON as! [String : Any]).value!
            self.weaLists = lives.map({ (live) -> WeatherModel in
               
                WeatherModel(value: live.realtime.weather, unit: live.realtime.weather)
                
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
extension MessageViewController : UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        self.view.addSubview(searchTableView)
        searchTableView.register(UITableViewCell.self, forCellReuseIdentifier: "mingyue")
        searchTableView.delegate = self
        searchTableView.dataSource = self
        searchTableView.snp.makeConstraints({ (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(searchTextField.snp.bottom)
            make.height.equalTo(400)
        })
        if let string = textField.text {
            for model in self.citys {
                if model.city.contains(string)  {
                    searchArray.removeAll()
                    searchArray.append(model)
                    searchTableView.reloadData()
                }else{
//                    searchArray.removeLast()
//                    searchTableView.reloadData()
                    
                }

            }
        }
        
        return true
    }
}

extension MessageViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mingyue", for: indexPath)
        cell.textLabel?.text = searchArray[indexPath.row].city
        return cell
    }
}
extension MessageViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        searchTableView.removeFromSuperview()
                            let urlString = "http://aider.meizu.com/app/weather/listWeather?cityIds="+"\(searchArray[indexPath.row].cityid!)"
                            Alamofire.request(URL(string:urlString)!).responseJSON { (response) in
                                guard let JSON = response.result.value as? NSDictionary else { return }
        
                                let lives = WeaRootClass(fromDictionary: JSON as! [String : Any]).value!
                                self.weaLists = lives.map({ (live) -> WeatherModel in
        
                                    WeatherModel(value: live.realtime.weather, unit: live.realtime.weather)
        
                                })
        
                                OperationQueue.main.addOperation({
                                    self.valueLabel.text = self.weaLists[0].value
                                    self.titleLabel.text = self.searchArray[indexPath.row].city

                                })
                            }
    }
}
