//
//  Vocabulary.swift
//  Bopomofo Studio
//
//  Created by Nelson Aquino Jr  on 7/24/21.
//

import SwiftUI

class VocabularyList: ObservableObject{
    @Published var testCharacters = [""]
    @Published var testPronunciation = [""]

    @Published var activitiesBPMF = ["ㄌㄨˋㄧㄥˊ","ㄌㄧㄡ ㄅㄧㄥ "]
    @Published var activitiesTranslation = ["Camping","Ice Skate"]
    
    @Published var alcoholBPMF = ["ㄨㄟ ㄕˋㄐㄧˋ","ㄈㄨˊㄊㄜˋㄐㄧㄚ ","ㄆㄨˊㄊㄠ˙ㄐㄧㄡˇ","ㄌㄢˊㄈㄨˇㄐㄧㄡˇ","ㄆㄧˊㄐㄧㄡˇ","ㄐㄧㄡˇㄌㄧㄤˋ"]
    @Published var alcoholTranslation = ["Whiskey","Vodka","Wine","Rum","Beer","Tolerance"]
    
    @Published var animalsBPMF = ["ㄔㄨㄥˊㄗ˙","ㄉㄧㄥ ","ㄉㄚˋㄒㄧㄥ ㄒㄧㄥ˙","ㄧㄚ ㄗ˙","ㄆㄧˊㄒㄧㄡ "]
    @Published var animalsTranslation = ["Insects","To Sting","Gorilla","Duck","Mythical\n(dragon head;\nlion body)"]
    
    @Published var bodyRelatedBPMF = ["ㄓㄥ ㄊㄧˇ","ㄊㄧˇㄨㄣ ","ㄐㄧㄠˇㄐㄧㄢ ","ㄐㄧㄠˇㄅㄟˋ","ㄓㄨㄥ ㄒㄧㄣ ","ㄒㄩㄥ ㄎㄡˇ","ㄕㄡˇㄓˇㄐㄧㄚ˙","ㄊㄨㄟˇ","ㄒㄧㄝˇ","ㄎㄡˇㄑㄧˋ","ㄈㄚˋㄨㄟˇ","ㄅㄛˊㄗ˙","ㄐㄧㄠˇㄏㄨㄞˊ","ㄍㄨˇㄊㄡ˙","ㄊㄨ ㄊㄡˊ","ㄅㄟˋ","ㄊㄨㄟˇㄐㄧㄠˇ","ㄕㄡˇㄨㄢˋ","ㄍㄜ ㄅㄛ˙","ㄕㄡˇㄅㄧˋ","ㄐㄧㄢ ㄅㄤˇ"]
    @Published var bodyRelatedTranslation = ["Limbs","Body\nTemp.","Tip of Toe","Top of Foot","Central\nPoint\nof Weight","Chest","Fingernail","Leg","Blood","Breathe","Hair Ends","Neck","Ankle","Bone","Bald","Back","Legs+Feet","Wrist","Arms","Arms\n(W/ Hands)","Shoulder"]
    
    @Published var bodyRelatedBPMF2 = ["ㄍㄜ ㄅㄛ˙ㄓㄡˇ","ㄒㄧㄚˋㄅㄚ˙","ㄔㄨㄣˊ","ㄌㄧㄢˇㄐㄧㄚˊ","ㄐㄧㄝˊㄇㄠˊ","ㄇㄟˊㄇㄠˊ","ㄜˊㄊㄡˊ","ㄉㄚˋㄊㄨㄟˇ","ㄒㄧㄠˇㄊㄨㄟˇ","ㄖㄢˇㄈㄚˋ"]
    @Published var bodyRelatedTranslation2 = ["Elbow","Chin","Lip","Cheeks","Eyelash","Eyebrows","Forehead","Thigh","Lower Leg","To Dye Hair"]
    
    @Published var breakfastBPMF = ["ㄏㄨㄚ ㄕㄥ "]
    @Published var breakfastTranslation = ["Peanut"]
    
    @Published var clothesBPMF = ["ㄒㄧ ㄓㄨㄤ "]
    @Published var clothesTranslation = ["Western\nSuit"]
    
    @Published var conversationBPMF = ["ㄓㄨㄥˋㄉㄧㄢˇ","ㄏㄨㄟˊㄎㄨㄟˋ","ㄒㄩㄣˋㄏㄠˋ","ㄔㄨㄟ ㄋㄧㄡˊ","ㄈㄚ ㄒㄧㄝˋ","ㄏㄢˊㄧˋ","ㄇㄧㄢˋㄉㄨㄟˋ","ㄕㄥ ㄕㄨ ","ㄔㄨㄛˋㄏㄠˋ","ㄍㄡ ㄊㄨㄥ ","ㄇㄧㄥˊㄑㄩㄝˋ","ㄧ ㄐㄧㄢˋ","ㄒㄧㄣ ㄌㄧㄥˇ","ㄊㄨㄥˇㄎㄨㄞ˙","ㄊㄧˊㄑㄧˇ","ㄇㄚˋ","ㄅㄠˋㄩㄢˋ","ㄌㄨㄢˋㄐㄧㄤˇ","ㄌㄨˋㄧㄣ ","ㄧㄣˇㄙ "]
    @Published var conversationTranslation = ["Main Point","Feedback","Reception\nor Signal","To Brag","To Vent","Implied\nMeaning","To Confront","To Be Rusty","Nickname","To Communicate","Accurate\nTo Make Clear\nClear","An Objection","To Understand\nBut Reject","Straightforward\nDirect","To Mention","To Scold","To Complain","To speak\ncarelessly","Sound\nRecording","Secrets"]
    

    @Published var conversationBPMF2 = ["ㄒㄧㄚˋㄌㄧㄡˊㄏㄨㄚˋ","ㄉㄚˇㄉㄨㄢˋ","ㄓㄨㄥ ㄉㄨㄢˋ","ㄒㄩˋㄐㄧㄡˋ","ㄨˋㄐㄧㄝˇ","ㄎㄡˇㄩˇ"]
    @Published var conversationTranslation2 = ["Dirty\nWords","To Interrupt","To Interrupt","To talk about\nthe past","To Misunderstand","Colloquial"]
    
    @Published var covid19BPMF = ["ㄐㄧㄝˇㄔㄨˊ","ㄓㄥˋㄈㄨˇ","ㄍㄢˇㄖㄢˇ","ㄖㄣˊㄕㄨˋ","ㄧˋㄇㄧㄠˊ","ㄉㄚˇ","ㄔㄨㄢˊㄖㄢˇ","ㄧˋㄑㄧㄥˊ","ㄍㄜˊㄌㄧˊ","ㄅㄠˋㄈㄚ "]
    @Published var covid19Translation = ["To Remove\n(A level)","Government","Infection","Number\nof People","Vaccine","To take\n(vaccine)","To infect\n(others)","Epidemic\nSituation\n(Covid)","Quarantine","To Break\nOut\nOutbreak"]
    
    @Published var cleaningBPMF = ["ㄇㄛˇㄅㄨˋ","ㄋㄧˊㄊㄨˇ"]
    @Published var cleaningTranslation = ["Cleaning\nRag","Dirt"]
    
    @Published var dessertBPMF = ["ㄒㄧㄢ ㄘㄠˇ","ㄒㄧㄥˋㄖㄣˊ","ㄨㄟˋㄘㄥ ","ㄅㄨˋㄌㄤˇㄋㄧˊ"]
    @Published var dessertTranslation = ["Grass Jelly","Almond","Miso","Brownie"]
    
    @Published var drivingBPMF = ["ㄔㄜ ㄎㄨˋ","ㄉㄤˇ","ㄕㄡˇㄆㄞˊ","ㄓㄨㄢˇㄨㄢ ","ㄌㄨㄣˊㄗ˙","ㄔㄜ ㄉㄥ ","ㄢ ㄑㄩㄢˊㄉㄞˋ","ㄉㄠˋㄉㄤˇ","ㄘㄞˇ","ㄧㄡˊㄇㄣˊ","ㄗˋㄆㄞˊ","ㄔㄜ ㄉㄠˋ","ㄊㄧㄥˊㄔㄜ ㄨㄟˋ"]
    @Published var drivingTranslation = ["Garage","Gear","Manual\nTransmission","Corner;Turn","Wheel","Headlights","Seat Belt","Reverse\nGear","To Step On","Throttle","Automatic\nTransmission","Traffic\nLane","Parking\nSpace"]
    
    @Published var emotionBPMF = ["ㄎㄨㄞˋㄌㄜˋ","ㄋㄢˊㄍㄨㄛˋ","ㄕㄥ ㄑㄧˋ","ㄎㄨㄣˋㄏㄨㄛˋ","ㄕㄨ ㄈㄨ","ㄌㄨˇㄇㄤˇ","ㄑㄧˋㄓㄚˋ","ㄢ ㄨㄟˋ","ㄎㄜˋㄈㄨˊ","ㄏㄨㄞˊㄧˊ","ㄗㄞˋㄏㄨ","ㄗㄞˋㄧˋ","ㄑㄧ ㄉㄞˋ","ㄈㄢˇㄧㄥˋ","ㄅㄧㄠˇㄑㄧㄥˊ","ㄌㄧㄡˊㄌㄧㄢˋ","ㄋㄧˋ","ㄎㄤˋㄐㄩˋ","ㄍㄢˇㄖㄣˊ","ㄐㄧㄝˋㄧˋ"]
    @Published var emotionTranslation = ["Happy","Sad","Angry","Confused","Comfy","Hot Head","To Burst\nwith Rage","To Comfort","To Endure\nHardships","To Doubt","To Care\n(Neutral)","To Care\n(Bad)","To Look\nForward To","Reaction","Expression","Reluctant\nto Leave","Tired\nof smth.","To Resist","Touching","To Mind"]
    
    @Published var emotionBPMF2 = ["ㄔㄥˊㄕㄡˋ","ㄍㄨ ㄉㄢ ","ㄖㄜˋㄒㄧㄣ ","ㄈㄥ ㄎㄨㄤˊ","ㄕㄨㄤˇ","ㄧㄡˊㄩˋ","ㄒㄧㄣ ㄑㄧㄥˊ","ㄓㄨㄢ ㄓㄨˋ","ㄈㄨˋㄉㄢ ","ㄒㄧㄣ ㄉㄨㄥˋ","ㄐㄩˋㄌㄧˊ","ㄇㄧˊㄌㄧㄢˋ","ㄍㄨˇㄌㄧˋ","ㄅㄧㄠˇㄒㄧㄢˋ","ㄨˊㄙㄨㄛˇㄨㄟˋ","ㄉㄞ ㄓㄨˋ","ㄑㄧㄥˊㄒㄩˋ","ㄍㄢˇㄐㄧ ","ㄧˊㄏㄢˋ","ㄎㄨㄥˇㄆㄚˋ"]
    @Published var emotionTranslation2 = ["To Endure","Lonely","To be Enthusiastic","Insane or\nCrazy","To feel\ngood","To Hesitate","Feeling to\ndo smth.","To Concentrate","To Bear\n(a burden)","Emotinally\nAffected\nHeartbeat","Distant","To Be\nObsessed","To Encourage","Behavior","Indifferent","To Be\nAstonished","Emotions","To Feel\nGrateful","Regret","Afraid That"]
    
