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
    
    /*Basics section
     */
    @Published var basicsChineseBPMF = [""]
    @Published var basicsChineseTranslation = ["i/me","he/she/it","we/us","they/them","who","what","where","when","why","to go","to come","to talk","to want","to feel\n(opinion)","to eat","to drink","and\n(only nouns)","and\n(connecting sentences)"]
    
    @Published var basicsNumbersBPMF = ["ㄌㄧㄥˊ","ㄧ ","ㄦˋ","ㄙㄢ ","ㄙˋ","ㄨˇ","ㄌㄧㄡˋ","ㄑㄧ ","ㄅㄚ ","ㄐㄧㄡˇ","ㄕˊ","ㄅㄞˇ","ㄑㄧㄢ ","ㄨㄢˋ"]
    @Published var basicsNumbersTranslation = ["0","1","2","3","4","5","6","7","8","9","10s place","100s place","1000s place","10000s place"]
    
    @Published var basicsIntroducingYourselfBPMF = ["ㄇㄧㄥˊㄗ˙","ㄐㄧㄠˋ","ㄔㄨㄛˋㄏㄠˋ"]
    @Published var basicsIntroducingYourselfTranslation = ["name","to be called\n(a name)","nickname"]
    
    @Published var basicsPersonalFavoritesBPMF = ["ㄓㄥˇㄌㄧˇ"]
    @Published var basicsPersonalFavoritesTranslation = ["to organize"]
    
    
    // This section is about popular topics
    
    @Published var topicLanguageLearningBPMF = ["ㄕㄤˋㄎㄜˋ","ㄒㄧㄚˋㄎㄜˋ","ㄌㄠˇㄕ ","ㄒㄩㄝˊㄕㄥ ","ㄍㄡ ㄊㄨㄥ ","ㄐㄩˇㄕㄡˇ","ㄐㄧ ㄅㄣˇ","ㄐㄧ ㄔㄨˇ","ㄕˊㄐㄧˋ","ㄐㄧㄡ ㄓㄥˋ","ㄍㄞˇㄓㄥˋ","ㄊㄨㄟˋㄅㄨˋ"]
    @Published var topicLanguageLearningTranslation = ["to go\nto class","to get out\nof class","teacher","student","to communicate","to raise\nhand","basic","foundation\nbasic","practical","to correct\n(someone else)","to correct\n(self)","to regress\nbecome worse"]
    
    @Published var topicLanguageExchangeBPMF = ["ㄇㄧㄥˊㄘˊ","ㄉㄨㄥˋㄘˊ","ㄒㄧㄥˊㄖㄨㄥˊㄘˊ","ㄊㄨㄥˊㄧㄣ ㄘˊ","ㄌㄨˋㄧㄣ ","ㄊㄨㄥˊㄧㄣ ㄘˊ","ㄊㄨㄛ ㄈㄨˊ","ㄈㄢˊㄊㄧˇ","ㄅㄧㄠ ㄉㄧㄢˇㄈㄨˊㄏㄠˋ","ㄏㄨㄟˊㄎㄨㄟˋ","ㄏㄢˊㄧˋ","ㄎㄡˇㄩˇ"]
    @Published var topicLanguageExchangeTranslation = ["noun","verb","adjective","homophones","sound\nrecording","homophones","TOEFL","traditional\nchinese","punctuation\nmarks","feedback","implied\nmeaning","colloquial"]
    
    @Published var topicDrivingOnRoadBPMF = ["ㄔㄜ ㄎㄨˋ","ㄉㄤˇ","ㄕㄡˇㄆㄞˊ","ㄓㄨㄢˇㄨㄢ ","ㄌㄨㄣˊㄗ˙","ㄔㄜ ㄉㄥ ","ㄢ ㄑㄩㄢˊㄉㄞˋ","ㄉㄠˋㄉㄤˇ","ㄘㄞˇ","ㄋㄧㄡˇ","ㄧㄡˊㄇㄣˊ","ㄗˋㄆㄞˊ","ㄔㄜ ㄉㄠˋ","ㄊㄧㄥˊㄔㄜ ㄨㄟˋ","ㄙㄞ ㄔㄜ ","ㄑㄧˇㄉㄨㄥˋ","ㄗㄞˋㄖㄣˊ","ㄐㄧㄝ ","ㄕㄨㄣˋㄌㄨˋ"]
    @Published var topicDrivingOnRoadTranslation = ["garage","gear","manual\ntransmission","corner;turn","wheel","headlights","seat belt","reverse\ngear","to step on","to twist","throttle","automatic\ntransmission","traffic\nlane","parking\nspace","held up\nin traffic","to turn on\n(machine)","to carry\npassengers","to pick\nsmbdy up","on the way"]
    
    @Published var topicWorkingBPMF = ["ㄓㄨㄢˋㄑㄧㄢˊ","ㄧㄥˋㄓㄥ ","ㄗ ㄍㄜˊ","ㄐㄧㄚ ㄒㄧㄣ ","ㄓ ㄕˋ","ㄗㄠˇㄅㄢ ","ㄨㄢˇㄅㄢ ","ㄧㄝˋㄅㄢ ","ㄐㄧㄥˇㄍㄠˋ","ㄉㄧㄥ ㄓㄨˋ","ㄍㄨˋㄌㄧˋ","ㄉㄧˋㄨㄟˋ"]
    @Published var topicWorkingTranslation = ["to earn\nmoney","to apply\nfor a job","qualifications","to raise\nsalary","knowledge","morning\nshift","night\nshift","late night\nshift","to warn","to breathe\ndown smbdy's\nback","to encourage","position\n(not physical)"]
    
    @Published var topicOfficeJobBPMF = ["ㄖㄣˊㄩㄢˊ","ㄓㄨˇㄍㄨㄢˇ","ㄍㄨㄟˋㄊㄞˊ","ㄊㄧˊㄍㄨㄥ ","ㄗㄜˊㄖㄣˋ","ㄖㄣˋㄨ˙","ㄑㄧˊㄒㄧㄢˋ","ㄔㄚˊㄎㄢˋ","ㄈㄨˋㄐㄧㄢˋ","ㄋㄟˋㄖㄨㄥˊ","ㄐㄧㄣˋㄉㄨˋ","ㄏㄨㄟˊㄎㄨㄟˋ","ㄢ ㄆㄞˊ","ㄎㄜˋㄏㄨˋ","ㄉㄨㄟˋㄧㄡˇ","ㄧㄡ ㄉㄧㄢˇ","ㄑㄩㄝ ㄉㄧㄢˇ","ㄓˋㄉㄨˋ","ㄆㄟˋㄏㄜˊ","ㄙ ㄒㄧㄚˋ"]
    @Published var topicOfficeJobTranslation = ["personnel","supervisor","front desk","to provide","responsibility","task","deadline","to examine","e-mail\nattachment","contents","progress","feedback","to arrange\n(matters)","client","team member","advantage","disadvantage","system","to coordinate\nwith","in private"]
    
    @Published var topicAskingForHelpBPMF = ["ㄅㄤ ","","ㄖㄣˊㄑㄧㄥˊ"]
    @Published var topicAskingForHelpTranslation = ["to help","to bother\nsomeone","favor"]
    
    @Published var topicDrinkingBPMF = ["ㄐㄧㄡˇㄌㄧㄤˋ","ㄕㄥ ㄆㄧˊㄐㄧㄡˇ"]
    @Published var topicDrinkingTranslation = ["tolerance","draft beer"]
    
    @Published var topicMRTBPMF = ["ㄐㄧㄝˊㄩㄣˋ","ㄉㄧㄢˋㄈㄨˊㄊㄧ ","ㄧㄡ ㄧㄡˊㄎㄚˇ","ㄐㄧㄚ ㄓˊ","ㄆㄚˊㄉㄨㄟˋ","ㄔㄚ ㄉㄨㄟˋ"]
    @Published var topicMRTTranslation = ["mass rapid\ntransit","escalator","MRT card","to recharge\n(money)","to get\nin line","to cut\nin line"]
    
    @Published var topicShoppingBPMF = ["ㄓㄜˊ","ㄧㄡ ㄏㄨㄟˋ","ㄉㄧㄥˋㄉㄢ ","ㄐㄧㄚˋㄓˊ","ㄓˊㄉㄜ˙","ㄊㄧㄠ "]
    @Published var topicShoppingTranslation = ["discount\n(percentage)","discount","to order","value\nworth","to be\nworth it","to pick"]
    
    @Published var topicExplainingYourPerspectiveBPMF = ["ㄓㄨㄥˋㄉㄧㄢˇ","ㄨˋㄐㄧㄝˇ","ㄓㄨˋㄧˋ","ㄎㄨㄥˇㄆㄚˋ","ㄨˊㄙㄨㄛˇㄨㄟˋ","ㄗㄨㄛˋㄈㄚˇ","ㄉㄞˋㄅㄧㄠˇ","ㄈㄣ ㄅㄧㄢˋ"]
    @Published var topicExplainingYourPerspectiveTranslation = ["main point","to misunderstand","to pay\nattention","to be afraid\nthat","indifferent","way of doing\nsmth","to represent","to distinguish\nto differentiate"]
    
    @Published var topicApologizingBPMF = ["ㄉㄨㄟˋㄅㄨˋㄑㄧˇ","ㄅㄨˋㄏㄠˇㄧˋㄙ˙","ㄘㄨㄛˋ","ㄘㄨㄛˋㄨˋ"]
    @Published var topicApologizingTranslation = ["sorry","sorry (casual)\nexcuse me","wrong doing\nfault","mistake"]
    
    @Published var topicCultureBPMF = ["ㄨㄣˊㄏㄨㄚˋ","ㄨㄣˊㄏㄨㄚˋㄔㄨㄥ ㄐㄧ ","ㄇㄧˊㄒㄧㄣˋ"]
    @Published var topicCultureTranslation = ["culture","culture shock","superstition"]
    
    @Published var topicCookingBPMF = ["ㄑㄧㄝ ","ㄏㄨㄥ ㄅㄟˋ","ㄓㄥ ","ㄔㄠˇ","ㄐㄧㄢ ","ㄐㄧㄤˋ","ㄓㄚˋ","ㄐㄧˇ","ㄊㄧㄢˇ"]
    @Published var topicCookingTranslation = ["to slice/cut","to bake","steamed","scrambled","pan fried","sauce","to press\n(juice)","to squeeze\n(w/ fingers)","to lick"]
    
    @Published var topicDirectionsBPMF = ["ㄕㄤˋ","ㄒㄧㄚˋ","ㄗㄨㄛˇ","ㄧㄡˋ","ㄧ ㄓˊ","ㄇㄚˇㄌㄨˋ","ㄍㄨㄛˋ","ㄅㄧㄢ ","ㄅㄨˋ"]
    @Published var topicDirectionsTranslation = ["up","down","left","right","straight","street","to cross\n(street)","side","relative\nlocation"]
    
    @Published var topicConvenienceStoreBPMF = ["ㄏㄨㄢ ㄧㄥˊㄍㄨㄤ ㄌㄧㄣˊ","ㄏㄨㄟˋㄩㄢˊ","ㄩㄥˋ","ㄎㄚˇ"]
    @Published var topicConvenienceStoreTranslation = ["welcome","membership","to use","card"]

    @Published var topicComplainingWorkBPMF = ["ㄅㄠˋㄩㄢˋ","ㄈㄚ ㄒㄧㄝˋ","ㄌㄢˇㄍㄨㄟˇ","ㄕㄥˋㄖㄣˋ","ㄋㄧˋ","ㄧㄚ ㄓㄚˋ","ㄊㄨ ㄊㄡˊ"]
    @Published var topicComplainingWorkTranslation = ["to complain","to vent","lazy ass","to be\ncompetent","tired\nof smth.","exploit\nworking","bald"]
    
    @Published var topicComplainingRelationshipBPMF = ["ㄔㄠˇㄐㄧㄚˋ","ㄅㄧˋㄇㄧㄢˇ","ㄉㄚˇㄉㄨㄢˋ","ㄐㄩˋㄐㄩㄝˊ","ㄔㄨㄥ ㄊㄨ ","ㄐㄧㄚˇㄕㄜˋ","ㄌㄧˋㄔㄤˇ","ㄐㄧㄠ ㄠˋ","ㄅㄨˋㄌㄧˇ","ㄇㄚˋ","ㄧㄣˇㄙ ","ㄏㄨㄞˊㄧˊ","ㄗㄞˋㄏㄨ˙","ㄗㄞˋㄧˋ","ㄐㄧㄝˋㄧˋ","ㄑㄧˋㄓㄚˋ","ㄢ ㄨㄟˋ","ㄇㄠˋㄈㄢˋ","ㄐㄩˋㄌㄧˊ","ㄈㄥ ㄎㄨㄤˊ","ㄓㄢˋㄆㄧㄢˊㄧ˙"]
    @Published var topicComplainingRelationshipTranslation = ["to argue","to avoid","to interrupt","to reject","conflicts","to assume","perspective","pride","ignore","to scold","secrets","to doubt","to care\n(about people)","to care\n(about things)","to mind","to burst\nwith rage","to comfort","to offend","distant\n(emotionally)","crazy","take\nadvantage of"]
    
    @Published var topicObsceneWordsBPMF = ["ㄗㄤ ㄏㄨㄚˋ","ㄍㄠˇ","ㄒㄧㄚˋㄌㄧㄡˊㄏㄨㄚˋ","ㄈㄟˋㄏㄨㄚˋ","ㄍㄢˋ","ㄎㄠˋ"]
    @Published var topicObsceneWordsTranslation = ["obscene\nwords","to do (bad)","dirty\nwords","bullshit","fuck","shit\ndamn"]
    
    @Published var topicRemarksReactionsBPMF = ["ㄓㄣ ㄐㄧㄚˇㄉㄜ˙","ㄅㄨˋㄙㄨㄢˋ","ㄕㄚˇㄧㄢˇ","ㄒㄧㄤ ㄏㄨㄚˋㄇㄚ","ㄕ ㄗㄨㄥ ","ㄈㄢˇㄓㄥˋ","","ㄌㄧㄥˋㄧ ㄈㄤ ㄇㄧㄢˋ","ㄗㄣˇㄇㄜ˙ㄕㄨㄛ ","ㄅㄧˋㄗㄨㄟˇ","ㄧ ㄌㄨˋㄕㄨㄣˋㄈㄥ ","ㄏㄨㄛˊㄍㄞ "]
    @Published var topicRemarksReactionsTranslation = ["really?!","it doesn't count","unbelievable","is that\nreasonable?","anyway,...","where did\nhe/she go?\nhe/she disappeared","on the other hand,...","how so?","shut up","have a\ngood trip!","serves you right"]
    
    
    
    // This section is about specific scenarios that happen in everyday life
    @Published var scenarioRunningOutOfBatteryBPMF = ["ㄔㄚ ㄗㄨㄛˋ","ㄔㄚ ","ㄅㄚˊ","ㄔㄨㄥ ㄉㄧㄢˋㄑㄧˋ","ㄔㄚ ㄊㄡˊ","ㄒㄧㄥˊㄉㄨㄥˋㄉㄧㄢˋㄩㄢˊ","ㄉㄧㄢˋㄩㄢˊㄒㄧㄢˋ"]
    @Published var scenarioRunningOutofBatteryTranslation = ["electric\nsocket","to plug in","to pull out","charger","charger block","power bank","power cable"]
    
    @Published var scenarioOrderingDrinksBPMF = ["ㄖㄜˋ","ㄨㄣ ","ㄅㄧㄥ ","ㄅㄟ ","ㄒㄧㄠˇ","ㄓㄨㄥ ","ㄉㄚˋ","ㄊㄤˊ","ㄑㄩˋ","ㄨㄟ ","ㄅㄢˋ","ㄑㄩㄢˊ"]
    @Published var scenarioOrderingDrinksTranslation = ["hot","warm","ice","cup\n(drink size)","small(size)","medium(size)","large(size)","sugar","none~0%","micro~30%","half~50%","full~100%"]
    
    @Published var scenarioGettingGasBPMF = ["ㄐㄧㄚ ㄇㄢˇ","ㄊㄧㄢˋㄊㄧㄥˊ"]
    @Published var scenarioGettingGasTranslation = ["fill till full","gas popping noise\n(when full)"]
    
    @Published var scenarioRestaurantBPMF = ["ㄩㄥˋㄘㄢ ","ㄋㄟˋㄩㄥˋ","ㄨㄞˋㄉㄞˋ","ㄉㄚˇㄅㄠ ","ㄉㄧㄥˋㄨㄟˋ","ㄈㄨˊㄨˋ","ㄏㄨㄟˊㄔㄨㄥ ","ㄎㄣˇ","ㄐㄧㄠˊ","ㄗㄠˇ","ㄇㄢˇㄧˋ"]
    @Published var scenarioRestaurantTranslation = ["to have a meal","eat in","take out","to make\na reservation","bag\nleftovers","service","to refill\n(tea bag)","to nibble","to chew","to bite","satisfied"]
    
    @Published var scenarioWearingClothesBPMF = ["ㄧ ㄈㄨˊ","ㄎㄡˋ","ㄒㄧˋ","ㄆㄧˊㄉㄞˋ","ㄉㄞˋ","ㄔㄨㄢ ","ㄉㄚ ㄆㄟˋ","ㄐㄩㄢ "]
    @Published var scenarioWearingClothesTranslation = ["clothes","to button\nup","to fasten\n(belt)","belt","to wear\n(accessories)","to wear(clothes)","to match\n(clothes)","to donate"]
    
    @Published var scenarioHaircutBPMF = ["ㄐㄧㄢˇ","ㄉㄨㄢˋ","ㄐㄧㄢˇㄘㄥˊ"]
    @Published var scenarioHaircutTranslation = ["to cut","short","fade"]
    
    @Published var scenarioFacingChallengesBPMF = ["ㄊㄧㄠˇㄓㄢˋ","ㄧㄥˋㄧㄠˋ","ㄎㄜˋㄈㄨˊ","ㄈㄢˇㄏㄨㄟˇ","ㄔㄨˇㄌㄧˇ","ㄍㄠˇㄗㄚˊ","ㄘㄡˋㄏㄜ˙","ㄐㄧㄝˇㄐㄩㄝˊ","ㄍㄨㄢ ㄔㄚˊ"]
    @Published var scenarioFacingChallengesTranslation = ["challenge","set on doing\nsmth","to overcome","to back out","to deal with\nto handle","to mess\nsmth up","to improvise\nto make do","to fix\na problem","to observe and\nsee what\nhappens"]
    
    @Published var scenarioInterviewBPMF = ["ㄇㄧㄢˋㄕˋ","ㄅㄧㄠˇㄑㄧㄥˊ"]
    @Published var scenarioInterviewTranslation = ["interview","expression\n(facial)"]
    
    @Published var scenarioBeingDownBPMF = ["ㄐㄧㄥ ㄕㄣ ","ㄒㄧㄣ ㄑㄧㄥˊ","ㄎㄨ ","ㄌㄧㄡˊㄧㄢˇㄌㄟˋ"]
    @Published var scenarioBeingDownTranslation = ["energy","state of mind\n(mood)","to cry","to shed tears"]
    
    @Published var scenarioComputerBPMF = ["ㄉㄧㄢˋㄋㄠˇ","ㄨㄤˇㄓㄢˋ","ㄉㄚˇㄗˋ","ㄕㄢ ㄔㄨˊ","ㄆㄧㄥˊㄐㄧㄚˋ","ㄒㄧㄡ ㄌㄧˇ"]
    @Published var scenarioComputerTranslation = ["computer","website","to type","to delete","reviews","to repair"]
    
    @Published var scenarioThrowingTrashBPMF = ["ㄌㄜˋㄙㄜˋ","ㄉㄧㄡ ","ㄏㄨㄟˊㄕㄡ ","ㄌㄜˋㄙㄜˋㄔㄜ "]
    @Published var scenarioThrowingTrashTranslation = ["trash","to throw","to recycle","trash truck"]
    
    @Published var scenarioBeingSingleBPMF = ["ㄉㄢ ㄕㄣ ","ㄊㄡˊㄎㄢˋ","ㄈㄤˋㄍㄜ ㄗ˙","ㄊㄧㄠˊㄎㄢˇ","ㄓㄨㄟ ","ㄅㄚˇㄇㄟˋ","ㄒㄧㄣˋㄉㄨㄥˋ","ㄧˊㄏㄢˋ","ㄧㄡˊㄩˋ","ㄇㄧˊㄌㄧㄢˋ","ㄇㄟˊㄒㄧˋ","ㄕㄨˊ","ㄑㄧㄣ ㄐㄧㄣˋ","ㄍㄠˋㄅㄞˊ","ㄒㄧˋㄨㄟˊ","ㄋㄧˋㄇㄧㄥˊ","ㄌㄧˋㄒㄧㄤˇ","ㄇㄧㄥˊㄒㄧㄢˇ"]
    @Published var scenarioBeingSingleTranslation = ["single","to steal\na glance","to stand\nsmbdy up","to tease","to pursue\n(smbdy)","to get\na girl","to feel something\n(for someone)","to regret","to hesitate","to obsess","to have\nno chance\n(hopeless)","to be familiar","to be close to","to confess\n(love)","subtle","anonymous","ideal","obvious"]
    
    @Published var scenarioHouseholdChoresBPMF = ["ㄇㄛˇㄅㄨˋ","ㄋㄧˊㄊㄨˇ","ㄍㄨㄚˋ"]
    @Published var scenarioHouseholdChoresTranslation = ["cleaning\nrag","dirt","to hang\n(things)"]

    @Published var scenarioBeachBPMF = ["ㄕㄚ ㄊㄢ ","ㄕㄞˋ","ㄊㄞˋㄧㄤˊ"]
    @Published var scenarioBeachTranslation = ["beach","to bathe\n(in sun)","sun"]
    
    @Published var scenarioYogaBPMF = ["ㄩˊㄐㄧㄚ ","ㄒㄧㄚˋㄑㄩㄢˇㄕˋ","ㄅㄟˋㄆㄧㄥˊ","ㄓㄨㄥ ㄒㄧㄣ ","ㄎㄡˇㄑㄧˋ","ㄒㄧ ","ㄊㄨˇ","ㄆㄧㄥˊㄅㄢˇ"]
    @Published var scenarioYogaTranslation = ["yoga","downward\ndog","flat back","central\npoint\nof weight","breathe","breathe in","breathe out","to plank"]
    
    @Published var scenarioHandlingCameraBPMF = [""]
    @Published var scenarioHandlingCameraTranslation = [""]
    
    @Published var scenarioPackageDeliveryBPMF = ["ㄅㄠ ㄍㄨㄛˇ","ㄋㄚˊ"]
    @Published var scenarioPackageDeliveryTranslation = ["package","to take"]
    
    @Published var scenarioSalonBPMF = ["ㄖㄢˇㄈㄚˋ"]
    @Published var scenarioSalonTranslation = ["to dye hair"]
    
    @Published var scenarioNatureBPMF = ["ㄌㄨˋㄊㄧㄢ ","ㄖˋㄔㄨ ","ㄖˋㄌㄨㄛˋ","ㄕㄨˋ","ㄕˊㄊㄡ˙","ㄍㄨㄤ ㄒㄧㄢˋ","ㄌㄨˋㄕㄨㄟ˙","ㄙㄣ ㄌㄧㄣˊ"]
    @Published var scenarioNatureTranslation = ["outdoors","sunrise","sunset","trees","rocks","natural\nlighting","dew","forest"]
    
    @Published var scenarioImmigrantBPMF = ["ㄕㄣ ㄈㄣ˙ㄖㄣˋㄊㄨㄥˊ","ㄧˊㄇㄧㄣˊ","ㄍㄨㄟ ㄕㄨˇㄍㄢˇ","ㄈㄨˋㄉㄢ ","ㄎㄜˋㄈㄨˊ","ㄍㄨㄛˊㄇㄧㄣˊ","ㄆㄧㄢˋㄐㄧㄢˋ"]
    @Published var scenarioImmigrantTranslation = ["personal\nidentity","to immigrate","sense of\nbelonging","to bear a\nburden","to endure\n(hardships)","citizens","prejudice"]
    
    @Published var scenarioWorkingOnSomethingBPMF = ["ㄓㄨㄢ ㄒㄧㄣ ","ㄈㄣ ㄒㄧㄣ ","ㄉㄚˇㄖㄠˇ"]
    @Published var scenarioWorkingOnSomethingTranslation = ["to concentrate","distracted","to disturb"]
    
    @Published var scenarioWorkingInManufacturingDesignBPMF = ["ㄍㄨㄟ ㄍㄜˊ","ㄈㄥ ㄒㄧㄢˇ","ㄍㄨㄥ ㄔㄚ ","ㄗㄨㄟˋㄒㄧㄠˇㄏㄨㄚˋ","ㄗㄨㄟˋㄉㄚˋㄏㄨㄚˋ","ㄊㄜˋㄒㄧㄥˊ","ㄒㄧㄥˊㄕˋ","ㄅㄧㄢˋㄒㄧㄥˊ","ㄖㄨㄢˇㄊㄧˇ","ㄉㄧㄢˋㄧㄚ ","ㄉㄧㄢˋㄌㄧㄡˊ","ㄆㄧㄥˊㄐㄩㄣ ","ㄐㄩˋㄊㄧˇ","ㄐㄧˊㄒㄧㄢˋ"]
    @Published var scenarioWorkingInManufacturingDesignTranslation = ["specifications","risk","tolerance","to minimize","to maximize","specific\nproperty","outer\nappearance","to deform","software","voltage","current","average","specific or\nconcrete","limit"]
    
    @Published var scenarioWorkingInManufacturngProcessBPMF = ["ㄓˋㄔㄥˊ","ㄕㄥ ㄔㄤˇ","ㄓˋㄌㄧㄤˋ","ㄧㄢˋㄓㄥˋ","ㄧˊㄐㄧ ","ㄅㄠ ㄓㄨㄤ ","ㄇㄠˇ","ㄉㄧㄢˇㄏㄢˋ","ㄌㄟˊㄏㄢˋ","ㄒㄧ ㄏㄢˋ","ㄏㄨㄥ ㄍㄢ ","ㄕㄨˋㄌㄧㄤˋ","ㄓㄨˋㄙㄨˋ","ㄗㄨˇㄓㄨㄤ ","ㄓㄜˊ"]
    @Published var scenarioWorkingInManufacturingProcessTranslation = ["manufacturing\nprocess","to\nmanufacture","quality","validation","to relocate\nequipment","packaging","crimp","spot welding","laser weld","soldering","oven baking","number\n(of things)","injection\nmold","assemble","to bend"]
    
    @Published var scenarioWorkingInManufacturingMaterialsBPMF = ["ㄔㄤˇㄕㄤ ","ㄔㄨ ㄅㄨˋ","ㄍㄨ ㄐㄧㄚˋ","ㄌㄧㄥˊㄐㄧㄢˋ","ㄊㄨˊㄘㄥˊ","ㄍㄨㄢˇㄗ˙"]
    @Published var scenarioWorkingInManufacturingMaterialsTranslation = ["supplier\nmanufacturer\nproducer","preliminary","estimation","parts\ncomponents","coating","tube\npipe"]
    
    @Published var scenarioWorkingInManufacturingProjectManagementBPMF = ["ㄖㄣˋㄨˋ","ㄧㄠ ㄑㄧㄡˊ","ㄓㄨㄥˋㄧㄠˋㄒㄧㄥˋ","ㄊㄨㄥ ㄓ ","ㄆㄧㄥˊㄒㄧㄥˊ","ㄑㄧㄢˊㄊㄧˊ","ㄍㄨㄟ ㄏㄨㄚˋ","ㄎㄜˇㄋㄥˊㄒㄧㄥˋ","ㄊㄧㄠˊㄐㄧㄢˋ","ㄔㄥˊㄒㄩˋ","ㄈㄣ ㄒㄧ ","ㄒㄧㄠˋㄌㄩˋ","ㄎㄨㄤˋㄎㄨㄤˋ","ㄐㄧㄢˇㄔㄚˊ","ㄍㄥ ㄒㄧㄣ ","ㄒㄧㄡ ㄍㄞˇ","ㄔㄨ ㄅㄨˋ","ㄍㄨ ㄐㄧㄚˋ","ㄈㄨˋㄎㄨㄢˇ","ㄔㄨ ㄔㄞ ","ㄨㄟˊㄓㄨˇ","ㄨㄟˊㄈㄨˇ","ㄍㄨㄢˇㄌㄧˇㄅㄨˋㄇㄣˊ","ㄒㄧㄠ ㄕㄡˋㄅㄨˋ","ㄖㄣˊㄕˋㄅㄨˋ","ㄧㄢˊㄈㄚ ㄅㄨˋ"]
    @Published var scenarioWorkingInManufacturingProjectManagementTranslation = ["tasks","requests","significance\nimportance","to notify","simultaneous","prerequisite","to schedule\n(on timeline)","probability\npossibility","requirement","procedure","analysis","efficiency","to frame","to inspect","to update","to revise","initial\npreliminary","estimation","payment","to go away\nfor business","to give\npriority to","to give\nsecondary to","administrative\ndepartment","sales\nmarketing\ndepartment","hr\ndepartment","r&d\ndepartment"]
    
    
    
    
    
    
    // This section is about possible discussion topics that happen in everyday life
    
    @Published var discussionGeneralBPMF = ["ㄈㄢˇㄧㄥˋ","ㄒㄧㄥˊㄖㄨㄥˊ","ㄔㄨㄟ ㄋㄧㄡˊ","ㄇㄧㄢˋㄉㄨㄟˋ","ㄊㄧˊㄑㄧˇ","ㄌㄨㄢˋㄐㄧㄤˇ","ㄇㄧㄥˊㄑㄩㄝˋ","ㄧ ㄐㄧㄢˋ","ㄕㄣ ","ㄒㄧˋㄐㄧㄝˊ","ㄒㄧㄤ ㄈㄢˇ","ㄕˋㄕˊ","ㄘˋㄕㄨˋ","ㄌㄧˋㄩㄥˋ","ㄍㄞˇㄅㄧㄢˋ","ㄈㄟ ㄧㄠˋ","ㄊㄧㄠˊㄓㄥˇ"]
    @Published var discussionGeneralTranslation = ["reaction","to describe","to brag","to confront","to mention","to speak\ncarelessly","to make clear","an objection","deep","details","opposite","facts","number of\ntimes","to make\nuse of","to change","to insist","to adjust"]
    
    @Published var discussionWhatToDoBPMF = ["ㄑㄧ ㄉㄞˋ","ㄉㄚˇㄈㄚ ","ㄓㄨㄣˇㄕˊ","ㄌㄨˋㄧㄥˊ","ㄅㄠˋㄇㄧㄥˊ","ㄑㄩˇㄒㄧㄠ ","ㄕㄨㄚˇㄈㄟˋ","ㄆㄚˊㄕㄢ ","ㄌㄧㄡ ㄅㄧㄥ ","ㄌㄞˋㄔㄨㄤˊ","ㄨㄣ ㄑㄩㄢˊ"]
    @Published var discussionWhatToDoTranslation = ["to look\nforward to","to kill\ntime","to be punctual","to be lazy in bed","to sign up","to cancel","to chill\npass time idly","to go hiking","camping","ice skate","hotsprings"]
    
    @Published var discussionWhatToEatBPMF = ["ㄨㄞˋㄙㄨㄥˋ","ㄊㄧㄠ ㄕˊ","ㄔ ㄉㄠˋㄅㄠˇ","ㄕㄡˋㄙ ","ㄏㄞˇㄒㄧㄢ ","ㄕˋ"]
    @Published var discussionWhatToEatTranslation = ["delivery","picky\neater","buffet","sushi","seafood","something-style\n(e.g. thai-style)"]

    @Published var discussionRelationshipsBPMF = ["ㄌㄤˋㄇㄢˋ","ㄑㄧㄣ ㄞˋㄉㄜ˙","ㄌㄧㄥˋㄧ ㄅㄢˋ","ㄔㄨ ㄌㄧㄢˋ","ㄔㄥˊㄓㄤˇ","ㄓㄡ ㄋㄧㄢˊ","ㄓㄣ ㄒㄧ ","ㄔㄨㄥˇㄏㄨㄞˋ","ㄊㄨㄥˊㄐㄩ ","ㄈㄣ ㄐㄩ ","ㄍㄨㄢˇㄑㄧㄥˊ","ㄩㄝ ㄏㄨㄟˋ","ㄨㄣ ㄋㄨㄢˇ","ㄉㄨㄣˋㄆㄞˊ"]
    @Published var discussionRelationshipsTranslation = ["romantic","dear","other half","first love","to grow","anniversary","to cherish","to spoil","to live\ntogether","to live\nseparate","affection\n(between two)","date\n(romantic)","warm","shield"]
    
    @Published var discussionLifeGoalsBPMF = ["ㄐㄧㄝ ㄉㄨㄢˋ","ㄇㄥˋㄒㄧㄤˇ","ㄓㄨㄟ ㄑㄧㄡˊ","ㄕˋㄏㄠˋ","ㄩㄣˋㄑㄧˋ","ㄒㄧㄥˋㄩㄣˋ","ㄌㄧˇㄧㄡˊ","ㄩㄢˊㄧㄣ ","ㄧㄠˋㄎㄢˋ","ㄓㄨˇㄧ˙","ㄔㄥˊㄅㄞˋ","ㄒㄧㄢˋㄓˋ","ㄕㄤˋㄐㄧㄣˋㄒㄧㄣ ","ㄩㄢˋㄨㄤˋ","ㄓㄤˋㄞˋ","ㄕˋㄊㄨˊ","ㄒㄧㄤˋㄕㄤˋ","ㄓㄥˋㄇㄧㄥˊ","ㄔㄥˊㄨㄟˊ","ㄒㄧㄤˇㄒㄧㄤˋ"]
    @Published var discussionLifeGoalsTranslation = ["stage\nphase","dreams\ngoals","ambitions","hobby\n(want to be\ngood)","luck\n(noun)","luck\n(adj)","excuse\n(to not do\nsmth)","reason","depends on","idea","success and\nfailures","restrictions","desire to\ndo better","wish","obstacles","try to do\n(smth)","to advance\nhigher","to prove","to become\n(end state)","to imagine"]
    
    @Published var discussionThePastBPMF = ["ㄑㄧ ㄐㄧㄢ "]
    @Published var discussionThePastTranslation = ["time period"]
    
    @Published var discussionGovernmentBPMF = ["ㄓㄥˋㄓˋ","ㄕㄜˋㄏㄨㄟˋ","ㄈㄚˇㄩㄢˋ","ㄈㄚˇㄌㄩˋ","ㄈㄢˋㄍㄨㄟ ","ㄊㄨㄥ ㄖㄨㄥˊ"]
    @Published var discussionGovernmentTranslation = ["government","society","politics","court","law","to break\nthe rules","to bend\nthe rules"]
    
    @Published var discussionAccidentsBPMF = ["ㄔㄜ ㄏㄨㄛˋ","ㄨㄟ ㄒㄧㄢˇ"]
    @Published var discussionAccidentsTranslation = ["accident","dangerous"]
    
    @Published var discussionOnThePhoneBPMF = ["ㄨㄟˊ","ㄒㄩㄣˋㄏㄠˋ","ㄉㄚˇㄉㄧㄢˋㄏㄨㄚˋ"]
    @Published var discussionOnThePhoneTranslation = ["hello~","reception\n signal","give a\nphone call"]
    
    @Published var discussionAmbienceBPMF = ["ㄖㄜˋㄋㄠˋ","ㄔㄠˇ","ㄑㄧˋㄈㄣ "]
    @Published var discussionAmbienceTranslation = ["lively","loud","atmosphere"]
    
    @Published var discussionWorkBPMF = ["ㄋㄧㄢˊㄐㄧㄚˋ","ㄍㄣ ㄐㄧㄣˋ","ㄨㄞˋㄆㄞˋ","ㄊㄨㄟˋㄒㄧㄡ ","ㄒㄧㄣ ㄎㄨˇ","ㄉㄨˋㄐㄧㄚˋ","ㄌㄧㄥˇㄌㄨˋㄖㄣˊ"]
    @Published var discussionWorkTranslation = ["annual\nleave","to follow\nup","to send to\nanother\nplace","to retire","tough\n(work/life)","spend one's\nbreak","guide\nleader\nmentor"]
    
    @Published var discussionPublicTransportationBPMF = [""]
    @Published var discussionPublicTransportationTranslation = [""]
    
    @Published var discussionCovid19BPMF = ["ㄙㄠˇㄇㄧㄠˊ","ㄊㄧˇㄨㄣ ","ㄐㄧㄝˇㄔㄨˊ","ㄓㄥˋㄈㄨˇ","ㄍㄢˇㄖㄢˇ","ㄖㄣˊㄕㄨˋ","ㄧˋㄇㄧㄠˊ","ㄉㄚˇ","ㄔㄨㄢˊㄖㄢˇ","ㄧˋㄑㄧㄥˊ","ㄍㄜˊㄌㄧˊ","ㄅㄠˋㄈㄚ "]
    @Published var discussionCovid19Translation = ["to scan","body\ntemp.","to remove\n(a level)","government","infection","number\nof people","vaccine","to take\n(vaccine)","to infect\n(others)","epidemic\nsituation\n(covid)","to quarantine","to break\nout\nan outbreak"]
    
    @Published var discussionDreamsBPMF = ["ㄗㄨㄛˋㄈㄥˋ","ㄜˋㄇㄥˋ","ㄏㄡˋㄌㄞˊ"]
    @Published var discussionDreamsTranslation = ["to dream","to have a\nnightmare","and then\n(talking about\nthe past)"]
    
    @Published var discussionSocialMediaBPMF = ["ㄍㄨㄢ ㄓㄨˋ","ㄉㄧㄢˇㄗㄢˋ","ㄆㄧㄣˊㄉㄠˋ","ㄉㄧㄥˋㄩㄝˋ","ㄈㄥ ㄙㄨㄛˇ","ㄕㄤˋㄔㄨㄢˊ","ㄧㄣˇㄘㄤˊ"]
    @Published var discussionSocialMediaTranslation = ["to follow","to like","channel","subscribe","to block","to upload\nto post","to hide"]
    
    @Published var discussionFinanceBPMF = ["ㄓ ㄔㄨ ","ㄕㄡ ㄖㄨˋ","ㄉㄞˋㄎㄨㄢˇ","ㄏㄜˊㄈㄚˇ","ㄌㄧˋㄒㄧ ","ㄎㄨㄟ ㄑㄧㄢˋ","ㄇㄧㄢˇㄈㄟˋ","ㄕㄚ ㄐㄧㄚˋ","ㄌㄜˋㄊㄡˋ","ㄈㄚˊㄑㄧㄢˊ","ㄒㄧㄣ ㄕㄨㄟˇ"]
    @Published var discussionFinanceTranslation = ["expense","income","loan","legal","interest","to owe","free","to bargain","lottery","to impose\na fine","salary"]
    
    @Published var discussionLocationsBPMF = ["ㄉㄠˋㄔㄨˇ","ㄕˋㄓㄨㄥ ㄒㄧㄣ ","ㄒㄧㄤ ㄒㄧㄚˋ","ㄒㄧㄤ ㄘㄨㄣ ","ㄒㄧㄠˇㄓㄣˋ"]
    @Published var discussionLocationsTranslation = ["everywhere","downtown","countryside","village","lively town\nin a quiet\nplace"]
    
    @Published var discussionKidsBPMF = ["ㄏㄞˊㄗ˙","ㄨㄢˊㄐㄩˋ","ㄌㄨㄢˋㄆㄠˇ","ㄆㄧㄣ ㄊㄨˊ","ㄆㄧㄣ ","ㄧㄥˊ","ㄕㄨ ","ㄕㄨ ㄐㄧㄚ˙","ㄧㄥˊㄇㄨˋ","ㄒㄧㄥˊㄨㄟˊ","ㄎㄤˋㄐㄩˋ","ㄔㄥˊㄈㄚˊ","ㄑㄧ ㄈㄨˋ","ㄇㄚˇㄏㄨˇ","ㄗㄨㄣ ㄓㄨㄥˋ","ㄑㄧㄤˇ","ㄇㄛˊㄈㄤˇ"]
    @Published var discussionKidsTranslation = ["kids","toys","to run\naround","jigsaw\npuzzle","to piece\ntogether","to win","to lose","loser","screen\n(tv/computer)","behavior","to resist","punishment","to bully","careless","to respect","to fight\nover","to imitate"]
    
    @Published var discussionInvestmentsBPMF = ["ㄌㄧˋㄖㄨㄣˋ","ㄍㄨˇㄆㄧㄠˋ"]
    @Published var discussionInvestmentsTranslation = ["profit","stocks"]
    
    @Published var discussionLivingSituationBPMF = ["ㄍㄨㄥ ㄩˋ","ㄉㄨˊㄉㄨㄥˋ","ㄐㄧㄝ ㄈㄤ˙","ㄍㄠ ㄌㄡˊ","ㄐㄧㄢˋㄓㄨˋ","ㄕ ㄍㄨㄥ "]
    @Published var discussionLivingSituationTranslation = ["apartment","single family\nhouse","neighborhood","highrise","buildings","carrying out\nconstruction"]
    
    @Published var discussionSchoolBPMF = ["ㄐㄧㄠˋㄕㄡˋ","ㄒㄩㄝˊㄑㄧˊ","ㄕˊㄒㄧˊ","ㄉㄚˋㄒㄩㄝˊ","ㄍㄠ ㄓㄨㄥ ","ㄍㄨㄛˊㄓㄨㄥ ","ㄎㄜ ㄒㄩㄝˊ","ㄎㄜ ㄐㄧˋ"]
    @Published var discussionSchoolTranslation = ["professor","semester","internship","university","highschool","middle school","science","technology"]
    
    @Published var discussionTravellingBPMF = ["ㄌㄩˇㄍㄨㄢ ","ㄏㄨˋㄓㄠˋ","ㄍㄨㄛˊㄐㄧˋㄐㄧㄚˋㄓㄠˋ","ㄏㄤˊㄒㄧㄤˋ","ㄊㄨㄟ ㄐㄧㄢˋ","ㄉㄠˇㄧㄡˊ","ㄍㄨㄛˊㄨㄞˋ","ㄑㄧㄢ ㄓㄥˋ","ㄇㄥˊㄧㄡˇ","ㄇㄢˋㄧㄡ ㄧㄡ ","ㄅㄧˋㄧㄠˋ"]
    @Published var discussionTravellingTranslation = ["hotel","passport","international\ndriver's\nlicense","direction\n(ship/plane)","to recommend","tour guide","abroad","visa","allied\ncountry","unhurried\nleisurely","necessary"]
    
    @Published var discussionDietBPMF = ["ㄧㄥˊㄧㄤˇ","ㄐㄧㄢˇㄕㄠˇ"]
    @Published var discussionDietTranslation = ["nutritous","to reduce"]
    
    @Published var discussionWorkingOutBPMF = ["ㄐㄧㄢˋㄕㄣ "]
    @Published var discussionWorkingOutTranslation = ["to keep fit"]

    @Published var discussionWeatherBPMF = ["ㄊㄧㄢ ㄑㄧˋ","ㄖㄜˋ","ㄌㄥˇ","ㄕ ","ㄍㄢ "]
    @Published var discussionWeatherTranslation = ["weather","hot","cold","humid","dry"]
    
    @Published var discussionMedicineBPMF = ["ㄧ ㄕㄥ ","ㄎㄢˋㄅㄧㄥˋ","ㄕㄥ ㄅㄧㄥˋ","ㄎㄜˊㄙㄡˋ","ㄅㄧㄥˋㄖㄣˊ","ㄓㄨㄥ ㄧ ","ㄓㄣ ㄐㄧㄡˇ"]
    @Published var discussionMedicineTranslation = ["doctor","visit a\ndoctor","to get sick","to cough","patient","chinese\nmedicine","acupuncture"]
    
    @Published var discussionBodyConditionBPMF = ["ㄐㄧㄣˋㄕˋ","ㄕ ㄇㄧㄢˊ"]
    @Published var discussionBodyConditionTranslation = ["nearsightedness","insomnia"]
    
    @Published var discussionSeasonalBPMF = ["ㄔㄨㄣ ㄊㄧㄢ ","ㄒㄧㄚˋㄊㄧㄢ ","ㄑㄧㄡ ㄊㄧㄢ ","ㄉㄨㄥ ㄊㄧㄢ "]
    @Published var discussionSeasonalTranslation = ["spring","summer","autumn","winter"]
    
    @Published var discussionCompetitionBPMF = ["ㄅㄧˇㄙㄞˋ","ㄉㄨㄟˋㄕㄡˇ"]
    @Published var discussionCompetitionTranslation = ["competition","opponent\ncompetitor"]
    
    @Published var discussionHometownBPMF = ["ㄐㄧㄚ ㄒㄧㄤ ","ㄒㄩˋㄐㄧㄡˋ","ㄌㄧㄡˊㄌㄧㄢˋ"]
    @Published var discussionHometownTranslation = ["hometown","to reminisce\n(with someone)","to be reluctant\nto leave"]
    
    @Published var discussionMarriageBPMF = ["ㄏㄨㄣ ㄌㄧˇ","ㄐㄧㄝˊㄏㄨㄣ ","ㄌㄧˊㄏㄨㄣ ","ㄏㄨㄞˊㄩㄣˋ"]
    @Published var discussionMarriageTranslation = ["wedding\nceremony","to get married","to get\na divorce","to be\npregnant"]
    
    @Published var discussionMoviesShowsBPMF = ["ㄉㄧㄢˋㄕˋㄐㄩˋ","ㄓㄨˇㄐㄩㄝˊ","ㄍㄢˇㄖㄣˊ"]
    @Published var discussionMoviesShowsTranslation = ["tv drama","protagonist","touching"]
    
    /*
     This is a list of vocabulary
     */
    
    @Published var listMeasureWordsBPMF = ["ㄧㄤˋ","ㄐㄧˊ","ㄊㄧㄠˊ","ㄨㄟˋ","ㄇㄧㄢˋ","ㄊㄞˊ","ㄐㄧㄢˋ","ㄓㄤ ","ㄑㄩㄢ ","ㄎㄨㄞˋ","ㄎㄜ ","ㄎㄜ ","ㄊㄤˊ","ㄎㄨㄢˇ","ㄊㄠˋ","ㄆㄧㄢˋ"]
    @Published var listMeasureWordsTranslation = ["kinds","episodes","long & thins","seats","flat\nsurfaces","vehicles\nmachines","clothes","flats","loops\nlaps","money","plants\ntrees","round","classes","types of\nproducts","sets","pieces"]

    @Published var listTimeWordsBPMF = ["ㄕㄡˇㄒㄧㄢ ","ㄧ ㄉㄢˋ","ㄧ ㄅㄟˋㄗ˙","ㄨㄟˊㄓˇ","ㄇㄨˋㄑㄧㄢ ","ㄨㄟˋㄌㄞˊ","ㄗㄨㄥˇㄧㄡˇ","ㄗㄨㄥˇㄧㄡˇ","ㄊㄨㄥ ㄒㄧㄠ ","ㄧ ㄓㄣ ㄗ˙","ㄔㄤˊㄑㄧ ","ㄧ ㄕㄨㄣˋ","ㄅㄢˋㄧㄝˋ","ㄌㄧㄥˊㄔㄣˊ"]
    @Published var listTimeWordsTranslation = ["first of all","once...","all one's life","up to; until","at the\npresent","in the future","inevitably\nthere\nwill be","all night","a while","for a\nlong time","in a flash","midnight","late\nmidnight"]
    
    @Published var listAdverbBPMF = ["ㄅㄨˋㄍㄢˇ","ㄔㄨㄥ ㄈㄣˋ","ㄧ ㄉㄨㄟ ","ㄅㄨˋㄉㄨㄢˋ","ㄇㄢˇ","ㄍㄜˋㄓㄨㄥˇ","ㄐㄧ ㄏㄨ ","ㄅㄞˊ","ㄨㄟˊㄧ ","ㄑㄧˊㄓㄨㄥ ","ㄉㄤ ㄓㄨㄥ ","ㄗㄨㄥˇㄕˋ","ㄌㄠˇㄕ˙","ㄐㄩㄝˊㄉㄨㄟˋ","ㄕㄠ ㄨㄟ ","ㄍㄤ ㄏㄠˇ","ㄅㄧㄥˋㄅㄨˋ","ㄖㄣˋㄏㄜˊ"]
    @Published var listAdverbTranslation = ["not dare to","as much as\npossible","a bunch","not stopping","quite","every kind","almost","in vain","only(sole)","among them","among them\n(location)","always","always\n(negative)","absolutely","slightly","just about time","not at all","any"]
    
    @Published var listAdjectivesBPMF = ["ㄓㄥˋㄇㄧㄢˋ","ㄈㄨˋㄇㄧㄢˋ","ㄊㄜˋㄕㄨ ","ㄆㄨˇㄅㄧㄢˋ","ㄨㄢˊㄇㄟˇ","ㄗㄠ ㄍㄠ ","ㄓㄣ ㄓㄥˋ","ambiguous\nblurry"]
    @Published var listAdjecitivesTranslation = ["positive","negative","special\nuncommon","common\nwidespread","perfect","worse","real;true","ㄇㄛˊㄏㄨ˙"]
    
    @Published var listMaterialsBPMF = ["ㄅㄛ ㄌㄧˊ"]
    @Published var listMaterialsTranslation = ["glass"]
    
    @Published var listElectronicsBPMF = ["ㄐㄧㄢˋㄆㄢˊ","ㄏㄨㄚˊㄕㄨˇ"]
    @Published var listElectronicsTranslation = ["keyboard","mouse"]
    
    @Published var listPhysicalDescriptionBPMF = ["ㄓㄞˇ","ㄎㄨㄢ ","ㄨㄞ ","ㄅㄧㄢˇ","ㄖㄡˊㄖㄨㄣˋ","ㄒㄩ ㄖㄨㄛˋ",]
    @Published var listPhysicalDescriptionTranslation = ["narrow","wide","slanted","flat","soft & smooth","weak"]
    
    @Published var listAlcoholBPMF = ["ㄨㄟ ㄕˋㄐㄧˋ","ㄈㄨˊㄊㄜˋㄐㄧㄚ ","ㄆㄨˊㄊㄠ˙ㄐㄧㄡˇ","ㄌㄢˊㄈㄨˇㄐㄧㄡˇ","ㄆㄧˊㄐㄧㄡˇ",]
    @Published var listAlcoholTranslation = ["whiskey","vodka","wine","rum","beer",]
    
    @Published var listNaturalDisasterBPMF = ["ㄊㄞˊㄈㄥ ","ㄉㄧˋㄓㄣˋ"]
    @Published var listNaturalDisasterTranslation = ["typhoon","earthquake"]
    
    @Published var listAnimalsBPMF = ["ㄋㄧㄡˇ","ㄓㄨ ","ㄐㄧ ","ㄩˊ","ㄔㄨㄥˊㄗ˙","ㄉㄚˋㄒㄧㄥ ㄒㄧㄥ˙","ㄧㄚ ㄗ˙"]
    @Published var listAnimalsTranslation = ["cow","pig","chicken","fish","insects","gorilla","duck"]
    
    @Published var listExteriorBodyPartsBPMF = ["ㄓㄥ ㄊㄧˇ","ㄜˊㄊㄡˊ","ㄇㄟˊㄇㄠˊ","ㄐㄧㄝˊㄇㄠˊ","ㄌㄧㄢˇㄐㄧㄚˊ","ㄔㄨㄣˊ","ㄒㄧㄚˋㄅㄚ˙","ㄅㄛˊㄗ˙","ㄅㄟˋ","ㄐㄧㄢ ㄅㄤˇ","ㄒㄩㄥ ㄎㄡˇ","ㄕㄡˇㄅㄧˋ","ㄕㄡˇㄓㄡˇ","ㄕㄡˇㄨㄢˋ","ㄕㄡˇㄓˇㄐㄧㄚ˙","ㄊㄨㄟˇ","ㄉㄚˋㄊㄨㄟˇ","ㄒㄧㄠˇㄊㄨㄟˇ","ㄐㄧㄠˇㄏㄨㄞˊ","ㄐㄧㄠˇ","ㄐㄧㄠˇㄐㄧㄢ ","ㄐㄧㄠˇㄅㄟˋ"]
    @Published var listExteriorBodyPartsTranslation = ["limbs","forehead","eyebrows","eyelash","cheeks","lip","chin","neck","back","shoulder","chest","arms\n(w/ hands)","elbow","wrist","fingernail","leg","thigh","lower leg","ankle","feet","tip of toe","top of foot"]
    
    @Published var listInteriorBodyPartsBPMF = ["ㄒㄧㄝˇ","ㄍㄨˇㄊㄡ˙"]
    @Published var listInteriorBodyPartsTranslation = ["blood","bone"]
    
    @Published var listEmotionsBPMF = ["ㄑㄧㄥˊㄒㄩˋ","ㄍㄠ ㄒㄧㄥˋ","ㄋㄢˊㄍㄨㄛˋ","ㄍㄢˇㄐㄧ ","ㄕㄥ ㄑㄧˋ","ㄎㄨㄣˋㄏㄨㄛˋ","ㄕㄨ ㄈㄨ","ㄍㄨ ㄉㄢ ","ㄖㄜˋㄒㄧㄣ ","ㄕㄨㄤˇ","ㄉㄨˇㄌㄢˋ","ㄒㄧㄣ ㄊㄥˊ","ㄋㄢˊㄕㄡˋ","ㄇㄠˊㄉㄨㄣˋ","ㄖㄨㄢˇㄌㄢˋ"]
    @Published var listEmotionsTranslation = ["emotions","happy","sad","grateful","angry","confused","comfortable","lonely","enthusiastic","to feel\ngood","ticked off","To feel\nsorry","uneasy","conflicted","lacking drive"]
    
    @Published var listPersonalityTraitsBPMF = ["ㄊㄧㄢ ㄓㄣ ","ㄌㄜˋㄍㄨㄢ ","ㄅㄟ ㄍㄨㄢ ","ㄎㄞ ㄈㄤˋ","ㄧㄡ ㄇㄛˋ","ㄌㄠˇㄍㄨˇㄉㄨㄥˇ","ㄗˋㄙ ","ㄗˋㄌㄧㄢˋ","ㄊㄧˇㄊㄧㄝ ","ㄧㄝˋㄇㄠ ㄗ˙","ㄅㄠˇㄕㄡˇ","ㄞˋㄒㄧㄢˋ","ㄎㄜˇㄎㄠˋ","ㄏㄠˇㄒㄧㄤ ㄔㄨˇ","ㄉㄨˊㄌㄧˋ","ㄌㄧˇㄓˋ","ㄧㄡˋㄓˋ","ㄌㄧㄥˊㄏㄨㄛˊ","ㄔㄨ ㄒㄧㄣ "]
    @Published var listPersonalityTraitsTranslation = ["innocent","optimistic","pessimistic","open\nminded","humorous","old-fashioned","selfish","narcissistic","considerate","night owl","conservative","to enjoy\nshowing off","dependable\nreliable","easygoing\neasy to get along","independent","rational","naive","flexible","careless"]
    
    @Published var listPersonalCharacteristicsBPMF = ["ㄏㄠˇㄧˋ","ㄜˋㄧˋ","ㄩㄥˇㄑㄧˋ","ㄑㄧㄢˊㄌㄧˋ"]
    @Published var listPersonalCharacteristicsTranslation = ["kindness","ill intention","courage","potential"]
    
    @Published var listHouseholdKitchenItemsBPMF = ["ㄎㄨㄞˋㄗ˙","ㄔㄚ ㄗ˙","ㄊㄤ ㄔˊ","ㄆㄢˊㄗ˙","ㄉㄠ ㄗ˙","ㄒㄧ ㄍㄨㄢˇ","ㄓˇㄐㄧㄣ ","ㄌㄨˊㄗ˙"]
    @Published var listHouseholdKitchenItemsTranslation = ["chopstick","fork","soup spoon","plate","knife","straw","napkin","stove"]
    
    @Published var listHouseholdBedroomItemsBPMF = ["ㄓㄣˇㄊㄡ˙","ㄊㄢˇㄗ˙","ㄇㄧㄢˋㄇㄛˊ","ㄔㄡ ㄊㄧ˙","ㄐㄧㄥˋㄗ˙","ㄧㄣ ㄒㄧㄤ ","ㄉㄧˋㄊㄢˇ","ㄈㄥ ㄕㄢˋ","ㄒㄧㄤ ㄕㄨㄟˇ","ㄌㄢˊㄗ˙"]
    @Published var listHouseholdBedroomItemsTranslation = ["pillow","blanket","facial mask","drawer","mirror","speakers","carpet\nrug","electric\nfan","perfume","basket"]
    
    @Published var listHouseholdBathroomItemsBPMF = ["ㄧㄚˊㄍㄠ ","ㄈㄟ ㄗㄠˋ","ㄇㄠˊㄐㄧㄣ ","ㄕㄨ ㄗ˙","ㄔㄨˊㄕ ㄐㄧ "]
    @Published var listHouseholdBathroomItemsTranslation = ["toothpaste","soap","towel","comb","dehumidifier"]
    
    @Published var listMedicineBPMF = ["ㄓˇㄊㄨㄥˋㄧㄠˋ","ㄅㄧㄥ ㄈㄨ "]
    @Published var listMedicineTranslation = ["painkiller","ice packs"]
    
    @Published var listFruitBPMF = ["ㄆㄧㄥˊㄍㄨㄛˇ","ㄔㄥˊㄗ˙","ㄘㄠˇㄇㄟˊ","ㄇㄤˊㄍㄨㄛˇ","ㄧㄥ ㄊㄠˊ","ㄌㄢˊㄇㄟˊ","ㄒㄧ ㄍㄨㄚ ","ㄈㄢ ㄑㄧㄝˊ","ㄆㄨˊㄊㄠˊ","ㄌㄧㄡˊㄌㄧㄢˊ","ㄩˋㄏㄜˊㄅㄠ "]
    @Published var listFruitTranslation = ["apple","orange","strawberry","mango","cherry","blueberry","watermelon","tomato","grape","durian","lychee"]
    
    @Published var listSeafoodBPMF = ["ㄍㄨㄟ ㄩˊ","ㄨㄟˇㄩˊ","ㄓㄤ ㄩˊ","ㄒㄧㄚ ㄗ˙","ㄩˊㄨㄢˊ"]
    @Published var listSeafoodTranslation = ["salmon","tuna","octopus","shrimp","fish\nball"]
    
    @Published var listNutsBPMF = ["ㄏㄨㄚ ㄕㄥ "]
    @Published var listNutsTranslation = ["Peanut"]
    
    @Published var listVegetableBPMF = ["ㄒㄧㄤ ㄍㄨ ","ㄅㄛ ㄘㄞˋ","ㄕㄨㄟˋㄌㄧㄢˊ","ㄈㄢ ㄑㄧㄝˊ","ㄧㄤˊㄘㄨㄥ ","ㄒㄧㄤ ㄘㄞˋ"]
    @Published var listVegetableTranslation = ["mushroom","spinach","snowflake\nstem","tomato","onion","corriander"]
    
    @Published var listDessertBPMF = ["ㄒㄧㄢ ㄘㄠˇ","ㄒㄧㄥˋㄖㄣˊ","ㄨㄟˋㄘㄥ ","ㄅㄨˋㄌㄤˇㄋㄧˊ","ㄖㄨˇㄌㄨㄛˋㄉㄢˋㄍㄠ "]
    @Published var listDessertTranslation = ["grass jelly","almond","miso","brownie","cheese cake"]
    
    @Published var listClothesBPMF = ["ㄒㄧ ㄓㄨㄤ ","ㄨㄞˋㄊㄠˋ","ㄨㄚ ㄗ˙","ㄒㄩㄝ ㄗ˙","ㄊㄨㄛ ㄒㄧㄝˊ","ㄍㄠ ㄍㄣ ㄒㄧㄝˊ","ㄔㄤˊㄒㄧㄡˋ","ㄉㄨㄢˇㄒㄧㄡˋ","ㄓˋㄍㄢˇ"]
    @Published var listClothesTranslation =  ["western\nsuit","jacket","socks","boots","slippers","high\nheels","long sleeves","short sleeves","texture"]
    
    @Published var listOccupationBPMF = ["ㄐㄧㄥˇㄔㄚ ","ㄒㄧㄠ ㄈㄤˊㄩㄢˊ","ㄕㄡˋㄧ ","ㄐㄩㄣ ㄉㄨㄟˋ","ㄕㄥ ㄧˋ","ㄧㄢˊㄐㄧㄡ ㄕㄥ ","ㄩㄥˋㄖㄣˊ"]
    @Published var listOccupationTranslation = ["police","firefighter","vet.","military","business","graduate\nstudent","servant\nmaid"]
    
    @Published var listFamilyBPMF = ["ㄦˊㄊㄨㄥˊ","ㄓˊㄗ˙","ㄓˊㄋㄩˇ","ㄒㄧㄠˋㄕㄨㄣˋ","ㄌㄠˇㄆㄛˊ","ㄌㄠˇㄍㄨㄥ ","ㄚ ㄍㄨㄥ ","ㄚ ㄇㄚˊ","ㄨㄞˋㄕㄥ ㄋㄩˇ","ㄨㄞˋㄕㄥ ","ㄅㄧㄠˇ","ㄊㄤˊ"]
    @Published var listFamilyTranslation = ["children\n(young)","nephew\n(brother's)","niece\n(brother's)","filial","wife","husband","grandpa","grandma","niece\n(sister's)","nephew\n(brother's)","cousin\n(mom's side)","cousin\n(dad's side)"]
    
    @Published var listAccessoriesBPMF = ["necklace","bracelet"]
    @Published var listAccessoriesTranslation = ["ㄒㄧㄤˋㄌㄧㄢˋ","ㄕㄡˇㄌㄧㄢˋ"]
    
    @Published var listContinentsBPMF = ["ㄋㄢˊㄇㄟˇ","ㄇㄟˇㄓㄡ ","ㄡ ㄓㄡ ","ㄋㄢˊㄐㄧˊㄓㄡ ","ㄧㄚˋㄓㄡ ","ㄈㄟ ㄓㄡ ","ㄠˋㄓㄡ "]
    @Published var listContinentsTranslation = ["south\namerica","americas","europe","antarctica","asia","africa","australia"]
    
    @Published var listCountriesBPMF = ["ㄒㄧ ㄅㄢ ㄧㄚˊ","ㄉㄜˊㄍㄨㄛˊ","ㄐㄧㄚ ㄋㄚˊㄉㄚˋ","ㄇㄛˋㄒㄧ ㄍㄜ ","ㄜˊㄌㄨㄛˊㄙ ","ㄒㄧㄣ ㄐㄧㄚ ㄆㄛ ","ㄇㄚˇㄌㄞˊㄒㄧ ㄧㄚˋ","ㄩㄝˋㄋㄢˊ","ㄖˋㄅㄣˇ"]
    @Published var listCountriesTranslation = ["Spain","Germany","Canada","Mexico","Russia","Singapore","Malaysia","Vietnam","Japan"]
    
    @Published var listUSStatesBPMF = ["ㄋㄟˋㄏㄨㄚˊㄉㄚˊ"]
    @Published var listUSStatesTranslation = ["Nevada",]
    
    @Published var listUSCitiesBPMF = ["ㄌㄟˊㄋㄨㄛˋ","ㄌㄚ ㄙ ㄨㄟˊㄐㄧㄚ ㄙ "]
    @Published var listUSCitiesTranslation = ["Reno","Las Vegas"]
    
    @Published var listChengYuBPMF = ["ㄧㄥˋㄓㄜ˙ㄊㄡˊㄆㄧˊ","ㄦˇㄖㄨˊㄇㄨˋㄖㄢˇ"]
    @Published var listChengYuTranslation = ["to force\noneself","to be influence\nand don't\nnotice"]
    
    @Published var listSayingsBPMF = ["ㄖㄜˋㄌㄧㄢˇㄊㄧㄝ ㄌㄥˇㄆㄧˋㄍㄨ˙","ㄊㄨㄛ ㄎㄨˋㄗ˙ㄈㄤˋㄆㄧˋ","ㄨㄣˊㄉㄢˋ","ㄧ ㄈㄣ ㄍㄥ ㄩㄣˊㄧ ㄈㄣ ㄕㄡ ㄏㄨㄛˋ","ㄧ ㄧㄢˊㄨㄟˊㄉㄧㄥˋ","ㄧ ㄇㄛˊㄧ ㄧㄤˋ"]
    @Published var listSayingsTranslation = ["to show \nfeelings and\nbe dejected","to make\nthings too\ncomplicated","to be done for","you reap what\nyou sow","it's settled\nthen","exactly the\nsame"]
    
    @Published var grammarAddEmotionBPMF = ["ㄉㄠˋㄉㄧˇ","ㄍㄟˇㄨㄛˇ"]
    @Published var grammarAddEmotionTranslation = ["to add emphasis\non questions\n(negative)","strengthen\nthe\nimperative"]
    
    @Published var grammarSentenceConnectionsBPMF = ["ㄩˇㄑㄧˊㄅㄨˋㄖㄨˊ","ㄋㄧㄥˋㄩㄢˋ","ㄓˇㄧㄡˇㄘㄞˊ","ㄓˇㄧㄠˋㄐㄧㄡˋ"]
    @Published var grammarSentenceConnectionsTranslation = ["rather than...\nbetter to","would you\nrather...","only if\n(situation) happens...\n(situation) will\nhappen","as long as\n(situation) happens\n(situation) should\nhappen"]
    
    @Published var grammarSmallDetailsBPMF = ["ㄔㄨㄥ ㄒㄧㄣ"]
    @Published var grammarSmallDetailsTranslation = ["re-(verb)"]
   
    
}

