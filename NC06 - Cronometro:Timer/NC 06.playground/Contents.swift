//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

class TimerViewController: UIViewController {
  
    var startButton = UIButton()
    var pauseButton = UIButton()
    var reset = UIButton()
    var timerLabel = UILabel()
    
    var seconds = 60
    var timer: Timer?
    var isTimerRunning = false
    var resumeTapped = false
    
    //MARK: - IBActions
    @IBAction func startButtonTapped(_ sender: UIButton) {
        if isTimerRunning == false {
            runTimer()
            self.startButton.isEnabled = false
        }
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(TimerViewController.updateTimer)), userInfo: nil, repeats: true)
        isTimerRunning = true
        pauseButton.isEnabled = true
    }
    
    @IBAction func pauseButtonTapped(_ sender: UIButton) {
        if self.resumeTapped == false {
            timer?.invalidate()
            isTimerRunning = false
            self.resumeTapped = true
            self.pauseButton.setTitle("Resume",for: .normal)
        } else {
            runTimer()
            self.resumeTapped = false
            isTimerRunning = true
            self.pauseButton.setTitle("Pause",for: .normal)
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        timer?.invalidate()
        seconds = 60
        timerLabel.text = timeString(time: TimeInterval(seconds))
        isTimerRunning = false
        pauseButton.isEnabled = false
        startButton.isEnabled = true
    }
    
    
    func updateTimer() {
        if seconds < 1 {
            timer?.invalidate()
           
        } else {
            seconds -= 1
            timerLabel.text = timeString(time: TimeInterval(seconds))
            
        }
    }
    
    func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    override func viewDidLoad() {
        super.loadView()
        self.title = "Timer"
        self.view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        pauseButton.isEnabled = false
        
        
        let button1 = startButton
        button1.setTitle("Start", for: .normal)
        button1.contentVerticalAlignment = .bottom
        button1.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        button1.titleLabel?.font = UIFont(name: "helvetica", size: 18)
        button1.layer.cornerRadius =  5
        button1.layer.borderWidth = 2
        button1.layer.borderColor = UIColor.black.cgColor
      
        button1.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        
        view.addSubview(button1)
        
        let button2 = pauseButton
        button2.setTitle("Pause", for: .normal)
        button2.titleLabel?.font = UIFont(name: "helvetica", size: 16)
        button2.contentVerticalAlignment = .bottom
        button2.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        button2.layer.cornerRadius =  5
        button2.layer.borderWidth = 2
        button2.layer.borderColor = UIColor.black.cgColor
       
        
        button2.addTarget(self, action: #selector(pauseButtonTapped), for: .touchUpInside)
        
        view.addSubview(button2)
        
        let button3 = reset
        button3.setTitle("Reset", for: .normal)
        button3.titleLabel?.font = UIFont(name: "helvetica", size: 16)
        button3.contentVerticalAlignment = .bottom
        button3.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        button3.layer.cornerRadius =  5
        button3.layer.borderWidth = 2
        button3.layer.borderColor = UIColor.black.cgColor
   
        
        button3.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
        
        view.addSubview(button3)
        
        let label = timerLabel
        label.textAlignment = .center
        label.font = UIFont(name: "helvetica", size: 40)
        
        
        view.addSubview(label)
        
        button1.translatesAutoresizingMaskIntoConstraints = false
        button2.translatesAutoresizingMaskIntoConstraints = false
        button3.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button1.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            button1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            button1.widthAnchor.constraint(equalToConstant: 100),
            button1.heightAnchor.constraint(equalToConstant: 40),
            
            button2.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            button2.leadingAnchor.constraint(equalTo: button1.leadingAnchor, constant: 120),
            button2.widthAnchor.constraint(equalToConstant: 100),
            button2.heightAnchor.constraint(equalToConstant: 40),
            
            button3.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            button3.leadingAnchor.constraint(equalTo: button2.leadingAnchor, constant: 120),
            button3.widthAnchor.constraint(equalToConstant: 100),
            button3.heightAnchor.constraint(equalToConstant: 40),
            
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            label.widthAnchor.constraint(equalToConstant: 340),
            label.heightAnchor.constraint(equalToConstant: 150),
            
            
            
        ])
    }
    
}



class StopWatchViewController: UIViewController, UITableViewDelegate {
    
    var timerLabel = UILabel()
    var tableView = UITableView()
    var totalSec:Float = 0
    var timer = Timer()
    var startButton = UIButton()
    
    
    var lapTimeArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "StopWatch"
        self.view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        timerLabel.text = "       Tap Start"
        
