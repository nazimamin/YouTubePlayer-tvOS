//
//  VideoDetailViewController.swift
//  StarcraftWatch
//
//  Created by Thibault Klein on 9/14/15.
//  Copyright © 2015 Prolific Interactive. All rights reserved.
//

import UIKit
import AVKit
import Alamofire

class VideoDetailViewController: UIViewController {

    static let videoDetailViewControllerIdentifier = "VideoDetailViewController"

    @IBOutlet weak var playButton: UIButton!

    var video: Video?

    override func viewDidLoad() {
        self.playButton.setNeedsFocusUpdate()
        self.playButton.updateFocusIfNeeded()
    }

    @IBAction func playButtonTapped(sender: AnyObject) {
        let playerVC = AVPlayerViewController()
        if let videoURL = self.video?.videoFormattedURL() {
            let asset = AVAsset(URL: videoURL)
            let playerItem = AVPlayerItem(asset: asset)
            playerVC.player = AVPlayer(playerItem: playerItem)

            self.presentViewController(playerVC, animated: true) { () -> Void in
                playerVC.player?.play()
            }
        }
    }

}
