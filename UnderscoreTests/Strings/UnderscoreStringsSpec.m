//
//  UnderscoreSpec.m
//  Underscore
//
//  Created by Vasco d'Orey on 16/11/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "Underscore+Strings.h"

SpecBegin(UnderscoreStrings)

describe(@"trim: get rid of unneccessary whitespace characters.", ^{
    it(@"should behave with nil", ^{
        expect(Underscore.string(nil).trim.unwrap).to.beNil;
        expect(Underscore.trim(nil)).to.beNil;
    });
    
    it(@"should work with empty strings", ^{
        expect(Underscore.string(@"").trim.unwrap).to.equal(@"");
        expect(Underscore.trim(@"")).to.equal(@"");
    });
    
    it(@"should work with leading whitespace", ^{
        expect(Underscore.string(@" underscore strings will be pretty useful")
               .trim
               .unwrap).to.equal(@"underscore strings will be pretty useful");
        expect(Underscore.trim(@" underscore strings will be pretty useful")).to.equal(@"underscore strings will be pretty useful");
    });
    
    it(@"should work with trailing whitespace", ^{
        expect(Underscore.string(@"underscore strings will be pretty useful ")
               .trim
               .unwrap).to.equal(@"underscore strings will be pretty useful");
        expect(Underscore.trim(@"underscore strings will be pretty useful ")).to.equal(@"underscore strings will be pretty useful");
    });
    
    it(@"should work without any whitespace", ^{
        expect(Underscore.string(@"underscore").trim.unwrap).to.equal(@"underscore");
        expect(Underscore.trim(@"underscore")).to.equal(@"underscore");
    });
    
    it(@"should work with only whitespace", ^{
        expect(Underscore.string(@"   ").trim.unwrap).to.equal(@" ");
        expect(Underscore.trim(@"   ")).to.equal(@" ");
        expect(Underscore.string(@"  ").trim.unwrap).to.equal(@"");
        expect(Underscore.trim(@"  ")).to.equal(@"");
        expect(Underscore.string(@" ").trim.unwrap).to.equal(@"");
        expect(Underscore.trim(@" ")).to.equal(@"");
    });
});

describe(@"capitalize: uppercase the first letter of a string.", ^{
    it(@"should behave with nil", ^{
        expect(Underscore.string(nil).capitalize.unwrap).to.beNil;
        expect(Underscore.capitalize(nil)).to.beNil;
    });
    
    it(@"should work with empty strings", ^{
        expect(Underscore.string(@"").capitalize.unwrap).to.equal(@"");
        expect(Underscore.capitalize(@"")).to.equal(@"");
    });
    
    it(@"should behave with lowercase strings", ^{
        expect(Underscore.string(@"hello").capitalize.unwrap).to.equal(@"Hello");
        expect(Underscore.capitalize(@"hello")).to.equal(@"Hello");
    });
    
    it(@"should behave with capitalized strings", ^{
        expect(Underscore.string(@"Hello There").capitalize.unwrap).to.equal(@"Hello There");
        expect(Underscore.capitalize(@"Hello There")).to.equal(@"Hello There");
    });
    
    it(@"should behave with uppercase strings", ^{
        expect(Underscore.string(@"HELLO THERE").capitalize.unwrap).to.equal(@"Hello There");
        expect(Underscore.capitalize(@"HELLO THERE")).to.equal(@"Hello There");
    });
    
    it(@"should keep whitespace intact", ^{
        expect(Underscore.string(@"       HELLO THERE How are you").capitalize.unwrap).to.equal(@"       Hello There How Are You");
        expect(Underscore.capitalize(@"       HELLO THERE How are you")).to.equal(@"       Hello There How Are You");
    });
});

describe(@"lowercase: make all characters in the string lowercase", ^{
    it(@"should behave with nil", ^{
        expect(Underscore.string(nil).lowercase.unwrap).to.beNil;
        expect(Underscore.lowercase(nil)).to.beNil;
    });
    
    it(@"should work with empty strings", ^{
        expect(Underscore.string(@"").lowercase.unwrap).to.equal(@"");
        expect(Underscore.lowercase(@"")).to.equal(@"");
    });
    
    it(@"should behave with lowercase strings", ^{
        expect(Underscore.string(@"hello").lowercase.unwrap).to.equal(@"hello");
        expect(Underscore.lowercase(@"hello")).to.equal(@"hello");
    });
    
    it(@"should behave with capitalized strings", ^{
        expect(Underscore.string(@"Hello There").lowercase.unwrap).to.equal(@"hello there");
        expect(Underscore.lowercase(@"Hello There")).to.equal(@"hello there");
    });
    
    it(@"should behave with uppercase strings", ^{
        expect(Underscore.string(@"HELLO THERE").lowercase.unwrap).to.equal(@"hello there");
        expect(Underscore.lowercase(@"HELLO THERE")).to.equal(@"hello there");
    });
    
    it(@"should keep whitespace intact", ^{
        expect(Underscore.string(@"       HELLO THERE How are you").lowercase.unwrap).to.equal(@"       hello there how are you");
        expect(Underscore.lowercase(@"       HELLO THERE How are you")).to.equal(@"       hello there how are you");
    });
});

