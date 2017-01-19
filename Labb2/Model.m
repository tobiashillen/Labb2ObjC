//
//  Model.m
//  Labb2
//
//  Created by Tobias Hillén on 2017-01-18.
//  Copyright © 2017 Tobias Hillén. All rights reserved.
//

#import "Model.h"
@interface Model ()
@property (nonatomic) int numbersOfCorrectGuesses;
@property (nonatomic) int gamesPlayed;
@property (nonatomic) NSMutableArray* allQuestions;
@end

@implementation Model

-(instancetype)init {
    self = [super init];
    if (self) {
        self.questions = [[NSMutableArray alloc] init];
        [self setUpAllQuestions];
        [self setUpFiveRandomQuestions];
        self.currentQuestion = self.questions[0];
        self.numbersOfCorrectGuesses =0;
    }
    return self;
}


-(void)setUpAllQuestions {
    NSDictionary* q1 = @{@"Question":@"Vad heter Englands huvudstad1?",
                         @"Correct":@"London",
                         @"Wrong1":@"Madrid",
                         @"Wrong2":@"New York",
                         @"Wrong3":@"Oslo"};
    NSDictionary* q2 = @{@"Question":@"Vad heter Englands huvudstad2?",
                         @"Correct":@"London",
                         @"Wrong1":@"Madrid",
                         @"Wrong2":@"New York",
                         @"Wrong3":@"Oslo"};
    NSDictionary* q3 = @{@"Question":@"Vad heter Englands huvudstad?3",
                         @"Correct":@"London",
                         @"Wrong1":@"Madrid",
                         @"Wrong2":@"New York",
                         @"Wrong3":@"Oslo"};
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

- (void)setUpFiveRandomQuestions {
    
    for (int i = 0; i < 5; i++) {
        int random = arc4random() % self.allQuestions.count;
        NSDictionary *randomQuestion = self.allQuestions[random];
        self.questions[i] = randomQuestion;
        [self.allQuestions removeObjectAtIndex:i];
        NSLog(@"%d" ,[self.allQuestions count ]);
    }
}

- (BOOL)isAnswerCorrect:(NSString*)answere {
    if ([self.currentQuestion[@"Correct"] isEqualToString:answere]){
        self.numbersOfCorrectGuesses++;
        return true;
    } else {
        return false;
    }
}

@end
