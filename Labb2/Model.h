//
//  Model.h
//  Labb2
//
//  Created by Tobias Hillén on 2017-01-18.
//  Copyright © 2017 Tobias Hillén. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject
@property (nonatomic) NSMutableArray* questions;
@property (nonatomic) NSDictionary* currentQuestion;
@end