    @Published var emotionBPMF3 = ["ㄉㄨˇㄌㄢˋ","ㄒㄧㄣ ㄊㄥˊ","ㄋㄢˊㄕㄡˋ","ㄇㄠˊㄉㄨㄣˋ","ㄊㄨㄥˊㄑㄧㄥˊㄒㄧㄣ ","ㄊㄨㄥˊㄌㄧˇㄒㄧㄣ ","ㄖㄨㄢˇㄌㄢˋ","ㄍㄨㄟ ㄕㄨˇㄍㄢˇ","ㄐㄧㄥ ㄕㄣ"]
    @Published var emotionTranslation3 = ["To be\nticked off","To feel\nsorry","To feel\nuneasy","to feel\nconflicted","Sympathy","Empathy","Lacking\nDrive","Sense of\nBelonging","Energy"]
    
    @Published var exerciseBPMF = ["ㄒㄧㄚˋㄑㄩㄢˇㄕˋ","ㄅㄟˋㄆㄧㄥˊ","ㄐㄧㄢˋㄕㄣ ","ㄩˊㄐㄧㄚ "]
    @Published var exerciseTranslation = ["Downward\nDog","Flat Back","To keep fit\nwith\nexercise","Yoga"]
    
    @Published var familyBPMF = ["ㄦˊㄊㄨㄥˊ","ㄓˊㄗ˙","ㄓˊㄋㄩˇ","ㄒㄧㄠˋㄕㄨㄣˋ","ㄌㄠˇㄆㄛˊ","ㄌㄠˇㄍㄨㄥ ","ㄚ ㄍㄨㄥ ","ㄚ ㄇㄚˊ","ㄨㄞˋㄕㄥ ㄋㄩˇ","ㄨㄞˋㄕㄥ ","ㄅㄧㄠˇ","ㄊㄤˊ"]
    @Published var familyTranslation = ["Children\n(Young)","Nephew\n(Brother's)","Niece\n(Brother's)","Filial","Wife","Husband","Grandpa","Grandma","Niece\n(Sister's)","Nephew\n(Brother's)","Cousin\n(Mom's Side)","Cousin\n(Dad's Side)"]
    
    @Published var financeBPMF = ["ㄓ ㄔㄨ ","ㄕㄡ ㄖㄨˋ","ㄌㄧˋㄖㄨㄣˋ","ㄉㄞˋㄎㄨㄢˇ","ㄏㄜˊㄈㄚˇ","ㄌㄧˋㄒㄧ ","ㄎㄨㄟ ㄑㄧㄢˋ","ㄇㄧㄢˇㄈㄟˋ","ㄕㄚ ㄐㄧㄚˋ","ㄌㄜˋㄊㄡˋ","ㄈㄚˊㄑㄧㄢˊ","ㄒㄧㄣ ㄕㄨㄟˇ"]
    @Published var financeTranslation = ["Expense","Income","Profit","Loan","Legal","Interest","To Owe","Free","To Bargain","Lottery","To Impose\nA Fine","Salary"]
    
    @Published var foodBPMF = ["ㄨㄞˋㄙㄨㄥˋ","ㄍㄨㄟ ㄩˊ","ㄨㄟˇㄩˊ","ㄓㄤ ㄩˊ","ㄒㄧㄚ ㄗ˙","ㄩˊㄨㄢˊ","ㄐㄧㄤˋ"]
    @Published var foodTranslation = ["Delivery","Salmon","Tuna","Octopus","Shrimp","Fish\nBall","Sauce"]
    
    @Published var foodRelatedBPMF = ["ㄎㄨㄞˋㄗ˙","ㄔㄚ ㄗ˙","ㄊㄤ ㄔˊ","ㄆㄢˊㄗ˙","ㄓㄥ ","ㄔㄠˇ","ㄐㄧㄢ ","ㄏㄨㄥ ㄅㄟˋ","ㄉㄠ ㄗ˙","ㄒㄧ ㄍㄨㄢˇ"]
    @Published var foodRelatedTranslation = ["Chopstick","Fork","Soup Spoon","Plate","Steamed","Scrambled","Pan Fried","To Bake","Knife","Straw"]
    
    @Published var fruitBPMF = ["ㄆㄧㄥˊㄍㄨㄛˇ","ㄔㄥˊㄗ˙","ㄘㄠˇㄇㄟˊ","ㄇㄤˊㄍㄨㄛˇ","ㄧㄥ ㄊㄠˊ","ㄌㄢˊㄇㄟˊ","ㄒㄧ ㄍㄨㄚ ","ㄈㄢ ㄑㄧㄝˊ","ㄆㄨˊㄊㄠˊ","ㄌㄧㄡˊㄌㄧㄢˊ","ㄩˋㄏㄜˊㄅㄠ "]
    @Published var fruitTranslation = ["Apple","Orange","Strawberry","Mango","Cherry","Blueberry","Watermelon","Tomato","Grape","Durian","Lychee"]
    
    @Published var gamesBPMF = ["ㄆㄧㄥˊㄊㄨˇ","ㄨㄢˊㄐㄩˋ","ㄧㄥˊㄇㄨˋ","ㄕㄨ ","ㄧㄥˊ"]
    @Published var gamesTranslation = ["Puzzle","Toys","Screen\n(Digital)","To Lose","To Win"]
    
    @Published var generalAdverbsBPMF = ["ㄔㄨㄥ ㄈㄣˋ","ㄅㄨˋㄉㄨㄢˋ","ㄨㄟˊㄧ ","ㄑㄧˊㄓㄨㄥ ","ㄉㄤ ㄓㄨㄥ ","ㄅㄨˋㄍㄢˇ","ㄕㄣˋㄓˋ","ㄌㄠˇㄕ˙","ㄧ ㄉㄨㄢˋㄧ ㄉㄨㄢˋ","ㄧ ㄉㄨㄟ ","ㄧ ㄅㄢ ","ㄇㄧㄢˇㄑㄧㄤˇ","ㄕㄣ ㄕㄤˋ","ㄐㄩㄝˊㄉㄨㄟˋ","ㄕㄠ ㄨㄟ ","ㄍㄢˇㄐㄧㄣˇ","ㄍㄤ ㄏㄠˇ","ㄅㄧㄥˋㄅㄨˋ","ㄖㄣˋㄏㄜˊ","ㄧㄡˊㄑㄧˊ"]
    @Published var generalAdverbsTranslation = ["As much\nas possible","Not\nStopping","Only(Sole)","Among\nThem","Among\n(Location)","Not Dare To","Even","Always\n(neg.)","Section\nby-\nSection","A bunch","Usually\nNormally","Barely\nEnough","On Oneself","Absolutely","Slightly;\nA little","Without\nLosing\nTime","Just About\nTime","Not\nAt All","Any","Specially;\nParticularly"]
    
    @Published var generalAdverbsBPMF2 = ["ㄐㄧㄤ ㄐㄧㄣˋ","ㄅㄞˊ","ㄗㄨㄥˇㄧㄡˇ","ㄖˋㄏㄡˋ","ㄧ ㄕㄨㄣˋ","ㄇㄢˇ","ㄐㄧ ㄏㄨ ","ㄍㄜˋㄓㄨㄥˇ"]
    @Published var generalAdverbsTranslation2 = ["Almost","In Vain","Inevitably","Sometime\n(in the future)","In a flash","Quite","Almost","Every Kind"]
    
    @Published var generalAdjectivesBPMF = ["ㄞˋㄇㄟˋ","ㄒㄧˋㄨㄟˊ","ㄓㄥˋㄇㄧㄢˋ","ㄈㄨˋㄇㄧㄢˋ","ㄉㄤ ㄉㄧˋ","ㄊㄜˋㄕㄨ ","ㄩˊㄔㄨㄣˇ","ㄨㄣ ㄋㄨㄢˇ","ㄒㄩ ㄏㄨㄢˋ","ㄧㄡˇㄐㄧㄢ ㄅㄤˇ","ㄓㄣ ㄓㄥˋ","ㄕㄣ ","ㄆㄧㄥˊ","ㄗㄠ ㄍㄠ ","ㄓㄣ ㄕˊ","ㄈㄢˇ","ㄕˊㄐㄧˋ","ㄨㄢˊㄇㄟˇ","ㄆㄨˇㄅㄧㄢˋ","ㄇㄛˊㄏㄨ˙","ㄕㄨㄣˋㄌㄨˋ","ㄌㄧㄠˇㄅㄨ˙ㄑㄧˇ"]
    @Published var generalAdjectivesTranslation = ["Ambiguous","Subtle","Positive","Negative","Local","Special\nUncommon","Stupid\n(Mean)","Warm","Imaginary","Responsible","Real;True","Deep","Flat","Worse","True/Fact","Upside down\nInside out","Practical","Perfect","Common\nWidespread","Ambiguous\n(Blurry)","On The Way","Amazing\nExtraordinary"]
    
    @Published var generalAdjectivesBPMF2 = ["ㄅㄧˋㄧㄠˋ","ㄇㄧㄥˊㄒㄧㄢˇ","ㄅㄛˊ","ㄖㄡˊㄖㄨㄣˋ","ㄇㄧˊㄖㄣˊ","ㄋㄧˋㄇㄧㄥˊ","ㄌㄧˇㄒㄧㄤˇ","ㄘㄢˇ","ㄧㄠˊㄩㄢˇ","ㄐㄩˋㄊㄧˇ","ㄒㄩ ㄖㄨㄛˋ","ㄇㄢˇㄧˋ","ㄆㄧㄥˊㄐㄩㄣ ","ㄨㄢˊㄓㄥˇ","ㄌㄧㄡˊㄒㄧㄥˊ","ㄑㄩㄢˊㄇㄧㄢˋ","ㄇㄚˇㄏㄨˇ","ㄇㄢˋㄧㄡ ㄧㄡ ","ㄉㄢ ㄔㄨㄣˊ","ㄒㄧㄣ ㄎㄨˇ"]
    @Published var generalAdjectivesTranslation2 = ["Necessary","Obvious","Thin and\nWeak","Soft and\nsmooth","Enchanting\nFascinating","Anonymous","Ideal","Brutal","Distant;\nFaraway","Specific\nConcrete","Weak","Satisfied","Average","Complete","Popular","Comprehensive","Careless","Unhurried\nLeisurely","Purely","Tough\n(work/life)"]
    
