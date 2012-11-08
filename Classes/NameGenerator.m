//
//  NameGenerator.m
//  Microlending
//
//  Created by Benjamin Mozenter on 11/4/12.
//
//

#import "NameGenerator.h"


@implementation NameGenerator: NSObject


@synthesize nameParts;

-(id) init{
    if(self == [super init]){
        [self.nameParts addObject:@"a"];
        [self.nameParts addObject:@"ai"];
        [self.nameParts addObject:@"al"];
        [self.nameParts addObject:@"an"];
        [self.nameParts addObject:@"app"];
        [self.nameParts addObject:@"aun"];
        [self.nameParts addObject:@"awl"];
        [self.nameParts addObject:@"bee"];
        [self.nameParts addObject:@"ben"];
        [self.nameParts addObject:@"beth"];
        [self.nameParts addObject:@"bing"];
        [self.nameParts addObject:@"bo"];
        [self.nameParts addObject:@"bro"];
        [self.nameParts addObject:@"cay"];
        [self.nameParts addObject:@"cro"];
        [self.nameParts addObject:@"ding"];
        [self.nameParts addObject:@"dot"];
        [self.nameParts addObject:@"e"];
        [self.nameParts addObject:@"eli"];
        [self.nameParts addObject:@"elk"];
        [self.nameParts addObject:@"ete"];
        [self.nameParts addObject:@"fa"];
        [self.nameParts addObject:@"far"];
        [self.nameParts addObject:@"fra"];
        [self.nameParts addObject:@"ga"];
        [self.nameParts addObject:@"gram"];
        [self.nameParts addObject:@"gre"];
        [self.nameParts addObject:@"grog"];
        [self.nameParts addObject:@"gur"];
        [self.nameParts addObject:@"ha"];
        [self.nameParts addObject:@"hew"];
        [self.nameParts addObject:@"hil"];
        [self.nameParts addObject:@"how"];
        [self.nameParts addObject:@"il"];
        [self.nameParts addObject:@"im"];
        [self.nameParts addObject:@"ing"];
        [self.nameParts addObject:@"jak"];
        [self.nameParts addObject:@"jen"];
        [self.nameParts addObject:@"jet"];
        [self.nameParts addObject:@"jin"];
        [self.nameParts addObject:@"jo"];
        [self.nameParts addObject:@"ju"];
        [self.nameParts addObject:@"ka"];
        [self.nameParts addObject:@"kat"];
        [self.nameParts addObject:@"kew"];
        [self.nameParts addObject:@"kit"];
        [self.nameParts addObject:@"ko"];
        [self.nameParts addObject:@"law"];
        [self.nameParts addObject:@"lee"];
        [self.nameParts addObject:@"len"];
        [self.nameParts addObject:@"let"];
        [self.nameParts addObject:@"lil"];
        [self.nameParts addObject:@"ling"];
        [self.nameParts addObject:@"lit"];
        [self.nameParts addObject:@"lo"];
        [self.nameParts addObject:@"ma"];
        [self.nameParts addObject:@"may"];
        [self.nameParts addObject:@"me"];
        [self.nameParts addObject:@"mi"];
        [self.nameParts addObject:@"mo"];
        [self.nameParts addObject:@"na"];
        [self.nameParts addObject:@"ni"];
        [self.nameParts addObject:@"no"];
        [self.nameParts addObject:@"od"];
        [self.nameParts addObject:@"og"];
        [self.nameParts addObject:@"ol"];
        [self.nameParts addObject:@"pa"];
        [self.nameParts addObject:@"pat"];
        [self.nameParts addObject:@"pet"];
        [self.nameParts addObject:@"po"];
        [self.nameParts addObject:@"qu"];
        [self.nameParts addObject:@"que"];
        [self.nameParts addObject:@"ra"];
        [self.nameParts addObject:@"ray"];
        [self.nameParts addObject:@"re"];
        [self.nameParts addObject:@"ri"];
        [self.nameParts addObject:@"rit"];
        [self.nameParts addObject:@"row"];
        [self.nameParts addObject:@"sal"];
        [self.nameParts addObject:@"sam"];
        [self.nameParts addObject:@"sas"];
        [self.nameParts addObject:@"say"];
        [self.nameParts addObject:@"si"];
        [self.nameParts addObject:@"sing"];
        [self.nameParts addObject:@"sis"];
        [self.nameParts addObject:@"sit"];
        [self.nameParts addObject:@"so"];
        [self.nameParts addObject:@"ste"];
        [self.nameParts addObject:@"tie"];
        [self.nameParts addObject:@"tong"];
        [self.nameParts addObject:@"tu"];
        [self.nameParts addObject:@"u"];
        [self.nameParts addObject:@"uju"];
        [self.nameParts addObject:@"up"];
        [self.nameParts addObject:@"vie"];
        [self.nameParts addObject:@"vi"];
        [self.nameParts addObject:@"vo"];
        [self.nameParts addObject:@"vow"];
        [self.nameParts addObject:@"wa"];
        [self.nameParts addObject:@"wi"];
        [self.nameParts addObject:@"xen"];
        [self.nameParts addObject:@"xi"];
        [self.nameParts addObject:@"yaw"];
        [self.nameParts addObject:@"yen"];
        [self.nameParts addObject:@"yi"];
        [self.nameParts addObject:@"ze"];
        [self.nameParts addObject:@"zin"];
        [self.nameParts addObject:@"zo"];
        }
    return self;
}

-(NSString *) generateName{
    
    NSMutableString *name = (NSMutableString *)[nameParts objectAtIndex:(rand() % ([nameParts count]))];
    [name appendString:((NSString *)[nameParts objectAtIndex:(rand() %([nameParts count]))])];
    int random = rand() % 2;
    for(int i = 0; i<random; i++){
        [name appendString:((NSString *)[nameParts objectAtIndex:(rand() % ([nameParts count]))])];
    }
    NSString *finalName = [self capitalize:  name];
    return finalName;
}

-(NSString *) capitalize: (NSString *)string
{
    return [NSString stringWithFormat:@"%@%@",[[string substringToIndex:1]capitalizedString], [string substringFromIndex:1]];
}


@end




