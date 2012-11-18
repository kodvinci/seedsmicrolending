//
//  HairDice.m
//  Microlending
//
//  Created by Benjamin Mozenter on 11/4/12.
//
//

#import "HairDice.h"

@implementation HairDice

-(id) init{
    if(self = [super init]){
    [self addNumber:1 ofTrait:@"Tulip"];
    [self addNumber:1 ofTrait:@"Branches"];
    [self addNumber:1 ofTrait:@"Silk Tree"];
    [self addNumber:1 ofTrait:@"Calla Lily"];
    [self addNumber:1 ofTrait:@"Lotus White"];
    
    
    [inheritance setObject:@"Leaves" forKey:@"Bamboo"];
    [inheritance setObject:@"Soft" forKey:@"Tulip"];
    [inheritance setObject:@"Bark" forKey:@"Branches"];
    [inheritance setObject:@"Spikes" forKey:@"Cactus"];
    [inheritance setObject:@"Spikes" forKey:@"Silk Tree"];
    [inheritance setObject:@"Bark" forKey:@"Cherry Blossom"];
    [inheritance setObject:@"Spikes" forKey:@"Venus Flytrap"];
    [inheritance setObject:@"Deep" forKey:@"Pitcher Plant"];
    [inheritance setObject:@"Deep" forKey:@"Black Turmpet Mushroom"];
    [inheritance setObject:@"Leaves" forKey:@"Fern"];
    [inheritance setObject:@"Soft" forKey:@"Narcissus"];
    [inheritance setObject:@"Soft" forKey:@"Carnation"];
    [inheritance setObject:@"Deep" forKey:@"Bird of Paradise"];
    [inheritance setObject:@"Deep" forKey:@"Calla Lilly"];
    [inheritance setObject:@"Leaves" forKey:@"Lotus White"];
    
    }
    return self;
}

-(NSString *) hairFromDadsHair:(NSString *) hair andMomsHair: (NSString *) hair2
    {
        NSString *hairType = @"Branches";
        NSString *dadsHair = [inheritance objectForKey: hair];
        NSString *momsHair = [inheritance objectForKey: hair2];
        if([dadsHair isEqualToString:@"Leaves"]){
            if([momsHair isEqualToString:@"Bark"]){
                hairType = @"Bamboo";
            }
            else if ([momsHair isEqualToString:@"Spikes"]){
                hairType = @"Venus FlyTrap";
            }
            else if ([momsHair isEqualToString:@"Leaves"]){
                hairType = @"Fern";
            }
            else if ([momsHair isEqualToString:@"Deep"]){
                hairType = @"Calla Lilly";
            }
            else if ([momsHair isEqualToString:@"Soft"]){
                hairType = @"Lotus White";
            }
        }
        else if([momsHair isEqualToString:@"Leaves"]){
            if([dadsHair isEqualToString:@"Bark"]){
                hairType = @"Bamboo";
            }
            else if ([dadsHair isEqualToString:@"Spikes"]){
                hairType = @"Venus FlyTrap";
            }
            else if ([dadsHair isEqualToString:@"Deep"]){
                hairType = @"Calla Lilly";
            }
            else if ([dadsHair isEqualToString:@"Soft"]){
                hairType = @"Lotus White";
            }
        }
        else if([dadsHair isEqualToString:@"Bark"]){
            if([momsHair isEqualToString:@"Bark"]){
                hairType = @"Branches";
            }
            else if ([momsHair isEqualToString:@"Spikes"]){
                hairType = @"Silk Tree";
            }
            else if ([momsHair isEqualToString:@"Deep"]){
                hairType = @"Black Trumpet Mushroom";
            }
            else if ([momsHair isEqualToString:@"Soft"]){
                hairType = @"CherryBlossom";
            }
        }
        else if([momsHair isEqualToString:@"Bark"]){
            if ([dadsHair isEqualToString:@"Spikes"]){
                hairType = @"Silk Tree";
            }
            else if ([dadsHair isEqualToString:@"Deep"]){
                hairType = @"Black Trumpet Mushroom";
            }
            else if ([dadsHair isEqualToString:@"Soft"]){
                hairType = @"CherryBlossom";
            }
        }
        else if([dadsHair isEqualToString:@"Spikes"]){
            if ([momsHair isEqualToString:@"Spikes"]){
                hairType = @"Cactus";
            }
            else if ([momsHair isEqualToString:@"Deep"]){
                hairType = @"Bird of Paradise";
            }
            else if ([momsHair isEqualToString:@"Soft"]){
                hairType = @"Tulip";
            }
        }
        else if([momsHair isEqualToString:@"Spikes"]){
           if ([dadsHair isEqualToString:@"Deep"]){
                hairType = @"Bird of Paradise";
            }
            else if ([dadsHair isEqualToString:@"Soft"]){
                hairType = @"Tulip";
            }
        }
        else if([dadsHair isEqualToString:@"Depp"]){
            if ([momsHair isEqualToString:@"Deep"]){
                hairType = @"Pitcher Plant";
            }
            else if ([momsHair isEqualToString:@"Soft"]){
                hairType = @"Narcisus";
            }
        }
        else if([momsHair isEqualToString:@"Deep"]){
            if ([dadsHair isEqualToString:@"Soft"]){
                hairType = @"Tulip";
            }
        }
        else if([momsHair isEqualToString:@"Soft"]){
            if ([dadsHair isEqualToString:@"Soft"]){
                hairType = @"Carnation";
            }
        }
        return hairType;
        
    }
@end