    @Published var generalAdjectivesBPMF3 = ["ㄆㄧㄥˊㄒㄧㄥˊ","ㄐㄧ ㄅㄣˇ","ㄖㄜˋㄋㄠˋ"]
    @Published var generalAdjectivesTranslation3 = ["Simultaneously","Basic (Adj)","Lively"]
    
    @Published var generalNounsBPMF = ["ㄐㄧㄝ ㄉㄨㄢˋ","ㄐㄧˊㄒㄧㄢˋ","ㄎㄜ ㄒㄩㄝˊ","ㄒㄧㄤ ㄈㄢˇ","ㄕㄜˋㄏㄨㄟˋ","ㄖㄣˊㄑㄧㄥˊ","ㄆㄧㄢˋㄐㄧㄢˋ","ㄕˋㄏㄠˋ","ㄎㄜ ㄐㄧˋ","ㄘˋㄕㄨˋ","ㄩˋㄉㄧㄥˋ","ㄔˋㄅㄤˇ","ㄌㄢˊㄗ˙","ㄊㄧㄠˇㄓㄢˋ","ㄘㄨㄛˋㄨˋ","ㄔㄥˊㄈㄚˊ","ㄉㄧˋㄨㄟˋ","ㄅㄠ ㄍㄨㄛˇ","ㄊㄧㄢ ㄧˋ","ㄩㄣˋㄑㄧ˙","ㄐㄧ ㄔㄨˇ"]
    @Published var generalNounsTranslation = ["Phase/\nStage","Limit","Science","Opposite","Society","Favor","Prejudice","Hobby\n(Good at)","Technology","Number\nof Times","Reservations","Wing-like\nthings","Basket","A Challenge","Mistake","Punishment\nPenalty","Position\n(not physical)","Package","Fate","Luck","Foundations\nBasics"]
    
    @Published var generalNounsBPMF2 = ["ㄒㄧㄢˋㄓˋ","ㄉㄨㄣˋㄆㄞˊ","ㄈㄚˇㄩㄢˋ","ㄌㄧˇㄧㄡˊ","ㄩㄢˊㄧㄣ ","ㄓㄨˇㄧ˙","ㄔㄚ ㄑㄩˇ","ㄌㄧㄥˇㄌㄨˋㄖㄣˊ","ㄔㄥˊㄅㄞˋ","ㄓㄨㄟ ㄑㄧㄡˊ","ㄑㄧㄢˊㄊㄧˊ","ㄘㄢ ㄎㄠˇㄉㄧㄢˇ","ㄒㄧ ㄤˇ","ㄑㄧ ㄐㄧㄢ ","ㄩˋㄩㄝ ","ㄓㄨㄥˋㄧㄠˋㄒㄧㄥˋ","ㄍㄨㄛˊㄇㄧㄣˊ","ㄕˋㄕˊ","ㄖㄣˋㄨˋ"]
    @Published var generalNounsTranslation2 = ["Restrictions","Shield","Court","Excuse;\nReason","Cause;\nReason","Idea","A Small\nIncident","A Guide\nLeader","Success or\nFailure","Ambitions","Prerequisite","Reference\nPoint","Thoughts","Time Period","Appointment","Significance\nImportance","Citizens","Facts","Tasks"]
    
    @Published var generalNounsBPMF3 = ["ㄅㄛ ㄌㄧˊ","ㄆㄧㄥˊㄉㄥˇ","ㄩㄢˋㄨㄤˋ","ㄗㄨㄛˋㄈㄚˇ","ㄕㄤˋㄐㄧㄣˋㄒㄧㄣ ","ㄐㄧㄚˋㄓˊ","ㄓㄤˋㄞˋ","ㄍㄨㄛˊㄓㄨㄥ ","ㄓㄥˋㄓˋ","ㄏㄨㄛˇㄅㄢˋ","ㄒㄧㄥˊㄨㄟˊ","ㄒㄧˋㄐㄧㄝˊ","ㄌㄧㄣˊㄐㄩ "]
    @Published var generalNounsTranslation3 = ["Glass","Equality","Wish","Way of\ndoing\nsomething","Desire to\ndo better","Value\nWorth","Obstacle","Junior\nHigh","Politics","Partner","Behavior","Details","Neighbor"]
    
    @Published var generalVerbsBPMF = ["ㄕˋㄊㄨˊ","ㄉㄨˋㄐㄧㄚˋ","ㄩㄥˋㄘㄢ ","ㄓㄥˇㄌㄧˇ","ㄍㄠˇ","ㄊㄧㄠ ","ㄩㄥ ㄧㄡˇ","ㄐㄧㄢˇㄕㄠˇ","ㄅㄠˋㄇㄧㄥˊ","ㄑㄧㄢˋ","ㄒㄧㄤˋㄕㄤˋ","ㄌㄧㄡˊㄉㄨㄥˋ","ㄉㄚ ㄆㄟˋ","ㄓㄨㄣˇㄕˊ","ㄅㄧˋㄇㄧㄢˇ","ㄐㄩㄢ ","ㄒㄧㄤ ㄍㄢ ","ㄔㄨㄤˋㄗㄨㄛˋ","ㄔㄨㄤˋㄗㄠ ","ㄍㄞˇㄗㄠˋ"]
    @Published var generalVerbsTranslation = ["Try to\ndo smth.","Spend One's\nHoliday","Have a Meal","To Organize Things","To Do\n(Bad)","To Pick","To Possess","To Reduce","To Sign Up","To Owe","To Advance\nHigher","To Flow","To Match\n(Clothes,etc)","To be\n on time","To Avoid","To Donate","Have to\ndo with (neg.)","To Create\n(Small)","To Create\n(Big)","Change\n(bc. someone)"]
    
    @Published var generalVerbsBPMF2 = ["ㄍㄞˇㄅㄧㄢˋ","ㄈㄢˋㄍㄨㄟ ","ㄧㄥˋㄧㄠˋ","ㄒㄧㄡ ㄌㄧˇ","ㄔㄠ ㄍㄨㄛˋ","ㄑㄩˇㄒㄧㄠ ","ㄓㄥˋㄇㄧㄥˊ","ㄆㄟˋㄈㄨ˙","ㄈㄟ ㄧㄠˋ","ㄘㄡˋㄏㄜ˙","ㄆㄠ ㄑㄧˋ","ㄅㄧˇㄕˋ","ㄒㄧㄥˊㄖㄨㄥˊ","ㄍㄠˇㄗㄚˊ","ㄊㄧㄠˊㄓㄥˇ","ㄧㄠ ㄑㄧㄡˊ","ㄙㄡ ㄒㄩㄣˊ","ㄈㄣ ㄅㄧㄢˋ","ㄘㄤˊ","ㄔㄨˇㄌㄧˇ","ㄉㄞˋㄅㄧㄠˇ","ㄐㄧㄝˇㄐㄩㄝˊ","ㄑㄧ ㄈㄨ˙","ㄉㄞˋㄌㄧㄥˇ"]
    @Published var generalVerbsTranslation2 = ["To Change","To Break\nRules","Firmly set\non doing\nsth","To Repair","To Go\nPass/Exceed","To Cancel","To Prove","To Admire","To Insist","To Make Do/\nImprovise","To Abandon","To Despise","To Describe","To mess\nsmth. up","To Adjust","To Request","To Search","To Distinguish","To Hide","To Deal With\nTo Handle","To Represent","To fix\na problem","To Bully","To Lead"]
    
    @Published var generalVerbsBPMF3 = ["ㄉㄞˋㄓㄜ˙","ㄓˊㄉㄜ˙","ㄧㄥ ㄉㄜ˙","ㄒㄧㄠ ㄕ ","ㄕ ㄗㄨㄥ ","ㄕㄚ ","ㄉㄢ ㄨˋ","ㄊㄨㄥ ㄖㄨㄥˊ","ㄇㄛˊㄈㄤˇ","ㄎㄜˋㄈㄨˊ","ㄉㄠˋㄅㄧㄝˊ","ㄧㄡˇㄑㄧㄢˊㄐㄧㄥˇ","ㄉㄥˇㄩˊ","ㄔㄥˊㄨㄟˊ","ㄍㄨ ㄐㄧˋ","ㄐㄧㄚ ㄖㄨˋ","ㄍㄢ ㄕㄜˋ","ㄐㄧㄥˇㄍㄠˋ","ㄉㄚˇㄈㄚ "]
    @Published var generalVerbsTranslation3 = ["To Lead\n(Casual)","To Be Worth It","To Deserve","To Disappear","To Disappear\n(Sarcastic,\nSmth. bad\nhappens)","To Kill","To Delay","To bend\nthe rules for\nbenefit","To Imitate","To Overcome","To Say\nGoodbye","To Be\nPromising","To Equal To","To Become\n(End State)","To Estimate","To Join In","To Interfere","To Warn","To Kill\nTime"]
    
    @Published var generalVerbsBPMF4 = ["ㄨㄢˊㄍㄨㄥ ","ㄐㄧㄚ ㄑㄧㄤˊ","ㄙㄨㄢˋㄕˋ","ㄗㄨㄣ ㄓㄨㄥˋ","ㄑㄧㄤˇ","ㄨㄚˇㄐㄧㄝˇ","ㄑㄩˇㄉㄞˋ","ㄊㄨㄟˋㄅㄨˋ","ㄐㄧㄢˋㄅㄧㄢˋ","ㄧ ㄌㄞˋ","ㄅㄠˇㄔˊ","ㄨㄟˊㄔˊ","ㄉㄤˇㄓㄨˋ","ㄙㄠˇㄇㄧㄠˊ","ㄐㄧㄝ ㄍㄨㄢˇ","ㄌㄧˋㄩㄥˋ","ㄐㄧㄡ ㄓㄥˋ","ㄍㄞˇㄓㄥˋ"]
    @Published var generalVerbsTranslation4 = ["To Complete\nA Project","To Strengthen","To Consider\nAs","To respect","To fight\nover","To collapse\n(figurative)","To Replace","To Regress","To Gradually\nChange","To Depend\nOn","To Maintain\nTo Keep","To Maintain\nTo Keep","To Obstruct","To Scan","To Take Over\n(Control)","To Make\nUse Of","To Correct\n(Smne Else)","To Correct\n(Self)"]
    
