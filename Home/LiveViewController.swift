

//
//  LiveViewController.swift
//  YKLive
//
//  Created by Mr_Jia on 2017/11/16.
//  Copyright © 2017年 Mr_Jia. All rights reserved.
//

import UIKit
import SnapKit
import SkeletonView
import RxSwift
import RxCocoa
class LiveViewController: UIViewController {
    var live:YKModel!
    var ijplayer:IJKMediaPlayback!
    var playerView:UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setBGround()

        setPlayerView()
        
        addSubViews()


    }
    func setBGround() {
        let imageView = UIImageView()
        imageView.isSkeletonable = true
        view.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalTo(0)
        }
        imageView.kf.setImage(with: URL.init(string:live.portrait))
        imageView.contentMode = .scaleToFill
        
        let blurffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurffect)
        blurView.frame = view.bounds
        imageView.addSubview(blurView)
        
        let label = UILabel()
        label.text = "loading....."
        imageView.addSubview(label)

        label.snp.makeConstraints { (make) in
            make.center.equalTo(imageView)
            make.width.equalTo(100)
            make.height.equalTo(20)
        }
        
        
    }
    func addSubViews()  {
        // --返回按钮
        let backBtn = UIButton(type: .custom)
        backBtn.setImage(#imageLiteral(resourceName: "goback"), for: .normal)
        view.addSubview(backBtn)
        backBtn.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(64)
            make.width.height.equalTo(40)
        }
        backBtn.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        self.view.bringSubview(toFront: backBtn)
        // --礼物按钮
        let giftBtn = UIButton(type: .custom)
        giftBtn.setImage(#imageLiteral(resourceName: "gift-1"), for: .normal)
        view.addSubview(giftBtn)
        giftBtn.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.width.height.equalTo(60)
            make.bottom.equalToSuperview().offset(-20)
        }
        giftBtn.addTarget(self, action: #selector(giftAction(sender:)), for: .touchUpInside)
        
        // --heart
        let likeBtn = UIButton(type: .custom)
        likeBtn.setImage(#imageLiteral(resourceName: "心"), for: .normal)
        view.addSubview(likeBtn)
        likeBtn.snp.makeConstraints { (make) in
            make.width.height.equalTo(60)
            make.right.equalToSuperview().offset(-10)
            make.bottom.equalTo(giftBtn.snp.bottom)
        }
        likeBtn.addTarget(self, action: #selector(likeAction(sender:)), for: .touchUpInside)
    }
   @objc func goBack()  {
        stop()
        navigationController?.popViewController(animated: true)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    @objc func giftAction(sender:UIButton) {
        let duration = 3.0
        let car = UIImageView(image: #imageLiteral(resourceName: "porsche"))
        
        car.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        view.addSubview(car)
        
        let widthCar = 240
        let heightCar = 120
        
        UIView.animate(withDuration: duration) {

            car.frame.size = CGSize(width: widthCar, height: heightCar)
            car.center = self.view.center

        }
        
        DispatchQueue.main.asyncAfter(deadline: .now()+duration) {
        
            UIView.animate(withDuration: duration, animations: {
                car.alpha = 0
            },completion: { (completed) in
                car.removeFromSuperview()
            })
        }
        let layerFw = CAEmitterLayer()
        view.layer.addSublayer(layerFw)
        emmitParticles(from: sender.center, emitter: layerFw, in: view)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration * 2) {
            layerFw.removeFromSuperlayer()
        }

        
    }
    @objc func likeAction(sender:UIButton) {
        let heart = DMHeartFlyView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        
        heart.center = sender.center
        
        view.addSubview(heart)
        
        heart.animate(in: view)
       
        let btnAnime = CAKeyframeAnimation(keyPath: "transform.scale")
        btnAnime.values = [1.0, 0.7, 0.5, 0.3, 0.5, 0.7, 1.0, 1.2, 1.4, 1.2, 1.0]
        btnAnime.keyTimes = [0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0]
        btnAnime.duration = 0.36
        sender.layer.add(btnAnime, forKey: "dian")
    }

    func stop()  {
        ijplayer.stop()
        ijplayer.shutdown()
        ijplayer.view.removeFromSuperview()
    }
    func setPlayerView() {
        self.playerView = UIView(frame:view.bounds)
        view.addSubview(self.playerView)
        
        ijplayer = IJKFFMoviePlayerController(contentURLString: live.url, with: nil)
//        ijplayer = IJKFFMoviePlayerController(contentURLString:"http://qqpull99.inke.cn/live/1510820546705564.flv?ikHost=tx&ikOp=0&codecInfo=8192", with: nil)

        let pv = ijplayer.view!
        pv.frame = playerView.frame
        pv.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        playerView.insertSubview(pv, at: 1)
        ijplayer.scalingMode = .aspectFill
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if !self.ijplayer.isPlaying() {
            ijplayer.prepareToPlay()
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
