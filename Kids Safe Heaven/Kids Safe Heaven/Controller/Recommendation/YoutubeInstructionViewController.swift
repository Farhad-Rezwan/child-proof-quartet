//
//  YoutubeInstructionViewController.swift
//  Kids Safe Heaven
//
//  Created by Farhad Ullah Rezwan on 17/10/20.
//  Copyright © 2020 Farhad Ullah Rezwan. All rights reserved.
//

import UIKit
import YoutubePlayer_in_WKWebView

class YoutubeInstructionViewController: UIViewController {
    
    @IBOutlet weak var videoInstructionHeader: UILabel!
    @IBOutlet weak var player: WKYTPlayerView!
    
    var headerName: String!
    var youtubeVideoLink: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        videoInstructionHeader.text = headerName
        
        player.layer.cornerRadius = 10
        player.layer.borderWidth = 6.0
        player.layer.borderColor = UIColor.black.cgColor
        player.load(withVideoId: youtubeVideoLink)

        // Do any additional setup after loading the view.
        /// removed the back text form the nevigation bar
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        self.navigationController?.navigationBar.isHidden = false
    }
}
