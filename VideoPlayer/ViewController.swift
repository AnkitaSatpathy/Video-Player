//
//  ViewController.swift
//  VideoPlayer
//
//  Created by Ankita Satpathy on 18/10/17.
//  Copyright © 2017 Ankita Satpathy. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var avPlayerLayer: AVPlayerLayer!
    var videoURL: NSURL?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
         let videoString: String =  Bundle.main.path(forResource: "moon", ofType: ".mp4") as! String
            
            videoURL = NSURL(fileURLWithPath: videoString)
       
    }

   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell") as! VideoCell
        cell.videoPlayerItem = AVPlayerItem.init(url: videoURL! as URL)
        return cell

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
}

