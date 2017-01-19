//
//  Model.h
//  Labb2
//
//  Created by Tobias Hillén on 2017-01-18.
//  Copyright © 2017 Tobias Hillén. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject
@property (nonatomic) NSDictionary* currentQuestion;
@property (nonatomic) BOOL isGameActive;
@property (nonatomic) int numberOfCorrectGuesses;
@property (nonatomic) int numberOfIncorrectGuesses;
- (BOOL)isAnswerCorrect:(NSString*)answer;
@end
