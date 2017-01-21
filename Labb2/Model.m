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
    NSDictionary* q4 = @{@"Question":@"Vilket spel kom först?",
                         @"Correct":@"Mega Man 2",
                         @"Wrong1":@"Super Metroid",
                         @"Wrong2":@"Sonic the Hedgehog",
                         @"Wrong3":@"Metal Gear Solid"};
    NSDictionary* q5 = @{@"Question":@"Vilken spelkonsol kom först?",
                         @"Correct":@"Sega Master System",
                         @"Wrong1":@"Nintendo 64",
                         @"Wrong2":@"Sega Saturn",
                         @"Wrong3":@"Playstation"};
    NSDictionary* q6 = @{@"Question":@"Vad händer om Super Mario tar en grön svamp?",
                         @"Correct":@"Han får ett extraliv",
                         @"Wrong1":@"Han blir liten",
                         @"Wrong2":@"Han dör",
                         @"Wrong3":@"Han blir odödlig"};
    NSDictionary* q7 = @{@"Question":@"Vad var undertiteln till Turtles IV till Super Nintendo?",
                         @"Correct":@"Turtles in Time",
                         @"Wrong1":@"Rumble in Manhattan",
                         @"Wrong2":@"Mutant Madness",
                         @"Wrong3":@"Splinter's Revenge"};
    NSDictionary* q8 = @{@"Question":@"Vem är sista bossen i Street Fighter II till Super Nintendo?",
                         @"Correct":@"M. Bison",
                         @"Wrong1":@"Ruy",
                         @"Wrong2":@"Ganon",
                         @"Wrong3":@"Chun-Li"};
    NSDictionary* q9 = @{@"Question":@"Vad heter det klassiska ryska pusselspelet?",
                         @"Correct":@"Tetris",
                         @"Wrong1":@"Metric",
                         @"Wrong2":@"Bust-a-Move",
                         @"Wrong3":@"Dr. Mario"};
    NSDictionary* q10 = @{@"Question":@"Vilken färg har Pac-Man?",
                         @"Correct":@"Gul",
                         @"Wrong1":@"Grön",
                         @"Wrong2":@"Blå",
                         @"Wrong3":@"Röd"};
    
    self.allQuestions = [NSMutableArray arrayWithObjects: q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, nil];
}

- (void)setUpRandomQuestionsForOneGame {
    
    for (int i = 0; i < self.numberOfRoundsLeft; i++) {
        int random = arc4random() % self.allQuestions.count;
        NSDictionary *randomQuestion = self.allQuestions[random];
        self.questions[i] = randomQuestion;
        [self.allQuestions removeObjectAtIndex:random];
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
