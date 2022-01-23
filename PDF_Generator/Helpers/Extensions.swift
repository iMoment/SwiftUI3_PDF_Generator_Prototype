//
//  Extensions.swift
//  PDF_Generator
//
//  Created by Stanley Pan on 2022/01/23.
//

import SwiftUI

extension View {
    // MARK: Extracting View's Height/Width
    func convertToScrollView<Content: View>(@ViewBuilder content: @escaping () -> Content) -> UIScrollView {
        let scrollView = UIScrollView()
        
        // MARK: Converting SwiftUI View to UIKit View
        let hostingController = UIHostingController(rootView: content()).view!
        hostingController.translatesAutoresizingMaskIntoConstraints = false
        
        // MARK: Constraints
        let constraints = [
            hostingController.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            hostingController.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            hostingController.topAnchor.constraint(equalTo: scrollView.topAnchor),
            hostingController.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            // Width Anchor
            hostingController.widthAnchor.constraint(equalToConstant: screenBounds().width)
        ]
        scrollView.addSubview(hostingController)
        scrollView.addConstraints(constraints)
        scrollView.layoutIfNeeded()
        
        return scrollView
    }
    
    // MARK: Export to PDF
    // Completion Handler will send status and URL
    func exportToPDF<Content: View>(@ViewBuilder content: @escaping () -> Content, completion: @escaping (Bool, URL?) -> ()) {
        
        // MARK: Temporary URL
        let documentDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first
        let outputFileURL = documentDirectory?.appendingPathComponent("PDF_FILENAME\(UUID().uuidString).pdf")
        
        // MARK: PDF View
        let pdfView = convertToScrollView {
            content()
        }
        
        let size = pdfView.contentSize
        
        // MARK: Attach to Root View and render PDF
        getRootController().view.insertSubview(pdfView, at: 0)
        
        // MARK: Rendering PDF
        let renderer = UIGraphicsPDFRenderer(bounds: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        
        do {
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func screenBounds() -> CGRect {
        return UIScreen.main.bounds
    }
    
    func getRootController() -> UIViewController {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return .init() }
        
        guard let root = screen.windows.first?.rootViewController else { return .init() }
        
        return root
    }
}
