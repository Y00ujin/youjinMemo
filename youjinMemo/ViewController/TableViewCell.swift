//
//  TableViewCell.swift
//  youjinMemo
//
//  Created by 김유진 on 2021/01/24.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var memoTitleLabel: UILabel!
    @IBOutlet weak var memoContentLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPress(longPressGestureRecognizer:)))
        contentView.addGestureRecognizer(longPressRecognizer)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func longPress(longPressGestureRecognizer: UILongPressGestureRecognizer) {
        guard longPressGestureRecognizer.state == .began else { return }
        //action sheet title 지정
        let optionMenu = UIAlertController(title: nil, message: "메모를 삭제할까요?", preferredStyle: .actionSheet)
        //옵션 초기화

        let deleteAction = UIAlertAction(title: "삭제", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
                memoTitle.remove(at: UserDefaults.standard.integer(forKey: "index"))
                memoContents.remove(at: UserDefaults.standard.integer(forKey: "index"))
                
                NotificationCenter.default.post(name: .TableReload, object: nil)
            
                print(memoTitle)
                print(memoContents)
        })

        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: {

            (alert: UIAlertAction!) -> Void in

      })

        optionMenu.addAction(deleteAction)
        optionMenu.addAction(cancelAction)

       //show
        print("click")
        UIApplication.topViewController()?.present(optionMenu, animated: true)
        
    }

}

extension UIApplication {

    var keyWindowInConnectedScenes: UIWindow? {
        windows.first(where: { $0.isKeyWindow })
    }

    class func topViewController(_ viewController: UIViewController? = UIApplication.shared.keyWindowInConnectedScenes?.rootViewController) -> UIViewController? {
        if let nav = viewController as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        if let tab = viewController as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }
        if viewController is UIAlertController {
            return viewController?.presentingViewController
        }
        if let presented = viewController?.presentedViewController {
            return topViewController(presented)
        }
        return viewController
    }
}

extension Notification.Name {
    static let TableReload = Notification.Name(rawValue: "TableReload")
}

