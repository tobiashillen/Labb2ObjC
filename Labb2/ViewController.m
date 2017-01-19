//
//  ViewController.m
//  Labb2
//
//  Created by Tobias Hillén on 2017-01-17.
//  Copyright © 2017 Tobias Hillén. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"

@interface ViewController ()
@property (nonatomic) Model *game;
@property (weak, nonatomic) IBOutlet UITextView *questionText;
@property (weak, nonatomic) IBOutlet UIButton *answerText1;
@property (weak, nonatomic) IBOutlet UIButton *answerText2;
@property (weak, nonatomic) IBOutlet UIButton *answerText3;
@property (weak, nonatomic) IBOutlet UIButton *answerText4;

@end

@implementation ViewController

- (IBAction)generateButtonPressed:(id)sender {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.game = [[Model alloc]init];
    [self displayQuestion];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)displayQuestion {
    self.questionText.text = self.game.currentQuestion[@"Question"];
    [self.answerText1 setTitle:self.game.currentQuestion[@"Correct"] forState:UIControlStateNormal];
    [self.answerText2 setTitle:self.game.currentQuestion[@"Wrong1"] forState:UIControlStateNormal];
    [self.answerText3 setTitle:self.game.currentQuestion[@"Wrong2"] forState:UIControlStateNormal];
    [self.answerText4 setTitle:self.game.currentQuestion[@"Wrong3"] forState:UIControlStateNormal];
}


@end
