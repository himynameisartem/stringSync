//
//  ViewController.swift
//  stringSync
//
//  Created by Артем Кудрявцев on 16.01.2024.
//

import UIKit

class MetronomeViewController: UIViewController {
    
    var selectedBmp = 26
    var selectedAccent = 0
    
    private var bmpPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    private let bmpLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = #colorLiteral(red: 0, green: 0.5058823529, blue: 0.4392156863, alpha: 1)
        label.text = "Bmp"
        label.font = UIFont(name: "Helvetica", size: 16)
        return label
    }()
    
    private var accentPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    private var metronomeImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Metronome")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private var metronomeArrowImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "MetronomeArrow")
        image.contentMode = .scaleAspectFit
        return image
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstreaints()
    
    }
    
    private func setupUI() {
        view.backgroundColor = #colorLiteral(red: 0.1294117647, green: 0.1294117647, blue: 0.1294117647, alpha: 1)
        
        view.addSubview(bmpPicker)
        view.addSubview(bmpLabel)
        view.addSubview(accentPicker)
        view.addSubview(metronomeImageView)
        view.addSubview(metronomeArrowImageView)
        
        bmpPicker.delegate = self
        bmpPicker.selectRow(selectedBmp, inComponent: 0, animated: false)
        accentPicker.delegate = self
        accentPicker.selectRow(selectedAccent, inComponent: 0, animated: false)
    }
    
    private func setupConstreaints() {
        NSLayoutConstraint.activate([
            
            bmpPicker.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            bmpPicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            bmpPicker.widthAnchor.constraint(equalToConstant: (view.frame.width - 40) / 3.5),
            bmpPicker.heightAnchor.constraint(equalToConstant: view.frame.height / 3.7),
            
            bmpLabel.centerYAnchor.constraint(equalTo: bmpPicker.centerYAnchor),
            bmpLabel.leadingAnchor.constraint(equalTo: bmpPicker.trailingAnchor),
            
            accentPicker.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            accentPicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            accentPicker.widthAnchor.constraint(equalToConstant: (view.frame.width - 40) / 3.5),
            accentPicker.heightAnchor.constraint(equalToConstant: view.frame.height / 3.7),

            
            metronomeImageView.topAnchor.constraint(equalTo: bmpPicker.bottomAnchor, constant: 20),
            metronomeImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            metronomeImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            metronomeImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            
            metronomeArrowImageView.topAnchor.constraint(equalTo: metronomeImageView.topAnchor),
            metronomeArrowImageView.leadingAnchor.constraint(equalTo: metronomeImageView.leadingAnchor),
            metronomeArrowImageView.trailingAnchor.constraint(equalTo: metronomeImageView.trailingAnchor),
            metronomeArrowImageView.bottomAnchor.constraint(equalTo: metronomeImageView.bottomAnchor)

        ])
    }
}
extension MetronomeViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == bmpPicker {
            return bmpDate.count
        } else {
            return accentDate.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == bmpPicker {
            return bmpDate[row]
        } else {
            return accentDate[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        var attributedString = NSAttributedString()
        
        if pickerView == bmpPicker {
            attributedString = NSAttributedString(string: bmpDate[row], attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        } else {
            if row == 0 {
                attributedString = NSAttributedString(string: accentDate[row], attributes: [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.4588235294, green: 0.4588235294, blue: 0.4588235294, alpha: 1)])
            } else {
                attributedString = NSAttributedString(string: accentDate[row], attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
            }
        }
        return attributedString
    }
}
