//
//  SharedData.swift
//  PDF_Generator
//
//  Created by Stanley Pan on 2022/01/23.
//

import Foundation

class SharedData: ObservableObject {
    // MARK: PDF Properties
    // ShareSheet producing error when using @State
    // Workaround: Use @StateObject instead
    @Published var PDFUrl: URL?
    @Published var showShareSheet: Bool = false
}
