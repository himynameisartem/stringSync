//
//  TabBarController.swift
//  stringSync
//
//  Created by Артем Кудрявцев on 16.01.2024.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        generateTabBar()
        tabBar.unselectedItemTintColor = #colorLiteral(red: 0.4588235294, green: 0.4588235294, blue: 0.4588235294, alpha: 1)
    }
    
    private func generateTabBar() {
        viewControllers = [generateVC(viewController: MetronomeViewController(), 
                                      title: "Metronome",
                                      image: UIImage(systemName: "metronome")),
                           generateVC(viewController: GuitarTuneViewController(),
                                      title: "Guitar Tune",
                                      image: UIImage(systemName: "guitars")),
                           generateVC(viewController: ChromaticTuneViewController(),
                                      title: "Chromatic Tune",
                                      image: UIImage(systemName: "waveform")),
                           generateVC(viewController: ChordsViewController(),
                                      title: "Chords",
                                      image: UIImage(systemName: "music.quarternote.3")),
                           generateVC(viewController: SettingsViewController(),
                                      title: "Settings",
                                      image: UIImage(systemName: "gear"))]
    }
    
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
}
