//
//  VideoCell.swift
//  VideoPlayer
//
//  Created by Ankita Satpathy on 18/10/17.
//  Copyright © 2017 Ankita Satpathy. All rights reserved.
//

import UIKit
import AVFoundation

class VideoCell: UITableViewCell {

    @IBOutlet weak var view: UIView!
    var player: AVPlayer?
    var playerLayer: AVPlayerLayer?
    
    var videoPlayerItem: AVPlayerItem? = nil {
        didSet {
          
            player?.replaceCurrentItem(with: self.videoPlayerItem)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.setupMoviePlayer()
    }
    func setupMoviePlayer(){
        self.player = AVPlayer.init(playerItem: videoPlayerItem)
        playerLayer = AVPlayerLayer(player: player)
        playerLayer?.videoGravity = AVLayerVideoGravity.resizeAspect
        player?.volume = 3
        player?.actionAtItemEnd = .none
        
        //        You need to have different variations
        //        according to the device so as the player fits well
        if UIScreen.main.bounds.width == 375 {
            let widthRequired = self.frame.size.width - 20
            playerLayer?.frame = CGRect.init(x: 0, y: 0, width: widthRequired, height: widthRequired/1.78)
        }else if UIScreen.main.bounds.width == 320 {
            playerLayer?.frame = CGRect.init(x: 0, y: 0, width: (self.frame.size.height - 120) * 1.78, height: self.frame.size.height - 120)
        }else{
            let widthRequired = self.frame.size.width
            playerLayer?.frame = CGRect.init(x: 0, y: 0, width: widthRequired, height: widthRequired/1.78)
        }
        self.backgroundColor = .clear
        self.view.layer.insertSublayer(playerLayer!, at: 0)
        self.player!.play()
    }
}
