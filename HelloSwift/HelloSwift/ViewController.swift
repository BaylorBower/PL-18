//
//  ViewController.swift
//  HelloSwift
//
//  Created by Baylor K. Bower on 10/5/18.
//  Copyright © 2018 Baylor K. Boweraa. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireRSSParser
import AVFoundation

public enum netResponseStatus {
    case success
    case error(string: String?)
    
}

public class RSSFeedParser{
    public static func getRSSFeedResponse(path: String, completionHandler:
        @escaping (_ response: RSSFeed?,_ status: netResponseStatus) -> Void) {
            Alamofire.request(path).responseRSS() { response in
                if let  rssFeedXML = response.result.value{
                    completionHandler(rssFeedXML, .success) //successful response
                }
                else{
                    completionHandler(nil, .error(string: response.result.error?.localizedDescription)) //Failed response
                }
    }
}
 
    
    var audioPlayer = AVAudioPlayer()
    
class ViewController: UIViewController {
    @IBOutlet var nameLabel: UILabel!

    
    audioPlayer = try AVAudioPlayer(contentsOf : URL)
    }
    catch {
    print(error)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func textFieldAction(textField: UITextField) {
        var URL = UITextField
        RSSFeedParser.getRSSFeedResponse(path: URL){
            (rssFeed: RSSFeed?, status: netResponseStatus) in
            print(rssFeed)
        }

    }
    @IBAction func leftyAction(leftButton: AnyObject) {
        audioPlayer.play()
    }

    @IBAction func rightyAction(rightButton: AnyObject) {
        if audioPlayer.isPlaying{
          audioPlayer.pause()
        } else{
            
        }
    }
}

