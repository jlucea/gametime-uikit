//
//  TimerStateView.swift
//  GameTime
//
//  Created by Jaime Lucea on 15/10/22.
//

import Foundation
import UIKit

class TimerStateView : UIView {
    
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var timeRemainingLabel: UILabel!
    @IBOutlet weak var timeRemainingProgressView: UIProgressView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        viewInit()
    }
    
    func viewInit() {
        print("Initiating TimerStateView")
        let xibView = Bundle.main.loadNibNamed("TimerStateView", owner: self)![0] as! UIView
        xibView.frame = self.bounds
        addSubview(xibView)
    }
    
}