struct Vocabulary: View {
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var pronunciationTextMode : Bool
    @Binding var pronunciationVoiceMode : Bool
    @Binding var voiceSelection : String
    @Binding var timerValue: Double
    @Binding var testModeSelection: String
    
    @ObservedObject var vocabularyList = VocabularyList()
    @State var vocabularyTranslation = [""]
    @State var vocabularyBPMF = [""]
    @State var topic = "when you are..."
    let topics = ["basics","when you are...","specific scenarios","discussion topics"]

    let previewText = "preview "
    @State var statePreviewText = ""
    
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    
    var PreviewStartColor = Color(red: 255 / 255, green: 153 / 255, blue: 51 / 255)
    
    var body: some View {
        VStack{
            Picker("Style", selection: $topic) {
                ForEach(topics, id: \.self) {
                    Text($0)
                    .padding()
                    .font(.custom("papyrus",size: 30))
                }
            }
            .pickerStyle(WheelPickerStyle())
            .frame(width: screenWidth, height: 100)
            
            
            // If the picker is scenarios
            Group{
                ScrollView{
                    
                    if(topic == "basics"){
                        VStack{
                            VStack{
                                Button("frequently used words"){
                                    vocabularyBPMF = self.vocabularyList.basicsChineseBPMF
                                    vocabularyTranslation = self.vocabularyList.basicsChineseTranslation
                                    statePreviewText = previewText + "frequently used words"
                                }.padding()
                                Button("numbers"){
                                    vocabularyBPMF = self.vocabularyList.basicsNumbersBPMF
                                    vocabularyTranslation = self.vocabularyList.basicsNumbersTranslation
                                    statePreviewText = previewText + "numbers"
                                }.padding()
                                Button("introduction"){
                                    vocabularyBPMF = self.vocabularyList.basicsIntroducingYourselfBPMF
                                    vocabularyTranslation = self.vocabularyList.basicsIntroducingYourselfTranslation
                                    statePreviewText = previewText + "introduction"
                                }.padding()
                            }
                        }
                    }
                    if(topic == "when you are..."){
                        VStack{
                            VStack{
                                Button("asked why learn chinese?"){
                                    vocabularyBPMF = self.vocabularyList.topicLanguageLearningBPMF
                                    vocabularyTranslation = self.vocabularyList.topicLanguageLearningTranslation
                                    statePreviewText = previewText + "asked why learn chinese?"
                                }.padding()
                                
                                Button("shopping"){
                                    vocabularyBPMF = self.vocabularyList.topicShoppingBPMF
                                    vocabularyTranslation = self.vocabularyList.topicShoppingTranslation
                                    statePreviewText = previewText + "when shopping"
                                }.padding()
                                
                               
                            }
                            VStack{
                                Button("drinking"){
                                    vocabularyBPMF = self.vocabularyList.topicDrinkingBPMF
                                    vocabularyTranslation = self.vocabularyList.topicDrinkingTranslation
                                    statePreviewText = previewText + "when drinking"
                                }.padding()
                                Button("language exchanging"){
                                    vocabularyBPMF = self.vocabularyList.topicLanguageExchangeBPMF
                                    vocabularyTranslation = self.vocabularyList.topicLanguageExchangeTranslation
                                    statePreviewText = previewText + "when language exchanging"
                                }.padding()
                                Button("working in an office"){
                                    vocabularyBPMF = self.vocabularyList.topicOfficeJobBPMF
                                    vocabularyTranslation = self.vocabularyList.topicOfficeJobTranslation
                                    statePreviewText = previewText + "when working in an office"
                                }.padding()
                                Button("complaining about work"){
                                    vocabularyBPMF = self.vocabularyList.topicComplainingWorkBPMF
                                    vocabularyTranslation = self.vocabularyList.topicComplainingWorkTranslation
                                    statePreviewText = previewText + "\ncomlaining about work"
                                }.padding()
                                Button("complaining about relationships"){
                                    vocabularyBPMF = self.vocabularyList.topicComplainingRelationshipBPMF
                                    vocabularyTranslation = self.vocabularyList.topicComplainingRelationshipTranslation
                                    statePreviewText = previewText + "\ncomplaining about relationships"
                                }.padding()
                            }
                            VStack{
                                
                            }
                        }
                        .padding()
                    }
                    
                    if(topic == "specific scenarios"){
                        VStack{
                            VStack{
                                
                                Button("running out of battery"){
                                    vocabularyBPMF = self.vocabularyList.scenarioRunningOutOfBatteryBPMF
                                    vocabularyTranslation = self.vocabularyList.scenarioRunningOutofBatteryTranslation
                                    statePreviewText = previewText + "\nrunning out of battery"
                                }.padding()
                            }
                        }
                        .padding()
                    }
                    
                    if(topic == "discussion topics"){
                        VStack{
                            VStack{
                                Button("what to do"){
                                    vocabularyBPMF = self.vocabularyList.discussionWhatToDoBPMF
                                    vocabularyTranslation = self.vocabularyList.discussionWhatToDoTranslation
                                    statePreviewText = previewText + "\ndiscussing what to do"
                                }.padding()
                                Button("what to eat"){
                                    vocabularyBPMF = self.vocabularyList.discussionWhatToEatBPMF
                                    vocabularyTranslation = self.vocabularyList.discussionWhatToEatTranslation
                                    statePreviewText = previewText + "\ndiscussing what to eat"
                                }.padding()
                                Button("public transportation"){
                                    vocabularyBPMF = self.vocabularyList.discussionPublicTransportationBPMF
                                    vocabularyTranslation = self.vocabularyList.discussionPublicTransportationTranslation
                                    statePreviewText = previewText + "\ndiscussing public transportation"
                                }.padding()
                                
                                Button("covid19"){
                                    vocabularyBPMF = self.vocabularyList.discussionCovid19BPMF
                                    vocabularyTranslation = self.vocabularyList.discussionCovid19Translation
                                    statePreviewText = previewText + "\ndiscussing covid19"
                                }.padding()
                            }
                        }
                        .padding()
                    }
                }
                .font(.custom("papyrus",size: 26))
                .frame(minWidth:200, maxWidth: screenWidth)
                .multilineTextAlignment(.leading)
                .padding(10)
                .frame(alignment: .leading)
                .foregroundColor(.black)
                .frame(width:screenWidth,height:screenHeight*0.60)
            }

            NavigationLink(destination: ContentPreview(contentOne: self.$vocabularyTranslation, contentTwo: self.$vocabularyBPMF, pronunciationTextMode: self.$pronunciationTextMode,pronunciationVoiceMode: self.$pronunciationVoiceMode, voiceSelection:self.$voiceSelection, timerValue: self.$timerValue,testModeSelection: self.$testModeSelection)){
            Text(statePreviewText)
            }
            .frame(width: screenWidth, height: 100, alignment: .center)
            .multilineTextAlignment(.center)
            //.navigationBarHidden(true)
            //.navigationBarTitle("")
            .foregroundColor(PreviewStartColor)
            .font(.custom("papyrus",size: 26))
            .padding(10)
            Spacer()
    
            
        }
    }
}

struct Vocabulary_Previews: PreviewProvider {
    @State static var pronunciationTextMode = true
    @State static var pronunciationVoiceMode = true
    @State static var voiceSelection = ""
    @State static var timerValue = 1.1
    @State static var testModeSelection = ""
    static var previews: some View {
        Vocabulary(pronunciationTextMode:$pronunciationTextMode,pronunciationVoiceMode:$pronunciationVoiceMode, voiceSelection:$voiceSelection, timerValue:$timerValue,testModeSelection: $testModeSelection)
    }
}
