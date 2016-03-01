//
//  ViewController.h
//  chartDemo
//
//  Created by tmoussajee on 01/03/2016.
//  Copyright © 2016 sedona. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYPieChart.h"

@interface ViewController : UIViewController <XYPieChartDelegate, XYPieChartDataSource>

@property (strong, nonatomic) IBOutlet XYPieChart *pieChart;
@property (weak, nonatomic) IBOutlet UIButton *refreshButton;

@property(nonatomic, strong) NSMutableArray *slices;
@property(nonatomic, strong) NSArray        *sliceColors;
@property (weak, nonatomic) IBOutlet UIView *middleView;

@end

