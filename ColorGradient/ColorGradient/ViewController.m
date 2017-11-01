//
//  ViewController.m
//  ColorGradient
//
//  Created by Rainy on 2017/10/31.
//  Copyright © 2017年 Rainy. All rights reserved.
//

#define kRGB(R,G,B) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1]

#import "ViewController.h"
#import "ColorGradientTool.h"

@interface ViewController ()
{
    ColorGradientDirection _tempDirection;
    CGFloat _R;
    CGFloat _G;
    CGFloat _B;
    CGFloat _R_end;
    CGFloat _G_end;
    CGFloat _B_end;
}
@property (weak, nonatomic) IBOutlet UISlider *R_Slider;
@property (weak, nonatomic) IBOutlet UISlider *G_Slider;
@property (weak, nonatomic) IBOutlet UISlider *B_Slider;
@property (weak, nonatomic) IBOutlet UIButton *LR_BT;
@property (weak, nonatomic) IBOutlet UIButton *RL_BT;
@property (weak, nonatomic) IBOutlet UIButton *UD_BT;
@property (weak, nonatomic) IBOutlet UIButton *DU_BT;
@property (weak, nonatomic) IBOutlet UISlider *R_Slider_end;
@property (weak, nonatomic) IBOutlet UISlider *G_Slider_end;
@property (weak, nonatomic) IBOutlet UISlider *B_Slider_end;
@property (weak, nonatomic) IBOutlet UIView *colorView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _tempDirection = ColorGradientDirectionForLeftToRight;
    [self.R_Slider addTarget:self action:@selector(changeRValue:) forControlEvents:UIControlEventValueChanged];
    [self.G_Slider addTarget:self action:@selector(changeGValue:) forControlEvents:UIControlEventValueChanged];
    [self.B_Slider addTarget:self action:@selector(changeBValue:) forControlEvents:UIControlEventValueChanged];
    [self.R_Slider_end addTarget:self action:@selector(changeRendValue:) forControlEvents:UIControlEventValueChanged];
    [self.G_Slider_end addTarget:self action:@selector(changeGendValue:) forControlEvents:UIControlEventValueChanged];
    [self.B_Slider_end addTarget:self action:@selector(changeBendValue:) forControlEvents:UIControlEventValueChanged];
    
    self.R_Slider.minimumValue =
    self.G_Slider.minimumValue =
    self.B_Slider.minimumValue =
    self.R_Slider_end.minimumValue =
    self.G_Slider_end.minimumValue =
    self.B_Slider_end.minimumValue = 0;
    
    self.R_Slider.maximumValue =
    self.G_Slider.maximumValue =
    self.B_Slider.maximumValue =
    self.R_Slider_end.maximumValue =
    self.G_Slider_end.maximumValue =
    self.B_Slider_end.maximumValue = 255.0;
}
- (void)changeRValue:(UISlider *)slider
{
    _R = slider.value;
    [ColorGradientTool gradientStartColor:kRGB(_R, _G, _B) endColor:kRGB(_R_end, _G_end, _B_end) statusView:self.colorView colorGradientDirection:_tempDirection];
}
- (void)changeGValue:(UISlider *)slider
{
    _G = slider.value;
    [ColorGradientTool gradientStartColor:kRGB(_R, _G, _B) endColor:kRGB(_R_end, _G_end, _B_end) statusView:self.colorView colorGradientDirection:_tempDirection];
}
- (void)changeBValue:(UISlider *)slider
{
    _B = slider.value;
    [ColorGradientTool gradientStartColor:kRGB(_R, _G, _B) endColor:kRGB(_R_end, _G_end, _B_end) statusView:self.colorView colorGradientDirection:_tempDirection];
}
- (void)changeRendValue:(UISlider *)slider
{
    _R_end = slider.value;
    [ColorGradientTool gradientStartColor:kRGB(_R, _G, _B) endColor:kRGB(_R_end, _G_end, _B_end) statusView:self.colorView colorGradientDirection:_tempDirection];
}
- (void)changeGendValue:(UISlider *)slider
{
    _G_end = slider.value;
    [ColorGradientTool gradientStartColor:kRGB(_R, _G, _B) endColor:kRGB(_R_end, _G_end, _B_end) statusView:self.colorView colorGradientDirection:_tempDirection];
}
- (void)changeBendValue:(UISlider *)slider
{
    _B_end = slider.value;
    [ColorGradientTool gradientStartColor:kRGB(_R, _G, _B) endColor:kRGB(_R_end, _G_end, _B_end) statusView:self.colorView colorGradientDirection:_tempDirection];
}
- (IBAction)LR:(id)sender {
    [self.LR_BT setSelected:YES];
    [self.RL_BT setSelected:NO];
    [self.UD_BT setSelected:NO];
    [self.DU_BT setSelected:NO];
    _tempDirection = ColorGradientDirectionForLeftToRight;
    [ColorGradientTool gradientStartColor:kRGB(_R, _G, _B) endColor:kRGB(_R_end, _G_end, _B_end) statusView:self.colorView colorGradientDirection:_tempDirection];
}
- (IBAction)RL:(id)sender {
    [self.LR_BT setSelected:NO];
    [self.RL_BT setSelected:YES];
    [self.UD_BT setSelected:NO];
    [self.DU_BT setSelected:NO];
    _tempDirection = ColorGradientDirectionForRightToLeft;
    [ColorGradientTool gradientStartColor:kRGB(_R, _G, _B) endColor:kRGB(_R_end, _G_end, _B_end) statusView:self.colorView colorGradientDirection:_tempDirection];
}
- (IBAction)UD:(id)sender {
    [self.LR_BT setSelected:NO];
    [self.RL_BT setSelected:NO];
    [self.UD_BT setSelected:YES];
    [self.DU_BT setSelected:NO];
    _tempDirection = ColorGradientDirectionForUpToUnder;
    [ColorGradientTool gradientStartColor:kRGB(_R, _G, _B) endColor:kRGB(_R_end, _G_end, _B_end) statusView:self.colorView colorGradientDirection:_tempDirection];
}
- (IBAction)DU:(id)sender {
    [self.LR_BT setSelected:NO];
    [self.RL_BT setSelected:NO];
    [self.UD_BT setSelected:NO];
    [self.DU_BT setSelected:YES];
    _tempDirection = ColorGradientDirectionForUnderToUp;
    [ColorGradientTool gradientStartColor:kRGB(_R, _G, _B) endColor:kRGB(_R_end, _G_end, _B_end) statusView:self.colorView colorGradientDirection:_tempDirection];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
