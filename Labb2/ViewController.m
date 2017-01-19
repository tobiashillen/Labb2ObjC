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
@property (weak, nonatomic) IBOutlet UIButton *answerBtn1;
@property (weak, nonatomic) IBOutlet UIButton *answerBtn2;
@property (weak, nonatomic) IBOutlet UIButton *answerBtn3;
@property (weak, nonatomic) IBOutlet UIButton *answerBtn4;
@property (weak, nonatomic) IBOutlet UIButton *nextQuestionBtn;
@property (weak, nonatomic) IBOutlet UITextView *correctAnswersText;
@property (weak, nonatomic) IBOutlet UITextView *incorrectAnswersText;


@end

@implementation ViewController

- (IBAction)pressedAnswerButton:(id)sender {
    UIButton *pressedBtn = (UIButton *)sender;
    if ([self.game isAnswerCorrect:pressedBtn.titleLabel.text]) {
        [pressedBtn setTitle:@"Rätt!" forState:UIControlStateNormal];
    } else {
        [pressedBtn setTitle:@"Fel!" forState:UIControlStateNormal];

    }
    [self disableAllAnswerButtons];
    self.nextQuestionBtn.hidden = NO;
}
//Kolla om det var rätt och om det finns en fråga till, Displaya ny fråga
- (IBAction)pressedNextQuestionButton:(id)sender {
    if (self.game.isGameActive) {
        [self displayQuestion];
        [self enableAllAnswerButtons];
    } else {
        [self hideAllAnswerButtons];
        [self setUpAndShowResultText];
        [self.nextQuestionBtn setTitle:@"Spela igen" forState:UIControlStateNormal];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self hideResultText];
    self.game = [[Model alloc]init];
    [self displayQuestion];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)displayQuestion {
    self.questionText.text = self.game.currentQuestion[@"Question"];
    [self.answerBtn1 setTitle:self.game.currentQuestion[@"Correct"] forState:UIControlStateNormal];
    [self.answerBtn2 setTitle:self.game.currentQuestion[@"Wrong1"] forState:UIControlStateNormal];
    [self.answerBtn3 setTitle:self.game.currentQuestion[@"Wrong2"] forState:UIControlStateNormal];
    [self.answerBtn4 setTitle:self.game.currentQuestion[@"Wrong3"] forState:UIControlStateNormal];
    self.nextQuestionBtn.hidden = YES;
}

- (void)disableAllAnswerButtons {
    self.answerBtn1.enabled = NO;
    self.answerBtn2.enabled = NO;
    self.answerBtn3.enabled = NO;
    self.answerBtn4.enabled = NO;
}

- (void)enableAllAnswerButtons {
    self.answerBtn1.enabled = YES;
    self.answerBtn2.enabled = YES;
    self.answerBtn3.enabled = YES;
    self.answerBtn4.enabled = YES;
}

- (void)hideAllAnswerButtons {
    self.answerBtn1.hidden = YES;
    self.answerBtn2.hidden = YES;
    self.answerBtn3.hidden = YES;
    self.answerBtn4.hidden = YES;
}

- (void)hideResultText {
    self.correctAnswersText.hidden = YES;
    self.incorrectAnswersText.hidden = YES;
}

- (void)setUpAndShowResultText {
    self.correctAnswersText.text = [NSString stringWithFormat:@"Antal rätt  %d", self.game.numberOfCorrectGuesses];
    self.incorrectAnswersText.text = [NSString stringWithFormat:@"Antal fel  %d", self.game.numberOfIncorrectGuesses];
    self.questionText.text = @"Resultat";
    self.correctAnswersText.hidden = NO;
    self.incorrectAnswersText.hidden = NO;
}

@end
