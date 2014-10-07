//
//  MagicalCreature.m
//  MCMS
//
//  Created by Christopher on 10/7/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "MagicalCreature.h"

@implementation MagicalCreature

- (instancetype)initWithName:(NSString *)name {
    self = [super init];

    if (name.length == 0) {
        [NSException raise:NSInvalidArgumentException
                    format:@"Dragons must have a name"];

    }

    self.name = name;
    return self;
}

@end
