//
//  Parser.m
//  CM-Json
//
//  Created by Walter Gonzalez Domenzain on 11/07/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import "Parser.h"

@implementation Parser

+ (void)parseWeather:(NSDictionary*)json {
    //check for valid value
    if(json != nil){
        NSDictionary    *main = [json valueForKey: @"main"];
        NSDictionary    *weather = [json valueForKey: @"weather"];
        NSString *tmp = [NSString stringWithFormat:@"%@", [weather valueForKey:@"icon"]];
        NSString *tmp2 = [tmp substringWithRange:NSMakeRange([tmp rangeOfString:@"("].location+6, 3)];
        mstIcon     = [NSString stringWithFormat:@"http://openweathermap.org/img/w/%@.png", tmp2];//[weather valueForKey:@"icon"]];
        mstTemp     = [self toCelcius:[[main valueForKey: @"temp"]doubleValue]];
        mstTempMax  = [self toCelcius:[[main valueForKey: @"temp_max"]doubleValue]];
        mstTempMin  = [self toCelcius:[[main valueForKey: @"temp_min"]doubleValue]];
        mstHumidity = [NSString stringWithFormat:@"%@ %@", [[main valueForKey: @"humidity"]stringValue], @"%"];
        mstPressure = [NSString stringWithFormat:@"%@ atm", [[main valueForKey: @"pressure"]stringValue]];
    }
}
+ (NSString *) toCelcius:(double)tempK {
    // ºC = K - 273.15
    double tempC = tempK - 273.15;
    NSString *strTempCelcius = [NSString stringWithFormat:@"%.2f ˚C", tempC];
    return strTempCelcius;
}

@end
