//
//  ContentView.swift
//  PDF_Generator
//
//  Created by Stanley Pan on 2022/01/23.
//

import SwiftUI

struct ContentView: View {
    let screen = UIScreen.main.bounds
    
    // MARK: PDF Properties
    @State var PDFUrl: URL?
    @State var showShareSheet: Bool = false
    
    var body: some View {
        VStack {
            Text("This is an example controller with content.")
            
            HStack {
                Rectangle()
                    .foregroundColor(Color.blue)
                    .frame(width: 200, height: 200)
                
                Rectangle()
                    .foregroundColor(Color.red)
                    .frame(width: 200, height: 200)
            }
            
            Spacer()
                .frame(width: screen.width, height: 60)
            
            Button(action: {
                exportToPDF {
                    self
                } completion: { status, url in
                    if let url = url, status {
                        print("Button was pressed with url: \(url)")
                        self.PDFUrl = url
                        self.showShareSheet.toggle()
                    } else {
                        print("Failed to produce PDF.")
                    }
                }

            }, label: {
                Image(systemName: "square.and.arrow.up.fill")
                    .font(.title2)
                    .foregroundColor(Color.black.opacity(0.7))
            })
        }
        .sheet(isPresented: $showShareSheet) {
            PDFUrl = nil
        } content: {
            if let PDFUrl = PDFUrl {
                ShareSheet(urls: [PDFUrl])
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// MARK: Share Sheet
struct ShareSheet: UIViewControllerRepresentable {
    var urls: [Any]
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: urls, applicationActivities: nil)
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        
    }
}
