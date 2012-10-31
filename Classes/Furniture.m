//
//  Furniture.m
//  Microlending
//
//  Created by guest user on 10/4/12.
//
//

#import "Furniture.h"

@implementation Furniture

@synthesize desire1 = desire1_, desire2 = desire2_, itemName = itemName_, itemLevel = itemLevel_, users = users_, useTime = useTime_, itemWidth = itemWidth_, happinessReward1 = happinessReward1_, happinessReward2 = happinessReward2_, purchaseCost = purchaseCost_, coinsCost = coinsCost_, leavesCost = leavesCost_, furnPic = furnPic_;

/*
//Make it illegal to initialize the class
- (id)init
{
    [self doesNotRecognizeSelector:_cmd];
    [self release];
    return nil;
} */

- (id)initWithCoder:(NSCoder *)decoder {
    if (self = [super init]) {
        self.itemName = [decoder decodeObjectForKey:@"itemName"];
        self.desire1 = [decoder decodeObjectForKey:@"desire1"];
        self.desire2 = [decoder decodeObjectForKey:@"desire2"];
        self.itemLevel = [decoder decodeIntegerForKey:@"itemLevel"];
        self.users = [decoder decodeIntegerForKey:@"users"];
        self.useTime = [decoder decodeIntegerForKey:@"useTime"];
        self.itemWidth = [decoder decodeIntegerForKey:@"itemWidth"];
        self.happinessReward1 = [decoder decodeIntegerForKey:@"happinessReward1"];
        self.happinessReward2 = [decoder decodeIntegerForKey:@"happinessReward2"];
        self.purchaseCost = [decoder decodeIntegerForKey:@"purchaseCost"];
        self.coinsCost = [decoder decodeIntegerForKey:@"coinsCost"];
        self.leavesCost = [decoder decodeIntegerForKey:@"leavesCost"];
        self.furnPic = [decoder decodeObjectForKey:@"furnPic"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:itemName forKey:@"itemName"];
    [encoder encodeObject:desire1 forKey:@"desire1"];
    [encoder encodeObject:desire2 forKey:@"desire2"];
    [encoder encodeInteger:itemLevel forKey:@"itemLevel"];
    [encoder encodeInteger:users forKey:@"users"];
    [encoder encodeInteger:useTime forKey:@"useTime"];
    [encoder encodeInteger:itemWidth forKey:@"itemWidth"];
    [encoder encodeInteger:happinessReward1 forKey:@"happinessReward1"];
    [encoder encodeInteger:happinessReward2 forKey:@"happinessReward2"];
    [encoder encodeInteger:purchaseCost forKey:@"purchaseCost"];
    [encoder encodeInteger:coinsCost forKey:@"coinsCost"];
    [encoder encodeInteger:leavesCost forKey:@"leavesCost"];
    [encoder encodeObject:furnPic forKey:@"furnPic"];
}

-(void)setFurnitureName:(NSString *)name
{
    itemName = name;
}
-(void)setFurnitureLevel:(NSInteger)level
{
    itemLevel = level;
}
-(void)setNumUsers:(NSInteger)NumUsers
{
    users = NumUsers;
}
-(void)setUseTime:(NSInteger)time
{
    useTime = time; 
}
-(void)setItemWidth:(NSInteger)width
{
    itemWidth = width;
}
-(void)setDesire1:(NSString *)desire
{
    desire1 = desire;
}
-(void)setDesire2:(NSString *)desire
{
    desire2 = desire;
}
-(void)setHappinessReward1:(NSInteger)happiness
{
    happinessReward1 = happiness;
}
-(void)setHappinessReward2:(NSInteger)happiness
{
    happinessReward2 = happiness;
}
-(void)setPurchaseCostCoins:(NSInteger)cost
{
    purchaseCost = cost;
}
-(void)setUpgradeCostLeaves:(NSInteger)cost
{
    leavesCost = cost;
}
-(void)setUpgradeCostCoins:(NSInteger)cost
{
    coinsCost = cost;
}

-(void) dealloc
{/*
    [desire1 release];
    [desire2 release];
    [itemName release];
  */ //WHY DOES IT CRASH WHEN I DEALLOC THE ABOVE 3 @property variables?
    [super dealloc];
}
-(CGRect) getBounds{
    CGSize size = [self contentSize];
    size.width *= scaleX_;
    size.height += scaleY_;
    return CGRectMake( position_.x - size.width* anchorPoint_.x,
                      position_.y - size.height* anchorPoint_.y, size.width,
                      size.height);
}
@end
