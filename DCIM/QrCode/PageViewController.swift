//
//  PageViewController.swift
//  DCIM
//
//  Created by Anyuting on 2019/8/23.
//  Copyright © 2019 kunsy. All rights reserved.
//

import SwiftUI
import UIKit

class OrangeController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
    }
}
struct ScanController: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: OrangeController, context: UIViewControllerRepresentableContext<ScanController>) {
        
    }
    func makeUIViewController(context: UIViewControllerRepresentableContext<ScanController>) -> OrangeController {
        return OrangeController()
    }
}

struct PageViewController: UIViewControllerRepresentable {
    
//    var controllers: [UIViewController]
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<PageViewController>) -> ScannerViewController {
//        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        return ScannerViewController()
    }
    func updateUIViewController(_ uiViewController: ScannerViewController, context: UIViewControllerRepresentableContext<PageViewController>) {
    }
}

//#if DEBUG
//struct PageViewController_Previews: PreviewProvider {
//    static var previews: some View {
//        PageViewController()
//    }
//}
//#endif