describe(@"uppercase: make all characters in the string uppercase", ^{
    it(@"should behave with nil", ^{
        expect(Underscore.string(nil).uppercase.unwrap).to.beNil;
        expect(Underscore.uppercase(nil)).to.beNil;
    });
    
    it(@"should work with empty strings", ^{
        expect(Underscore.string(@"").uppercase.unwrap).to.equal(@"");
        expect(Underscore.uppercase(@"")).to.equal(@"");
    });
    
    it(@"should behave with lowercase strings", ^{
        expect(Underscore.string(@"hello").uppercase.unwrap).to.equal(@"HELLO");
        expect(Underscore.uppercase(@"hello")).to.equal(@"HELLO");
    });
    
    it(@"should behave with capitalized strings", ^{
        expect(Underscore.string(@"Hello There").uppercase.unwrap).to.equal(@"HELLO THERE");
        expect(Underscore.uppercase(@"Hello There")).to.equal(@"HELLO THERE");
    });
    
    it(@"should behave with uppercase strings", ^{
        expect(Underscore.string(@"HELLO THERE").uppercase.unwrap).to.equal(@"HELLO THERE");
        expect(Underscore.uppercase(@"HELLO THERE")).to.equal(@"HELLO THERE");
    });
    
    it(@"should keep whitespace intact", ^{
        expect(Underscore.string(@"       HELLO THERE How are you").uppercase.unwrap).to.equal(@"       HELLO THERE HOW ARE YOU");
        expect(Underscore.uppercase(@"       HELLO THERE How are you")).to.equal(@"       HELLO THERE HOW ARE YOU");
    });
});

describe(@"strip: remove occurences of a substring from a string", ^{
    it(@"should behave with nil", ^{
        expect(Underscore.string(nil).strip(nil).unwrap).to.beNil;
        expect(Underscore.strip(nil, nil)).to.beNil;
        expect(Underscore.string(@"hey").strip(nil).unwrap).to.beNil;
        expect(Underscore.strip(@"hey", nil)).to.beNil;
        expect(Underscore.string(nil).strip(@"abc").unwrap).to.beNil;
        expect(Underscore.strip(nil, @"abc")).to.beNil;
    });
    
    it(@"should behave with empty strings", ^{
        expect(Underscore.string(@"").strip(@"abc").unwrap).to.equal(@"");
        expect(Underscore.strip(@"", @"abc")).to.equal(@"");
    });
    
    it(@"should remove substrings correctly", ^{
        expect(Underscore.string(@"It was the best of times, it was the worst of times")
               .strip(@",")
               .unwrap).to.equal(@"It was the best of times it was the worst of times");
        expect(Underscore.strip(@"It was the best of times, it was the worst of times"
                                , @",")).to.equal(@"It was the best of times it was the worst of times");
        expect(Underscore.string(@"aaabbbccc").strip(@"b").unwrap).to.equal(@"aaaccc");
        expect(Underscore.strip(@"aaabbbccc", @"b")).to.equal(@"aaaccc");
        expect(Underscore.string(@"aaabbbccc").strip(@"bb").unwrap).to.equal(@"aaabccc");
        expect(Underscore.strip(@"aaabbbccc", @"bb")).to.equal(@"aaabccc");
    });
    
    it(@"should behave when the substring doesn't exist", ^{
        expect(Underscore.string(@"It was the best of times, it was the worst of times")
               .strip(@"zzz")
               .unwrap).to.equal(@"It was the best of times, it was the worst of times");
        expect(Underscore.strip(@"It was the best of times, it was the worst of times",
                                @"zzz")).to.equal(@"It was the best of times, it was the worst of times");
        expect(Underscore.string(@"aaabbbccc").strip(@"d").unwrap).to.equal(@"aaabbbccc");
        expect(Underscore.strip(@"aaabbbccc", @"d")).to.equal(@"aaabbbccc");
    });
});