    @Published var healthBPMF = ["ㄕ ㄇㄧㄢˊ","ㄐㄧㄣˋㄕˋ","ㄧㄥˊㄧㄤˇ","ㄑㄧㄤˇㄆㄛˋㄓㄥˋ","ㄅㄧㄥ ㄈㄨ ","ㄓㄣ ㄐㄧㄡˇ"]
    @Published var healthTranslation = ["Insomnia","Nearsightedness","Nutritious","OCD","Ice Packs","Acupuncture"]
    
    @Published var householdBPMF = ["ㄧㄚˊㄍㄠ ","ㄓㄣˇㄊㄡ˙","ㄇㄧㄢˋㄇㄛˊ","ㄔㄡ ㄊㄧ˙","ㄓˇㄊㄨㄥˋㄧㄠˋ","ㄈㄟ ㄗㄠˋ","ㄓˇㄐㄧㄣ ","ㄧㄣ ㄒㄧㄤ ","ㄉㄧˋㄊㄢˇ","ㄊㄢˇㄗ˙","ㄌㄨˊㄗ˙","ㄈㄥ ㄕㄢˋ","ㄔㄚ ㄗㄨㄛˋ","ㄐㄧㄥˋㄗ˙","ㄇㄠˊㄐㄧㄣ ","ㄕㄨ ㄗ˙","ㄒㄧㄤ ㄕㄨㄟˇ","ㄍㄨㄥ ㄩˋ"]
    @Published var householdTranslation = ["Toothpaste","Pillow","Facial Mask","Drawer","Painkiller","Soap","Napkin","Speakers","Carpet\nRug","Blanket","Stove","Electric\nFan","Electric\nSocket","Mirror","Towel","Comb","Perfume","Apartment"]
    
    @Published var horrorBPMF = ["ㄇㄧˊㄒㄧㄣˋ","ㄈㄥˋㄧㄢˇ","ㄉㄧˋㄩˋ"]
    @Published var horrorTranslation = ["Superstition","Nightmare","Hell"]
    
    @Published var infrastructureBPMF = ["ㄍㄠ ㄌㄡˊ","ㄐㄧㄢˋㄓㄨˋ","ㄕ ㄍㄨㄥ ","ㄍㄨㄥ ㄩˋ","ㄉㄨˊㄉㄨㄥˋ"]
    @Published var infrastructureTranslation = ["Highrises","Buildings","Carry Out\nConstruction","Apartment","Detached\nHouse"]
    
    @Published var languageBPMF = ["ㄊㄨㄥˊㄧㄣ ㄘˊ","ㄊㄨㄛ ㄈㄨˊ","ㄨㄣˊㄏㄨㄚˋㄔㄨㄥ ㄐㄧ ","ㄈㄢˊㄊㄧˇ","ㄅㄧㄠ ㄉㄧㄢˇㄈㄨˊㄏㄠˋ"]
    @Published var languageTranslation = ["Homophones","TOEFL","Culture\nShock","Traditional\nChinese","Punctuation\nMarks"]
    
    @Published var locationBPMF = ["ㄒㄧㄤ ㄒㄧㄚˋ","ㄒㄧㄤ ㄘㄨㄣ ","ㄙㄣ ㄌㄧㄣˊ","ㄇㄟˇㄓㄡ ","ㄒㄧㄠˇㄓㄣˋ","ㄕˋㄓㄨㄥ ㄒㄧㄣ ","ㄨㄣ ㄑㄩㄢˊ","ㄐㄧㄝ ㄈㄤ˙","ㄇㄚˇㄌㄨˋ","ㄉㄠˋㄔㄨˇ"]
    @Published var locationTranslation = ["Countryside","Village","Forest","Americas","Lively Place\nIn City","Downtown","Hotsprings","Neighborhood","Street","Everywhere"]
    
    @Published var machinesBPMF = ["ㄉㄧㄢˋㄈㄨˊㄊㄧ ","ㄑㄧˇㄉㄨㄥˋ","ㄔㄨˊㄕ ㄐㄧ "]
    @Published var machinesTranslation = ["Escalator","Switch On","Dehumidifier"]
    
    @Published var marriageBPMF = ["ㄏㄨㄣ ㄌㄧˇ","ㄐㄧㄝˊㄏㄨㄣ "]
    @Published var marriageTranslation = ["Wedding\nCeremony","To get married"]
    
    @Published var measureWordsBPMF = ["ㄧㄤˋ","ㄐㄧˊ","ㄊㄧㄠˊ","ㄨㄟˋ","ㄇㄧㄢˋ","ㄊㄞˊ","ㄐㄧㄢˋ","ㄓㄤ ","ㄑㄩㄢ ","ㄎㄨㄞˋ","ㄎㄜ ","ㄎㄜ ","ㄊㄤˊ","ㄎㄨㄢˇ","ㄊㄠˋ","ㄆㄧㄢˋ"]
    @Published var measureWordsTranslation = ["Kinds","Episode","Long & Thin","Seats","Flat\nSurfaces","Vehicles\nMachines","Clothes","Flat","Loops\nLaps","Ｍoney","Plants\nTrees","Round","Classes","Types Of\nProducts","Sets","A Piece"]
    
    @Published var mediaBPMF = ["ㄉㄧㄢˋㄕˋㄐㄩˋ","ㄓㄨˇㄐㄩㄝˊ","ㄍㄨㄢ ㄓㄨˋ","ㄉㄧㄢˇㄗㄢˋ","ㄆㄧㄣˊㄉㄠˋ","ㄉㄧㄥˋㄩㄝˋ","ㄈㄥ ㄙㄨㄛˇ"]
    @Published var mediaTranslation = ["TV Drama","Protagonist","To Follow\n(Social)","To Like\n(Social)","Channel\n(Social)","Subscribe\n(Social)","To Block"]
    
    @Published var mentalVerbsBPMF = ["ㄅㄨˋㄌㄧˇ","ㄎㄢˋㄑㄧㄥ ","ㄓㄢˋㄆㄧㄢˊㄧ˙","ㄈㄢˇㄏㄨㄟˇ","ㄐㄧㄚ ㄑㄧˇㄌㄞˊ","ㄓㄥˇㄌㄧˇ","ㄒㄧㄤˇㄒㄧㄤˋ","ㄈㄣ ㄒㄧㄣ ","ㄊㄨㄟˊㄙㄤˋ","ㄧˋㄕˊ","ㄐㄩㄝˊㄒㄧㄣ "]
    @Published var mentalVerbsTranslation = ["Ignore","To Look\nDown On","Take\nadvantage of","To Back Out","To Add\nTogether","To Process\nThings","To Imagine","Distracted","Disheartened","To Realize","Make Up\nOne's Mind"]
    
    @Published var natureBPMF = ["ㄌㄨˋㄕㄨㄟ˙","ㄌㄨˋㄊㄧㄢ ","ㄖˋㄔㄨ ","ㄖˋㄌㄨㄛˋ","ㄕㄨˋ","ㄕˊㄊㄡ˙","ㄧㄤˇ","ㄏㄨˋㄨㄞˋ","ㄉㄧˋㄓㄣˋ","ㄍㄨㄤ ㄒㄧㄢˋ","ㄔㄨㄣ ㄊㄧㄢ ","ㄒㄧㄚˋㄊㄧㄢ ","ㄑㄧㄡ ㄊㄧㄢ ","ㄉㄨㄥ ㄊㄧㄢ "]
    @Published var natureTranslation = ["Dew","Outdoors","Sunrise","Sunset","Trees","Rocks","To Raise\nProvide For","Outdoor","Earthquake","Lighting","Spring","Summer","Autumn","Winter"]
    
    @Published var occupationBPMF = ["ㄐㄧㄥˇㄔㄚ ","ㄒㄧㄠ ㄈㄤˊㄩㄢˊ","ㄕㄡˋㄧ ","ㄐㄩㄣ ㄉㄨㄟˋ","ㄕㄥ ㄧˋ","ㄧㄢˊㄐㄧㄡ ㄕㄥ ","ㄩㄥˋㄖㄣˊ"]
    @Published var occupationTranslation = ["Police","Firefighter","Vet.","Military","Business","Graduate\nStudent","Servant\nMaid"]
    
    @Published var patternsBPMF = ["ㄩˇㄑㄧˊㄅㄨˋㄖㄨˊ","ㄍㄟˇㄨㄛˇ","ㄋㄧㄥˋㄩㄢˋ","ㄔㄨㄥ ㄒㄧㄣ ","ㄙㄨㄟˊㄓㄜ˙","ㄔㄨˊㄈㄟ "]
    @Published var patternsTranslation = ["Rather than...\nBetter to","Strengthen\nthe\nmperative","Would you\nrather...","Re-","As ()\n Happens,...","Unless..."]
    
    @Published var personalCharacteristicBPMF = ["ㄊㄧㄢ ㄓㄣ ","ㄌㄜˋㄍㄨㄢ ","ㄅㄟ ㄍㄨㄢ ","ㄏㄠˇㄧˋ","ㄜˋㄧˋ","ㄗˋㄌㄧㄢˋ","ㄊㄧˇㄊㄧㄝ ","ㄧㄝˋㄇㄠ ㄗ˙","ㄅㄠˇㄕㄡˇ","ㄞˋㄒㄧㄢˋ","ㄎㄜˇㄎㄠˋ","ㄏㄠˇㄒㄧㄤ ㄔㄨˇ","ㄩㄥˇㄑㄧˋ","ㄉㄨˊㄌㄧˋ","ㄌㄧˇㄓˋ","ㄧㄡˋㄓˋ","ㄊㄧㄠ ㄕˊ","ㄑㄧㄢˊㄌㄧˋ"]
    @Published var personalCharacteristicTranslation = ["Innocent","Optimistic","Pessimistic","Kindness","Ill Intention","Narcissistic","Considerate","Night Owl","Conservative","To Enjoy\nShowing Off","Dependable\nReliable","Easygoing","Courage","Independent","Rational","Naive","Picky\nEater","Potential"]
    
    @Published var personalCharacteristicBPMF2 = ["ㄌㄠˇㄍㄨˇㄉㄨㄥˇ","ㄊㄠˋㄌㄨˋ","ㄗˋㄙ ","ㄎㄞ ㄈㄤˋ","ㄐㄧㄠ ㄠˋ","ㄧㄡ ㄇㄛˋ","ㄕㄣ ㄈㄣ˙ㄖㄣˋㄊㄨㄥˊ","ㄌㄢˇㄍㄨㄟˇ","ㄏㄨㄣˊㄉㄢˋ","ㄌㄧˋㄔㄤˇ","ㄌㄧㄥˊㄏㄨㄛˊ"]
    @Published var personalCharacteristicTranslation2 = ["Old-Fashioned","Routine","Selfish","Open\nMinded","Pride","Humorous","Personal\nIdentity","Lazy Ass","Bastard","Perspective","Flexible\n(Thinking)"]
    
