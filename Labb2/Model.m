//
//  Model.m
//  Labb2
//
//  Created by Tobias Hillén on 2017-01-18.
//  Copyright © 2017 Tobias Hillén. All rights reserved.
//

#import "Model.h"
@interface Model ()
@property (nonatomic) int numberOfRoundsPlayed;
@property (nonatomic) int numberOfRoundsLeft;
@property (nonatomic) NSMutableArray* allQuestions;
@property (nonatomic) NSMutableArray* questions;
@end

@implementation Model

-(instancetype)init {
    self = [super init];
    if (self) {
        self.isGameActive = YES;
        self.numberOfCorrectGuesses = 0;
        self.numberOfRoundsPlayed = 0;
        self.numberOfRoundsLeft = 5;
        self.questions = [[NSMutableArray alloc] init];
        [self setUpAllQuestions];
        [self setUpRandomQuestionsForOneGame];
        self.currentQuestion = self.questions[0];
    }
    return self;
}


-(void)setUpAllQuestions {
    NSDictionary* q1 = @{@"Question":@"Vilket år släpptes det första Grand Theft Auto-spelet ut?",
                         @"Correct":@"1997",
                         @"Wrong1":@"2002",
                         @"Wrong2":@"1982",
                         @"Wrong3":@"1992"};
    NSDictionary* q2 = @{@"Question":@"Vad heter antagonisten i Mega Man-serien till NES?",
                         @"Correct":@"Dr. Wily",
                         @"Wrong1":@"Bowser",
                         @"Wrong2":@"Wicked Professor",
                         @"Wrong3":@"Cobra Kai"};
    NSDictionary* q3 = @{@"Question":@"Vad heter Nintendos konsoll som släpps under 2017?",
                         @"Correct":@"Nintendo Switch",
                         @"Wrong1":@"Super Nintendo",
                         @"Wrong2":@"Nintendo Go",
                         @"Wrong3":@"Mega Nintendo"};
    NSDictionary* q4 = @{@"Question":@"Vad heter Englands huvudstad?4",
                         @"Correct":@"London",
                         @"Wrong1":@"Madrid",
                         @"Wrong2":@"New York",
                         @"Wrong3":@"Oslo"};
    NSDictionary* q5 = @{@"Question":@"Vad heter Englands huvudstad?5",
                         @"Correct":@"London",
                         @"Wrong1":@"Madrid",
                         @"Wrong2":@"New York",
                         @"Wrong3":@"Oslo"};
    NSDictionary* q6 = @{@"Question":@"Vad heter Englands huvudstad?6",
                         @"Correct":@"London",
                         @"Wrong1":@"Madrid",
                         @"Wrong2":@"New York",
                         @"Wrong3":@"Oslo"};
    NSDictionary* q7 = @{@"Question":@"Vad heter Englands huvudstad?7",
                         @"Correct":@"London",
                         @"Wrong1":@"Madrid",
                         @"Wrong2":@"New York",
                         @"Wrong3":@"Oslo"};
    NSDictionary* q8 = @{@"Question":@"Vad heter Englands huvudstad?8",
                         @"Correct":@"London",
                         @"Wrong1":@"Madrid",
                         @"Wrong2":@"New York",
                         @"Wrong3":@"Oslo"};
    NSDictionary* q9 = @{@"Question":@"Vad heter Englands huvudstad9?",
                         @"Correct":@"London",
                         @"Wrong1":@"Madrid",
                         @"Wrong2":@"New York",
                         @"Wrong3":@"Oslo"};
    NSDictionary* q10 = @{@"Question":@"Vad heter Englands huvudstad10?",
                         @"Correct":@"London",
                         @"Wrong1":@"Madrid",
                         @"Wrong2":@"New York",
                         @"Wrong3":@"Oslo"};
    
    self.allQuestions = [NSMutableArray arrayWithObjects: q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, nil];
}

- (void)setUpRandomQuestionsForOneGame {
    
    for (int i = 0; i < self.numberOfRoundsLeft; i++) {
        int random = arc4random() % self.allQuestions.count;
        NSDictionary *randomQuestion = self.allQuestions[random];
        self.questions[i] = randomQuestion;
        [self.allQuestions removeObjectAtIndex:i];
    }
}


- (BOOL)isAnswerCorrect:(NSString*)answer {
    
    self.numberOfRoundsLeft--;
    self.numberOfRoundsPlayed++;
    
    if (self.numberOfRoundsLeft <= 0) {
        self.isGameActive = NO;
    }
    
    if ([self.currentQuestion[@"Correct"] isEqualToString:answer]){
        self.numberOfCorrectGuesses++;
        [self changeCurrentQuestion];
        return true;
    } else {
        self.numberOfIncorrectGuesses++;
        [self changeCurrentQuestion];
        return false;
    }
}

- (void)changeCurrentQuestion {
    if (self.isGameActive){
        self.currentQuestion = self.questions[self.numberOfRoundsPlayed];
    }
}

- (BOOL)isThisTheLastQuestion {
    return (self.numberOfRoundsLeft == 1);
}

@end
