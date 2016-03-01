//
//  ViewController.m
//  chartDemo
//
//  Created by tmoussajee on 01/03/2016.
//  Copyright © 2016 sedona. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.slices = [NSMutableArray arrayWithCapacity:10];
    
    for(int i = 0; i < 5; i ++)
    {
        NSNumber *one = [NSNumber numberWithInt:rand()%60+20];
        [_slices addObject:one];
    }
    
    [self.pieChart setDataSource:self];
    [self.pieChart setStartPieAngle:M_PI_2];
    [self.pieChart setAnimationSpeed:1.0];
//    [self.pieChart setLabelFont:[UIFont fontWithName:@"DBLCDTempBlack" size:24]];
    [self.pieChart setLabelRadius:160];
    [self.pieChart setShowPercentage:NO];
  //  [self.pieChart setPieBackgroundColor:[UIColor colorWithWhite:0.95 alpha:1]];
    [self.pieChart setPieCenter:CGPointMake(self.pieChart.frame.size.height / 2 + 15, self.pieChart.frame.size.height / 2 + 15
                                            )];
    [self.pieChart setUserInteractionEnabled:NO];
    self.pieChart.showLabel = NO;
    
    [self.refreshButton.layer setCornerRadius:self.refreshButton.bounds.size.height / 2];
//    self.refreshButton.backgroundColor = [UIColor whiteColor];
    self.middleView.layer.cornerRadius = self.middleView.bounds.size.height / 2 + 8;
    
    self.sliceColors = [NSArray arrayWithObjects:
                       [UIColor colorWithRed:246/255.0 green:155/255.0 blue:0/255.0 alpha:1],
                       [UIColor colorWithRed:129/255.0 green:195/255.0 blue:29/255.0 alpha:1],
                       [UIColor colorWithRed:62/255.0 green:173/255.0 blue:219/255.0 alpha:1],
                       [UIColor colorWithRed:229/255.0 green:66/255.0 blue:115/255.0 alpha:1],
                       [UIColor colorWithRed:148/255.0 green:141/255.0 blue:139/255.0 alpha:1],nil];
//    [self.pieChart startSpin];
//    [self initTriangle];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.pieChart reloadData];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}


//- (void)initTriangle
//{
//    UIView *triangle;
//    CGRect frame;
//    
//    frame.size.width = self.pieChart.frame.size.width / 12;
//    frame.size.height = self.pieChart.frame.size.height / 12;
//    NSLog(@"%f, %f", self.pieChart.frame.origin.x, self.pieChart.frame.origin.y);
//    NSLog(@"%f, %f", self.pieChart.frame.size.height, self.pieChart.frame.size.width);
//    
//    frame.origin.x = self.pieChart.frame.origin.x +
//    (self.pieChart.frame.size.width / 2) - (self.pieChart.frame.size.width * 0.5) + 2;
//    frame.origin.y = 20;
//    NSLog(@"%f", frame.origin.x);
//    
//    triangle = [[UIView alloc] initWithFrame:frame];
//    triangle.backgroundColor = [UIColor whiteColor];
//    
//    UIBezierPath *path = [UIBezierPath new];
//    [path moveToPoint:(CGPoint){0, 0}];
//    
//    [path addLineToPoint:(CGPoint){triangle.frame.size.height / 2,  (triangle.frame.size.height / 3) * 2}];
//    
//    [path addLineToPoint:(CGPoint){triangle.frame.size.height, 0}];
//    [path addLineToPoint:(CGPoint){0, 0}];
//    
//    CAShapeLayer *mask = [CAShapeLayer new];
//    mask.path = path.CGPath;
//    triangle.layer.mask = mask;
//    [triangle.layer setCornerRadius:9];
//    
//    [self.pieChart addSubview:triangle];
//}

#pragma mark - XYPieChart Data Source

- (NSUInteger)numberOfSlicesInPieChart:(XYPieChart *)pieChart
{
    return self.slices.count;
}

- (CGFloat)pieChart:(XYPieChart *)pieChart valueForSliceAtIndex:(NSUInteger)index
{
    return [[self.slices objectAtIndex:index] intValue];
}

- (UIColor *)pieChart:(XYPieChart *)pieChart colorForSliceAtIndex:(NSUInteger)index
{
    return [self.sliceColors objectAtIndex:(index % self.sliceColors.count)];
}

#pragma mark - XYPieChart Delegate
- (void)pieChart:(XYPieChart *)pieChart willSelectSliceAtIndex:(NSUInteger)index
{
    NSLog(@"will select slice at index %lu",(unsigned long)index);
}
- (void)pieChart:(XYPieChart *)pieChart willDeselectSliceAtIndex:(NSUInteger)index
{
    NSLog(@"will deselect slice at index %lu",(unsigned long)index);
}
- (void)pieChart:(XYPieChart *)pieChart didDeselectSliceAtIndex:(NSUInteger)index
{
    NSLog(@"did deselect slice at index %lu",(unsigned long)index);
}
- (void)pieChart:(XYPieChart *)pieChart didSelectSliceAtIndex:(NSUInteger)index
{
    NSLog(@"did select slice at index %lu",(unsigned long)index);
//    self.selectedSliceLabel.text = [NSString stringWithFormat:@"$%@",[self.slices objectAtIndex:index]];
}

- (IBAction)clickTurnButton:(id)sender {
    static bool a = false;
    if (a)
        [self.pieChart startSpin];
    else
        [self.pieChart stopSpin];
    a = !a;
}

@end