    @Published var physicalDescriptionBPMF = ["ㄓㄞˇ","ㄊㄜˋㄉㄧㄢˇ","ㄨㄞ ","ㄅㄧㄢˇ","ㄎㄨㄢ ","ㄓㄞˇ"]
    @Published var physicalDescriptionTranslation = ["Narrow","Characteristic","Slanted","Flat","Wide","Narrow"]
    
    @Published var placeNamesBPMF = ["ㄌㄚ ㄙ ㄨㄟˊㄐㄧㄚ ㄙ ","ㄋㄟˋㄏㄨㄚˊㄉㄚˊ","ㄌㄟˊㄋㄨㄛˋ","ㄒㄧ ㄅㄢ ㄧㄚˊ","ㄉㄜˊㄍㄨㄛˊ","ㄐㄧㄚ ㄋㄚˊㄉㄚˋ","ㄇㄛˋㄒㄧ ㄍㄜ ","ㄋㄢˊㄇㄟˇ","ㄡ ㄓㄡ ","ㄜˊㄌㄨㄛˊㄙ ","ㄠˋㄓㄡ ","ㄒㄧㄣ ㄐㄧㄚ ㄆㄛ ","ㄇㄚˇㄌㄞˊㄒㄧ ㄧㄚˋ","ㄩㄝˋㄋㄢˊ","ㄖˋㄅㄣˇ","ㄋㄢˊㄐㄧˊㄓㄡ ","ㄧㄚˋㄓㄡ ","ㄈㄟ ㄓㄡ "]
    @Published var placeNamesTranslation = ["Las Vegas","Nevada","Reno","Spain","Germany","Canada","Mexico","South\nAmerica","Europe","Russia","Australia","Singapore","Malaysia","Vietnam","Japan","Antarctica","Asia","Africa"]
    
    @Published var relationshipsBPMF = ["ㄔㄨ ㄌㄧㄢˋ","ㄉㄨㄟˋㄒㄧㄤˋ","ㄕㄡˇㄕㄨˋ","ㄊㄨㄥˊㄐㄩ ","ㄈㄣ ㄐㄩ ","ㄇㄟˊㄒㄧˋ","ㄧㄣˇㄙ ","ㄔㄠˇㄐㄧㄚˋ","ㄑㄧㄣ ㄞˋㄉㄜ","ㄑㄧㄣ ㄐㄧㄣˋ","ㄕㄨˊ","ㄔㄨㄥˇㄏㄨㄞˋ","ㄓㄣ ㄓㄨㄥ ","ㄐㄩˋㄐㄩㄝˊ","ㄓㄣ ㄒㄧ ","ㄒㄧㄤˋㄞˋ","ㄓㄡ ㄋㄧㄢˊ","ㄑㄧㄥˊㄌㄩˇ","ㄑㄧㄥˊㄖㄣˊ","ㄔㄥˊㄓㄤˇ","ㄑㄧㄤˇㄆㄛˋ"]
    @Published var relationshipsTranslation = ["First Love","Significant\nOther","To Secretly\nProtect","To Live\nTogether","To Live\nSeparate","To Have\nNo Chance","Privacy","To Argue","Dear","To be close to","To be\nfamiliar\nwith","To Spoil","To Treasure","To Reject","To Value\nTo Cherish","Loving","Anniversary","Lovers\nSweethearts","Lover\nSweetheart","To Grow","To Force\n(High Level)"]
    
    @Published var relationshipsBPMF2 = ["ㄑㄧㄥˊㄖㄣˊ","ㄍㄠˋㄅㄞˊ","ㄏㄨㄞˊㄩㄣˋ","ㄔㄨㄥ ㄊㄨ ","ㄕㄨˊ","ㄍㄨㄢˇㄑㄧㄥˊ","ㄩㄝ ㄏㄨㄟˋ"]
    @Published var relationshipsTranslation2 = ["Sweetheart\nLover","To Confess\n(Love)","To Be\nPregnant","Conflicts","To be\nfamiliar","Affection\n(between two)","Date\n(Romantic)"]
    
    @Published var remarksBPMF = ["ㄅㄨˋㄙㄨㄢˋ","ㄒㄧㄤˋㄏㄨㄚˋ","ㄈㄟˋㄏㄨㄚˋ","ㄈㄢˇㄓㄥˋ","ㄅㄧˋㄗㄨㄟˇ","ㄗㄣˇㄇㄜ˙ㄕㄨㄛ ","ㄌㄧㄥˋㄧ ㄈㄤ ㄇㄧㄢˋ"]
    @Published var remarksTranslation = ["Doesn't\nCount","Reasonable?","No Way!","Anyway","Shut up\n(rude)","How so?","On the\nOther Hand"]
    
    @Published var restaurantsBPMF = ["ㄈㄨˊㄨˋ","ㄉㄚˇㄅㄠ ","ㄔ ㄉㄠˋㄅㄠˇ"]
    @Published var restaurantsTranslation = ["Service","Bag\nLeftovers","Buffet"]
    
    @Published var sayingsBPMF = ["ㄧㄥˋㄓㄜ˙ㄊㄡˊㄆㄧˊ","ㄧ ㄌㄨˋㄕㄨㄣˋㄈㄥ ","ㄓㄥ ㄧㄢˇㄕㄨㄛ ㄒㄧㄚ ㄏㄨㄚˋ","ㄖㄜˋㄌㄧㄢˇㄊㄧㄝ ㄌㄥˇㄆㄧˋㄍㄨ˙","ㄊㄨㄛ ㄎㄨˋㄗ˙ㄈㄤˋㄆㄧˋ","ㄨㄣˊㄉㄢˋ","ㄏㄨㄛˊㄍㄞ ","ㄧ ㄧㄢˊㄨㄟˊㄉㄧㄥˋ","ㄦˊㄧㄢˊ","ㄧ ㄈㄣ ㄍㄥ ㄩㄣˊㄧ ㄈㄣ ㄕㄡ ㄏㄨㄛˋ","ㄇㄨˊㄌㄧㄥˊㄌㄧㄤˇㄎㄜˇ","ㄨㄟˊㄓˇ","ㄧ ㄇㄛˊㄧ ㄧㄤˋ","ㄗ ㄗ ㄅㄨˋㄐㄩㄢˋ","ㄩˋㄩˋㄍㄨㄚˇㄏㄨㄢ ","ㄘㄢˇㄐㄩㄝˊㄖㄣˊㄏㄨㄢˊ","ㄓㄠˋㄐㄧㄡˋ","ㄌㄠˇㄕˊㄕㄨㄛ ","ㄌㄞˊㄉㄜ˙ㄐㄧˊ","ㄧㄠˋㄅㄨˋㄕˋ","ㄦˇㄖㄨˊㄇㄨˋㄖㄢˇ"]
    @Published var sayingsTranslation = ["To Force\nOneself","Have a\nGood Trip","To obviously\nlie","To show \nfeelings and\nbe dejected","To make\nthings too\ncomplicated","To be\ndone for","Serves\nyou right","It's settled\nthen","With regard\nto ...","You get\nwhat you\nput in","Ambiguous","Up until","Exactly the\nsame","Tirelessly","Be in\nthe dumps","Tragic\nBeyond\nCompare","Just as\nUsual","Honestly...","There's\nstill\ntime","If it were\nnot for","Imperceptibly\nInfluenced\n(Young)"]
    
    @Published var schoolBPMF = ["ㄐㄧㄠˋㄕㄡˋ","ㄒㄩㄝˊㄑㄧˊ"]
    @Published var schoolTranslation = ["Professor","Semester"]
    
    @Published var shoppingBPMF = ["ㄓㄜˊ","ㄧㄡ ㄏㄨㄟˋ","ㄉㄧㄥˋㄉㄢ "]
    @Published var shoppingTranslation = ["Discount\n(Percentage)","Discount","To Order"]
    
    @Published var specificMovementBPMF = ["ㄉㄨㄥˋㄧㄠˊ","ㄑㄧㄝ ","ㄒㄧ ","ㄊㄨˇ","ㄍㄨㄟˋ","ㄆㄧㄥˊㄅㄢˇ","ㄔㄚ ㄉㄨㄟˋ","ㄑㄧㄠˋ","ㄐㄩˇㄕㄡˇ","ㄔㄚ ","ㄕㄢ ㄔㄨˊ","ㄗㄞˋㄖㄣˊ","ㄎㄡˋ","ㄙㄨㄛˇ","ㄒㄧˋ","ㄅㄤˇ","ㄉㄧㄥ ㄓㄨˋ","ㄧㄣˇㄘㄤˊ","ㄊㄠˊㄆㄠˇ","ㄌㄞˋㄔㄨㄤˊ"]
    @Published var specificMovementTranslation = ["To Shake","To Slice/Cut","Breathe In","Breathe Out","To Kneel","To Plank","Cut in Line","To Stick Up","To Raise\nHand","To Stick In","To Delete","To Carry Passengers","To Button\nUp","To Lock","To Fasten","To Tie","To breathe\ndown\nsmbdy's\nback","To Hide","Run Away","To Lazy Around in Bed"]
    
    @Published var specificMovementBPMF2 = ["ㄔㄠˇㄒㄧㄥˇ","ㄧㄤˇ","ㄊㄧㄥˊㄌㄧㄡˊ","ㄅㄚˊ","ㄐㄧˋㄈㄤˋ","ㄐㄧㄚ ㄓˊ","ㄍㄨㄚˋ","ㄅㄚˇㄇㄟˋ","ㄇㄧㄢˇㄑㄧㄤˇ","ㄕㄤˋㄔㄨㄢˊ","ㄙ ","ㄐㄧㄝˋ","ㄌㄧㄡˇ","ㄒㄧㄢ ","ㄊㄧㄠˊㄎㄢˇ","ㄓㄨˋㄧˋ","ㄈㄨ ","ㄈㄤˋㄍㄜ ㄗ˙","ㄐㄧㄥˇㄍㄠˋ","ㄍㄨㄣˇ","ㄍㄨㄚˋ"]
    @Published var specificMovementTranslation2 = ["Wake smbdy.\nw/ Noise","To Face\nUpward","To stay\ntemporarily","To pull out","Leave smth\nwith sb.","To Reacharge\nMoney\n(On card)","Hang up\na phone","To get\na girl","Force sb.\nto do\nsmth.","To Upload\nTo Post","To Tear","To Give Up\nAbstinate","To Twist","To Lift","To Tease","To pay\nattention to","To Apply\nTo Spread","Stand\nsmbd. up","To Warn","To Roll\n(things)","To hang\n(things)"]
    
