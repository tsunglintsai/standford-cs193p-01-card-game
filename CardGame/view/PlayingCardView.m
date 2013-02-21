//
//  PlayingCardView.m
//  CardGame
//
//  Created by Henry on 2/18/13.
//  Copyright (c) 2013 Henry. All rights reserved.
//

#import "PlayingCardView.h"
@interface PlayingCardView()
@end

@implementation PlayingCardView


-(void) setSuit:(NSString *)suit{
    _suit = suit;
    [self setNeedsDisplay];
}

-(void) setRank:(NSUInteger)rank{
    _rank = rank;
    [self setNeedsDisplay];
}

-(void) setFaceup:(BOOL)faceup{
    _faceup = faceup;
    [self setNeedsDisplay];
}


-(void)drawRect:(CGRect)rect{
    UIImage *imageToDraw;
    if(self.faceup){
        imageToDraw = [self playingCardImage];
    }else{
        imageToDraw = [UIImage imageNamed:@"CardBack.png"];
    }
    imageToDraw = [[self class]image:imageToDraw ScaledToFitSize:self.bounds.size];
    [imageToDraw drawAtPoint:CGPointMake(0, 0)];
}

+ (UIImage *)image:(UIImage*)image ScaledToFitSize:(CGSize)size
{
    //calculate rect
    CGFloat aspect = image.size.width / image.size.height;
    if (size.width / aspect <= size.height)
    {
        return [[self class]image:image scaledToSize:CGSizeMake(size.width, size.width / aspect)];
    }
    else
    {
        return [[self class]image:image scaledToSize:CGSizeMake(size.height * aspect, size.height)];
    }
}

+ (UIImage *)image:(UIImage*)image scaledToSize:(CGSize)size
{
    //create drawing context
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0f);
    
    //draw
    [image drawInRect:CGRectMake(0.0f, 0.0f, size.width, size.height)];
    
    //capture resultant image
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //return image
    return resultImage;
}


-(UIImage*) playingCardImage{
    UIImage *playingCardImage;
    NSDictionary *suitName = @{@"♥":@"heart", @"♦":@"diamond", @"♠":@"spade", @"♣":@"club"};
    NSString *filePrefix = [suitName objectForKey:self.suit];
    if(filePrefix){
        NSString *fileName = [@[filePrefix,[NSNumber numberWithInteger:self.rank]] componentsJoinedByString:@"-"];
        playingCardImage = [UIImage imageNamed:fileName];
    }
    return playingCardImage;
}


#pragma mark - Initialization
-(void)setup{
    // do inialization here
}

-(void)awakeFromNib{
    [self setup];
}

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    [self setup];
    return self;
}

@end