        let button1 = startButton
        button1.setTitle("Start", for: .normal)
        button1.contentVerticalAlignment = .bottom
        button1.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        button1.titleLabel?.font = UIFont(name: "helvetica", size: 18)
        button1.layer.cornerRadius =  5
        button1.layer.borderWidth = 2
        button1.layer.borderColor = UIColor.black.cgColor
        
        button1.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        
        view.addSubview(button1)
        
        let button2 = UIButton()
        button2.setTitle("Pause", for: .normal)
        button2.titleLabel?.font = UIFont(name: "helvetica", size: 16)
        button2.contentVerticalAlignment = .bottom
        button2.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        button2.layer.cornerRadius =  5
        button2.layer.borderWidth = 2
        button2.layer.borderColor = UIColor.black.cgColor
        
        
        button2.addTarget(self, action: #selector(pauseButtonTapped), for: .touchUpInside)
        
        view.addSubview(button2)
        
        let button3 = UIButton()
        button3.setTitle("Reset", for: .normal)
        button3.titleLabel?.font = UIFont(name: "helvetica", size: 16)
        button3.contentVerticalAlignment = .bottom
        button3.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        button3.layer.cornerRadius =  5
        button3.layer.borderWidth = 2
        button3.layer.borderColor = UIColor.black.cgColor
        
        
        button3.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
        
        view.addSubview(button3)
        
        let label = timerLabel
        label.font = UIFont(name: "helvetica", size: 40)
        
        
        view.addSubview(label)
        
        button1.translatesAutoresizingMaskIntoConstraints = false
        button2.translatesAutoresizingMaskIntoConstraints = false
        button3.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button1.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            button1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            button1.widthAnchor.constraint(equalToConstant: 100),
            button1.heightAnchor.constraint(equalToConstant: 40),
            
            button2.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            button2.leadingAnchor.constraint(equalTo: button1.leadingAnchor, constant: 120),
            button2.widthAnchor.constraint(equalToConstant: 100),
            button2.heightAnchor.constraint(equalToConstant: 40),
            
            button3.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            button3.leadingAnchor.constraint(equalTo: button2.leadingAnchor, constant: 120),
            button3.widthAnchor.constraint(equalToConstant: 100),
            button3.heightAnchor.constraint(equalToConstant: 40),
            
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            label.widthAnchor.constraint(equalToConstant: 340),
            label.heightAnchor.constraint(equalToConstant: 150),
            
            
            
            ])
    }



    
    
    // MARK: - buttons tapped
    func startButtonTapped(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateTimer), userInfo: nil, repeats: true)
        print("start tapped")
        startButton.isEnabled = false
    }
    
    func pauseButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        print("stop tapped")
        startButton.isEnabled = true

    }
    
    func resetButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        totalSec = 0
        timerLabel.text = "    00 : 00 : 00"
        startButton.isEnabled = true
    }
    
    
    // MARK: - update timer
    func updateTimer() {
        totalSec += 55.0
        
        let hours = Int(totalSec) / 3600
        let minutes = Int(totalSec) / 60 % 60
        let seconds = Int(totalSec) % 60
    
        
        
        timerLabel.text = "        \(hours) : \(minutes) : \(seconds)"
        
            }
    
    
}



class MyTabBarController: UITabBarController{
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        let cronometroViewControler = UINavigationController(rootViewController: StopWatchViewController())
        
        let tabBarItem1: UITabBarItem = UITabBarItem(title: "StopWatch", image: #imageLiteral(resourceName: "clock-stopwatch-7.png").withRenderingMode(UIImageRenderingMode.alwaysTemplate), selectedImage: UIImage(named: "StopWatch"))
        cronometroViewControler.tabBarItem = tabBarItem1
       
        
        
        let timerViewController = UINavigationController(rootViewController: TimerViewController())
        
        let tabBarItem2:UITabBarItem = UITabBarItem(title: "Timer", image: #imageLiteral(resourceName: "clock-timer-7.png").withRenderingMode(UIImageRenderingMode.alwaysTemplate), selectedImage: UIImage(named: "Timer"))
        timerViewController.tabBarItem = tabBarItem2
        
        
        
        
        self.viewControllers = [cronometroViewControler,timerViewController]
        
    }
    
}

PlaygroundPage.current.liveView = MyTabBarController()