    @Published var specificMovementBPMF3 = ["ㄊㄡ ㄎㄢˋ","ㄍㄨㄚ ","ㄌㄧㄤˊ","ㄊㄡ ","ㄙㄠˇ","ㄏㄨㄟ ㄕㄡˇ","ㄉㄨㄣ ","ㄎㄢˇ","ㄈㄤˋㄍㄜ ㄗ","ㄔㄞ ㄎㄞ ","ㄐㄧˇ","ㄧㄠˇ","ㄐㄧㄠˊ","ㄧㄢˋ","ㄉㄧㄠ ","ㄏㄢˊ","ㄊㄨㄣ ","ㄎㄣˇ","ㄌㄨㄢˋㄆㄠˇ","ㄒㄧㄡ ㄐㄧㄢˇ"]
    @Published var specificMovementTranslation3 = ["Steal a\nGlance","To Shave","To Measure","To Steal","To Scan","To Wave","To Squat","To Chop","Stand smbdy\nup","To Take Apart","To Squeeze","To Bite","To Chew","To Swallow","To Hold\nWith Mouth","To Hold\nIn Mouth","Swallow w/o\nChewing","To Nibble","To Run\nAround","To Trim"]
    
    @Published var specificMovementBPMF4 = ["ㄊㄧㄢˇ","ㄏㄨㄟˊㄔㄨㄥ ","ㄉㄨㄟˋㄐㄧㄤˇ","ㄐㄧˇ","ㄧㄚ ","ㄓㄚˋ","ㄙㄞ ㄔㄜ "]
    @Published var specificMovementTranslation4 = ["To Lick","Refill\n(Teabag)","To Check\nLottery","Squeeze\n(Fingers)","Squeeze\n(Two Hands)","Press\n(Juice)","Held Up\nIn Traffic"]
    
    @Published var technologyBPMF = ["ㄔㄨㄥ ㄉㄧㄢˋㄑㄧˋ","ㄔㄨㄥ ㄉㄧㄢˋㄅㄠˇ","ㄉㄧㄢˋㄩㄢˊㄒㄧㄢˋ","ㄍㄨㄢ ㄎㄞ ","ㄐㄧㄢˋㄆㄢˊ","ㄏㄨㄚˊㄕㄨˇ","ㄔㄚ ㄊㄡˊ"]
    @Published var technologyTranslation = ["Charger","Portable\nCharger","Power\nCable","Switch","Keyboard","Mouse","Plug"]
    
    @Published var timeWordsBPMF = ["ㄕㄡˇㄒㄧㄢ ","ㄧ ㄉㄢˋ","ㄧ ㄅㄟˋㄗ˙","ㄇㄨˋㄑㄧㄢ ","ㄨㄟˊㄓˇ","ㄗㄨㄥˇㄧㄡˇ","ㄊㄨㄥ ㄒㄧㄠ ","ㄘˇ","ㄧ ㄓㄣ ㄗ˙","ㄔㄤˊㄑㄧ ","ㄅㄢˋㄧㄝˋ","ㄌㄧㄥˊㄔㄣˊ"]
    @Published var timeWordsTranslation = ["First of All","Once...","All one's life","At the\npresent","Up to; Until","Inevitably\nthere\nwill be","All Night","Here and Now","A While","For a\nlong time","Midnight","Late\nMidnight"]
    
    @Published var travelBPMF = ["ㄌㄩˇㄍㄨㄢ ","ㄏㄨˋㄓㄠˋ","ㄍㄨㄛˊㄐㄧˋㄐㄧㄚˋㄓㄠˋ","ㄏㄤˊㄒㄧㄤˋ","ㄊㄨㄟ ㄐㄧㄢˋ","ㄉㄠˇㄧㄡˊ","ㄍㄨㄛˊㄨㄞˋ","ㄅㄧˋㄋㄢˋ","ㄑㄧㄢ ㄓㄥˋ","ㄇㄥˊㄧㄡˇ","ㄧˊㄇㄧㄣˊ"]
    @Published var travelTranslation = ["Hotel","Passport","International\nDriver's\nLicense","Direction\n(ship/plane)","To Recommend","Tour Guide","Abroad","To Take\nRefuge","Visa","Allied\nCountry","To Immigrate"]
    
    @Published var vegetableBPMF = ["ㄒㄧㄤ ㄍㄨ ","ㄅㄛ ㄘㄞˋ","ㄕㄨㄟˋㄌㄧㄢˊ","ㄈㄢ ㄑㄧㄝˊ","ㄧㄤˊㄘㄨㄥ ","ㄒㄧㄤ ㄘㄞˋ"]
    @Published var vegetableTranslation = ["Mushroom","Spinach","Snowflake\nStem","Tomato","Onion","Corriander"]
    
    @Published var wearablesBPMF = ["ㄨㄞˋㄊㄠˋ","ㄨㄚ ㄗ˙","ㄒㄧㄤˋㄌㄧㄢˋ","ㄕㄡˇㄌㄧㄢˋ","ㄒㄩㄝ ㄗ˙","ㄊㄨㄛ ㄒㄧㄝˊ","ㄍㄠ ㄍㄣ ㄒㄧㄝˊ","ㄔㄤˊㄒㄧㄡˋ","ㄉㄨㄢˇㄒㄧㄡˋ"]
    @Published var wearablesTranslation = ["Jacket","Socks","Necklace","Bracelet","Boots","Slippers","High\nHeels","Long Sleeves","Short Sleeves"]
    
    @Published var workBPMF = ["ㄈㄥ ㄒㄧㄢˇ","ㄍㄨㄥ ㄔㄚ ","ㄗㄨㄟˋㄒㄧㄠˇㄏㄨㄚˋ","ㄗㄨㄟˋㄉㄚˋㄏㄨㄚˋ","ㄉㄧㄢˋㄧㄚ ","ㄉㄧㄢˋㄌㄧㄡˊ","ㄓㄨˋㄙㄨˋ","ㄗㄨˇㄓㄨㄤ ","ㄑㄧˊㄒㄧㄢˋ","ㄅㄧㄢˋㄒㄧㄥˊ","ㄎㄜˋㄏㄨˋ","ㄕㄥ ㄔㄤˇ","ㄈㄨˋㄐㄧㄢˋ","ㄔㄚˊㄎㄢˋ","ㄧㄡ ㄉㄧㄢˇ","ㄑㄩㄝ ㄉㄧㄢˇ","ㄕㄡˇㄕㄨˋ","ㄐㄧㄣˋㄉㄨˋ","ㄏㄨㄟˊㄎㄨㄟˋ","ㄢ ㄆㄞˊ"]
    @Published var workTranslation = ["Risk","Tolerance","To Minimize","To Maximize","Voltage","Current","Injection\nMold","Assemble","Deadline","Deformed","Client","To\nManufacture","E-Mail\nAttachment","To Examine","Advantage","Disadvantage","Surgery","Progress","Feedback","To Arrange\n(Matters)"]
    
    @Published var workBPMF2 = ["ㄐㄧㄥ ㄧㄥˊ","ㄓㄨˇㄍㄨㄢˇ","ㄗㄜˊㄖㄣˋ","ㄓ ㄕˋ","ㄖㄣˋㄨ","ㄩˋㄉㄧㄥˋ","ㄒㄧㄡ ㄍㄞˇ","ㄗㄠˇㄅㄢ ","ㄨㄢˇㄅㄢ ","ㄧㄝˋㄅㄢ ","ㄅㄨˋㄇㄣˊ","ㄙ ㄒㄧㄚˋ","ㄊㄧㄠˇㄓㄢˋ","ㄗ ㄍㄜˊ","ㄅㄠˇㄓㄥˋ","ㄩㄢˊㄍㄨㄥ ","ㄧㄢˋㄕㄡ ","ㄩˋㄓ ","ㄊㄨˊㄘㄥˊ","ㄕㄥˋㄖㄣˋ"]
    @Published var workTranslation2 = ["To Manage\n(Run)","Supervisor","Responsibility","Knowledge","Task","To Schedule","To Revise","Morning\nShift","Night\nShift","Late Night\nShift","Department","In Private","Challenge","Qualifications","Guarantee","Employee","To Check &\nAccept","Pay in\nadvance","Coating","To be\ncompetent"]
    
    @Published var workBPMF3 = ["ㄑㄧㄥˇㄐㄧㄠˋ","ㄓˋㄌㄧㄤˋ","ㄍㄥ ㄒㄧㄣ ","ㄊㄧˊㄍㄨㄥ ","ㄍㄨㄟ ㄍㄜˊ","ㄖㄣˊㄩㄢˊ","ㄍㄨㄟˋㄊㄞˊ","ㄖㄨㄢˇㄊㄧˇ","ㄌㄧˊㄑㄧㄥ ","ㄊㄧㄠˊㄐㄧㄢˋ","ㄊㄧˊㄐㄧㄠ ","ㄈㄣ ㄒㄧ ","ㄒㄧㄥˊㄕˋ","ㄍㄡˋㄗㄠˋ","ㄓㄨㄢˋㄑㄧㄢˊ","ㄐㄧㄢˇㄔㄚˊ","ㄎㄜˇㄋㄥˊㄒㄧㄥˋ","ㄓㄤˇㄒㄧㄤˋ","ㄐㄧㄚˇㄕㄜˋ","ㄔㄨ ㄅㄨˋ","ㄍㄨ ㄐㄧㄚˋ","ㄐㄧㄚ ㄒㄧㄣ "]
    @Published var workTranslation3 = ["To ask for\nguidance","Quality","To Update","To Provide","Specifications","Personnel","Front Desk","Software","To Clarify\n(Facts)","Condition or\nRequirement","To Submit\n(Reports)","Analysis","Outer\nAppearance","Composition","To Earn\nMoney","To Inspect","Probability\nPossibility","Appearance","To Assume","Initial\nPreliminary","Estimation","To Raise\nSalary"]
    
    @Published var workBPMF4 = ["ㄊㄨㄥ ㄓ ","ㄍㄨㄢˇㄗ","ㄅㄠˇㄓㄨㄤ ","ㄧㄢˋㄓㄥˋ","ㄔㄤˇㄕㄤ ","ㄓㄜˊ","ㄋㄧㄡˇ","ㄑㄧˋㄧㄢˇㄉㄧㄥ ","ㄏㄨㄚ ㄙ ","ㄍㄞˋㄓㄤ ","ㄍㄨㄢˇㄌㄧˇㄅㄨˋㄇㄣˊ","ㄒㄧㄠ ㄕㄡˋㄅㄨˋ","ㄖㄣˊㄕˋㄅㄨˋ","ㄧㄢˊㄈㄚ ㄅㄨˋ","ㄈㄨˋㄎㄨㄢˇ","ㄨㄟˊㄓㄨˇ","ㄨㄟˊㄈㄨˇ","ㄆㄟˋㄏㄜˊ","ㄔㄨ ㄔㄞ ","ㄍㄨㄟ ㄏㄨㄚˋ"]
    @Published var workTranslation4 = ["To Notify","Tube\nPipe","Packaging","Validation","Supplier\nManufacturer\nProducer","To Bend","To Twist","Ｒivet","Washer","To Sign Off","Administrative\nDepartment","Sales\nMarketing\nDepartment","HR\nDepartment","R&D\nDepartment","Payment\nTo Pay Money","Give Priority\nTo","Give Secondary\nTo","To Coordinate\nWith","To Go Away\nFor Business","Plan\n(How to do smth)"]
    
