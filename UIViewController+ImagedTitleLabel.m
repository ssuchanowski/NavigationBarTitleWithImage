//
//  UIViewController+ImagedTitleLabel.m
//  Tenerife Bay
//
//  Created by Sebastian Suchanowski on 2/3/14.
//  Copyright (c) 2014 Synappse Sebastian Suchanowski. All rights reserved.
//

#import "UIViewController+ImagedTitleLabel.h"

@implementation UIViewController (ImagedTitleLabel)

- (UIView *)createTitleViewWithImageNamed:(NSString *)imageName {
    
    int viewWidth = 0;
    int viewHeight = 30.0;
    UIView *resultView = [[UIView alloc] init];
    
    UIFont *font = [UIFont customFont_bariolBold:20.0];
    UILabel *lbl = [[UILabel alloc] init];
    [lbl setFont:font];
    [lbl setText:self.title];
    [lbl setTextColor:[UIColor whiteColor]];
    
    if (![imageName isEqual:nil]) {
        UIImage *img = [UIImage imageNamed:imageName];
        UIImageView *imgView = [[UIImageView alloc] initWithImage:img];
        [imgView setContentMode:UIViewContentModeCenter ];
        [imgView setFrame:CGRectMake(0, 0, img.size.width, viewHeight)];
        viewWidth += img.size.width + 6;
        
        [resultView addSubview:imgView];
    }
    
    CGRect lblFrame = [lbl.text boundingRectWithSize:CGSizeMake(MAXFLOAT, viewHeight)
                                             options:NSStringDrawingUsesLineFragmentOrigin
                                          attributes:@{NSFontAttributeName:font}
                                             context:nil];
    
    [lbl setFrame:CGRectMake(viewWidth, 0, lblFrame.size.width, viewHeight)];
    viewWidth += lblFrame.size.width;
    
    [resultView addSubview:lbl];
    
    [resultView setFrame:CGRectMake(0, 0, viewWidth, viewHeight)];
    
    return resultView;
}

@end