describe(@"split: split the string into an array with the components separated by the spaces", ^{
    it(@"should behave with nil", ^{
        expect(Underscore.string(nil).split(nil).unwrap).to.beNil;
        expect(Underscore.split(nil, nil)).to.beNil;
        expect(Underscore.string(@" this is a long string").split(nil).unwrap).to.beNil;
        expect(Underscore.split(@" this is a long string", nil)).to.beNil;
    });
    
    it(@"should behave with empty strings", ^{
        expect(Underscore.string(@"").split(@" ").unwrap).to.equal(@[ @"" ]);
        expect(Underscore.split(@"", @" ")).to.equal(@[ @"" ]);
    });
    
    it(@"should behave with single words", ^{
        expect(Underscore.string(@"hello").split(@" ").unwrap).to.equal(@[ @"hello" ]);
        expect(Underscore.split(@"hello", @" ")).to.equal(@[ @"hello" ]);
        expect(Underscore.string(@" hello ").split(@" ").unwrap).to.equal((@[ @"", @"hello", @"" ]));
        expect(Underscore.split(@" hello ", @" ")).to.equal((@[ @"", @"hello", @"" ]));
    });
    
    it(@"should behave with multiple words", ^{
        expect(Underscore.string(@"hello underscore strings").split(@" ").unwrap).to.equal((@[ @"hello", @"underscore", @"strings" ]));
        expect(Underscore.split(@"hello underscore strings", @" ")).to.equal((@[ @"hello", @"underscore", @"strings" ]));
        expect(Underscore.string(@" hello  underscore strings ")
               .split(@" ")
               .unwrap).to.equal((@[ @"", @"hello", @"", @"underscore", @"strings", @"" ]));
        expect(Underscore.split(@" hello  underscore strings ", @" ")).to.equal((@[ @"", @"hello", @"", @"underscore", @"strings", @"" ]));
    });
    
    it(@"should behave with diferent separators", ^{
        expect(Underscore.string(@"hello underscore strings").split(@"n").unwrap).to.equal((@[ @"hello u", @"derscore stri", @"gs"]));
        expect(Underscore.split(@"hello underscore strings", @"n")).to.equal((@[ @"hello u", @"derscore stri", @"gs"]));
        
        NSString *bestWorstTestString = @"It was the best of times, it was the worst of times";
        NSArray *bestWorstSplit = @[ @"I", @" was ", @"he bes", @" of ", @"imes, i", @" was ", @"he wors", @" of ", @"imes"];
        expect(Underscore.string(bestWorstTestString).split(@"t").unwrap).to.equal(bestWorstSplit);
        expect(Underscore.split(bestWorstTestString , @"t")).to.equal(bestWorstSplit);
        
        NSString *heyTestString = @"hey this is another string hey yeah";
        NSArray *heyAnotherStringSplit = @[ @"", @" this is another string ", @" yeah" ];
        expect(Underscore.string(heyTestString) .split(@"hey").unwrap).to.equal(heyAnotherStringSplit);
        expect(Underscore.split(heyTestString , @"hey")).to.equal(heyAnotherStringSplit);
    });
});

describe(@"join: joins the given array adding the given string between each component", ^{
    it(@"should behave with nil", ^{
        expect(Underscore.array(@[ @"a" ]).join(nil).unwrap).to.beNil;
        expect(Underscore.join(@[ @"a" ], nil)).to.beNil;
        expect(Underscore.array(nil).join(nil).unwrap).to.beNil;
        expect(Underscore.join(nil, nil)).to.beNil;
        expect(Underscore.array(nil).join(@"abc").unwrap).to.beNil;
        expect(Underscore.join(nil, @"abc")).to.beNil;
    });
    
    it(@"should behave with empty arrays", ^{
        expect(Underscore.array(@[ ]).join(@"h").unwrap).to.equal(@"");
        expect(Underscore.join(@[ ], @"h")).to.equal(@"");
    });
    
    it(@"should join arrays correctly", ^{
        expect(Underscore.array(@[ @"it", @"was", @"the", @"best" ]).join(@", ").unwrap).to.equal(@"it, was, the, best");
        expect(Underscore.join(@[ @"it", @"was", @"the", @"best" ], @", ")).to.equal(@"it, was, the, best");
    });
    
    it(@"should handle non string objects", ^{
        expect(Underscore.array(@[ @"string", [NSNull null]]).join(@", ").unwrap).to.equal(@"string, <null>");
        expect(Underscore.join(@[ @"string", [NSNull null]], @", ")).to.equal(@"string, <null>");
    });
});

describe(@"Underscore.strings should work with chaining", ^{
    it(@"should behave with nil", ^{
        expect(Underscore.string(nil)
               .strip(nil)
               .trim
               .capitalize
               .split(nil)
               .unwrap).to.beNil;
        expect(Underscore.string(nil)
               .lowercase
               .capitalize
               .uppercase
               .strip(@"hey")
               .unwrap).to.beNil;
    });
    
    it(@"should behave as intended", ^{
        expect(Underscore.string(@"It was the best of times, it was the worst of times")
               .lowercase
               .strip(@",")
               .split(@" ")
               .uniq
               .join(@", ")
               .unwrap).to.equal(@"it, was, the, best, of, times, worst");
    });
});

SpecEnd