    @Published var workBPMF5 = ["ㄨㄞˋㄆㄞˋ","ㄍㄣ ㄐㄧㄣˋ","ㄊㄨㄟˋㄒㄧㄡ ","ㄓˋㄉㄨˋ","ㄎㄨㄤˋㄎㄨㄤˋ","ㄋㄧㄢˊㄐㄧㄚˋ","ㄔㄥˊㄒㄩˋ","ㄙㄢˋㄏㄨㄟˋ","ㄒㄧㄠˋㄌㄩˋ","ㄐㄧㄢ ㄉㄨ ","ㄓˋㄔㄥˊ","ㄒㄧㄤˋㄇㄨˋ","ㄕㄜˋㄊㄨㄢˊ","ㄌㄩˋ","ㄉㄨㄟˋㄧㄡˇ","ㄔㄨ ㄒㄧˊ","ㄑㄩㄝ ㄒㄧˊ","ㄍㄨㄟ ㄏㄨㄚˋ","ㄕˊㄒㄧˊ","ㄊㄜˋㄒㄧㄥˊ"]
    @Published var workTranslation5 = ["To send to\nanother\nplace","To Follow\nUp","To Retire","System","To Frame\n(box around)","Annual\nLeave","Procedure","Meeting\nEnd","Efficiency","To Supervise","Manufacturing\nProcess","Item","Club","Rate","Team Member","To Be\nPresent","To Be\nAbsent","To Schedule\n(On timeline)","Internship","Specific\nProperty"]
    
    @Published var workBPMF6 = ["ㄓˋㄔㄥˊ","ㄉㄧㄢˇㄏㄢˋ","ㄧˊㄐㄧ ","ㄅㄠ ㄓㄨㄤ ","ㄇㄠˇ","ㄌㄟˊㄏㄢˋ","ㄒㄧ ㄏㄢˋ","ㄏㄨㄥ ㄍㄢ ","ㄕㄨˋㄌㄧㄤˋ","ㄌㄧㄥˊㄐㄧㄢˋ","ㄧㄚ ㄓㄚˋ"]
    @Published var workTranslation6 = ["Manufacturing\nProcess","Spot Welding","To Relocation\nEquipment","Packaging","Crimp","Laser Weld","Soldering","Oven Baking","Number\n(Of things)","Parts\nComponents","Exploit\nWorking"]
}

struct Vocabulary: View {
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var pronunciation : Bool
    @Binding var timerValue: Double
    
