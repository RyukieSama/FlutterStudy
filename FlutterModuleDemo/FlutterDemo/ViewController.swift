//
//  ViewController.swift
//  FlutterDemo
//
//  Created by 王荣庆 on 2021/12/6.
//

import UIKit
import Flutter

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
        flutterEngin.run()
    }

    @IBAction func showFlutterAction(_ sender: UIButton) {
        let vc = FlutterViewController(engine: flutterEngin, nibName: nil, bundle: nil)
//        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true, completion: nil)
    }
    
    private lazy var flutterEngin: FlutterEngine = {
        let en = FlutterEngine()
        return en
    }()
    
}

