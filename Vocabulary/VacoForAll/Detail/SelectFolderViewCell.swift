//
//  SelectFolderViewCell.swift
//  Vocabulary
//
//  Created by apple on 2020/08/30.
//  Copyright © 2020 LEE HAEUN. All rights reserved.
//

import UIKit
import SnapKit
import PoingVocaSubsystem

protocol SelectFolderViewCellDelegate: class {
    func selectFolder(didTapEdit button: UIButton, selectedFolder Folder: Group)
}

class SelectFolderViewCell: UICollectionViewCell {
    static let reuseIdentifier = String(describing: SelectFolderViewCell.self)
    
    enum SelectFolderCellType {
      case add
      case read
    }
    
    enum Constant {
        static let sideMargin: CGFloat = 16
        enum Image {
            static let height: CGFloat = 48
        }
        enum TextContents {
            static let leftMargin: CGFloat = 20
            static let bottomMargin: CGFloat = 18
        }
        static let imageRadius: CGFloat = 24
    }
    
    weak var delegate: MyVocaWordCellDelegate?
    var Folder: VocaForAll?
    
    lazy var ContentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.shadow(
            color: UIColor(red: 138.0 / 255.0, green: 149.0 / 255.0, blue: 158.0 / 255.0, alpha: 1),
            alpha: 0.2,
            x: 0,
            y: 10,
            blur: 60,
            spread: 0
        )
        view.layer.cornerRadius = 20
        view.clipsToBounds = false
        view.backgroundColor = .white
        return view
    }()
    lazy var folderImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = Constant.imageRadius
        imageView.backgroundColor = .lightGray
        return imageView
    }()
    lazy var folderTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 18)
        label.numberOfLines = 2
        label.textColor = .midnight
        return label
    }()
    lazy var addImageView: UIImageView = {
       let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "icAdd")
        view.backgroundColor = .clear
        view.clipsToBounds = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .clear
        clipsToBounds = false
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(folder: VocaForAll, type: SelectFolderCellType) {
        
        if type == .add {
            self.folderImageView.isHidden = true
            self.folderTitleLabel.isHidden = true
        } else {
            self.addImageView.isHidden = true
        }
        
        self.Folder = folder
        self.folderTitleLabel.text = folder.title
        if let urlImage = URL(string: folder.words[0].imageURL) {
            folderImageView.sd_setImage(with: urlImage)
        }
    }
    
    func configureLayout() {
        contentView.addSubview(ContentView)
        ContentView.addSubview(folderImageView)
        ContentView.addSubview(folderTitleLabel)
        ContentView.addSubview(addImageView)
        
        ContentView.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.top.equalTo(self)
        }
        
        folderImageView.snp.makeConstraints { (make) in
            make.leading.equalTo(ContentView).offset(20)
            make.top.equalTo(ContentView).offset(20)
            make.width.height.equalTo(Constant.Image.height)
        }
        
        folderTitleLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(ContentView).offset(20)
            make.bottom.equalTo(ContentView).offset(-20)
        }
        
        addImageView.snp.makeConstraints { (make) in
            make.leading.top.equalTo(ContentView).offset(63)
            make.trailing.bottom.equalTo(ContentView).offset(-63)
        }
    }
}