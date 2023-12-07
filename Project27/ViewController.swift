//
//  ViewController.swift
//  Project27
//
//  Created by Yulian Gyuroff on 3.12.23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    
    var currentDrawType = 0
    let someE = "🐞"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        drawRectangle()
    }

    @IBAction func redrawTapped(_ sender: Any) {
        currentDrawType += 1
        if currentDrawType > 8 {
            currentDrawType = 0
        }
        switch currentDrawType {
        case 0:
            drawRectangle()
        case 1:
            drawCircle()
        case 2:
            drawCheckerboard()
        case 3:
            drawRotatedSquares()
        case 4:
            drawLines()
        case 5:
            drawImagesAndText()
        case 6:
            drawLadyBug()
        case 7:
            drawTWIN()
        case 8:
            drawMoreRotatedSquares()
        default:
            break
 
        }
    }
    
    func drawRectangle() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
        let image = renderer.image { ctx in
            //awesome drawing code there
            let rectangle = CGRect(x: 0, y: 0, width: 512, height: 512)
            ctx.cgContext.setFillColor(UIColor.red.cgColor)
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.setLineWidth(10)
            
            ctx.cgContext.addRect(rectangle)
            ctx.cgContext.drawPath(using: .fillStroke)
        }
        imageView.image = image
    }
    func drawCircle() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
        
        let image = renderer.image { ctx in
            //awesome drawing code there
            let rectangle = CGRect(x: 0, y: 0, width: 512, height: 512).insetBy(dx: 5, dy: 5)
            ctx.cgContext.setFillColor(UIColor.red.cgColor)
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.setLineWidth(10)
            
            ctx.cgContext.addEllipse(in: rectangle)
            ctx.cgContext.drawPath(using: .fillStroke)
        }
        imageView.image = image
    }
    func drawCheckerboard() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
        let image = renderer.image { ctx in
            //awesome drawing code there
            ctx.cgContext.setFillColor(UIColor.black.cgColor)
            for row in 0..<8 {
                for col in 0..<8 {
                    if (row + col) % 2 == 0 {
                        ctx.cgContext.fill(CGRect(x: col*64, y: row*64, width: 64, height: 64))
                    }
                }
            }
        }
        imageView.image = image
    }
    func drawRotatedSquares() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
        let image = renderer.image { ctx in
            //awesome drawing code there
            ctx.cgContext.translateBy(x: 256, y: 256)
            
            let rotations = 16
            let amount = Double.pi / Double(rotations)
            for _ in 0..<rotations {
                ctx.cgContext.rotate(by: CGFloat(amount))
                ctx.cgContext.addRect(CGRect(x: -128, y: -128, width: 256, height: 256))
            }
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.strokePath()
        }
        imageView.image = image
    }
    func drawMoreRotatedSquares() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
        let image = renderer.image { ctx in
            //awesome drawing code there
            ctx.cgContext.translateBy(x: 256, y: 256)
            
            let rotations = 16
            let amount = Double.pi / Double(rotations)
            for _ in 0..<rotations {
                ctx.cgContext.rotate(by: CGFloat(amount))
                for i in 0..<12 {
                    ctx.cgContext.addRect(CGRect(x: -128+i*8, y: -128+i*8, width: 256-2*(i*8), height: 256-2*(i*8)))
                    //ctx.cgContext.addRect(CGRect(x: -120, y: -120, width: 240, height: 240))
                    //ctx.cgContext.addRect(CGRect(x: -112, y: -112, width: 224, height: 224))
                }
            }
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.strokePath()
        }
        imageView.image = image
    }
    func drawLines() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
        let image = renderer.image { ctx in
            //awesome drawing code there
            ctx.cgContext.translateBy(x: 256, y: 256)
            
            var first = true
            var length: CGFloat = 256
            
            for _ in 0..<256 {
                ctx.cgContext.rotate(by: .pi / 2)
                
                if first {
                    ctx.cgContext.move(to: CGPoint(x: length, y: 50))
                    first = false
                }else{
                    ctx.cgContext.addLine(to: CGPoint(x: length, y: 50))
                }
                length *= 0.99
            }
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.strokePath()
        }
        imageView.image = image
    }
    func drawImagesAndText() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
        let image = renderer.image { ctx in
            //awesome drawing code there
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            
            let attrs: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 36),
                .paragraphStyle: paragraphStyle
            ]
            
            let string = "The best-laid schemes o'\nmice an' men gang aft agley"
            let attributedString = NSAttributedString(string: string, attributes: attrs)
            attributedString.draw(with: CGRect(x: 32, y: 32, width: 448, height: 448),
                                  options: .usesLineFragmentOrigin, context: nil)
            
            let mouse = UIImage(named: "mouse")
            mouse?.draw(at: CGPoint(x: 300, y: 150))
        }
        imageView.image = image
    }
    func drawLadyBug() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
        
        let image = renderer.image { ctx in
            //awesome drawing code there
            
            var rectangle = CGRect(x: 208, y: 32, width: 128, height: 128).insetBy(dx: 5, dy: 5)
            ctx.cgContext.setFillColor(UIColor.black.cgColor)
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.setLineWidth(7)
            
            ctx.cgContext.addEllipse(in: rectangle)
            ctx.cgContext.drawPath(using: .fillStroke)
            
            rectangle = CGRect(x: 164, y: 32, width: 128, height: 128).insetBy(dx: 5, dy: 5)
            ctx.cgContext.setFillColor(UIColor.black.cgColor)
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.setLineWidth(7)
           
            ctx.cgContext.addEllipse(in: rectangle)
            ctx.cgContext.drawPath(using: .fillStroke)
            
            rectangle = CGRect(x: 128, y: 64, width: 256, height: 384).insetBy(dx: 5, dy: 5)
            ctx.cgContext.setFillColor(UIColor.red.cgColor)
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.setLineWidth(7)
            
            ctx.cgContext.addEllipse(in: rectangle)
            ctx.cgContext.drawPath(using: .fillStroke)
            
            rectangle = CGRect(x: 178, y: 114, width: 48, height: 48).insetBy(dx: 5, dy: 5)
            ctx.cgContext.setFillColor(UIColor.black.cgColor)
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.setLineWidth(7)
            
            ctx.cgContext.addEllipse(in: rectangle)
            ctx.cgContext.drawPath(using: .fillStroke)
            
            rectangle = CGRect(x: 282, y: 114, width: 48, height: 48).insetBy(dx: 5, dy: 5)
            ctx.cgContext.setFillColor(UIColor.black.cgColor)
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.setLineWidth(7)
            
            ctx.cgContext.addEllipse(in: rectangle)
            ctx.cgContext.drawPath(using: .fillStroke)
            
            rectangle = CGRect(x: 208, y: 208, width: 96, height: 96).insetBy(dx: 5, dy: 5)
            ctx.cgContext.setFillColor(UIColor.black.cgColor)
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.setLineWidth(7)
            
            ctx.cgContext.addEllipse(in: rectangle)
            ctx.cgContext.drawPath(using: .fillStroke)
            
            rectangle = CGRect(x: 178, y: 370, width: 48, height: 48).insetBy(dx: 5, dy: 5)
            ctx.cgContext.setFillColor(UIColor.black.cgColor)
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.setLineWidth(7)
            
            ctx.cgContext.addEllipse(in: rectangle)
            ctx.cgContext.drawPath(using: .fillStroke)
            
            rectangle = CGRect(x: 282, y: 370, width: 48, height: 48).insetBy(dx: 5, dy: 5)
            ctx.cgContext.setFillColor(UIColor.black.cgColor)
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.setLineWidth(7)
            
            ctx.cgContext.addEllipse(in: rectangle)
            ctx.cgContext.drawPath(using: .fillStroke)
            
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.setLineWidth(7)
 
            ctx.cgContext.move(to: CGPoint(x: 256, y: 64))
            ctx.cgContext.addLine(to: CGPoint(x: 256, y: 448))
            ctx.cgContext.drawPath(using: .fillStroke)
            
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.setLineWidth(7)
 
            ctx.cgContext.move(to: CGPoint(x: 182, y: 32))
            ctx.cgContext.addLine(to: CGPoint(x: 150, y: 0))
            ctx.cgContext.drawPath(using: .fillStroke)
            
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.setLineWidth(7)
 
            ctx.cgContext.move(to: CGPoint(x: 282, y: 32))
            ctx.cgContext.addLine(to: CGPoint(x: 314, y: 0))
            ctx.cgContext.drawPath(using: .fillStroke)
            
            rectangle = CGRect(x: 182, y: 32, width: 32, height: 32).insetBy(dx: 5, dy: 5)
            ctx.cgContext.setFillColor(UIColor.white.cgColor)
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.setLineWidth(7)
            
            ctx.cgContext.addEllipse(in: rectangle)
            ctx.cgContext.drawPath(using: .fillStroke)
            
            rectangle = CGRect(x: 282, y: 32, width: 32, height: 32).insetBy(dx: 5, dy: 5)
            ctx.cgContext.setFillColor(UIColor.white.cgColor)
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.setLineWidth(7)
            
            ctx.cgContext.addEllipse(in: rectangle)
            ctx.cgContext.drawPath(using: .fillStroke)
            
        }
        imageView.image = image
    }
    func drawTWIN() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
        
        let image = renderer.image { ctx in
            
            ctx.cgContext.setFillColor(UIColor.black.cgColor)
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.setLineWidth(7)
            // T
            ctx.cgContext.move(to: CGPoint(x: 32, y: 128))
            ctx.cgContext.addLine(to: CGPoint(x: 128, y: 128))
            ctx.cgContext.drawPath(using: .fillStroke)
            
            ctx.cgContext.move(to: CGPoint(x: 80, y: 128))
            ctx.cgContext.addLine(to: CGPoint(x: 80, y: 256))
            ctx.cgContext.drawPath(using: .fillStroke)
            // W
            ctx.cgContext.move(to: CGPoint(x: 144, y: 124))
            ctx.cgContext.addLine(to: CGPoint(x: 160, y: 242))
            ctx.cgContext.addLine(to: CGPoint(x: 176, y: 192))
            ctx.cgContext.addLine(to: CGPoint(x: 192, y: 242))
            ctx.cgContext.addLine(to: CGPoint(x: 212, y: 124))
            ctx.cgContext.drawPath(using: .stroke)
            // I
            ctx.cgContext.move(to: CGPoint(x: 228, y: 124))
            ctx.cgContext.addLine(to: CGPoint(x: 228, y: 256))
            ctx.cgContext.drawPath(using: .stroke)
            // N
            ctx.cgContext.move(to: CGPoint(x: 244, y: 124))
            ctx.cgContext.addLine(to: CGPoint(x: 244, y: 256))
            ctx.cgContext.move(to: CGPoint(x: 244, y: 124))
            ctx.cgContext.addLine(to: CGPoint(x: 288, y: 252))
            ctx.cgContext.move(to: CGPoint(x: 288, y: 124))
            ctx.cgContext.addLine(to: CGPoint(x: 288, y: 256))
            ctx.cgContext.drawPath(using: .stroke)
 
        }
        imageView.image = image
    }
}