    @ObservedObject var vocabularyList = VocabularyList()
    @State var vocabularyTranslation = [""]
    @State var vocabularyBPMF = [""]
    
    
    var body: some View {
        HStack{
            Group{
                ScrollView{
                    
                    VStack{
                        Button("Activities"){
                            vocabularyTranslation = self.vocabularyList.activitiesTranslation
                            vocabularyBPMF = self.vocabularyList.activitiesBPMF
                        }.padding(.bottom,5)
                        
                        Button("Alcohol"){
                            vocabularyTranslation = self.vocabularyList.alcoholTranslation
                            vocabularyBPMF = self.vocabularyList.alcoholBPMF
                        }.padding(.bottom,5)
                        
                        Button("Animals"){
                            vocabularyTranslation = self.vocabularyList.animalsTranslation
                            vocabularyBPMF = self.vocabularyList.animalsBPMF
                        }.padding(.bottom,5)
                        
                        Button("Body\nRelated"){
                            vocabularyTranslation = self.vocabularyList.bodyRelatedTranslation
                            vocabularyBPMF = self.vocabularyList.bodyRelatedBPMF
                        }.padding(.bottom,5)
                        
                        Button("Body\nRelated(2)"){
                            vocabularyTranslation = self.vocabularyList.bodyRelatedTranslation2
                            vocabularyBPMF = self.vocabularyList.bodyRelatedBPMF2
                        }.padding(.bottom,5)
                        
                        Button("Breakfast"){
                            vocabularyTranslation = self.vocabularyList.breakfastTranslation
                            vocabularyBPMF = self.vocabularyList.breakfastBPMF
                        }.padding(.bottom,5)
                        
                        Button("Conversation"){
                            vocabularyTranslation = self.vocabularyList.conversationTranslation
                            vocabularyBPMF = self.vocabularyList.conversationBPMF
                        }.padding(.bottom,5)
                        
                        Button("Conversation\n(2)"){
                            vocabularyTranslation = self.vocabularyList.conversationTranslation2
                            vocabularyBPMF = self.vocabularyList.conversationBPMF2
                        }.padding(.bottom,5)
                    }
                    VStack{
                        
                        Button("Covid19"){
                            vocabularyTranslation = self.vocabularyList.covid19Translation
                            vocabularyBPMF = self.vocabularyList.covid19BPMF
                        }.padding(.bottom,5)
                        
                        Button("Cleaning"){
                            vocabularyTranslation = self.vocabularyList.cleaningTranslation
                            vocabularyBPMF = self.vocabularyList.cleaningBPMF
                        }.padding(.bottom,5)
                    }
                    VStack{
                        Button("Driving"){
                            vocabularyTranslation = self.vocabularyList.drivingTranslation
                            vocabularyBPMF = self.vocabularyList.drivingBPMF
                        }.padding(.bottom,5)
                        
                        Button("Emotions(1)"){
                            vocabularyTranslation = self.vocabularyList.emotionTranslation
                            vocabularyBPMF = self.vocabularyList.emotionBPMF
                        }.padding(.bottom,5)
                        
                        Button("Emotions(2)"){
                            vocabularyTranslation = self.vocabularyList.emotionTranslation2
                            vocabularyBPMF = self.vocabularyList.emotionBPMF2
                        }.padding(.bottom,5)
                        
                        Button("Emotions(3)"){
                            vocabularyTranslation = self.vocabularyList.emotionTranslation3
                            vocabularyBPMF = self.vocabularyList.emotionBPMF3
                        }.padding(.bottom,5)
                        
                        Button("Exercise"){
                            vocabularyTranslation = self.vocabularyList.exerciseTranslation
                            vocabularyBPMF = self.vocabularyList.exerciseBPMF
                        }.padding(.bottom,5)
                        
                        Button("Family"){
                            vocabularyTranslation = self.vocabularyList.familyTranslation
                            vocabularyBPMF = self.vocabularyList.familyBPMF
                        }.padding(.bottom,5)
                        
                        Button("Finance"){
                            vocabularyTranslation = self.vocabularyList.financeTranslation
                            vocabularyBPMF = self.vocabularyList.financeBPMF
                        }.padding(.bottom,5)
                        
                        VStack{
                            Button("Food"){
                                vocabularyTranslation = self.vocabularyList.foodTranslation
                                vocabularyBPMF = self.vocabularyList.foodBPMF
                            }.padding(.bottom,5)
                            
                            Button("Food Related"){
                                vocabularyTranslation = self.vocabularyList.foodRelatedTranslation
                                vocabularyBPMF = self.vocabularyList.foodRelatedBPMF
                            }.padding(.bottom,5)
                        }
                        
                        Button("Fruit"){
                            vocabularyTranslation = self.vocabularyList.fruitTranslation
                            vocabularyBPMF = self.vocabularyList.fruitBPMF
                        }.padding(.bottom,5)
                        
                        Button("Games"){
                            vocabularyTranslation = self.vocabularyList.gamesTranslation
                            vocabularyBPMF = self.vocabularyList.gamesBPMF
                        }.padding(.bottom,5)
                        
                    }
                    VStack{
                        Button("General\nAdverbs"){
                            vocabularyTranslation = self.vocabularyList.generalAdverbsTranslation
                            vocabularyBPMF = self.vocabularyList.generalAdverbsBPMF
                        }.padding(.bottom,5)
                        
                        Button("General\nAdverbs(2)"){
                            vocabularyTranslation = self.vocabularyList.generalAdverbsTranslation2
                            vocabularyBPMF = self.vocabularyList.generalAdverbsBPMF2
                        }.padding(.bottom,5)
                        
                        Button("General\nAdjectives"){
                            vocabularyTranslation = self.vocabularyList.generalAdjectivesTranslation
                            vocabularyBPMF = self.vocabularyList.generalAdjectivesBPMF
                        }.padding(.bottom,5)
                        
                        Button("General\nAdjectives(2)"){
                            vocabularyTranslation = self.vocabularyList.generalAdjectivesTranslation2
                            vocabularyBPMF = self.vocabularyList.generalAdjectivesBPMF2
                        }.padding(.bottom,5)
                        
                        Button("General\nAdjectives(3)"){
                            vocabularyTranslation = self.vocabularyList.generalAdjectivesTranslation3
                            vocabularyBPMF = self.vocabularyList.generalAdjectivesBPMF3
                        }.padding(.bottom,5)
                        
                        Button("General\nNouns"){
                            vocabularyTranslation = self.vocabularyList.generalNounsTranslation
                            vocabularyBPMF = self.vocabularyList.generalNounsBPMF
                        }.padding(.bottom,5)
                        
                        VStack{
                            Button("General\nNouns(2)"){
                                vocabularyTranslation = self.vocabularyList.generalNounsTranslation2
                                vocabularyBPMF = self.vocabularyList.generalNounsBPMF2
                            }.padding(.bottom,5)
                            
                            Button("General\nNouns(3)"){
                                vocabularyTranslation = self.vocabularyList.generalNounsTranslation3
                                vocabularyBPMF = self.vocabularyList.generalNounsBPMF3
                            }.padding(.bottom,5)
                            
                            Button("General\nVerbs"){
                                vocabularyTranslation = self.vocabularyList.generalVerbsTranslation
                                vocabularyBPMF = self.vocabularyList.generalVerbsBPMF
                            }.padding(.bottom,5)
                            
                            Button("General\nVerbs(2)"){
                                vocabularyTranslation = self.vocabularyList.generalVerbsTranslation2
                                vocabularyBPMF = self.vocabularyList.generalVerbsBPMF2
                            }.padding(.bottom,5)
                            
                            Button("General\nVerbs(3)"){
                                vocabularyTranslation = self.vocabularyList.generalVerbsTranslation3
                                vocabularyBPMF = self.vocabularyList.generalVerbsBPMF3
                            }.padding(.bottom,5)
                            
                            Button("General\nVerbs(4)"){
                                vocabularyTranslation = self.vocabularyList.generalVerbsTranslation4
                                vocabularyBPMF = self.vocabularyList.generalVerbsBPMF4
                            }.padding(.bottom,5)
                        }


                    }
                    VStack{
                        Button("Health"){
                            vocabularyTranslation = self.vocabularyList.healthTranslation
                            vocabularyBPMF = self.vocabularyList.healthBPMF
                        }.padding(.bottom,5)
                        
                        Button("Horror"){
                            vocabularyTranslation = self.vocabularyList.horrorTranslation
                            vocabularyBPMF = self.vocabularyList.horrorBPMF
                        }.padding(.bottom,5)
                    
                        Button("Household"){
                            vocabularyTranslation = self.vocabularyList.householdTranslation
                            vocabularyBPMF = self.vocabularyList.householdBPMF
                        }.padding(.bottom,5)
                        
                        Button("Infrastructure"){
                            vocabularyTranslation = self.vocabularyList.infrastructureTranslation
                            vocabularyBPMF = self.vocabularyList.infrastructureBPMF
                        }.padding(.bottom,5)
                        
                        Button("Language"){
                            vocabularyTranslation = self.vocabularyList.languageTranslation
                            vocabularyBPMF = self.vocabularyList.languageBPMF
                        }.padding(.bottom,5)
                        
                        Button("Location"){
                            vocabularyTranslation = self.vocabularyList.locationTranslation
                            vocabularyBPMF = self.vocabularyList.locationBPMF
                        }.padding(.bottom,5)
                        
                        Button("Machines"){
                            vocabularyTranslation = self.vocabularyList.machinesTranslation
                            vocabularyBPMF = self.vocabularyList.machinesBPMF
                        }.padding(.bottom,5)
                        
                        Button("Measure\nWords"){
                            vocabularyTranslation = self.vocabularyList.measureWordsTranslation
                            vocabularyBPMF = self.vocabularyList.measureWordsBPMF
                        }.padding(.bottom,5)
                        
                        Button("Media"){
                            vocabularyTranslation = self.vocabularyList.mediaTranslation
                            vocabularyBPMF = self.vocabularyList.mediaBPMF
                        }.padding(.bottom,5)
                    }
                    VStack{
                            Button("Mental\nVerbs"){
                                vocabularyTranslation = self.vocabularyList.mentalVerbsTranslation
                                vocabularyBPMF = self.vocabularyList.mentalVerbsBPMF
                            }.padding(.bottom,5)
                        
                            Button("Dessert"){
                                vocabularyTranslation = self.vocabularyList.dessertTranslation
                                vocabularyBPMF = self.vocabularyList.dessertBPMF
                            }.padding(.bottom,5)
                        
                            
                            Button("Nature"){
                                vocabularyTranslation = self.vocabularyList.natureTranslation
                                vocabularyBPMF = self.vocabularyList.natureBPMF
                            }.padding(.bottom,5)
                        }
                        
                    VStack{
                        Button("Patterns"){
                            vocabularyTranslation = self.vocabularyList.patternsTranslation
                            vocabularyBPMF = self.vocabularyList.patternsBPMF
                        }.padding(.bottom,5)
                        
                        Button("Personal\nCharacteristics"){
                            vocabularyTranslation = self.vocabularyList.personalCharacteristicTranslation
                            vocabularyBPMF = self.vocabularyList.personalCharacteristicBPMF
                        }.padding(.bottom,5).font(.system(size: 10))
                        
                        Button("Personal\nCharacteristics(2)"){
                            vocabularyTranslation = self.vocabularyList.personalCharacteristicTranslation2
                            vocabularyBPMF = self.vocabularyList.personalCharacteristicBPMF2
                        }.padding(.bottom,5).font(.system(size: 10))
                        
                        Button("Physical\nDescription"){
                            vocabularyTranslation = self.vocabularyList.physicalDescriptionTranslation
                            vocabularyBPMF = self.vocabularyList.physicalDescriptionBPMF
                        }.padding(.bottom,5)
                        
                        Button("Place Names"){
                            vocabularyTranslation = self.vocabularyList.placeNamesTranslation
                            vocabularyBPMF = self.vocabularyList.placeNamesBPMF
                        }.padding(.bottom,5)
                        
                    }
                    VStack{
                        
                        Button("Occupation"){
                            vocabularyTranslation = self.vocabularyList.occupationTranslation
                            vocabularyBPMF = self.vocabularyList.occupationBPMF
                        }.padding(.bottom,5)
                        
                        Button("Relationships"){
                            vocabularyTranslation = self.vocabularyList.relationshipsTranslation
                            vocabularyBPMF = self.vocabularyList.relationshipsBPMF
                        }.padding(.bottom,5)
                        
                        Button("Remarks"){
                            vocabularyTranslation = self.vocabularyList.remarksTranslation
                            vocabularyBPMF = self.vocabularyList.remarksBPMF
                        }.padding(.bottom,5)
                        
                        Button("Restaurants"){
                            vocabularyTranslation = self.vocabularyList.restaurantsTranslation
                            vocabularyBPMF = self.vocabularyList.restaurantsBPMF
                        }.padding(.bottom,5)
                        
                        Button("Sayings"){
                            vocabularyTranslation = self.vocabularyList.sayingsTranslation
                            vocabularyBPMF = self.vocabularyList.sayingsBPMF
                        }.padding(.bottom,5)
                        
                        Button("School"){
                            vocabularyTranslation = self.vocabularyList.schoolTranslation
                            vocabularyBPMF = self.vocabularyList.schoolBPMF
                        }.padding(.bottom,5)
                        
                        Button("Shopping"){
                            vocabularyTranslation = self.vocabularyList.shoppingTranslation
                            vocabularyBPMF = self.vocabularyList.shoppingBPMF
                        }.padding(.bottom,5)
                    }
                    
                    VStack{
                        Button("Specific\nMovements (1)"){
                            vocabularyTranslation = self.vocabularyList.specificMovementTranslation
                            vocabularyBPMF = self.vocabularyList.specificMovementBPMF
                        }.padding(.bottom,5)
                        
                        Button("Specific\nMovements (2)"){
                            vocabularyTranslation = self.vocabularyList.specificMovementTranslation2
                            vocabularyBPMF = self.vocabularyList.specificMovementBPMF2
                        }.padding(.bottom,5)
                        
                        Button("Specific\nMovements (3)"){
                            vocabularyTranslation = self.vocabularyList.specificMovementTranslation3
                            vocabularyBPMF = self.vocabularyList.specificMovementBPMF3
                        }.padding(.bottom,5)
                        
                        Button("Specific\nMovements (4)"){
                            vocabularyTranslation = self.vocabularyList.specificMovementTranslation4
                            vocabularyBPMF = self.vocabularyList.specificMovementBPMF4
                        }.padding(.bottom,5)
                        
                        Button("Technology"){
                            vocabularyTranslation = self.vocabularyList.technologyTranslation
                            vocabularyBPMF = self.vocabularyList.technologyBPMF
                        }.padding(.bottom,5)
                        
                        Button("Time\nWords"){
                            vocabularyTranslation = self.vocabularyList.timeWordsTranslation
                            vocabularyBPMF = self.vocabularyList.timeWordsBPMF
                        }.padding(.bottom,5)
                        
                        Button("Travel"){
                            vocabularyTranslation = self.vocabularyList.travelTranslation
                            vocabularyBPMF = self.vocabularyList.travelBPMF
                        }.padding(.bottom,5)
                        
                        Button("Vegetables"){
                            vocabularyTranslation = self.vocabularyList.vegetableTranslation
                            vocabularyBPMF = self.vocabularyList.vegetableBPMF
                        }.padding(.bottom,5)
                        
                        Button("Wearables"){
                            vocabularyTranslation = self.vocabularyList.wearablesTranslation
                            vocabularyBPMF = self.vocabularyList.wearablesBPMF
                        }.padding(.bottom,5)
                        
                    }
                
                        
                    VStack{
                        Button("Work(1)"){
                            vocabularyTranslation = self.vocabularyList.workTranslation
                            vocabularyBPMF = self.vocabularyList.workBPMF
                        }.padding(.bottom,5)
                        
                        Button("Work(2)"){
                            vocabularyTranslation = self.vocabularyList.workTranslation2
                            vocabularyBPMF = self.vocabularyList.workBPMF2
                        }.padding(.bottom,5)
                        
                        Button("Work(3)"){
                            vocabularyTranslation = self.vocabularyList.workTranslation3
                            vocabularyBPMF = self.vocabularyList.workBPMF3
                        }.padding(.bottom,5)
                        
                        Button("Work(4)"){
                            vocabularyTranslation = self.vocabularyList.workTranslation4
                            vocabularyBPMF = self.vocabularyList.workBPMF4
                        }.padding(.bottom,5)
                        
                        Button("Work(5)"){
                            vocabularyTranslation = self.vocabularyList.workTranslation5
                            vocabularyBPMF = self.vocabularyList.workBPMF5
                        }.padding(.bottom,5)
                        
                        Button("Work(6)"){
                            vocabularyTranslation = self.vocabularyList.workTranslation6
                            vocabularyBPMF = self.vocabularyList.workBPMF6
                        }.padding(.bottom,5)
                        
                        
                        
                    }
                }
                .frame(maxWidth: 80)
                .multilineTextAlignment(.center)
                
            }
            .padding(.leading,10)
            .font(.system(size: 12))
            NavigationView{
                VStack{
                    NavigationLink(destination: ContentPreview(contentOne: self.$vocabularyTranslation, contentTwo: self.$vocabularyBPMF)){
                    Text("Preview")

                    }
                    
                }
                .navigationBarHidden(true)
                .navigationBarTitle("")
                
                
            }
            
            VStack{
                
                NavigationLink(destination: Test(contentOne: self.$vocabularyTranslation, contentTwo: self.$vocabularyBPMF, pronunciation: self.$pronunciation, timerValue: self.$timerValue)){
                Text("S\nt\na\nr\nt\n \nT\ne\ns\nt\n")
                }.disabled(self.vocabularyTranslation == [""])
            }
            .padding(.leading,5)
            .padding(.trailing)
        }
    }
}

struct Vocabulary_Previews: PreviewProvider {
    @State static var pronunciation = true
    @State static var timerValue = 1.1
    static var previews: some View {
        Vocabulary(pronunciation:$pronunciation, timerValue:$timerValue)
    }
}
