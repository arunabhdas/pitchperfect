//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created  on 2/8/17.
//  Copyright © 2017 pitchperfect. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    @IBOutlet weak var slowButton: UIButton!
    @IBOutlet weak var fastButton: UIButton!
    @IBOutlet weak var highPitchButton: UIButton!
    @IBOutlet weak var lowPitchButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    @IBOutlet weak var outerStackView: UIStackView!
    @IBOutlet weak var innerStackView1: UIStackView!
    @IBOutlet weak var innerStackView2: UIStackView!
    @IBOutlet weak var innerStackView3: UIStackView!
    @IBOutlet weak var innerStackView4: UIStackView!
    
    
    var recordedAudioURL: URL!
    
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int {
        case slow = 0, fast, chipmunk, vader, echo, reverb
    }
    
    @IBAction func playSoundForButton(_ sender: UIButton) {
        print("\(recordedAudioURL!) button was pressed")
        switch (ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .chipmunk:
            playSound(pitch: 1000)
        case .vader:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)

        }
        configureUI(.playing)
        
    }
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        print(" stop button tapped")
        stopAudio()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slowButton.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        fastButton.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        highPitchButton.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        lowPitchButton.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        echoButton.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        reverbButton.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        
        setupAudio()
        // Do any additional setup after loading the view.
        print(recordedAudioURL)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }
    
    // helper function: all the innerStackView should share the same style, configure them together
    func setInnerStackViewsAxis(axisStyle: UILayoutConstraintAxis)  {
        self.innerStackView1.axis = axisStyle
        self.innerStackView2.axis = axisStyle
        self.innerStackView3.axis = axisStyle
        self.innerStackView4.axis = axisStyle
    }
    
    // override this function to make sure when rotated to landscape, the buttons are not squeezed
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        let orientation = UIApplication.shared.statusBarOrientation
        
        if orientation.isLandscape{
            self.outerStackView.axis = .vertical
            self.setInnerStackViewsAxis(axisStyle: .horizontal)
        } else {
            self.outerStackView.axis = .horizontal
            self.setInnerStackViewsAxis(axisStyle: .vertical)
        }
        
    }

}
