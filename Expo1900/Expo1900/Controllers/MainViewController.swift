//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class MainViewController: UIViewController {
    @IBOutlet private weak var mainStackView: UIStackView!
    private let jsonDecoder = JSONDecoder()
    private let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        return formatter
    }()
    private var exposition: Exposition? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        exposition = decodeExposition("exposition_universelle_1900")
        configureView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func decodeExposition(_ file: String) -> Exposition? {
        guard let expositionAsset: NSDataAsset = NSDataAsset(name: file) else { return nil }
        let exposition = try? jsonDecoder.decode(Exposition.self, from: expositionAsset.data)
        
        return exposition
    }
    
    private func configureLabel(text: String?, textStyle: UIFont.TextStyle, numberOfLines: Int = 1) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.preferredFont(forTextStyle: textStyle)
        label.numberOfLines = numberOfLines
        
        return label
    }
    
    private func configureView() {
        let koreanTitleLabel: UILabel = configureLabel(text: exposition?.koreanTitle, textStyle: .title1)
        let englishTitleLabel: UILabel = configureLabel(text: exposition?.englishTitle, textStyle: .title1)
        let visitorsLabel: UILabel = configureLabel(text: "방문객 : \(numberFormatter.string(for: exposition?.visitors) ?? "")",
                                                    textStyle: .title3)
        let locationLabel: UILabel = configureLabel(text: "개최지 : \(exposition?.location ?? "")",
                                                    textStyle: .title3)
        let durationLabel: UILabel = configureLabel(text: "개최 기간 : \(exposition?.duration ?? "")",
                                                    textStyle: .title3)
        let descriptionLabel: UILabel = configureLabel(text: exposition?.description,
                                                       textStyle: .body,
                                                       numberOfLines: 0)
        
        let posterImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "poster")
            
            return imageView
        }()
        
        let koreanItemsViewButton: UIButton = {
            let button = UIButton()
            let action = UIAction { _ in
                self.navigationController?.isNavigationBarHidden = false
                self.performSegue(withIdentifier: "koreanItemsSegue", sender: self)
            }
            button.setTitle("🇰🇷 한국의 출품작 보러가기 🇰🇷", for: .normal)
            button.setTitleColor(.systemBlue, for: .normal)
            button.addAction(action, for: .touchUpInside)
            
            return button
        }()
        
        mainStackView.addArrangedSubview(koreanTitleLabel)
        mainStackView.addArrangedSubview(englishTitleLabel)
        
        mainStackView.addArrangedSubview(posterImageView)
        
        mainStackView.addArrangedSubview(visitorsLabel)
        mainStackView.addArrangedSubview(locationLabel)
        mainStackView.addArrangedSubview(durationLabel)
        mainStackView.addArrangedSubview(descriptionLabel)
        
        mainStackView.addArrangedSubview(koreanItemsViewButton)
    }
}
