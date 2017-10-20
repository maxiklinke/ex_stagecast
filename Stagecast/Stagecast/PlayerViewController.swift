//
//  PlayerViewController.swift
//  Stagecast
//
//  Created by Maximilian Klinke on 15.10.17.
//  Copyright © 2017 Maximilian Klinke. All rights reserved.
//

import Foundation
import UIKit
import AVKit
import AVFoundation

class PlayerViewController: UIViewController {
    
    @IBOutlet var label_live: UILabel!
    
    
    override func viewDidLoad() {
        label_live.layer.cornerRadius = 5
        label_live.clipsToBounds = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let videoURL = URL(string: "https://stagecast.se/media/04322054-52AB-4FD6-9679-473525485A16/session_1.m3u8")
        let player = AVPlayer(url: videoURL!)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        playerLayer.frame = self.view.bounds
        
        //print(self.view.layer)
        
        //self.view.layer.addSublayer(playerLayer)
        self.view.layer.insertSublayer(playerLayer, at: 0)
        
        
        print(player)
        
        player.play()
    }
    
    @IBAction func OnExitButtonClicked(_ sender: Any) {
        //presentedViewController.
        navigationController!.popViewController(animated: true)
    }
}
