//
//  TempViewController.swift
//  databaseDemo
//
//  Created by chityuen on 11/30/17.
//  Copyright © 2017 chityuen. All rights reserved.
//

import UIKit
import Charts
import Firebase
import SVProgressHUD


class TempViewController: UIViewController {


    @IBOutlet weak var lineChartView: LineChartView!
    var ref : DatabaseReference!
    //    var handle : DatabaseHandle!
    var name : Double = 0.0
    var temperature:[Double] = []
    var moisture:[Double] = []
    var humidity:[Double] = []
    var days :[String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        ref = Database.database().reference()
        SVProgressHUD.show()
        receiveData(data: "Temperature")
        
    }
    
    func setChart(dataPoints: [String], values: [Double], dataType: String){
        self.lineChartView.chartDescription?.text = ""
        self.lineChartView.noDataText = ""
        var dataEntries :[ChartDataEntry] = []
        for i in 0..<dataPoints.count{
            let dataEntry = ChartDataEntry(x: Double(i), y: values[i])
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = LineChartDataSet(values: dataEntries, label: "\(dataType)")
        chartDataSet.circleRadius = 3
        //        let chartData = LineChartData(dataSet: chartDataSet)
        self.lineChartView.data = LineChartData(dataSet: chartDataSet)
        
        
        self.lineChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: dataPoints)
        self.lineChartView.xAxis.granularity = 1.0
        self.lineChartView.xAxis.labelPosition = .bottom
        self.lineChartView.animate(xAxisDuration: 2)
        chartDataSet.colors = [UIColor(red: CGFloat(200.0/255.0), green: CGFloat(200.0/25.0), blue: CGFloat(200.0/255.0), alpha: CGFloat(10))]
    }
    
    func aMethod(data: String, completion: @escaping (Bool) -> ()){
        DispatchQueue.global().async {
            //background thread
            self.ref!.child("\(data)").observe(.childAdded, with: { (snapshot) in
                if let item = snapshot.value as? Double{
                    self.temperature.append(item-19)
                    self.days.append("\(0)")
                }
                completion(true)
            })
        }
    }
    
    func receiveData(data: String){
        aMethod(data: data) { (success) in
            guard success == true else{
                fatalError("cannot retrieve data!")
            }
            DispatchQueue.main.async {
                //Main UI thread
                SVProgressHUD.dismiss()
                self.setChart(dataPoints: self.days, values: self.temperature, dataType: data)
            }
        }
    }
    


    @IBAction func BackPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
