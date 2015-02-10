//
//  TableViewCell.m
//  ScoreKeeperIB
//
//  Created by Jordan Nelson on 2/9/15.
//  Copyright (c) 2015 Jordan Nelson. All rights reserved.
//

#import "TableViewCell.h"

@interface TableViewCell () <UITextFieldDelegate>
    
@property (strong, nonatomic) IBOutlet UITextField *player;

@property (strong, nonatomic) IBOutlet UILabel *score;

@property (strong, nonatomic) IBOutlet UIStepper *scoreChanger;

@end

@implementation TableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

    return self;
}

- (void)awakeFromNib {
    
    [self.scoreChanger addTarget:self action:@selector(stepperChanged:) forControlEvents:UIControlEventValueChanged];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)stepperChanged:(id)sender {
    double value = [self.scoreChanger value];
    self.score.text = [NSString stringWithFormat:@"%d",(int)value];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}


@end
