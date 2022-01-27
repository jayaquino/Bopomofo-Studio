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
    @Published var basicsChineseBPMF = ["ㄨㄛˇ","ㄊㄚ ","ㄨㄛˇㄇㄣ˙","ㄊㄚ ㄇㄣ˙","ㄕㄟˊ","ㄕㄣˊㄇㄜ˙","ㄋㄚˇㄌㄧˇ","ㄕㄣˊㄇㄜ˙ㄕˊㄏㄡˋ","ㄨㄟˋㄕㄣˊㄇㄜ˙","ㄑㄩˋ","ㄌㄞˊ","ㄕㄨㄛ ","ㄒㄧㄤˇ","ㄐㄩㄝˊㄉㄜ˙","ㄔ ","ㄏㄜ ","ㄒㄧˇㄏㄨㄢ ","ㄏㄢˋ","ㄖㄢˊㄏㄡˋ","ㄊㄞˋ","ㄌㄧˋㄏㄞˋ","ㄕㄥ ㄉㄧㄠˋ"]
    @Published var basicsChineseTranslation = ["i/me","he/she/it","we/us","they/them","who","what","where","when","why","to go","to come","to talk","to want","to feel\n(opinion)","to eat","to drink","to like","and\n(only nouns)","and\n(connecting sentences)","too\n(adj)","impressive","tones"]
    
    @Published var basicsNumbersBPMF = ["ㄌㄧㄥˊ","ㄧ ","ㄦˋ","ㄙㄢ ","ㄙˋ","ㄨˇ","ㄌㄧㄡˋ","ㄑㄧ ","ㄅㄚ ","ㄐㄧㄡˇ","ㄕˊ","ㄅㄞˇ","ㄑㄧㄢ ","ㄨㄢˋ","ㄈㄨˋ"]
    @Published var basicsNumbersTranslation = ["0","1","2","3","4","5","6","7","8","9","10s place","100s place","1000s place","10000s place","negative"]
    
    @Published var basicsIntroducingYourselfBPMF = ["ㄨㄛˇㄕˋ","ㄇㄧㄥˊㄗ˙","ㄐㄧㄠˋ","ㄔㄨㄛˋㄏㄠˋ"]
    @Published var basicsIntroducingYourselfTranslation = ["i am...","name","to be called\n(a name)","nickname"]
    
    @Published var basicsSayingHelloBPMF = ["ㄋㄧˇㄏㄠˇ","ㄏㄟ ","ㄏㄞ "]
    @Published var basicsSayingHelloTranslation = ["hello\n(formal/first time)","hey","hi"]
    
    
    @Published var basicsThingsBPMF = ["ㄕˊㄐㄧㄢ ","ㄕㄡˇㄐㄧ ","ㄖㄣˊ","ㄘㄜˋㄙㄨㄛˇ","ㄒㄧˇㄕㄡˇㄐㄧㄢ ","ㄍㄨㄥ ㄗㄨㄛˋ","ㄨㄣˋㄊㄧˊ","ㄧˋㄙ˙","ㄐㄧㄚ ","ㄒㄩㄝˊㄒㄧㄠˋ","ㄆㄥˊㄧㄡ˙","ㄅㄨˋㄈㄣˋ"]
    @Published var basicsThingsTranslation = ["time","cellphone","people","bathroom\n(w/o shower)","washroom","work","problem","meaning","home","school","friend","part\n(i.e. that part)"]
    
    @Published var basicsInterjectionsBPMF = ["ㄣ˙","ㄏㄚˊ","ㄟˊ"]
    @Published var basicsInterjectionsTranslation = ["show you're\npaying attention\nin conversations","what did\nyou say?","huh? something\nis wrong"]
    
    @Published var basicsOpinionsBPMF = ["ㄅㄨˋㄏㄠˇ","ㄅㄨˊㄊㄞˋㄏㄠˇ","ㄏㄞˊㄏㄠˇ","ㄅㄨˊㄘㄨㄛˋ","ㄏㄣˇㄏㄠˇ","ㄔㄠ ㄏㄠˇ","ㄌㄢˋ","ㄆㄞˊ","ㄅㄞˇㄈㄣ ㄓ ","ㄆㄚ "]
    @Published var basicsOpinionTranslation = ["not good(0%)","not that\ngreat(30%)","ok(50%)","not bad\n(70%)","great(90%)","very good(100%)","crappy","to rank","percent\n(out of 100)","percent"]
    
    @Published var basicsPersonalFavoritesBPMF = ["ㄧㄠˋㄎㄢˋ","ㄓㄥˇㄌㄧˇ","ㄐㄧㄝˋㄧˋ","ㄍㄨˇㄍㄨˇ","ㄋㄥˊㄍㄡˋ","ㄙㄨㄢˋㄕˋ","ㄌㄧˊㄅㄨ˙ㄎㄞ ","ㄐㄧㄝˊㄕㄥˇ","ㄙㄢ ㄈㄣ ㄓㄨㄥ ㄖㄜˋㄉㄨˋ","ㄅㄨˊㄧㄠˋㄌㄧㄢˇ","ㄌㄠˇㄕˋㄕㄨㄛ ","ㄨㄛˇㄕˋㄕㄨㄛ ","ㄅㄧㄠ ㄓㄨㄣˇ","ㄧㄢˊㄙㄨˋ","ㄍㄠˇㄉㄧㄥˋ","ㄅㄧˇㄉㄜ˙ㄕㄤˋ","ㄕㄜˇㄉㄨˋㄉㄜˊ","ㄨㄟˋㄩˊ"]
    @Published var basicsPersonalFavoritesTranslation = ["it depends on...","to organize","to mind\n(smth)","bulging\n(like full stomach)","capable of","to regard as\nbe considered as","inseparable from\ncan't live without","to save\ncut down on","short bursts of\nenthusiasm","shameless","honestly...","What I mean is...","standard\n(level)","serious\n(heavy;solemn)","get it done","can compare with","reluctant to part\n(pity feeling)","to be located at"]
    
    // This section is about popular topics
    
    @Published var topicLanguageLearningBPMF = ["ㄕㄤˋㄎㄜˋ","ㄒㄧㄚˋㄎㄜˋ","ㄌㄠˇㄕ ","ㄒㄩㄝˊㄕㄥ ","ㄏㄨㄛˇㄅㄢˋ","ㄍㄡ ㄊㄨㄥ ","ㄐㄩˇㄕㄡˇ","ㄐㄧ ㄅㄣˇ","ㄐㄧ ㄔㄨˇ","ㄕˊㄐㄧˋ","ㄐㄧㄡ ㄓㄥˋ","ㄍㄞˇㄓㄥˋ","ㄊㄨㄟˋㄅㄨˋ","ㄍㄜˊㄏㄜˊ","ㄉㄡˋㄉㄧㄢˇ","ㄨㄟˋㄓˋ","ㄐㄧˋㄑㄧㄠˇ","ㄈㄣ ㄒㄧㄠˋ","ㄕㄥ ㄘˊ","ㄓㄨㄣˇ"]
    @Published var topicLanguageLearningTranslation = ["to go\nto class","to get out\nof class","teacher","student","partner","to communicate","to raise\nhand","basic","foundation\nbasic","practical","to correct\n(someone else)","to correct\n(self)","to regress\nbecome worse","barrier\n(language)","comma","position\n(of words;things)","tips\n(techniques)","school branch","new word","accurate"]
    
    @Published var topicLanguageExchangeBPMF = ["ㄇㄧㄥˊㄘˊ","ㄉㄨㄥˋㄘˊ","ㄒㄧㄥˊㄖㄨㄥˊㄘˊ","ㄊㄨㄥˊㄧㄣ ㄘˊ","ㄌㄨˋㄧㄣ ","ㄊㄨㄥˊㄧㄣ ㄘˊ","ㄊㄨㄛ ㄈㄨˊ","ㄈㄢˊㄊㄧˇ","ㄅㄧㄠ ㄉㄧㄢˇㄈㄨˊㄏㄠˋ","ㄏㄨㄟˊㄎㄨㄟˋ","ㄏㄢˊㄧˋ","ㄎㄡˇㄩˇ","ㄉㄚˇㄓㄠ ㄏㄨ "]
    @Published var topicLanguageExchangeTranslation = ["noun","verb","adjective","homophones","sound\nrecording","homophones","TOEFL","traditional\nchinese","punctuation\nmarks","feedback","implied\nmeaning","colloquial","to wave\n(say hello)"]
    
    @Published var topicDirectionsBPMF = ["ㄕㄤˋ","ㄒㄧㄚˋ","ㄗㄨㄛˇ","ㄧㄡˋ","ㄧ ㄓˊ","ㄇㄚˇㄌㄨˋ","ㄍㄨㄛˋ","ㄅㄧㄢ ","ㄅㄨˋ"]
    @Published var topicDirectionsTranslation = ["up","down","left","right","straight","street","to cross\n(street)","side","relative\nlocation"]
    
    @Published var topicAskingForHelpBPMF = ["ㄅㄤ ","ㄉㄚˇㄖㄠˇ","ㄖㄣˊㄑㄧㄥˊ","ㄕㄢˋㄔㄤˊ"]
    @Published var topicAskingForHelpTranslation = ["to help","to bother\nsomeone","favor","to not be\ngood at"]
    
    @Published var topicShoppingBPMF = ["ㄏㄨㄢ ㄧㄥˊㄍㄨㄤ ㄌㄧㄣˊ","ㄏㄨㄟˋㄩㄢˊ","ㄩㄥˋ","ㄎㄚˇ","ㄌㄧㄥˊㄑㄧㄢˊ","ㄕㄡ ㄋㄧˇ","ㄈㄚ ㄆㄧㄠˋ","ㄧㄣˋㄔㄨ ","ㄗㄞˋㄐㄩˋ","ㄓㄜˊ","ㄧㄡ ㄏㄨㄟˋ","ㄉㄧㄥˋㄉㄢ ","ㄐㄧㄚˋㄓˊ","ㄓˊㄉㄜ˙","ㄊㄧㄠ ","ㄧㄥˊㄧㄝˋ"]
    @Published var topicShoppingTranslation = ["welcome","membership","to use","card","pocket change","received x$\n(cashier will say)","receipt","to print out","electronically\nstore receipt","discount\n(percentage)","discount","to order","value\nworth","to be\nworth it","to pick","to be open\nfor business"]
    
    @Published var topicMRTBPMF = ["ㄐㄧㄝˊㄩㄣˋ","ㄉㄧㄢˋㄈㄨˊㄊㄧ ","ㄉㄧㄢˋㄊㄧ ","ㄧㄡ ㄧㄡˊㄎㄚˇ","ㄐㄧㄚ ㄓˊ","ㄆㄚˊㄉㄨㄟˋ","ㄔㄚ ㄉㄨㄟˋ","ㄇㄛˋㄅㄢ ㄔㄜ ","ㄌㄨˋㄨㄤˇ"]
    @Published var topicMRTTranslation = ["mass rapid\ntransit","escalator","elevator","MRT card","to recharge\n(money)","to get\nin line","to cut\nin line","last chance\n(e.g. last train)","road network"]
    
    @Published var topicWorkingBPMF = ["ㄓㄥ ㄑㄧㄡˊ","ㄧㄥˋㄓㄥ ","ㄓㄨㄢˋㄑㄧㄢˊ","ㄋㄨˇㄌㄧˋ","ㄍㄨㄥ ㄗㄨㄛˋㄎㄨㄤˊ","ㄧㄥˋㄓㄥ ","ㄗ ㄍㄜˊ","ㄐㄧㄚ ㄒㄧㄣ ","ㄓ ㄕˋ","ㄗㄠˇㄅㄢ ","ㄨㄢˇㄅㄢ ","ㄧㄝˋㄅㄢ ","ㄐㄧㄥˇㄍㄠˋ","ㄉㄧㄥ ㄓㄨˋ","ㄍㄨˋㄌㄧˋ","ㄉㄧˋㄨㄟˋ","ㄧㄡˊㄐㄧㄢˋ","ㄈㄨˋㄐㄧㄢˋ","ㄓㄨㄢˇㄐㄧˋ","ㄈㄨˋㄅㄣˇ","ㄍㄨㄢˇ"]
    @Published var topicWorkingTranslation = ["to seek","to apply\nfor a job","to earn\nmoney","dilligent","workaholic","to apply\nfor a job","qualifications","to raise\nsalary","knowledge","morning\nshift","night\nshift","late night\nshift","to warn","to breathe\ndown smbdy's\nback","to encourage","position\n(not physical)","email","email\nattachment","to forward","to cc\n(email)","to manage\n(employees)"]
    
    @Published var topicOfficeJobBPMF = ["ㄖㄣˊㄩㄢˊ","ㄓㄨˇㄍㄨㄢˇ","ㄍㄨㄟˋㄊㄞˊ","ㄊㄧˊㄍㄨㄥ ","ㄗㄜˊㄖㄣˋ","ㄖㄣˋㄨ˙","ㄑㄧˊㄒㄧㄢˋ","ㄔㄚˊㄎㄢˋ","ㄈㄨˋㄐㄧㄢˋ","ㄋㄟˋㄖㄨㄥˊ","ㄐㄧㄣˋㄉㄨˋ","ㄏㄨㄟˊㄎㄨㄟˋ","ㄢ ㄆㄞˊ","ㄎㄜˋㄏㄨˋ","ㄉㄨㄟˋㄧㄡˇ","ㄧㄡ ㄉㄧㄢˇ","ㄑㄩㄝ ㄉㄧㄢˇ","ㄓˋㄉㄨˋ","ㄆㄟˋㄏㄜˊ","ㄙ ㄒㄧㄚˋ","ㄊㄧㄢˊ","ㄈㄣ ㄍㄨㄥ ㄙ ","ㄗㄨㄥˇㄍㄨㄥ ㄙ "]
    @Published var topicOfficeJobTranslation = ["personnel","supervisor","front desk","to provide","responsibility","task","deadline","to examine","e-mail\nattachment","contents","progress","feedback","to arrange\n(matters)","client","team member","advantage","disadvantage","system","to coordinate\nwith","in private","to fill\nout a form","branch(office)","headquarters"]
    
    @Published var topicDrivingOnRoadBPMF = ["ㄔㄜ ㄎㄨˋ","ㄉㄤˇ","ㄕㄡˇㄆㄞˊ","ㄓㄨㄢˇㄨㄢ ","ㄌㄨㄣˊㄗ˙","ㄔㄜ ㄉㄥ ","ㄢ ㄑㄩㄢˊㄉㄞˋ","ㄉㄠˋㄉㄤˇ","ㄘㄞˇ","ㄋㄧㄡˇ","ㄧㄡˊㄇㄣˊ","ㄗˋㄆㄞˊ","ㄔㄜ ㄉㄠˋ","ㄊㄧㄥˊㄔㄜ ㄨㄟˋ","ㄙㄞ ㄔㄜ ","ㄑㄧˇㄉㄨㄥˋ","ㄗㄞˋㄖㄣˊ","ㄐㄧㄝ ","ㄕㄨㄣˋㄌㄨˋ","ㄒㄧ ㄏㄨㄛˇ","ㄨㄢ "]
    @Published var topicDrivingOnRoadTranslation = ["garage","gear","manual\ntransmission","corner;turn","wheel","headlights","seat belt","reverse\ngear","to step on","to twist","throttle","automatic\ntransmission","traffic\nlane","parking\nspace","held up\nin traffic","to turn on\n(machine)","to carry\npassengers","to pick\nsmbdy up","on the way","engine to die","curvy"]
    
    @Published var topicApologizingBPMF = ["ㄉㄨㄟˋㄅㄨˋㄑㄧˇ","ㄅㄨˋㄏㄠˇㄧˋㄙ˙","ㄉㄠˋㄑㄧㄢˋ","ㄘㄨㄛˋ","ㄘㄨㄛˋㄨˋ","ㄇㄠˋㄈㄢˋ","ㄔㄥˊㄒㄧㄣ ","ㄊㄨㄛ ㄌㄟˇ"]
    @Published var topicApologizingTranslation = ["sorry","sorry (casual)\nexcuse me","make an apology","wrong doing\nfault","mistake","to offend","sincerity","to be a\nburden on"]
    
    @Published var topicComplainingBPMF = ["ㄅㄠˋㄩㄢˋ","ㄈㄚ ㄒㄧㄝˋ","ㄅㄚ ㄍㄨㄚˋ","ㄌㄢˇㄍㄨㄟˇ","ㄕㄥˋㄖㄣˋ","ㄋㄧˋ","ㄧㄚ ㄓㄚˋ","ㄔㄨㄥˊㄈㄨˋ"]
    @Published var topicComplainingTranslation = ["to complain","to vent","to gossip","lazy butt","to be\ncompetent","tired\nof smth.","exploit\nworking","to repeat"]
    
    @Published var topicArguingBPMF = ["ㄔㄠˇㄐㄧㄚˋ","ㄅㄧˋㄇㄧㄢˇ","ㄉㄚˇㄉㄨㄢˋ","ㄐㄩˋㄐㄩㄝˊ","ㄔㄨㄥ ㄊㄨ ","ㄐㄧㄚˇㄕㄜˋ","ㄌㄧˋㄔㄤˇ","ㄐㄧㄠ ㄠˋ","ㄅㄨˋㄌㄧˇ","ㄇㄚˋ","ㄧㄣˇㄙ ","ㄏㄨㄞˊㄧˊ","ㄗㄞˋㄏㄨ˙","ㄗㄞˋㄧˋ","ㄐㄧㄝˋㄧˋ","ㄑㄧˋㄓㄚˋ","ㄢ ㄨㄟˋ","ㄇㄠˋㄈㄢˋ","ㄐㄩˋㄌㄧˊ","ㄈㄥ ㄎㄨㄤˊ","ㄓㄢˋㄆㄧㄢˊㄧ˙","ㄓㄠˇㄔㄨ "]
    @Published var topicArguingTranslation = ["to argue","to avoid","to interrupt","to reject","conflicts","to assume","perspective","pride","ignore","to scold","secrets","to doubt","to care\n(about people)","to care\n(about things)","to mind","to burst\nwith rage","to comfort","to offend","distant\n(emotionally)","crazy","take\nadvantage of","to find out\nfrom someone"]
    
    @Published var topicExplainingYourPerspectiveBPMF = ["ㄓㄨㄥˋㄉㄧㄢˇ","ㄑㄧㄤˊㄉㄧㄠˋ","ㄧˋㄐㄧㄢˋ","ㄨˋㄐㄧㄝˇ","ㄓㄨˋㄧˋ","ㄎㄨㄥˇㄆㄚˋ","ㄨˊㄙㄨㄛˇㄨㄟˋ","ㄗㄨㄛˋㄈㄚˇ","ㄉㄞˋㄅㄧㄠˇ","ㄈㄣ ㄅㄧㄢˋ","ㄏㄨㄞˊㄧˊ","ㄈㄚ ㄕˋ","ㄕㄨㄟˋ ㄈㄨˊ","ㄎㄞ ㄉㄠˇ"]
    @Published var topicExplainingYourPerspectiveTranslation = ["main point","to emphasize","subjective view","to misunderstand","to pay\nattention","to be afraid\nthat","indifferent","way of doing\nsmth","to represent","to distinguish\nto differentiate","to doubt\nto suspect","to swear;promise","to persuade\nto convince","help smbdy. see\nwhat's correct"]
    
    @Published var topicChineseNewYearBPMF = ["ㄔㄨㄣ ㄐㄧㄝˊ","ㄍㄨㄛˋㄋㄧㄢˊ","ㄋㄧㄢˊㄧㄝˋㄈㄢˋ","ㄊㄨㄢˊㄩㄢˊ","ㄔㄨˊㄒㄧ ","ㄔㄨㄣ ㄌㄧㄢˊ","ㄇㄣˊㄌㄧㄢˊ","ㄊㄧㄝ ","ㄏㄨㄟˊㄋㄧㄤˊㄐㄧㄚ ","ㄉㄚˋㄙㄠˇㄔㄨˊ","ㄅㄞˋㄋㄧㄢˊ","ㄨㄢˋㄕˋㄖㄨˊㄧˋ","ㄍㄨㄥ ㄒㄧˇㄈㄚ ㄘㄞˊ","ㄉㄚˋㄐㄧˊㄉㄚˋㄌㄧˋ","ㄋㄧㄢˊㄋㄧㄢˊㄧㄡˇㄩˊ","ㄅㄨˋㄅㄨˋㄍㄠ ㄕㄥ ","ㄅㄢˋㄕㄡˇㄌㄧˇ","ㄧㄚ ㄙㄨㄟˋㄑㄧㄢˊ","ㄕㄡˇㄙㄨㄟˋ","ㄈㄤˋㄅㄧㄢ ㄆㄠˋ","ㄨㄟˊㄌㄨˊ","ㄅㄞˋㄈㄤˇ","ㄔㄨ ㄒㄧ ","ㄗㄡˇㄔㄨㄣ ","ㄕˊㄦˋㄕㄥ ㄒㄧㄠˋ","ㄈㄢˇㄍㄨㄛ˙ㄌㄞ˙","ㄑㄧㄣ ㄑㄧ ","ㄑㄩㄢ ㄐㄧㄚ "]
    @Published var topicChineseNewYearTranslation = ["lunar new year","to celebrate\nnew year","new year's\neve dinner","to reunite\n(family members)","new year's eve","new year couplets","door couplet","to stick/paste","to visit parents\n(married woman)","thorough cleanup","wish smbdy\nhappy new year","'may everything go\nyour way'","'congratulations;\nwish you health'","'great luck;great profit'","'have abundance\nevery year'","'rise in the ranks'","gift given\n(when visiting)","new year's eve\nmoney","to stay up to\nwait new years","to set off\nfirecrackers","family to gather\nin new years\n(old saying)","to pay someone\na visit","first day of\nlunar month","walking around in\nthird day of\nnew year","chinese zodiac","to turn over\nturn to opposite\ndirection","relatives","entire family"]
    
    @Published var topicRemarksReactionsBPMF = ["ㄓㄣ ㄐㄧㄚˇㄉㄜ˙","ㄅㄨˋㄙㄨㄢˋ","ㄕㄚˇㄧㄢˇ","ㄒㄧㄤ ㄏㄨㄚˋㄇㄚ","ㄈㄢˇㄓㄥˋ","ㄕ ㄗㄨㄥ ","ㄌㄧㄥˋㄧ ㄈㄤ ㄇㄧㄢˋ","ㄗㄣˇㄇㄜ˙ㄕㄨㄛ ","ㄅㄧˋㄗㄨㄟˇ","ㄧ ㄌㄨˋㄕㄨㄣˋㄈㄥ ","ㄏㄨㄛˊㄍㄞ ","ㄈㄟˋㄏㄨㄚˋ"]
    @Published var topicRemarksReactionsTranslation = ["really?!","it doesn't count","unbelievable","is that\nreasonable?","anyway,...","where did he/\nshe go?","on the\nother hand,...","how so?","shut up","have a\ngood trip!","serves you right","no kidding!"]
    
    
    
    // This section is about specific scenarios that happen in everyday life
    
    @Published var scenarioRunningOutOfBatteryBPMF = ["ㄔㄚ ㄗㄨㄛˋ","ㄔㄚ ","ㄅㄚˊ","ㄔㄨㄥ ㄉㄧㄢˋㄑㄧˋ","ㄔㄚ ㄊㄡˊ","ㄒㄧㄥˊㄉㄨㄥˋㄉㄧㄢˋㄩㄢˊ","ㄉㄧㄢˋㄩㄢˊㄒㄧㄢˋ","ㄈㄢˇㄙㄨㄛˇ"]
    @Published var scenarioRunningOutofBatteryTranslation = ["electric\nsocket","to plug in","to pull out","charger","charger block","power bank","power cable","locked out"]
    
    @Published var scenarioOrderingDrinksBPMF = ["ㄧㄠˋ","ㄖㄜˋ","ㄨㄣ ","ㄅㄧㄥ ","ㄅㄟ ","ㄒㄧㄠˇ","ㄓㄨㄥ ","ㄉㄚˋ","ㄊㄤˊ","ㄑㄩˋ","ㄨㄟ ","ㄅㄢˋ","ㄑㄩㄢˊ"]
    @Published var scenarioOrderingDrinksTranslation = ["to want","hot","warm","ice","cup\n(drink size)","small(size)","medium(size)","large(size)","sugar","none~0%","micro~30%","half~50%","full~100%"]
    
    @Published var scenarioGettingGasBPMF = ["ㄐㄧㄚ ㄇㄢˇ","ㄊㄧㄢˋㄊㄧㄥˊ"]
    @Published var scenarioGettingGasTranslation = ["fill till full","gas popping noise\n(when full)"]
    
    @Published var scenarioRestaurantBPMF = ["ㄩㄥˋㄘㄢ ","ㄐㄧㄝˊㄓㄤˋ","ㄋㄟˋㄩㄥˋ","ㄨㄞˋㄉㄞˋ","ㄊㄨㄟ ㄐㄧㄢˋ","ㄉㄚˇㄅㄠ ","ㄉㄧㄥˋㄨㄟˋ","ㄈㄨˊㄨˋ","ㄏㄨㄟˊㄔㄨㄥ ","ㄎㄣˇ","ㄐㄧㄠˊ","ㄗㄠˇ","ㄇㄢˇㄧˋ","ㄌㄧㄡˊㄟˋ"]
    @Published var scenarioRestaurantTranslation = ["to have a meal","to settle\nthe bill","eat in","take out","to make\na reservation","recommendation","bag\nleftovers","service","to refill\n(tea bag)","to nibble","to chew","to bite","satisfied","leave room\n(stomach)"]
    
    @Published var scenarioConveyorSushiBPMF = ["ㄍㄨㄟ ㄩˊ","ㄨㄟˇㄩˊ","ㄕㄡˇㄐㄩㄢˇ","ㄨㄟˋㄘㄥ ㄊㄤ ","ㄆㄢˊ"]
    @Published var scenarioConveyorSushiTranslation = ["salmon","tuna","hand roll","miso soup","a plate"]
    
    @Published var scenarioOnThePhoneBPMF = ["ㄨㄟˊ","ㄒㄩㄣˋㄏㄠˋ","ㄉㄚˇㄉㄧㄢˋㄏㄨㄚˋ"]
    @Published var scenarioOnThePhoneTranslation = ["hello~","reception\n signal","give a\nphone call"]
    
    @Published var scenarioDrinkingBPMF = ["ㄐㄧㄡˇㄅㄚ ","ㄐㄧㄡˇㄌㄧㄤˋ","ㄕㄥ ㄆㄧˊㄐㄧㄡˇ","ㄐㄩ ㄐㄧㄡˇㄨ "]
    @Published var scenarioDrinkingTranslation = ["bar","tolerance","draft beer","izakaya"]
    
    @Published var scenarioWearingClothesBPMF = ["ㄧ ㄈㄨˊ","ㄔㄨㄢ ","ㄉㄞˋ","ㄓㄞ ","ㄎㄡˋ","ㄒㄧˋ","ㄆㄧˊㄉㄞˋ","ㄧㄢˇㄐㄧㄥˋ","ㄦˇㄏㄨㄢˊ","ㄒㄧㄤˋㄌㄧㄢˋ","ㄕㄡˇㄌㄧㄢˋ","ㄕㄡˇㄅㄧㄠˇ","ㄉㄚ ㄆㄟˋ","ㄐㄩㄢ ","ㄍㄠ ㄐㄧˊ"]
    @Published var scenarioWearingClothesTranslation = ["clothes","to wear(clothes)","to wear\n(accessories)","to take off\n(accessories)","to button\nup","to fasten\n(belt)","belt","glasses","earring","necklace","bracelet","wrist watch","to match\n(clothes)","to donate","fancy;\nhigh quality"]
    
    @Published var scenarioFocusedBPMF = ["ㄓㄨㄢ ㄒㄧㄣ ","ㄈㄣ ㄒㄧㄣ ","ㄉㄚˇㄖㄠˇ","ㄐㄧㄢˋㄔˊ","ㄇㄚˊ"]
    @Published var scenarioFocusedTranslation = ["to concentrate","distracted","to disturb","to persevere","to feel numb\n(e.g. legs)"]
    
    @Published var scenarioCookingBPMF = ["ㄑㄧㄝ ","ㄏㄨㄥ ㄅㄟˋ","ㄓㄥ ","ㄔㄠˇ","ㄐㄧㄢ ","ㄐㄧㄤˋ","ㄓㄚˋ","ㄐㄧˇ","ㄊㄧㄢˇ","ㄙㄨㄟˋㄉㄧㄠˋ"]
    @Published var scenarioCookingTranslation = ["to slice/cut","to bake","steamed","scrambled","pan fried","sauce","to press\n(juice)","to squeeze\n(w/ fingers)","to lick","to drop and\nsmash"]
    
    @Published var scenarioHaircutBPMF = ["ㄐㄧㄢˇ","ㄉㄨㄢˋ","ㄐㄧㄢˇㄘㄥˊ"]
    @Published var scenarioHaircutTranslation = ["to cut","short","fade"]
    
    @Published var scenarioFacingChallengesBPMF = ["ㄊㄧㄠˇㄓㄢˋ","ㄧㄥˋㄧㄠˋ","ㄎㄜˋㄈㄨˊ","ㄈㄢˇㄏㄨㄟˇ","ㄔㄨˇㄌㄧˇ","ㄍㄠˇㄗㄚˊ","ㄘㄡˋㄏㄜ˙","ㄐㄧㄝˇㄐㄩㄝˊ","ㄍㄨㄢ ㄔㄚˊ","ㄐㄧㄚ ㄑㄧㄤˊ","ㄍㄞˇㄐㄧㄣˋ","ㄕˋㄧㄥˋ"]
    @Published var scenarioFacingChallengesTranslation = ["challenge","set on doing\nsmth","to overcome","to back out","to deal with\nto handle","to mess\nsmth up","to improvise\nto make do","to fix\na problem","to observe and\nsee what\nhappens","to strengthen\nto enhance","to improve\nto make better","to adapt"]
    
    @Published var scenarioDidSomethingDumbBPMF = ["ㄇㄧˊㄌㄨˋ","ㄆㄥˋ","ㄏㄨˊㄊㄨˊ","ㄈㄢˇㄙㄨㄛˇ","ㄉㄞˋㄅㄨˇ"]
    @Published var scenarioDidSomethingDumbTranslation = ["to get lost","to bump intt\nsomething","someone who\nalways forget","to be\nlocked out","to be arrested"]
    
    @Published var scenarioInterviewBPMF = ["ㄇㄧㄢˋㄕˋ","ㄅㄧㄠˇㄑㄧㄥˊ","ㄨㄛˋㄕㄡˇ"]
    @Published var scenarioInterviewTranslation = ["interview","expression\n(facial)","to shake hands"]
    
    @Published var scenarioInTheSlumpsBPMF = ["ㄐㄧㄥ ㄕㄣ ","ㄒㄧㄣ ㄑㄧㄥˊ","ㄎㄨ ","ㄌㄧㄡˊㄧㄢˇㄌㄟˋ"]
    @Published var scenarioInTheSlumpsTranslation = ["energy","state of mind\n(mood)","to cry","to shed tears"]
    
    @Published var scenarioTechnologyBPMF = ["ㄉㄧㄢˋㄋㄠˇ","ㄨㄤˇㄓㄢˋ","ㄉㄚˇㄗˋ","ㄕㄢ ㄔㄨˊ","ㄆㄧㄥˊㄐㄧㄚˋ","ㄒㄧㄡ ㄌㄧˇ","ㄍㄨㄥ ㄋㄥˊ","ㄉㄞˋㄐㄧ ","ㄉㄧㄢˋㄔˊ","ㄔㄥˊㄕˋ","ㄖㄨㄢˇㄊㄧˇ","ㄗㄢˋㄊㄧㄥˊ","ㄏㄨㄚˋㄓˋ"]
    @Published var scenarioTechnologyTranslation = ["computer","website","to type","to delete","reviews","to repair","features\nfunctionality","sleep(mode)","battery","program","software","to pause","picture/video\nquality"]
    
    @Published var scenarioThrowingTrashBPMF = ["ㄌㄜˋㄙㄜˋ","ㄉㄧㄡ ","ㄏㄨㄟˊㄕㄡ ","ㄌㄜˋㄙㄜˋㄔㄜ "]
    @Published var scenarioThrowingTrashTranslation = ["trash","to throw","to recycle","trash truck"]
    
    @Published var scenarioBeingSingleBPMF = ["ㄉㄢ ㄕㄣ ","ㄊㄡˊㄎㄢˋ","ㄈㄤˋㄍㄜ ㄗ˙","ㄊㄧㄠˊㄎㄢˇ","ㄓㄨㄟ ","ㄅㄚˇㄇㄟˋ","ㄒㄧㄣˋㄉㄨㄥˋ","ㄧˊㄏㄢˋ","ㄧㄡˊㄩˋ","ㄇㄧˊㄌㄧㄢˋ","ㄇㄟˊㄒㄧˋ","ㄕㄨˊ","ㄑㄧㄣ ㄐㄧㄣˋ","ㄍㄠˋㄅㄞˊ","ㄒㄧˋㄨㄟˊ","ㄋㄧˋㄇㄧㄥˊ","ㄌㄧˋㄒㄧㄤˇ","ㄇㄧㄥˊㄒㄧㄢˇ","ㄓㄨㄛ ㄋㄨㄥˋ","ㄎㄠˋㄐㄧㄣˋ"]
    @Published var scenarioBeingSingleTranslation = ["single","to steal\na glance","to stand\nsmbdy up","to tease","to pursue\n(smbdy)","to get\na girl","to feel something\n(for someone)","to regret","to hesitate","to obsess","to have\nno chance\n(hopeless)","to be familiar","to be close to","to confess\n(love)","subtle","anonymous","ideal","obvious","to tease","to approach"]
    
    @Published var scenarioHouseholdChoresBPMF = ["ㄙㄠˋ","ㄒㄧˇ","ㄇㄛˇㄅㄨˋ","ㄋㄧˊㄊㄨˇ","ㄍㄨㄚˋ","ㄒㄧ ㄔㄣˊㄑㄧˋ","ㄒㄧ ㄉㄧˋ"]
    @Published var scenarioHouseholdChoresTranslation = ["to broom","to wash","cleaning\nrag","dirt","to hang\n(things)","vacuum","to vacuum\nthe floor"]
    
    @Published var scenarioBeachBPMF = ["ㄕㄚ ㄊㄢ ","ㄕㄞˋ","ㄊㄞˋㄧㄤˊ","ㄧㄡˊㄩㄥˇ"]
    @Published var scenarioBeachTranslation = ["beach","to bathe\n(in sun)","sun","to swim"]
    
    @Published var scenarioYogaBPMF = ["ㄩˊㄐㄧㄚ ","ㄒㄧㄚˋㄑㄩㄢˇㄕˋ","ㄅㄟˋㄆㄧㄥˊ","ㄓㄨㄥ ㄒㄧㄣ ","ㄎㄡˇㄑㄧˋ","ㄒㄧ ","ㄊㄨˇ","ㄆㄧㄥˊㄅㄢˇ"]
    @Published var scenarioYogaTranslation = ["yoga","downward\ndog","flat back","central\npoint\nof weight","breathe","breathe in","breathe out","to plank"]
    
    @Published var scenarioHandlingCameraBPMF = ["ㄆㄞ ㄓㄠˋ","ㄏㄥˊ","ㄓˊ","ㄘˊㄊㄧㄝˇ"]
    @Published var scenarioHandlingCameraTranslation = ["take a picture","horizontal\n(landscape)","vertical\n(portrait)","magnet"]
    
    @Published var scenarioPackageDeliveryBPMF = ["ㄅㄠ ㄍㄨㄛˇ","ㄋㄚˊ","ㄕㄡˇㄐㄧ ","ㄏㄡˋㄙㄢ ㄇㄚˇ"]
    @Published var scenarioPackageDeliveryTranslation = ["package","to take","phone","last 3 digits\nof phone"]
    
    @Published var scenarioSalonBPMF = ["ㄖㄢˇㄈㄚˋ","ㄊㄤˋ"]
    @Published var scenarioSalonTranslation = ["to dye hair","to perm"]
    
    @Published var scenarioNatureBPMF = ["ㄉㄧˋㄑㄧㄡˊ","ㄉㄚˋㄗˋㄖㄢˊ","ㄌㄨˋㄊㄧㄢ ","ㄖˋㄔㄨ ","ㄖˋㄌㄨㄛˋ","ㄕㄨˋ","ㄕˊㄊㄡ˙","ㄍㄨㄤ ㄒㄧㄢˋ","ㄌㄨˋㄕㄨㄟ˙","ㄙㄣ ㄌㄧㄣˊ","ㄏㄨㄟˇ"]
    @Published var scenarioNatureTranslation = ["earth","nature","outdoors","sunrise","sunset","trees","rocks","natural\nlighting","dew","forest","to destroy"]
    
    @Published var scenarioImmigrantBPMF = ["ㄕㄣ ㄈㄣˋㄖㄣˋㄊㄨㄥˊ","ㄧˊㄇㄧㄣˊ","ㄍㄨㄟ ㄕㄨˇㄍㄢˇ","ㄈㄨˋㄉㄢ ","ㄎㄜˋㄈㄨˊ","ㄍㄨㄛˊㄇㄧㄣˊ","ㄆㄧㄢˋㄐㄧㄢˋ","ㄎㄜˋㄅㄢˇㄧㄣˋㄒㄧㄤˋ","ㄔㄨㄥ ㄐㄧ ","ㄏㄨㄣˋㄒㄩㄝˋ","ㄍㄨㄛˊㄐㄧˊ","ㄓㄨㄥˇㄗㄨˊ"]
    @Published var scenarioImmigrantTranslation = ["personal\nidentity","to immigrate","sense of\nbelonging","to bear a\nburden","to endure\n(hardships)","citizens","prejudice","stereotype","impact\neffect","half blood","nationality","ethnic group"]
    
    @Published var scenarioWorkingInManufacturingProjectManagementBPMF = ["ㄖㄣˋㄨˋ","ㄒㄧㄥˊㄕˋㄌㄧˋ","ㄧㄠ ㄑㄧㄡˊ","ㄓㄨㄥˋㄧㄠˋㄒㄧㄥˋ","ㄊㄨㄥ ㄓ ","ㄆㄧㄥˊㄒㄧㄥˊ","ㄑㄧㄢˊㄊㄧˊ","ㄍㄨㄟ ㄏㄨㄚˋ","ㄎㄜˇㄋㄥˊㄒㄧㄥˋ","ㄊㄧㄠˊㄐㄧㄢˋ","ㄔㄥˊㄒㄩˋ","ㄈㄣ ㄒㄧ ","ㄒㄧㄠˋㄌㄩˋ","ㄎㄨㄤˋㄎㄨㄤˋ","ㄐㄧㄢˇㄔㄚˊ","ㄍㄥ ㄒㄧㄣ ","ㄒㄧㄡ ㄍㄞˇ","ㄔㄨ ㄅㄨˋ","ㄍㄨ ㄐㄧㄚˋ","ㄈㄨˋㄎㄨㄢˇ","ㄔㄨ ㄔㄞ ","ㄨㄟˊㄓㄨˇ","ㄨㄟˊㄈㄨˇ","ㄍㄨㄢˇㄌㄧˇㄅㄨˋㄇㄣˊ","ㄒㄧㄠ ㄕㄡˋㄅㄨˋ","ㄖㄣˊㄕˋㄅㄨˋ","ㄧㄢˊㄈㄚ ㄅㄨˋ"]
    @Published var scenarioWorkingInManufacturingProjectManagementTranslation = ["tasks","planner\nschedule","requests","significance\nimportance","to notify","simultaneous","prerequisite","to schedule\n(on timeline)","probability\npossibility","requirement","procedure","analysis","efficiency","to frame","to inspect","to update","to revise","initial\npreliminary","estimation","payment","to go away\nfor business","to give\npriority to","to give\nsecondary to","administrative\ndepartment","sales\nmarketing\ndepartment","hr\ndepartment","r&d\ndepartment"]
    
    // This section is about possible discussion topics that happen in everyday life
    
    @Published var discussionGeneralBPMF = ["ㄏㄨㄚˋㄊㄧˊ","ㄈㄢˇㄧㄥˋ","ㄧㄢˊㄓㄨㄥˋ","ㄒㄧㄥˊㄖㄨㄥˊ","ㄉㄚ ㄧㄥ˙","ㄔㄨㄟ ㄋㄧㄡˊ","ㄇㄧㄢˋㄉㄨㄟˋ","ㄊㄧˊㄑㄧˇ","ㄌㄨㄢˋㄐㄧㄤˇ","ㄇㄧㄥˊㄑㄩㄝˋ","ㄧ ㄐㄧㄢˋ","ㄕㄣ ","ㄒㄧˋㄐㄧㄝˊ","ㄒㄧㄤ ㄈㄢˇ","ㄕˋㄕˊ","ㄘˋㄕㄨˋ","ㄌㄧˋㄩㄥˋ","ㄍㄞˇㄅㄧㄢˋ","ㄈㄟ ㄧㄠˋ","ㄊㄧㄠˊㄓㄥˇ","ㄇㄧㄥˋㄌㄧㄥˋ","ㄉㄧㄢˇㄊㄡˊ","ㄨㄞˋㄅㄧㄠˇ","ㄕㄣ ㄑㄧㄥˇ","ㄔㄨㄥ ㄕˊ"]
    @Published var discussionGeneralTranslation = ["topic of\nconversation","reaction","serious\nheavy","to describe","to promise\n(person to person)","to brag","to confront","to mention","to speak\ncarelessly","to make clear","an objection","deep","details","opposite","facts","number of\ntimes","to make\nuse of","to change","to insist","to adjust","a command\nto command","to nod head","outward appearance","to apply\n(for something)","to enrich"]
    
    @Published var discussionWhatToDoBPMF = ["ㄑㄧ ㄉㄞˋ","ㄉㄚˇㄈㄚ ","ㄐㄩˋㄏㄨㄟˋ","ㄓㄨㄣˇㄕˊ","ㄌㄨˋㄧㄥˊ","ㄅㄠˋㄇㄧㄥˊ","ㄑㄩˇㄒㄧㄠ ","ㄕㄨㄚˇㄈㄟˋ","ㄑㄧㄥˋㄓㄨˋ","ㄆㄚˊㄕㄢ ","ㄌㄧㄡ ㄅㄧㄥ ","ㄌㄞˋㄔㄨㄤˊ","ㄨㄣ ㄑㄩㄢˊ"]
    @Published var discussionWhatToDoTranslation = ["to look\nforward to","to kill\ntime","get-together","to be punctual","to be lazy in bed","to sign up","to cancel","to chill\npass time idly","to celebrate","to go hiking","camping","ice skate","hotsprings"]
    
    @Published var discussionWhatToEatBPMF = ["ㄨㄞˋㄙㄨㄥˋ","ㄊㄧㄠ ㄕˊ","ㄔ ㄉㄠˋㄅㄠˇ","ㄕㄡˋㄙ ","ㄏㄞˇㄒㄧㄢ ","ㄏㄨㄛˇㄍㄨㄛ ","ㄎㄠˇㄖㄡˋ","ㄕˋ","ㄈㄟˊ"]
    @Published var discussionWhatToEatTranslation = ["delivery","picky\neater","buffet","sushi","seafood","hotpot","barbecue","something-style\n(e.g. thai-style)","fatty(food)"]
    
    @Published var discussionWhereToGoBPMF = ["ㄉㄧˋㄈㄤ ","ㄆㄧㄥˊㄐㄧㄚˋ"]
    @Published var discussionWhereToGoTranslation = ["place","reviews\ncomments"]
    
    @Published var discussionRelationshipsBPMF = ["ㄌㄤˋㄇㄢˋ","ㄑㄧㄣ ㄞˋㄉㄜ˙","ㄌㄧㄥˋㄧ ㄅㄢˋ","ㄔㄨ ㄌㄧㄢˋ","ㄔㄥˊㄓㄤˇ","ㄓㄡ ㄋㄧㄢˊ","ㄓㄣ ㄒㄧ ","ㄔㄨㄥˇㄏㄨㄞˋ","ㄊㄨㄥˊㄐㄩ ","ㄈㄣ ㄐㄩ ","ㄍㄨㄢˇㄑㄧㄥˊ","ㄩㄝ ㄏㄨㄟˋ","ㄨㄣ ㄋㄨㄢˇ","ㄉㄨㄣˋㄆㄞˊ","ㄧ ㄎㄠˋ","ㄊㄨㄛˇㄒㄧㄝˊ"]
    @Published var discussionRelationshipsTranslation = ["romantic","dear","other half","first love","to grow","anniversary","to cherish","to spoil","to live\ntogether","to live\nseparate","affection\n(between two)","date\n(romantic)","warm","shield","secure(feeling)","to compromise"]
    
    @Published var discussionPublicTransportationBPMF = ["ㄉㄚˇ","ㄗㄨㄛˋ","ㄍㄨㄥ ㄔㄜ ","ㄐㄧˋㄔㄥˊㄔㄜ ","ㄏㄨㄛˇㄔㄜ ","ㄐㄧㄝˊㄩㄣˋ","ㄐㄧㄠˇㄊㄚ ㄔㄜ ","ㄎㄜˋㄩㄣˋ","ㄐㄧㄠ ㄊㄨㄥ ","ㄈㄤ ㄅㄧㄢˋ"]
    @Published var discussionPublicTransportationTranslation = ["to take\n(transportation)","to take\n(transportation)","public bus","taxi","train","MRT","bicycle","intercity bus","availability\nof public\ntransportation","convenient"]
    
    @Published var discussionCovid19BPMF = ["ㄧˋㄑㄧㄥˊ","ㄎㄡˇㄓㄠˋ","ㄍㄜˊㄌㄧˊ","ㄙㄠˇㄇㄧㄠˊ","ㄊㄧˇㄨㄣ ","ㄐㄧㄝˇㄔㄨˊ","ㄓㄥˋㄈㄨˇ","ㄍㄢˇㄖㄢˇ","ㄖㄣˊㄕㄨˋ","ㄧˋㄇㄧㄠˊ","ㄉㄚˇ","ㄔㄨㄢˊㄖㄢˇ","ㄧˋㄑㄧㄥˊ","ㄅㄠˋㄈㄚ "]
    @Published var discussionCovid19Translation = ["covid","mask","to quarantine","to scan","body\ntemp.","to remove\n(a level)","government","infection","number\nof people","vaccine","to take\n(vaccine)","to infect\n(others)","epidemic\nsituation\n(covid)","to break\nout\nan outbreak"]
    
    @Published var discussionLifeGoalsBPMF = ["ㄐㄧㄝ ㄉㄨㄢˋ","ㄇㄥˋㄒㄧㄤˇ","ㄓㄨㄟ ㄑㄧㄡˊ","ㄕˊㄒㄧㄢˋ","ㄕˋㄏㄠˋ","ㄩㄣˋㄑㄧˋ","ㄒㄧㄥˋㄩㄣˋ","ㄌㄧˇㄧㄡˊ","ㄩㄢˊㄧㄣ ","ㄧㄠˋㄎㄢˋ","ㄓㄨˇㄧ˙","ㄔㄥˊㄅㄞˋ","ㄒㄧㄢˋㄓˋ","ㄕㄤˋㄐㄧㄣˋㄒㄧㄣ ","ㄩㄢˋㄨㄤˋ","ㄓㄤˋㄞˋ","ㄕˋㄊㄨˊ","ㄒㄧㄤˋㄕㄤˋ","ㄓㄥˋㄇㄧㄥˊ","ㄔㄥˊㄨㄟˊ","ㄒㄧㄤˇㄒㄧㄤˋ","ㄕㄣ ㄈㄣ˙"]
    @Published var discussionLifeGoalsTranslation = ["stage\nphase","dreams\ngoals","ambitions","to come true\nto realize","hobby\n(want to be\ngood)","luck\n(noun)","luck\n(adj)","excuse\n(to not do\nsmth)","reason","depends on","idea","success and\nfailures","restrictions","desire to\ndo better","wish","obstacles","try to do\n(smth)","to advance\nhigher","to prove","to become\n(end state)","to imagine","status\n(of a person)"]
    
    @Published var discussionCultureBPMF = ["ㄨㄣˊㄏㄨㄚˋ","ㄨㄣˊㄏㄨㄚˋㄔㄨㄥ ㄐㄧ ","ㄇㄧˊㄒㄧㄣˋ","ㄉㄨㄥ ㄈㄤ ","ㄒㄧ ㄈㄤ ","ㄈㄚ ㄓㄢˇ","ㄓㄨㄥˇㄗㄨˊ"]
    @Published var discussionCultureTranslation = ["culture","culture shock","superstition","eastern","western","to develop","ethic group"]
    
    @Published var discussionTravellingBPMF = ["ㄅㄢ ㄐㄧ ","ㄌㄩˇㄍㄨㄢ ","ㄏㄨˋㄓㄠˋ","ㄍㄨㄛˊㄐㄧˋㄐㄧㄚˋㄓㄠˋ","ㄏㄤˊㄒㄧㄤˋ","ㄊㄨㄟ ㄐㄧㄢˋ","ㄉㄠˇㄧㄡˊ","ㄍㄨㄛˊㄨㄞˋ","ㄑㄧㄢ ㄓㄥˋ","ㄇㄥˊㄧㄡˇ","ㄇㄢˋㄧㄡ ㄧㄡ ","ㄅㄧˋㄧㄠˋ","ㄉㄠˇㄧㄡˊ","ㄐㄩ ㄌㄧㄡˊㄓㄥˋ"]
    @Published var discussionTravellingTranslation = ["flight","hotel","passport","international\ndriver's\nlicense","direction\n(ship/plane)","to recommend","tour guide","abroad","visa","allied\ncountry","unhurried\nleisurely","necessary","tour guide","Alien Resident Card\n(Taiwan)"]
    
    @Published var discussionWorkBPMF = ["ㄋㄧㄢˊㄐㄧㄚˋ","ㄍㄣ ㄐㄧㄣˋ","ㄨㄞˋㄆㄞˋ","ㄊㄨㄟˋㄒㄧㄡ ","ㄒㄧㄣ ㄎㄨˇ","ㄉㄨˋㄐㄧㄚˋ","ㄌㄧㄥˇㄌㄨˋㄖㄣˊ"]
    @Published var discussionWorkTranslation = ["annual\nleave","to follow\nup","to send to\nanother\nplace","to retire","tough\n(work/life)","spend one's\nbreak","guide\nleader\nmentor"]
    
    @Published var discussionWeatherBPMF = ["ㄊㄧㄢ ㄑㄧˋ","ㄖㄜˋ","ㄌㄥˇ","ㄕ ","ㄍㄢ ","ㄌㄧㄤˋ","ㄒㄧㄚˋㄩˇ","ㄒㄧㄚˋㄒㄩㄝˇ"]
    @Published var discussionWeatherTranslation = ["weather","hot","cold","humid","dry","bright","to rain","to snow"]
    
    @Published var discussionMoviesShowsBPMF = ["ㄎㄢˋ","ㄓㄨㄟ ㄐㄩˋ","ㄉㄧㄢˋㄧㄥˇ","ㄉㄧㄢˋㄕˋㄐㄩˋ","ㄓㄨˇㄐㄩㄝˊ","ㄍㄢˇㄖㄣˊ","ㄓㄨㄟ ㄒㄧㄣ ","ㄇㄧㄥˊㄒㄧㄥˊ"]
    @Published var discussionMoviesShowsTranslation = ["to watch","to binge","movie","tv drama","protagonist","touching","to stan","celebrity"]
    
    @Published var discussionSchoolBPMF = ["ㄐㄧㄠ ","ㄐㄧㄠ ㄕㄨ ","ㄐㄧㄠˋㄕㄡˋ","ㄒㄩㄝˊㄑㄧˊ","ㄕㄨㄛˋㄕˋ","ㄕˊㄒㄧˊ","ㄋㄧㄢˊㄐㄧˊ","ㄉㄚˋㄒㄩㄝˊ","ㄍㄠ ㄓㄨㄥ ","ㄍㄨㄛˊㄓㄨㄥ ","ㄎㄜ ㄒㄩㄝˊ","ㄎㄜ ㄐㄧˋ","ㄒㄩㄝˊㄨㄟˋ","ㄧㄢˊㄐㄧㄡ ㄙㄨㄛˇ","ㄅㄛˊㄕˋ","ㄒㄧˋ","ㄑㄧˇㄧㄝˋㄍㄨㄢˇㄌㄧˇ"]
    @Published var discussionSchoolTranslation = ["to teach","to teach\n(in school)","professor","semester","master's degree","internship","grade\n(school)","university","highschool","middle school","science","technology","academic degree","graduate school","doctorate's","department\n(college)","business management"]
    
    @Published var discussionLivingSituationBPMF = ["ㄍㄨㄥ ㄩˋ","ㄎㄨㄥ ㄐㄧㄢˋ","ㄉㄨˊㄉㄨㄥˋ","ㄐㄧㄝ ㄈㄤ˙","ㄍㄠ ㄌㄡˊ","ㄐㄧㄢˋㄓㄨˋ","ㄕ ㄍㄨㄥ ","ㄔㄨㄢˊㄔㄥˊ"]
    @Published var discussionLivingSituationTranslation = ["apartment","space","single family\nhouse","neighborhood","highrise","buildings","carrying out\nconstruction","impart &\ninherit"]
    
    @Published var discussionHometownBPMF = ["ㄐㄧㄚ ㄒㄧㄤ ","ㄒㄩˋㄐㄧㄡˋ","ㄌㄧㄡˊㄌㄧㄢˋ"]
    @Published var discussionHometownTranslation = ["hometown","to reminisce\n(with someone)","to be reluctant\nto leave"]
    
    @Published var discussionBodyConditionBPMF = ["ㄕㄡˋㄕㄤ ","ㄧ ㄕㄥ ","ㄎㄢˋㄅㄧㄥˋ","ㄕㄥ ㄅㄧㄥˋ","ㄎㄜˊㄙㄡˋ","ㄅㄧㄥˋㄖㄣˊ","ㄓㄨㄥ ㄧ ","ㄓㄣ ㄐㄧㄡˇ","ㄐㄧㄣˋㄕˋ","ㄕ ㄇㄧㄢˊ","ㄑㄧˋㄔㄨㄢˇ","ㄐㄧㄢˇㄘㄜˋ","ㄋㄧㄢˊㄐㄧˋ","ㄘㄜˋ","ㄇㄚˊ"]
    @Published var discussionBodyConditionTranslation = ["to be hurt","doctor","visit a\ndoctor","to get sick","to cough","patient","chinese\nmedicine","acupuncture","nearsightedness","insomnia","asthma","examination\n(check for smth)","age","thorny feeling\n(leg)","leg falling\nasleep"]
    
    @Published var discussionDietBPMF = ["ㄧㄣˇㄕˊ","ㄧㄥˊㄧㄤˇ","ㄐㄧㄢˇㄕㄠˇ","ㄊㄢˋㄕㄨㄟˇㄏㄨㄚˋㄏㄜˊㄨˋ","ㄐㄧㄢˇㄈㄟˊ","ㄆㄤˋ","ㄕㄡˋ","ㄨㄟˊㄊㄚ ㄇㄧㄥˋ"]
    @Published var discussionDietTranslation = ["diet","nutritous","to reduce","carbohydrates","to reduce\nweight","fat","skinny","vitamin"]
    
    @Published var discussionWorkingOutBPMF = ["ㄐㄧㄢˋㄕㄣ ","ㄆㄠˇㄅㄨˋ","ㄧㄡˊㄩㄥˇ","ㄓㄨㄥˋㄒㄩㄣˋ","ㄐㄧㄢˋㄕㄣ ㄈㄤˊ","ㄐㄧㄢˇㄈㄟˊ"]
    @Published var discussionWorkingOutTranslation = ["to keep fit","to run","to swim","weight\ntraining","gym","to lose weight"]
    
    @Published var discussionSportsAndCompetitionBPMF = ["ㄉㄚˇㄌㄢˊㄑㄧㄡˊ","ㄉㄚˇㄅㄤˋㄑㄧㄡˊ","ㄊㄧ ㄗㄨˊㄑㄧㄡˊ","ㄍㄠ ㄦˇㄈㄨ ㄑㄧㄡˊ","ㄅㄧˇㄙㄞˋ","ㄉㄨㄟˋㄕㄡˇ"]
    @Published var discussionSportsAndCompetitionTranslation = ["basketball","baseball","soccer","golf","competition","opponent\ncompetitor"]
    
    @Published var discussionSocialMediaBPMF = ["ㄍㄨㄢ ㄓㄨˋ","ㄉㄧㄢˇㄗㄢˋ","ㄆㄧㄣˊㄉㄠˋ","ㄉㄧㄥˋㄩㄝˋ","ㄈㄥ ㄙㄨㄛˇ","ㄕㄤˋㄔㄨㄢˊ","ㄉㄨㄥˋㄊㄞˋ","ㄊㄧㄠˋ","ㄊㄨㄥ ㄓ ","ㄕˋㄒㄩㄣˋ","ㄉㄧㄠˋㄔㄚˊ","ㄧㄣˇㄘㄤˊ"]
    @Published var discussionSocialMediaTranslation = ["to follow","to like","channel","subscribe","to block","to upload\nto post","stories","to miss\n(notification)","notification","video chat","to survey\npoll","to hide"]
    
    @Published var discussionAmbienceBPMF = ["ㄖㄜˋㄋㄠˋ","ㄔㄠˇ","ㄢ ㄐㄧㄥˋ","ㄑㄧˋㄈㄣ "]
    @Published var discussionAmbienceTranslation = ["lively","loud","quiet","atmosphere"]
    
    @Published var discussionThePastBPMF = ["ㄑㄧ ㄐㄧㄢ ","ㄒㄩˋㄐㄧㄡˋ","ㄋㄚˋㄕˊㄏㄡˋ","ㄐㄧˋㄧˋ","ㄓㄠ ㄉㄞˋ"]
    @Published var discussionThePastTranslation = ["time period","to go over\nold days","that time","memory","to host\n(someone)"]
    
    @Published var discussionGovernmentBPMF = ["ㄓㄥˋㄓˋ","ㄗㄨㄥˇㄊㄨㄥˇ","ㄕㄜˋㄏㄨㄟˋ","ㄈㄚˇㄩㄢˋ","ㄈㄚˇㄌㄩˋ","ㄈㄢˋㄍㄨㄟ ","ㄊㄨㄥ ㄖㄨㄥˊ","ㄖㄣˊㄑㄩㄢˊ","ㄒㄩㄢˇㄐㄩˇ","ㄐㄧㄥ ㄐㄧˋ","ㄇㄠˋㄧˋ"]
    @Published var discussionGovernmentTranslation = ["government","president","society","court","law","to break\nthe rules","to bend\nthe rules","human rights","election","economy","trade;commerce"]
    
    @Published var discussionAccidentsBPMF = ["ㄔㄜ ㄏㄨㄛˋ","ㄨㄟ ㄒㄧㄢˇ","ㄒㄧㄢˋㄔㄤˇ","ㄓㄥˋㄖㄣˊ"]
    @Published var discussionAccidentsTranslation = ["accident","dangerous","on site","witness"]
    
    @Published var discussionDreamsBPMF = ["ㄗㄨㄛˋㄈㄥˋ","ㄜˋㄇㄥˋ","ㄏㄡˋㄌㄞˊ"]
    @Published var discussionDreamsTranslation = ["to dream","to have a\nnightmare","and then\n(talking about\nthe past)"]
    
    @Published var discussionMarriageBPMF = ["ㄏㄨㄣ ㄌㄧˇ","ㄒㄧˇㄧㄢˋ","ㄐㄧㄝˊㄏㄨㄣ ","ㄌㄧˊㄏㄨㄣ ","ㄏㄨㄞˊㄩㄣˋ"]
    @Published var discussionMarriageTranslation = ["wedding\nceremony","wedding\nbanquet","to get married","to get\na divorce","to be\npregnant"]
    
    @Published var discussionKidsBPMF = ["ㄏㄞˊㄗ˙","ㄨㄢˊㄐㄩˋ","ㄕㄡˇㄧㄡˊ","ㄌㄨㄢˋㄆㄠˇ","ㄆㄧㄣ ㄊㄨˊ","ㄆㄧㄣ ","ㄧㄥˊ","ㄕㄨ ","ㄕㄨ ㄐㄧㄚ˙","ㄧㄥˊㄇㄨˋ","ㄒㄧㄥˊㄨㄟˊ","ㄎㄤˋㄐㄩˋ","ㄔㄥˊㄈㄚˊ","ㄑㄧ ㄈㄨˋ","ㄇㄚˇㄏㄨˇ","ㄗㄨㄣ ㄓㄨㄥˋ","ㄑㄧㄤˇ","ㄇㄛˊㄈㄤˇ","ㄋㄞˇㄨㄟˋ"]
    @Published var discussionKidsTranslation = ["kids","toys","mobile game","to run\naround","jigsaw\npuzzle","to piece\ntogether","to win","to lose","loser","screen\n(tv/computer)","behavior","to resist","punishment","to bully","careless","to respect","to fight\nover","to imitate","milk smell\nbaby smell\ncat smell"]
    
    @Published var discussionFinanceBPMF = ["ㄓ ㄔㄨ ","ㄕㄡ ㄖㄨˋ","ㄉㄞˋㄎㄨㄢˇ","ㄏㄜˊㄈㄚˇ","ㄌㄧˋㄒㄧ ","ㄎㄨㄟ ㄑㄧㄢˋ","ㄇㄧㄢˇㄈㄟˋ","ㄕㄚ ㄐㄧㄚˋ","ㄌㄜˋㄊㄡˋ","ㄈㄚˊㄑㄧㄢˊ","ㄒㄧㄣ ㄕㄨㄟˇ","ㄈㄣ ㄑㄧ ","ㄨˋㄐㄧㄚˋ","ㄕㄥ ㄏㄨㄛˊㄈㄟˋ"]
    @Published var discussionFinanceTranslation = ["expense","income","loan","legal","interest","to owe","free","to bargain","lottery","to impose\na fine","salary","installments","price\n(commodities)","life expenses"]
    
    @Published var discussionInvestmentsBPMF = ["ㄌㄧˋㄖㄨㄣˋ","ㄍㄨˇㄆㄧㄠˋ"]
    @Published var discussionInvestmentsTranslation = ["profit","stocks"]
    
    @Published var discussionAstrologicalSignsBPMF = ["ㄒㄧㄥˋㄗㄨㄛˋ"]
    @Published var discussionAstrologicalSignsTranslation = ["astrological sign"]
    
    @Published var discussionChineseZodiacBPMF = ["ㄕㄡˇㄩˊ","ㄕˊㄦˋㄕㄥ ㄒㄧㄠˋ"]
    @Published var discussionChineseZodiacTranslation = ["to be part of\nto belong to","chinese zodiac"]
    
    
    //This is a list of vocabulary
    
    @Published var listColorsBPMF = ["ㄑㄧㄢˇ","ㄕㄣ ","ㄏㄟ ㄙㄜˋ","ㄅㄞˊㄙㄜˋ","ㄏㄨㄟ ㄙㄜˋ","ㄏㄨㄥˊㄙㄜˋ","ㄌㄢˊㄙㄜˋ","ㄌㄩˋㄙㄜˋ","ㄏㄨㄤˊㄙㄜˋ","ㄐㄩˊㄙㄜˋ","ㄈㄣ ㄏㄨㄥˊㄙㄜˋ","ㄘㄨㄥ ㄙㄜˋ"]
    @Published var listColorsTranslation = ["light\n(color)","deep\n(color)","black","white","grey","red","blue","green","yellow","orange","pink","brown"]
    
    @Published var listClothingBPMF = ["ㄧ ㄈㄨˊ","ㄎㄨˋㄗ˙","ㄒㄧ ㄓㄨㄤ ","ㄨㄞˋㄊㄠˋ","ㄨㄚ ㄗ˙","ㄒㄩㄝ ㄗ˙","ㄊㄨㄛ ㄒㄧㄝˊ","ㄍㄠ ㄍㄣ ㄒㄧㄝˊ","ㄔㄤˊㄒㄧㄡˋ","ㄉㄨㄢˇㄒㄧㄡˋ","ㄋㄟˋㄎㄨˋ","ㄋㄟˋㄧ ","ㄓˋㄍㄢˇ"]
    @Published var listClothingTranslation =  ["clothes","pants","western\nsuit","jacket","socks","boots","slippers","high\nheels","long sleeves","short sleeves","underwear","bra","texture"]
    
    @Published var listAccessoriesBPMF = ["ㄒㄧㄤˋㄌㄧㄢˋ","ㄕㄡˇㄌㄧㄢˋ","ㄧㄢˇㄐㄧㄥˋ","ㄧㄣˇㄒㄧㄥˊㄧㄢˇㄐㄧㄥˋ","ㄇㄠˋㄗ˙","ㄦˇㄏㄨㄢˊ"]
    @Published var listAccessoriesTranslation = ["necklace","bracelet","glasses","contact\nlense","hat","earring"]
    
    @Published var listEmotionsBPMF = ["ㄑㄧㄥˊㄒㄩˋ","ㄍㄠ ㄒㄧㄥˋ","ㄋㄢˊㄍㄨㄛˋ","ㄍㄢˇㄐㄧ ","ㄕㄥ ㄑㄧˋ","ㄎㄨㄣˋㄏㄨㄛˋ","ㄕㄨ ㄈㄨ","ㄍㄨ ㄉㄢ ","ㄖㄜˋㄒㄧㄣ ","ㄕㄨㄤˇ","ㄉㄨˇㄌㄢˋ","ㄒㄧㄣ ㄊㄥˊ","ㄋㄢˊㄕㄡˋ","ㄇㄠˊㄉㄨㄣˋ","ㄖㄨㄢˇㄌㄢˋ","ㄒㄧㄢˋㄇㄨˋ","ㄐㄧˊㄉㄨˋ"]
    @Published var listEmotionsTranslation = ["emotions","happy","sad","grateful","angry","confused","comfortable","lonely","enthusiastic","to feel\ngood","ticked off","To feel\nsorry","uneasy","conflicted","lacking drive","envy","jealous\n(bad way)"]
    
    @Published var listPersonalityTraitsBPMF = ["ㄋㄟˋㄒㄧㄤˋ","ㄨㄞˋㄒㄧㄤˋ","ㄊㄧㄢ ㄓㄣ ","ㄌㄜˋㄍㄨㄢ ","ㄅㄟ ㄍㄨㄢ ","ㄎㄞ ㄈㄤˋ","ㄧㄡ ㄇㄛˋ","ㄌㄠˇㄍㄨˇㄉㄨㄥˇ","ㄗˋㄙ ","ㄗˋㄌㄧㄢˋ","ㄊㄧˇㄊㄧㄝ ","ㄧㄝˋㄇㄠ ㄗ˙","ㄅㄠˇㄕㄡˇ","ㄞˋㄒㄧㄢˋ","ㄎㄜˇㄎㄠˋ","ㄏㄠˇㄒㄧㄤ ㄔㄨˇ","ㄉㄨˊㄌㄧˋ","ㄌㄧˇㄓˋ","ㄧㄡˋㄓˋ","ㄌㄧㄥˊㄏㄨㄛˊ","ㄧㄡˇㄕㄢˋ","ㄊㄧㄝ ㄒㄧㄣ ","ㄉㄧ ㄉㄧㄠˋ","ㄍㄠ ㄉㄧㄠˋ"]
    @Published var listPersonalityTraitsTranslation = ["introvert","extrovert","innocent","optimistic","pessimistic","open\nminded","humorous","old-fashioned","selfish","narcissistic","considerate","night owl","conservative","to enjoy\nshowing off","dependable\nreliable","easygoing\neasy to get along","independent","rational","naive","flexible","hospitable","thoughtful","low-key","high-key"]
    
    @Published var listHouseholdKitchenItemsBPMF = ["ㄎㄨㄞˋㄗ˙","ㄔㄚ ㄗ˙","ㄊㄤ ㄔˊ","ㄆㄢˊㄗ˙","ㄉㄠ ㄗ˙","ㄒㄧ ㄍㄨㄢˇ","ㄓˇㄐㄧㄣ ","ㄌㄨˊㄗ˙","ㄅㄧㄥ ㄒㄧㄤ "]
    @Published var listHouseholdKitchenItemsTranslation = ["chopstick","fork","soup spoon","plate","knife","straw","napkin","stove","fridge"]
    
    @Published var listHouseholdBedroomItemsBPMF = ["ㄓㄣˇㄊㄡ˙","ㄊㄢˇㄗ˙","ㄔㄨㄤˊ","ㄔㄡ ㄊㄧ˙","ㄐㄧㄥˋㄗ˙","ㄧㄣ ㄒㄧㄤ ","ㄉㄧˋㄊㄢˇ","ㄈㄥ ㄕㄢˋ","ㄒㄧㄤ ㄕㄨㄟˇ","ㄌㄢˊㄗ˙","ㄏㄨㄚˋㄓㄨㄤ ㄆㄧㄣˇ","ㄇㄧㄢˋㄇㄛˊ","ㄎㄨㄥ ㄐㄧㄢˋ"]
    @Published var listHouseholdBedroomItemsTranslation = ["pillow","blanket","bed","drawer","mirror","speakers","carpet\nrug","electric\nfan","perfume","basket","makeup","facial mask","space"]
    
    @Published var listHouseholdBathroomItemsBPMF = ["ㄘㄜˋㄙㄨㄛˇ","ㄨㄟˋㄩˋ","ㄧㄚˊㄍㄠ ","ㄈㄟ ㄗㄠˋ","ㄇㄠˊㄐㄧㄣ ","ㄕㄨ ㄗ˙","ㄔㄨˊㄕ ㄐㄧ "]
    @Published var listHouseholdBathroomItemsTranslation = ["bathroom\n(w/o shower)","bathroom\n(w/ shower)","toothpaste","soap","towel","comb","dehumidifier"]
    
    @Published var listMeasureWordsBPMF = ["ㄌㄧㄤˋㄘˊ","ㄧㄤˋ","ㄐㄧˊ","ㄊㄧㄠˊ","ㄨㄟˋ","ㄇㄧㄢˋ","ㄊㄞˊ","ㄐㄧㄢˋ","ㄓㄤ ","ㄑㄩㄢ ","ㄎㄨㄞˋ","ㄎㄜ ","ㄎㄜ ","ㄊㄤˊ","ㄎㄨㄢˇ","ㄊㄠˋ","ㄆㄧㄢˋ","ㄔㄥˊ","ㄎㄜˋ","ㄘㄥˊ"]
    @Published var listMeasureWordsTranslation = ["measure word","kinds","episodes","long & thins","seats","flat\nsurfaces","vehicles\nmachines","clothes","flats","loops\nlaps","money","plants\ntrees","round","classes","types of\nproducts","sets","pieces","steak\ndone-ness\n(1-10,3=rare)","grams","floors"]
    
    @Published var listAdverbBPMF = ["ㄇㄚˇㄕㄤˋ","ㄌㄧˋㄎㄜˋ","ㄅㄨˋㄍㄢˇ","ㄐㄧˇㄓㄜ˙","ㄔㄨㄥ ㄈㄣˋ","ㄧ ㄉㄨㄟ ","ㄅㄨˋㄉㄨㄢˋ","ㄇㄢˇ","ㄍㄜˋㄓㄨㄥˇ","ㄐㄧ ㄏㄨ ","ㄅㄞˊ","ㄨㄟˊㄧ ","ㄑㄧˊㄓㄨㄥ ","ㄉㄤ ㄓㄨㄥ ","ㄗㄨㄥˇㄕˋ","ㄌㄠˇㄕ˙","ㄐㄩㄝˊㄉㄨㄟˋ","ㄕㄠ ㄨㄟ ","ㄍㄤ ㄏㄠˇ","ㄅㄧㄥˋㄅㄨˋ","ㄖㄣˋㄏㄜˊ","ㄊㄡ ㄊㄡ ","ㄕㄨㄣˋㄅㄧㄢˋ","ㄕㄨㄣˋㄌㄧˋ"]
    @Published var listAdverbTranslation = ["immediately","faster than\nimmediately","not dare to","hurriedly","as much as\npossible","a bunch","not stopping","quite","every kind","almost","in vain","only(sole)","among them","among them\n(location)","always","always\n(negative)","absolutely","slightly","just about time","not at all","any","sneakily","without making\nextra effort","smoothly"]
    
    @Published var listAdjectivesBPMF = ["ㄓㄥˋㄇㄧㄢˋ","ㄈㄨˋㄇㄧㄢˋ","ㄊㄜˋㄕㄨ ","ㄆㄨˇㄅㄧㄢˋ","ㄨㄢˊㄇㄟˇ","ㄗㄠ ㄍㄠ ","ㄓㄣ ㄓㄥˋ","ㄇㄛˊㄏㄨ˙","ㄍㄜˋㄖㄣˊ","ㄅㄟ ㄅㄧˇ","ㄒㄧㄥˋㄩㄣˋ","ㄕˋㄉㄨˋ","ㄐㄧㄢˇㄉㄨㄢˇ"]
    @Published var listAdjectivesTranslation = ["positive","negative","special\nuncommon","common\nwidespread","perfect","worse","real;true","ambiguous\nblurry","personal(things)","morally wrong","lucky","appropriate\nmoderate\nnot to little/much","brief\nnot long"]
    
    @Published var listMaterialsBPMF = ["ㄅㄛ ㄌㄧˊ","ㄊㄨㄥˊ","ㄇㄨˋ","ㄙㄨˋㄐㄧㄠ ","ㄐㄧㄣ ","ㄧㄣˊ"]
    @Published var listMaterialsTranslation = ["glass","copper","wood","plastic","gold","silver"]
    
    @Published var listElectronicsBPMF = ["ㄐㄧㄢˋㄆㄢˊ","ㄏㄨㄚˊㄕㄨˇ","ㄕㄡˇㄐㄧ ","ㄉㄧㄢˋㄋㄠˇ","ㄉㄧㄢˋㄕˋ","ㄦˇㄐㄧ ","ㄋㄧㄡˇ"]
    @Published var listElectronicsTranslation = ["keyboard","mouse","phone","computer","television","earphones","button\n(can be pressed)"]
    
    @Published var listPhysicalDescriptionBPMF = ["ㄓㄞˇ","ㄎㄨㄢ ","ㄨㄞ ","ㄅㄧㄢˇ","ㄖㄡˊㄖㄨㄣˋ","ㄒㄩ ㄖㄨㄛˋ",]
    @Published var listPhysicalDescriptionTranslation = ["narrow","wide","slanted","flat","soft & smooth","weak"]
    
    @Published var listSeasonsBPMF = ["ㄐㄧˋㄐㄧㄝˊ","ㄔㄨㄣ ㄊㄧㄢ ","ㄒㄧㄚˋㄊㄧㄢ ","ㄑㄧㄡ ㄊㄧㄢ ","ㄉㄨㄥ ㄊㄧㄢ "]
    @Published var listSeasonsTranslation = ["season","spring","summer","autumn","winter"]
    
    @Published var listAlcoholBPMF = ["ㄨㄟ ㄕˋㄐㄧˋ","ㄈㄨˊㄊㄜˋㄐㄧㄚ ","ㄆㄨˊㄊㄠ˙ㄐㄧㄡˇ","ㄌㄢˊㄈㄨˇㄐㄧㄡˇ","ㄆㄧˊㄐㄧㄡˇ",]
    @Published var listAlcoholTranslation = ["whiskey","vodka","wine","rum","beer",]
    
    @Published var listNaturalDisasterBPMF = ["ㄊㄞˊㄈㄥ ","ㄉㄧˋㄓㄣˋ","ㄏㄨㄛˇㄗㄞ "]
    @Published var listNaturalDisasterTranslation = ["typhoon","earthquake","fire"]
    
    @Published var listAnimalsBPMF = ["ㄋㄧㄡˇ","ㄓㄨ ","ㄧㄤˊ","ㄐㄧ ","ㄩˊ","ㄧㄚ ㄗ˙","ㄔㄨㄥˊㄗ˙","ㄉㄚˋㄒㄧㄥ ㄒㄧㄥ˙","ㄏㄞˇㄅㄠˋ","ㄌㄩˊ","ㄌㄧㄝˋㄍㄡˇ"]
    @Published var listAnimalsTranslation = ["cow","pig","lamb","chicken","fish","duck","insects","gorilla","seal","donkey","hyena"]
    
    @Published var listLocationsBPMF = ["ㄉㄠˋㄔㄨˇ","ㄕˋㄓㄨㄥ ㄒㄧㄣ ","ㄒㄧㄤ ㄒㄧㄚˋ","ㄒㄧㄤ ㄘㄨㄣ ","ㄒㄧㄠˇㄓㄣˋ","ㄕㄚ ㄇㄛˋ"]
    @Published var listLocationsTranslation = ["everywhere","downtown","countryside","village","lively town\nin a quiet\nplace","desert"]
    
    @Published var listExteriorBodyPartsBPMF = ["ㄕㄣ ㄊㄧˇ","ㄓㄥ ㄊㄧˇ","ㄜˊㄊㄡˊ","ㄇㄟˊㄇㄠˊ","ㄐㄧㄝˊㄇㄠˊ","ㄌㄧㄢˇㄐㄧㄚˊ","ㄔㄨㄣˊ","ㄒㄧㄚˋㄅㄚ˙","ㄅㄛˊㄗ˙","ㄅㄟˋ","ㄐㄧㄢ ㄅㄤˇ","ㄒㄩㄥ ㄎㄡˇ","ㄕㄡˇㄅㄧˋ","ㄕㄡˇㄓㄡˇ","ㄕㄡˇㄨㄢˋ","ㄕㄡˇㄓˇㄐㄧㄚ˙","ㄊㄨㄟˇ","ㄉㄚˋㄊㄨㄟˇ","ㄒㄧㄠˇㄊㄨㄟˇ","ㄐㄧㄠˇㄏㄨㄞˊ","ㄐㄧㄠˇ","ㄐㄧㄠˇㄐㄧㄢ ","ㄐㄧㄠˇㄅㄟˋ","ㄌㄨㄛˇㄊㄧˇ","ㄈㄨ ㄙㄜˋ","ㄊㄡˊㄆㄧˊ","ㄨㄟˇㄅㄚ˙"]
    @Published var listExteriorBodyPartsTranslation = ["body","limbs","forehead","eyebrows","eyelash","cheeks","lip","chin","neck","back","shoulder","chest","arms\n(w/ hands)","elbow","wrist","fingernail","leg","thigh","lower leg","ankle","feet","tip of toe","top of foot","nakedness","skin color","scalp","tail"]
    
    @Published var listInteriorBodyPartsBPMF = ["ㄒㄧㄝˇ","ㄍㄨˇㄊㄡ˙","ㄊㄨㄛˋㄧㄝˋ","ㄐㄧ ㄖㄡˋ","ㄦˋㄊㄡˊㄐㄧ ","ㄅㄧˊㄍㄡˋ"]
    @Published var listInteriorBodyPartsTranslation = ["blood","bone","saliva\nspit","muscle","biceps","boogers"]
    
    @Published var listPersonalCharacteristicsBPMF = ["ㄏㄠˇㄧˋ","ㄜˋㄧˋ","ㄩㄥˇㄑㄧˋ","ㄑㄧㄢˊㄌㄧˋ"]
    @Published var listPersonalCharacteristicsTranslation = ["kindness","ill intention","courage","potential"]
    
    @Published var listMedicineBPMF = ["ㄓˇㄊㄨㄥˋㄧㄠˋ","ㄩㄣ ㄔㄜ ㄧㄠˋ","ㄩㄣ ㄐㄧ ㄧㄠˋ","ㄩㄣ ㄔㄨㄢˊㄧㄠˋ","ㄅㄧㄥ ㄈㄨ "]
    @Published var listMedicineTranslation = ["painkiller","motion sickness\nmedicine (car)","motion sickness\nmedicine (plane)","motion sickness\nmedicine (boat)","ice packs"]
    
    @Published var listFruitBPMF = ["ㄆㄧㄥˊㄍㄨㄛˇ","ㄔㄥˊㄗ˙","ㄘㄠˇㄇㄟˊ","ㄇㄤˊㄍㄨㄛˇ","ㄧㄥ ㄊㄠˊ","ㄌㄢˊㄇㄟˊ","ㄒㄧ ㄍㄨㄚ ","ㄈㄢ ㄑㄧㄝˊ","ㄆㄨˊㄊㄠˊ","ㄌㄧㄡˊㄌㄧㄢˊ","ㄩˋㄏㄜˊㄅㄠ "]
    @Published var listFruitTranslation = ["apple","orange","strawberry","mango","cherry","blueberry","watermelon","tomato","grape","durian","lychee"]
    
    @Published var listFoodBPMF = ["ㄕˊㄨˋ","ㄓㄨˇㄕˊ","ㄑㄧㄢ ㄘㄥˊㄇㄧㄢˋ"]
    @Published var listFoodTranslation = ["food","staple food","lasagna"]
    
    @Published var listSeafoodBPMF = ["ㄍㄨㄟ ㄩˊ","ㄨㄟˇㄩˊ","ㄓㄤ ㄩˊ","ㄒㄧㄚ ㄗ˙","ㄩˊㄨㄢˊ"]
    @Published var listSeafoodTranslation = ["salmon","tuna","octopus","shrimp","fish\nball"]
    
    @Published var listVegetableBPMF = ["ㄒㄧㄤ ㄍㄨ ","ㄅㄛ ㄘㄞˋ","ㄕㄨㄟˋㄌㄧㄢˊ","ㄈㄢ ㄑㄧㄝˊ","ㄧㄤˊㄘㄨㄥ ","ㄒㄧㄤ ㄘㄞˋ"]
    @Published var listVegetableTranslation = ["mushroom","spinach","snowflake\nstem","tomato","onion","corriander"]
    
    @Published var listDessertBPMF = ["ㄒㄧㄢ ㄘㄠˇ","ㄒㄧㄥˋㄖㄣˊ","ㄨㄟˋㄘㄥ ","ㄅㄨˋㄌㄤˇㄋㄧˊ","ㄖㄨˇㄌㄨㄛˋㄉㄢˋㄍㄠ ","ㄇㄚˇㄈㄣ ","ㄉㄡˋㄏㄨㄚ "]
    @Published var listDessertTranslation = ["grass jelly","almond","miso","brownie","cheese cake","muffin","silk tofu"]
    
    @Published var listNutsBPMF = ["ㄏㄨㄚ ㄕㄥ ","ㄓ ㄇㄚ˙"]
    @Published var listNutsTranslation = ["peanut","sesame"]
    
    @Published var listOccupationBPMF = ["ㄐㄧㄥˇㄔㄚ ","ㄒㄧㄠ ㄈㄤˊㄩㄢˊ","ㄕㄡˋㄧ ","ㄐㄩㄣ ㄉㄨㄟˋ","ㄕㄥ ㄧˋ","ㄧㄢˊㄐㄧㄡ ㄕㄥ ","ㄩㄥˋㄖㄣˊ","ㄧㄢˊㄐㄧㄡ ㄕㄥ ","ㄐㄧㄠˋㄕ ","ㄓㄨㄥˋㄊㄧㄢˊㄖㄣˊ"]
    @Published var listOccupationTranslation = ["police","firefighter","vet.","military","business","graduate\nstudent","servant\nmaid","postgrad\nstudent","instructor\nteacher","farmer"]
    
    @Published var listFamilyBPMF = ["ㄦˊㄊㄨㄥˊ","ㄓˊㄗ˙","ㄓˊㄋㄩˇ","ㄒㄧㄠˋㄕㄨㄣˋ","ㄌㄠˇㄆㄛˊ","ㄌㄠˇㄍㄨㄥ ","ㄚ ㄍㄨㄥ ","ㄚ ㄇㄚˊ","ㄨㄞˋㄕㄥ ㄋㄩˇ","ㄨㄞˋㄕㄥ ","ㄅㄧㄠˇ","ㄊㄤˊ"]
    @Published var listFamilyTranslation = ["children\n(young)","nephew\n(brother's)","niece\n(brother's)","filial","wife","husband","grandpa","grandma","niece\n(sister's)","nephew\n(brother's)","cousin\n(mom's side)","cousin\n(dad's side)"]
    
    @Published var listHolidaysBPMF = ["ㄐㄧㄝˊㄖˋ","ㄉㄨㄢ ㄨˇㄐㄧㄝˊ","ㄓㄨㄥ ㄩㄢˊㄐㄧㄝˊ","ㄐㄧˊㄒㄧㄤˊㄏㄨㄚˋ"]
    @Published var listHolidaysTranslation = ["holiday","dragon boat","ghost festival","sayings during\nspecial times"]
    
    @Published var listContinentsBPMF = ["ㄋㄢˊㄇㄟˇ","ㄇㄟˇㄓㄡ ","ㄡ ㄓㄡ ","ㄋㄢˊㄐㄧˊㄓㄡ ","ㄧㄚˋㄓㄡ ","ㄈㄟ ㄓㄡ ","ㄠˋㄓㄡ "]
    @Published var listContinentsTranslation = ["south\namerica","americas","europe","antarctica","asia","africa","australia"]
    
    @Published var listCountriesBPMF = ["ㄒㄧ ㄅㄢ ㄧㄚˊ","ㄉㄜˊㄍㄨㄛˊ","ㄐㄧㄚ ㄋㄚˊㄉㄚˋ","ㄇㄛˋㄒㄧ ㄍㄜ ","ㄜˊㄌㄨㄛˊㄙ ","ㄒㄧㄣ ㄐㄧㄚ ㄆㄛ ","ㄇㄚˇㄌㄞˊㄒㄧ ㄧㄚˋ","ㄩㄝˋㄋㄢˊ","ㄖˋㄅㄣˇ"]
    @Published var listCountriesTranslation = ["spain","germany","canada","mexico","russia","singapore","malaysia","vietnam","japan"]
    
    @Published var listUSStatesBPMF = ["ㄋㄟˋㄏㄨㄚˊㄉㄚˊ","ㄐㄧㄚ ㄓㄡ "]
    @Published var listUSStatesTranslation = ["nevada","california"]
    
    @Published var listUSCitiesBPMF = ["ㄌㄟˊㄋㄨㄛˋ","ㄌㄚ ㄙ ㄨㄟˊㄐㄧㄚ ㄙ "]
    @Published var listUSCitiesTranslation = ["reno","las vegas"]
    
    @Published var listChengYuBPMF = ["ㄧㄥˋㄓㄜ˙ㄊㄡˊㄆㄧˊ","ㄦˇㄖㄨˊㄇㄨˋㄖㄢˇ","ㄅㄧㄣ ㄓˋㄖㄨˊㄍㄨㄟ ","ㄏㄨㄚˋㄕㄜˊㄊㄧㄢ ㄗㄨˊ"]
    @Published var listChengYuTranslation = ["to force\noneself","to be influence\nand don't\nnotice","home away\nfrom home","ruin the effect\nby doing too much"]
    
    @Published var listSayingsBPMF = ["ㄖㄜˋㄌㄧㄢˇㄊㄧㄝ ㄌㄥˇㄆㄧˋㄍㄨ˙","ㄊㄨㄛ ㄎㄨˋㄗ˙ㄈㄤˋㄆㄧˋ","ㄨㄣˊㄉㄢˋ","ㄧ ㄈㄣ ㄍㄥ ㄩㄣˊㄧ ㄈㄣ ㄕㄡ ㄏㄨㄛˋ","ㄧ ㄧㄢˊㄨㄟˊㄉㄧㄥˋ","ㄧ ㄇㄛˊㄧ ㄧㄤˋ","ㄅㄨˋㄍㄢˇㄒㄧㄤˋㄒㄧㄣ "]
    @Published var listSayingsTranslation = ["to show \nfeelings and\nbe dejected","to make\nthings too\ncomplicated","to be done for","you reap what\nyou sow","it's settled\nthen","exactly the\nsame","i can't\nbelieve..."]
    
    @Published var grammarAddEmotionBPMF = ["ㄉㄠˋㄉㄧˇ","ㄍㄟˇㄨㄛˇ","ㄌㄧㄢˊ"]
    @Published var grammarAddEmotionTranslation = ["to add emphasis\non questions\n(negative)","strengthen\nthe\nimperative","even...\n(good or bad)"]
    
    @Published var grammarTimeWordsBPMF = ["ㄕㄡˇㄒㄧㄢ ","ㄓㄥˋㄧㄠˋ","ㄘㄥˊㄐㄧㄥ ","ㄧ ㄉㄢˋ","ㄧ ㄅㄟˋㄗ˙","ㄨㄟˊㄓˇ","ㄇㄨˋㄑㄧㄢ ","ㄨㄟˋㄌㄞˊ","ㄐㄧㄤ ㄌㄞˊ","ㄗㄨㄥˇㄧㄡˇ","ㄊㄨㄥ ㄒㄧㄠ ","ㄧ ㄓㄣ ㄗ˙","ㄔㄤˊㄑㄧ ","ㄧ ㄕㄨㄣˋ","ㄅㄢˋㄧㄝˋ","ㄌㄧㄥˊㄔㄣˊ"]
    @Published var grammarTimeWordsTranslation = ["first of all","just about to","to use to\nonce existed","once...happens","all one's life","up to; until","at the\npresent","in the future","in the near future","inevitably\nthere\nwill be","all night","a while","for a\nlong time","in a flash","midnight","late\nmidnight"]
    
    @Published var grammarSentenceConnectionsBPMF = ["ㄩˇㄑㄧˊㄅㄨˋㄖㄨˊ","ㄋㄧㄥˋㄩㄢˋ","ㄓˇㄧㄡˇㄘㄞˊ","ㄓˇㄧㄠˋㄐㄧㄡˋ","ㄊㄡˋㄍㄨㄛˋ","ㄕㄨㄛ ㄉㄠˋ"]
    @Published var grammarSentenceConnectionsTranslation = ["rather than...\nbetter to","would you\nrather...","only if\n(situation) happens...\n(situation) will\nhappen","as long as\n(situation) happens\n(situation) should\nhappen","through (situation)\n(situation) happens;\nby the means of","speaking of..."]
    
    @Published var grammarResultComplimentsBPMF = ["ㄗㄨㄛˇㄧㄡˋ","ㄧˇㄕㄤˋ","ㄉㄠˋ","ㄐㄧㄢˋ","ㄉㄨㄥˇ","ㄍㄨㄛˋ","ㄏㄠˇ","ㄨㄢˊ","ㄍㄨㄤ ","ㄘㄨㄛˋ","ㄍㄢˇㄐㄧㄥ ","ㄗㄡˇ","ㄉㄧㄠˋ","ㄉㄠˇ","ㄏㄨㄟˋ"]
    @Published var grammarResultComplimentsTranslation = ["approximately\na number","more than\na number","result obtained\nfrom an action","result obtained\nfrom an action\n(only senses)","understood\n(only senses)","experienced","done well\nand finished","finished","subject is\nall gone","mistaken","subject is cleaned","subject went away","subject is gone","subject fell","subject is mastered"]
}

struct Vocabulary: View {
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var pronunciationTextMode : Bool
    @Binding var pronunciationVoiceMode : Bool
    @Binding var voiceSelection : String
    @Binding var timerValue: Double
    @Binding var testModeSelection: String
    @Binding var testType: String
    
    @ObservedObject var vocabularyList = VocabularyList()
    @State var vocabularyTranslation = [""]
    @State var vocabularyBPMF = [""]
    @State var topic = "basics"
    let topics = ["basics","when you are...","specific scenarios","discussion topics","lists","grammar"]
    
    let previewText = "preview "
    @State var previewID = ""
    
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }

    var teal = Color(red: 49 / 255, green: 163 / 255, blue: 159 / 255)
    
    var body: some View {
        VStack{
            VStack{
                Text("Topic Selection")
                    .multilineTextAlignment(.center)
                    .font(.custom("copperplate",size: 25))
                Picker("Style", selection: $topic) {
                    ForEach(topics, id: \.self) {
                        Text($0)
                            .padding()
                            .font(.custom("copperplate",size: 20))
                    }
                }
                .pickerStyle(InlinePickerStyle())
                .padding()
                .frame(minWidth: screenWidth,maxHeight:screenHeight/5)
            }.frame(maxWidth:screenWidth)
            
            
            // If the picker is basic
            Group{
                ScrollView{
                    
                    if(topic == "basics"){
                        VStack{
                            VStack{
                                Button("frequent words"){
                                    vocabularyBPMF = self.vocabularyList.basicsChineseBPMF
                                    vocabularyTranslation = self.vocabularyList.basicsChineseTranslation
                                    previewID = previewText + "frequently used words"
                                }.padding()
                                
                                Button("numbers"){
                                    vocabularyBPMF = self.vocabularyList.basicsNumbersBPMF
                                    vocabularyTranslation = self.vocabularyList.basicsNumbersTranslation
                                    previewID = previewText + "numbers"
                                }.padding()
                                
                                Button("introduction"){
                                    vocabularyBPMF = self.vocabularyList.basicsIntroducingYourselfBPMF
                                    vocabularyTranslation = self.vocabularyList.basicsIntroducingYourselfTranslation
                                    previewID = previewText + "introduction"
                                }.padding()
                                
                                Button("saying hello"){
                                    vocabularyBPMF = self.vocabularyList.basicsSayingHelloBPMF
                                    vocabularyTranslation = self.vocabularyList.basicsSayingHelloTranslation
                                    previewID = previewText + "saying hello"
                                }.padding()
                                
                                Button("things"){
                                    vocabularyBPMF = self.vocabularyList.basicsThingsBPMF
                                    vocabularyTranslation = self.vocabularyList.basicsThingsTranslation
                                    previewID = previewText + "introduction"
                                }.padding()
                                
                                Button("interjections"){
                                    vocabularyBPMF = self.vocabularyList.basicsInterjectionsBPMF
                                    vocabularyTranslation = self.vocabularyList.basicsInterjectionsTranslation
                                    previewID = previewText + "interjections"
                                }.padding()
                                
                                Button("opinions"){
                                    vocabularyBPMF = self.vocabularyList.basicsOpinionsBPMF
                                    vocabularyTranslation = self.vocabularyList.basicsOpinionTranslation
                                    previewID = previewText + "opinions"
                                }.padding()
                                
                                Button("personal favorites"){
                                    vocabularyBPMF = self.vocabularyList.basicsPersonalFavoritesBPMF
                                    vocabularyTranslation = self.vocabularyList.basicsPersonalFavoritesTranslation
                                    previewID = previewText + "personal favorites"
                                }.padding()
                                
                            }
                        }
                    }
                    if(topic == "when you are..."){
                        VStack{
                            VStack{
                                Button("learning languages"){
                                    vocabularyBPMF = self.vocabularyList.topicLanguageLearningBPMF
                                    vocabularyTranslation = self.vocabularyList.topicLanguageLearningTranslation
                                    previewID = previewText + "learning languages"
                                }.padding()
                                
                                Button("language exchanging"){
                                    vocabularyBPMF = self.vocabularyList.topicLanguageExchangeBPMF
                                    vocabularyTranslation = self.vocabularyList.topicLanguageExchangeTranslation
                                    previewID = previewText + "language exchanging"
                                }.padding()
                                
                                Button("needing directions"){
                                    vocabularyBPMF = self.vocabularyList.topicDirectionsBPMF
                                    vocabularyTranslation = self.vocabularyList.topicDirectionsTranslation
                                    previewID = previewText + "needing directions"
                                }.padding()
                                
                                Button("asking for help"){
                                    vocabularyBPMF = self.vocabularyList.topicAskingForHelpBPMF
                                    vocabularyTranslation = self.vocabularyList.topicAskingForHelpTranslation
                                    previewID = previewText + "asking for help"
                                }.padding()
                                
                                Button("shopping"){
                                    vocabularyBPMF = self.vocabularyList.topicShoppingBPMF
                                    vocabularyTranslation = self.vocabularyList.topicShoppingTranslation
                                    previewID = previewText + "shopping"
                                }.padding()
                                
                                Button("taking MRT"){
                                    vocabularyBPMF = self.vocabularyList.topicMRTBPMF
                                    vocabularyTranslation = self.vocabularyList.topicMRTTranslation
                                    previewID = previewText + "MRT"
                                }.padding()
                                
                                Button("at work"){
                                    vocabularyBPMF = self.vocabularyList.topicWorkingBPMF
                                    vocabularyTranslation = self.vocabularyList.topicWorkingTranslation
                                    previewID = previewText + "working"
                                }.padding()
                                
                                Button("at a office job"){
                                    vocabularyBPMF = self.vocabularyList.topicOfficeJobBPMF
                                    vocabularyTranslation = self.vocabularyList.topicOfficeJobTranslation
                                    previewID = previewText + "office job"
                                }.padding()
                                
                                Button("driving"){
                                    vocabularyBPMF = self.vocabularyList.topicDrivingOnRoadBPMF
                                    vocabularyTranslation = self.vocabularyList.topicDrivingOnRoadTranslation
                                    previewID = previewText + "driving"
                                }.padding()
                            }
                            VStack{
                                Button("apologizing"){
                                    vocabularyBPMF = self.vocabularyList.topicApologizingBPMF
                                    vocabularyTranslation = self.vocabularyList.topicApologizingTranslation
                                    previewID = previewText + "apologizing"
                                }.padding()
                                
                                Button("complaining"){
                                    vocabularyBPMF = self.vocabularyList.topicComplainingBPMF
                                    vocabularyTranslation = self.vocabularyList.topicComplainingTranslation
                                    previewID = previewText + "complaining"
                                }.padding()
                                
                                Button("arguing"){
                                    vocabularyBPMF = self.vocabularyList.topicArguingBPMF
                                    vocabularyTranslation = self.vocabularyList.topicArguingTranslation
                                    previewID = previewText + "arguing"
                                }.padding()
                                
                                Button("explaining your perspective"){
                                    vocabularyBPMF = self.vocabularyList.topicExplainingYourPerspectiveBPMF
                                    vocabularyTranslation = self.vocabularyList.topicExplainingYourPerspectiveTranslation
                                    previewID = previewText + "explaining"
                                }.padding()
                                
                                Button("in chinese new year"){
                                    vocabularyBPMF = self.vocabularyList.topicChineseNewYearBPMF
                                    vocabularyTranslation = self.vocabularyList.topicChineseNewYearTranslation
                                    previewID = previewText + "chinese new year"
                                }.padding()
                                
                                Button("remarks & reactions"){
                                    vocabularyBPMF = self.vocabularyList.topicRemarksReactionsBPMF
                                    vocabularyTranslation = self.vocabularyList.topicRemarksReactionsTranslation
                                    previewID = previewText + "remarks & reactions"
                                }.padding()
                                
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
                                    previewID = previewText + "\nrunning out of battery"
                                }.padding()
                                
                                Button("ordering drinks"){
                                    vocabularyBPMF = self.vocabularyList.scenarioOrderingDrinksBPMF
                                    vocabularyTranslation = self.vocabularyList.scenarioOrderingDrinksTranslation
                                    previewID = previewText + "ordering drinks"
                                }.padding()
                                
                                Button("getting gas"){
                                    vocabularyBPMF = self.vocabularyList.scenarioGettingGasBPMF
                                    vocabularyTranslation = self.vocabularyList.scenarioGettingGasTranslation
                                    previewID = previewText + "getting gas"
                                }.padding()
                                
                                Button("at restaurants"){
                                    vocabularyBPMF = self.vocabularyList.scenarioRestaurantBPMF
                                    vocabularyTranslation = self.vocabularyList.scenarioRestaurantTranslation
                                    previewID = previewText + "at restaurants"
                                }.padding()
                                
                                Button("conveyor sushi"){
                                    vocabularyBPMF = self.vocabularyList.scenarioConveyorSushiBPMF
                                    vocabularyTranslation = self.vocabularyList.scenarioConveyorSushiTranslation
                                    previewID = previewText + "conveyor sushi"
                                }.padding()
                                
                                Button("on the phone"){
                                    vocabularyBPMF = self.vocabularyList.scenarioOnThePhoneBPMF
                                    vocabularyTranslation = self.vocabularyList.scenarioOnThePhoneTranslation
                                    previewID = previewText + "on the phone"
                                }.padding()
                                
                                Button("drinking"){
                                    vocabularyBPMF = self.vocabularyList.scenarioDrinkingBPMF
                                    vocabularyTranslation = self.vocabularyList.scenarioDrinkingTranslation
                                    previewID = previewText + "drinking"
                                }.padding()
                                
                                Button("wearing clothes"){
                                    vocabularyBPMF = self.vocabularyList.scenarioWearingClothesBPMF
                                    vocabularyTranslation = self.vocabularyList.scenarioWearingClothesTranslation
                                    previewID = previewText + "wearing clothes"
                                }.padding()
                                
                                Button("focused"){
                                    vocabularyBPMF = self.vocabularyList.scenarioFocusedBPMF
                                    vocabularyTranslation = self.vocabularyList.scenarioFocusedTranslation
                                    previewID = previewText + "focused"
                                }.padding()
                                
                                Button("cooking"){
                                    vocabularyBPMF = self.vocabularyList.scenarioCookingBPMF
                                    vocabularyTranslation = self.vocabularyList.scenarioCookingTranslation
                                    previewID = previewText + "cooking"
                                }.padding()
                                
                            }
                            
                            VStack{
                                Button("haircut"){
                                    vocabularyBPMF = self.vocabularyList.scenarioHaircutBPMF
                                    vocabularyTranslation = self.vocabularyList.scenarioHaircutTranslation
                                    previewID = previewText + "haircut"
                                }.padding()
                                
                                Button("facing challenges"){
                                    vocabularyBPMF = self.vocabularyList.scenarioFacingChallengesBPMF
                                    vocabularyTranslation = self.vocabularyList.scenarioFacingChallengesTranslation
                                    previewID = previewText + "facing challenges"
                                }.padding()
                                
                                Button("did something dumb"){
                                    vocabularyBPMF = self.vocabularyList.scenarioDidSomethingDumbBPMF
                                    vocabularyTranslation = self.vocabularyList.scenarioDidSomethingDumbTranslation
                                    previewID = previewText + "dummy"
                                }.padding()
                                
                                Button("interview"){
                                    vocabularyBPMF = self.vocabularyList.scenarioInterviewBPMF
                                    vocabularyTranslation = self.vocabularyList.scenarioInterviewTranslation
                                    previewID = previewText + "interview"
                                }.padding()
                                
                                Button("in the slumps"){
                                    vocabularyBPMF = self.vocabularyList.scenarioInTheSlumpsBPMF
                                    vocabularyTranslation = self.vocabularyList.scenarioInTheSlumpsTranslation
                                    previewID = previewText + "in the slumps"
                                }.padding()
                                
                                Button("using technology"){
                                    vocabularyBPMF = self.vocabularyList.scenarioTechnologyBPMF
                                    vocabularyTranslation = self.vocabularyList.scenarioTechnologyTranslation
                                    previewID = previewText + "using the computer"
                                }.padding()
                                
                                Button("throwing trash"){
                                    vocabularyBPMF = self.vocabularyList.scenarioThrowingTrashBPMF
                                    vocabularyTranslation = self.vocabularyList.scenarioThrowingTrashTranslation
                                    previewID = previewText + "throwing trash"
                                }.padding()
                                
                                Button("being single"){
                                    vocabularyBPMF = self.vocabularyList.scenarioBeingSingleBPMF
                                    vocabularyTranslation = self.vocabularyList.scenarioBeingSingleTranslation
                                    previewID = previewText + "being single"
                                }.padding()
                                
                                Button("household chores"){
                                    vocabularyBPMF = self.vocabularyList.scenarioHouseholdChoresBPMF
                                    vocabularyTranslation = self.vocabularyList.scenarioHouseholdChoresTranslation
                                    previewID = previewText + "household chores"
                                }.padding()
                                
                                Button("at the beach"){
                                    vocabularyBPMF = self.vocabularyList.scenarioBeachBPMF
                                    vocabularyTranslation = self.vocabularyList.scenarioBeachTranslation
                                    previewID = previewText + "at the beach"
                                }.padding()
                            }
                            
                            VStack{
                                
                                Button("doing yoga"){
                                    vocabularyBPMF = self.vocabularyList.scenarioYogaBPMF
                                    vocabularyTranslation = self.vocabularyList.scenarioYogaTranslation
                                    previewID = previewText + "doing yoga"
                                }.padding()
                                
                                Button("handling a camera"){
                                    vocabularyBPMF = self.vocabularyList.scenarioHandlingCameraBPMF
                                    vocabularyTranslation = self.vocabularyList.scenarioHandlingCameraTranslation
                                    previewID = previewText + "handling a camera"
                                }.padding()
                                
                                Button("getting packages"){
                                    vocabularyBPMF = self.vocabularyList.scenarioPackageDeliveryBPMF
                                    vocabularyTranslation = self.vocabularyList.scenarioPackageDeliveryTranslation
                                    previewID = previewText + "getting packages"
                                }.padding()
                                
                                Button("at a salon"){
                                    vocabularyBPMF = self.vocabularyList.scenarioSalonBPMF
                                    vocabularyTranslation = self.vocabularyList.scenarioSalonTranslation
                                    previewID = previewText + "at a salon"
                                }.padding()
                                
                                Button("outside in nature"){
                                    vocabularyBPMF = self.vocabularyList.scenarioNatureBPMF
                                    vocabularyTranslation = self.vocabularyList.scenarioNatureTranslation
                                    previewID = previewText + "outside in nature"
                                }.padding()
                                
                                Button("being an immigrant"){
                                    vocabularyBPMF = self.vocabularyList.scenarioImmigrantBPMF
                                    vocabularyTranslation = self.vocabularyList.scenarioImmigrantTranslation
                                    previewID = previewText + "being an immigrant"
                                }.padding()
                                
                                Button("project management"){
                                    vocabularyBPMF = self.vocabularyList.scenarioWorkingInManufacturingProjectManagementBPMF
                                    vocabularyTranslation = self.vocabularyList.scenarioWorkingInManufacturingProjectManagementTranslation
                                    previewID = previewText + "project management"
                                }.padding()
                            }
                        }
                        .padding()
                    }
                    
                    if(topic == "discussion topics"){
                        VStack{
                            VStack{
                                
                                Button("general discussion words"){
                                    vocabularyBPMF = self.vocabularyList.discussionGeneralBPMF
                                    vocabularyTranslation = self.vocabularyList.discussionGeneralTranslation
                                    previewID = previewText + "general words"
                                }.padding()
                                
                                Button("what to do"){
                                    vocabularyBPMF = self.vocabularyList.discussionWhatToDoBPMF
                                    vocabularyTranslation = self.vocabularyList.discussionWhatToDoTranslation
                                    previewID = previewText + "\ndiscussing what to do"
                                }.padding()
                                
                                Button("what to eat"){
                                    vocabularyBPMF = self.vocabularyList.discussionWhatToEatBPMF
                                    vocabularyTranslation = self.vocabularyList.discussionWhatToEatTranslation
                                    previewID = previewText + "\ndiscussing what to eat"
                                }.padding()
                                
                                Button("where to go"){
                                    vocabularyBPMF = self.vocabularyList.discussionWhereToGoBPMF
                                    vocabularyTranslation = self.vocabularyList.discussionWhereToGoTranslation
                                    previewID = previewText + "where to go"
                                }.padding()
                                
                                Button("relationships"){
                                    vocabularyBPMF = self.vocabularyList.discussionRelationshipsBPMF
                                    vocabularyTranslation = self.vocabularyList.discussionRelationshipsTranslation
                                    previewID = previewText + "relationships"
                                }.padding()
                                
                                Button("public transportation"){
                                    vocabularyBPMF = self.vocabularyList.discussionPublicTransportationBPMF
                                    vocabularyTranslation = self.vocabularyList.discussionPublicTransportationTranslation
                                    previewID = previewText + "\ndiscussing public transportation"
                                }.padding()
                                
                                Button("covid19"){
                                    vocabularyBPMF = self.vocabularyList.discussionCovid19BPMF
                                    vocabularyTranslation = self.vocabularyList.discussionCovid19Translation
                                    previewID = previewText + "\ndiscussing covid19"
                                }.padding()
                                
                                Button("life goals"){
                                    vocabularyBPMF = self.vocabularyList.discussionLifeGoalsBPMF
                                    vocabularyTranslation = self.vocabularyList.discussionLifeGoalsTranslation
                                    previewID = previewText + "life goals"
                                }.padding()
                                
                                Button("culture"){
                                    vocabularyBPMF = self.vocabularyList.discussionCultureBPMF
                                    vocabularyTranslation = self.vocabularyList.discussionCultureTranslation
                                    previewID = previewText + "culture"
                                }.padding()
                                
                                Button("travelling"){
                                    vocabularyBPMF = self.vocabularyList.discussionTravellingBPMF
                                    vocabularyTranslation = self.vocabularyList.discussionTravellingTranslation
                                    previewID = previewText + "travelling"
                                }.padding()
                                
                                
                            }
                            
                            VStack{
                                
                                Button("work"){
                                    vocabularyBPMF = self.vocabularyList.discussionWorkBPMF
                                    vocabularyTranslation = self.vocabularyList.discussionWorkTranslation
                                    previewID = previewText + "work"
                                }.padding()
                                
                                Button("weather"){
                                    vocabularyBPMF = self.vocabularyList.discussionWeatherBPMF
                                    vocabularyTranslation = self.vocabularyList.discussionWeatherTranslation
                                    previewID = previewText + "weather"
                                }.padding()
                                
                                Button("movies"){
                                    vocabularyBPMF = self.vocabularyList.discussionMoviesShowsBPMF
                                    vocabularyTranslation = self.vocabularyList.discussionMoviesShowsTranslation
                                    previewID = previewText + "movies"
                                }.padding()
                                
                                Button("school"){
                                    vocabularyBPMF = self.vocabularyList.discussionSchoolBPMF
                                    vocabularyTranslation = self.vocabularyList.discussionSchoolTranslation
                                    previewID = previewText + "school"
                                }.padding()
                                
                                Button("living situation"){
                                    vocabularyBPMF = self.vocabularyList.discussionLivingSituationBPMF
                                    vocabularyTranslation = self.vocabularyList.discussionLivingSituationTranslation
                                    previewID = previewText + "living situation"
                                }.padding()
                                
                                Button("hometown"){
                                    vocabularyBPMF = self.vocabularyList.discussionHometownBPMF
                                    vocabularyTranslation = self.vocabularyList.discussionHometownTranslation
                                    previewID = previewText + "hometown"
                                }.padding()
                                
                                Button("body condition"){
                                    vocabularyBPMF = self.vocabularyList.discussionBodyConditionBPMF
                                    vocabularyTranslation = self.vocabularyList.discussionBodyConditionTranslation
                                    previewID = previewText + "body condition"
                                }.padding()
                                
                                Button("diet"){
                                    vocabularyBPMF = self.vocabularyList.discussionDietBPMF
                                    vocabularyTranslation = self.vocabularyList.discussionDietTranslation
                                    previewID = previewText + "diet"
                                }.padding()
                                
                                Button("working out"){
                                    vocabularyBPMF = self.vocabularyList.discussionWorkingOutBPMF
                                    vocabularyTranslation = self.vocabularyList.discussionWorkingOutTranslation
                                    previewID = previewText + ""
                                }.padding()
                                
                                Button("sports & competition"){
                                    vocabularyBPMF = self.vocabularyList.discussionSportsAndCompetitionBPMF
                                    vocabularyTranslation = self.vocabularyList.discussionSportsAndCompetitionTranslation
                                    previewID = previewText + "sports & competition"
                                }.padding()
                                
                            }
                            
                            VStack{
                                
                                Button("social media"){
                                    vocabularyBPMF = self.vocabularyList.discussionSocialMediaBPMF
                                    vocabularyTranslation = self.vocabularyList.discussionSocialMediaTranslation
                                    previewID = previewText + "social media"
                                }.padding()
                                
                                Button("ambience"){
                                    vocabularyBPMF = self.vocabularyList.discussionAmbienceBPMF
                                    vocabularyTranslation = self.vocabularyList.discussionAmbienceTranslation
                                    previewID = previewText + "ambience"
                                }.padding()
                                
                                Button("the past"){
                                    vocabularyBPMF = self.vocabularyList.discussionThePastBPMF
                                    vocabularyTranslation = self.vocabularyList.discussionThePastTranslation
                                    previewID = previewText + "the past"
                                }.padding()
                                
                                Button("government"){
                                    vocabularyBPMF = self.vocabularyList.discussionGovernmentBPMF
                                    vocabularyTranslation = self.vocabularyList.discussionGovernmentTranslation
                                    previewID = previewText + "government"
                                }.padding()
                                
                                Button("accidents"){
                                    vocabularyBPMF = self.vocabularyList.discussionAccidentsBPMF
                                    vocabularyTranslation = self.vocabularyList.discussionAccidentsTranslation
                                    previewID = previewText + "accidents"
                                }.padding()
                                
                                Button("dreams"){
                                    vocabularyBPMF = self.vocabularyList.discussionDreamsBPMF
                                    vocabularyTranslation = self.vocabularyList.discussionDreamsTranslation
                                    previewID = previewText + "dreams"
                                }.padding()
                                
                                Button("marriage"){
                                    vocabularyBPMF = self.vocabularyList.discussionMarriageBPMF
                                    vocabularyTranslation = self.vocabularyList.discussionMarriageTranslation
                                    previewID = previewText + "marriage"
                                }.padding()
                                
                                Button("kids"){
                                    vocabularyBPMF = self.vocabularyList.discussionKidsBPMF
                                    vocabularyTranslation = self.vocabularyList.discussionKidsTranslation
                                    previewID = previewText + "kids"
                                }.padding()
                                
                                Button("finance"){
                                    vocabularyBPMF = self.vocabularyList.discussionFinanceBPMF
                                    vocabularyTranslation = self.vocabularyList.discussionFinanceTranslation
                                    previewID = previewText + "finance"
                                }.padding()
                                
                                Button("investments"){
                                    vocabularyBPMF = self.vocabularyList.discussionInvestmentsBPMF
                                    vocabularyTranslation = self.vocabularyList.discussionInvestmentsTranslation
                                    previewID = previewText + "investments"
                                }.padding()
                                
                            }
                            VStack{
                                Button("astrological sign"){
                                    vocabularyBPMF = self.vocabularyList.discussionAstrologicalSignsBPMF
                                    vocabularyTranslation = self.vocabularyList.discussionAstrologicalSignsTranslation
                                    previewID = previewText + "astrological sign"
                                }.padding()
                                
                                Button("chinese zodiac"){
                                    vocabularyBPMF = self.vocabularyList.discussionChineseZodiacBPMF
                                    vocabularyTranslation = self.vocabularyList.discussionChineseZodiacTranslation
                                    previewID = previewText + "chinese zodiac"
                                }.padding()
                            }
                        }
                        .padding()
                    }
                    if(topic == "lists"){
                        VStack{
                            VStack{
                                
                                Button("colors"){
                                    vocabularyBPMF = self.vocabularyList.listColorsBPMF
                                    vocabularyTranslation = self.vocabularyList.listColorsTranslation
                                    previewID = previewText + "colors"
                                }.padding()
                                
                                Button("clothing"){
                                    vocabularyBPMF = self.vocabularyList.listClothingBPMF
                                    vocabularyTranslation = self.vocabularyList.listClothingTranslation
                                    previewID = previewText + "clothing"
                                }.padding()
                                
                                Button("accessories"){
                                    vocabularyBPMF = self.vocabularyList.listAccessoriesBPMF
                                    vocabularyTranslation = self.vocabularyList.listAccessoriesTranslation
                                    previewID = previewText + "accessories"
                                }.padding()
                                
                                Button("emotions"){
                                    vocabularyBPMF = self.vocabularyList.listEmotionsBPMF
                                    vocabularyTranslation = self.vocabularyList.listEmotionsTranslation
                                    previewID = previewText + "emotions"
                                }.padding()
                                
                                Button("personality traits"){
                                    vocabularyBPMF = self.vocabularyList.listPersonalityTraitsBPMF
                                    vocabularyTranslation = self.vocabularyList.listPersonalityTraitsTranslation
                                    previewID = previewText + "personality traits"
                                }.padding()
                                
                                Button("kitchen items"){
                                    vocabularyBPMF = self.vocabularyList.listHouseholdKitchenItemsBPMF
                                    vocabularyTranslation = self.vocabularyList.listHouseholdKitchenItemsTranslation
                                    previewID = previewText + "kitchen items"
                                }.padding()
                                
                                Button("bedroom items"){
                                    vocabularyBPMF = self.vocabularyList.listHouseholdBedroomItemsBPMF
                                    vocabularyTranslation = self.vocabularyList.listHouseholdBedroomItemsTranslation
                                    previewID = previewText + "bedroom items"
                                }.padding()
                                
                                Button("bathroom items"){
                                    vocabularyBPMF = self.vocabularyList.listHouseholdBathroomItemsBPMF
                                    vocabularyTranslation = self.vocabularyList.listHouseholdBathroomItemsTranslation
                                    previewID = previewText + "bathroom items"
                                }.padding()
                                
                                Button("measure words"){
                                    vocabularyBPMF = self.vocabularyList.listMeasureWordsBPMF
                                    vocabularyTranslation = self.vocabularyList.listMeasureWordsTranslation
                                    previewID = previewText + "measure words"
                                }.padding()
                                
                            }
                            
                            VStack{
                                
                                Button("general adverbs"){
                                    vocabularyBPMF = self.vocabularyList.listAdverbBPMF
                                    vocabularyTranslation = self.vocabularyList.listAdverbTranslation
                                    previewID = previewText + "general adverbs"
                                }.padding()
                                
                                Button("general adjectives"){
                                    vocabularyBPMF = self.vocabularyList.listAdjectivesBPMF
                                    vocabularyTranslation = self.vocabularyList.listAdjectivesTranslation
                                    previewID = previewText + "general adjectives"
                                }.padding()
                                
                                Button("materials"){
                                    vocabularyBPMF = self.vocabularyList.listMaterialsBPMF
                                    vocabularyTranslation = self.vocabularyList.listMaterialsTranslation
                                    previewID = previewText + "materials"
                                }.padding()
                                
                                Button("electronics"){
                                    vocabularyBPMF = self.vocabularyList.listElectronicsBPMF
                                    vocabularyTranslation = self.vocabularyList.listElectronicsTranslation
                                    previewID = previewText + "electronics"
                                }.padding()
                                
                                Button("physical descriptions"){
                                    vocabularyBPMF = self.vocabularyList.listPhysicalDescriptionBPMF
                                    vocabularyTranslation = self.vocabularyList.listPhysicalDescriptionTranslation
                                    previewID = previewText + "physical descriptions"
                                }.padding()
                                
                                Button("seasons"){
                                    vocabularyBPMF = self.vocabularyList.listSeasonsBPMF
                                    vocabularyTranslation = self.vocabularyList.listSeasonsTranslation
                                    previewID = previewText + "seasons"
                                }.padding()
                                
                                Button("alcohol"){
                                    vocabularyBPMF = self.vocabularyList.listAlcoholBPMF
                                    vocabularyTranslation = self.vocabularyList.listAlcoholTranslation
                                    previewID = previewText + "alcohol"
                                }.padding()
                                
                                Button("natural disasters"){
                                    vocabularyBPMF = self.vocabularyList.listNaturalDisasterBPMF
                                    vocabularyTranslation = self.vocabularyList.listNaturalDisasterTranslation
                                    previewID = previewText + "natural disasters"
                                }.padding()
                                
                                Button("animals"){
                                    vocabularyBPMF = self.vocabularyList.listAnimalsBPMF
                                    vocabularyTranslation = self.vocabularyList.listAnimalsTranslation
                                    previewID = previewText + "animals"
                                }.padding()
                                
                                Button("locations"){
                                    vocabularyBPMF = self.vocabularyList.listLocationsBPMF
                                    vocabularyTranslation = self.vocabularyList.listLocationsTranslation
                                    previewID = previewText + "locations"
                                }.padding()
                            }
                            
                            VStack{
                                
                                Button("exterior body parts"){
                                    vocabularyBPMF = self.vocabularyList.listExteriorBodyPartsBPMF
                                    vocabularyTranslation = self.vocabularyList.listExteriorBodyPartsTranslation
                                    previewID = previewText + "exterior body parts"
                                }.padding()
                                
                                Button("interior body parts"){
                                    vocabularyBPMF = self.vocabularyList.listInteriorBodyPartsBPMF
                                    vocabularyTranslation = self.vocabularyList.listInteriorBodyPartsTranslation
                                    previewID = previewText + "interior body parts"
                                }.padding()
                                
                                Button("personal characteristics"){
                                    vocabularyBPMF = self.vocabularyList.listPersonalCharacteristicsBPMF
                                    vocabularyTranslation = self.vocabularyList.listPersonalCharacteristicsTranslation
                                    previewID = previewText + "personal characteristics"
                                }.padding()
                                
                                Button("fruits"){
                                    vocabularyBPMF = self.vocabularyList.listFruitBPMF
                                    vocabularyTranslation = self.vocabularyList.listFruitTranslation
                                    previewID = previewText + "fruits"
                                }.padding()
                                
                                Button("vegetables"){
                                    vocabularyBPMF = self.vocabularyList.listVegetableBPMF
                                    vocabularyTranslation = self.vocabularyList.listVegetableTranslation
                                    previewID = previewText + "vegetables"
                                }.padding()
                                
                                Button("food"){
                                    vocabularyBPMF = self.vocabularyList.listFoodBPMF
                                    vocabularyTranslation = self.vocabularyList.listFoodTranslation
                                    previewID = previewText + "seafood"
                                }.padding()
                                
                                Button("seafood"){
                                    vocabularyBPMF = self.vocabularyList.listSeafoodBPMF
                                    vocabularyTranslation = self.vocabularyList.listSeafoodTranslation
                                    previewID = previewText + "seafood"
                                }.padding()
                                
                                Button("desserts"){
                                    vocabularyBPMF = self.vocabularyList.listDessertBPMF
                                    vocabularyTranslation = self.vocabularyList.listDessertTranslation
                                    previewID = previewText + "desserts"
                                }.padding()
                                
                                Button("nuts"){
                                    vocabularyBPMF = self.vocabularyList.listNutsBPMF
                                    vocabularyTranslation = self.vocabularyList.listNutsTranslation
                                    previewID = previewText + "nuts"
                                }.padding()
                                
                                Button("occupations"){
                                    vocabularyBPMF = self.vocabularyList.listOccupationBPMF
                                    vocabularyTranslation = self.vocabularyList.listOccupationTranslation
                                    previewID = previewText + "occupations"
                                }.padding()
                                
                            }
                            
                            VStack{
                                
                                Button("family"){
                                    vocabularyBPMF = self.vocabularyList.listFamilyBPMF
                                    vocabularyTranslation = self.vocabularyList.listFamilyTranslation
                                    previewID = previewText + "family"
                                }.padding()
                                
                                Button("continents"){
                                    vocabularyBPMF = self.vocabularyList.listContinentsBPMF
                                    vocabularyTranslation = self.vocabularyList.listContinentsTranslation
                                    previewID = previewText + "continents"
                                }.padding()
                                
                                Button("countries"){
                                    vocabularyBPMF = self.vocabularyList.listCountriesBPMF
                                    vocabularyTranslation = self.vocabularyList.listCountriesTranslation
                                    previewID = previewText + "countries"
                                }.padding()
                                
                                Button("us states"){
                                    vocabularyBPMF = self.vocabularyList.listUSStatesBPMF
                                    vocabularyTranslation = self.vocabularyList.listUSStatesTranslation
                                    previewID = previewText + "us states"
                                }.padding()
                                
                                Button("us cities"){
                                    vocabularyBPMF = self.vocabularyList.listUSCitiesBPMF
                                    vocabularyTranslation = self.vocabularyList.listUSCitiesTranslation
                                    previewID = previewText + "us cities"
                                }.padding()
                                
                                Button("chengyu"){
                                    vocabularyBPMF = self.vocabularyList.listChengYuBPMF
                                    vocabularyTranslation = self.vocabularyList.listChengYuTranslation
                                    previewID = previewText + "chengyu"
                                }.padding()
                                
                                Button("sayings"){
                                    vocabularyBPMF = self.vocabularyList.listSayingsBPMF
                                    vocabularyTranslation = self.vocabularyList.listSayingsTranslation
                                    previewID = previewText + "sayings"
                                }.padding()
                            }
                        }
                        .padding()
                    }
                    
                    if(topic == "grammar"){
                        VStack{
                            VStack{
                                
                                Button("add emotion"){
                                    vocabularyBPMF = self.vocabularyList.grammarAddEmotionBPMF
                                    vocabularyTranslation = self.vocabularyList.grammarAddEmotionTranslation
                                    previewID = previewText + "add emotion"
                                }.padding()
                                
                                Button("time words"){
                                    vocabularyBPMF = self.vocabularyList.grammarTimeWordsBPMF
                                    vocabularyTranslation = self.vocabularyList.grammarTimeWordsTranslation
                                    previewID = previewText + "time words"
                                }.padding()
                                
                                Button("sentence connections"){
                                    vocabularyBPMF = self.vocabularyList.grammarSentenceConnectionsBPMF
                                    vocabularyTranslation = self.vocabularyList.grammarSentenceConnectionsTranslation
                                    previewID = previewText + "sentence connections"
                                }.padding()
                                
                                Button("result compliments"){
                                    vocabularyBPMF = self.vocabularyList.grammarResultComplimentsBPMF
                                    vocabularyTranslation = self.vocabularyList.grammarResultComplimentsTranslation
                                    previewID = previewText + "result compliments"
                                }.padding()
                            }
                        }
                        .padding()
                    }
                }
                .font(.custom("copperplate",size: 26))
                .frame(minWidth:screenWidth)
                .multilineTextAlignment(.leading)
                .padding(10)
                .frame(alignment: .leading)
                .foregroundColor(.black)
            }
            
            NavigationLink(destination: ContentPreviewVocabulary(contentOne: self.$vocabularyTranslation, contentTwo: self.$vocabularyBPMF,previewID: self.$previewID, pronunciationTextMode: self.$pronunciationTextMode, timerValue: self.$timerValue,testType:self.$testType)){
                Text(previewID)
            }
            .frame(width: screenWidth*9/10, height: screenHeight/10, alignment: .center)
            .multilineTextAlignment(.center)
            .foregroundColor(teal)
            .font(.custom("copperplate",size:30))
            .padding(5)
            
            
            
        }.frame(maxHeight: screenHeight)
    }
}

struct Vocabulary_Previews: PreviewProvider {
    @State static var pronunciationTextMode = true
    @State static var pronunciationVoiceMode = true
    @State static var voiceSelection = ""
    @State static var timerValue = 1.1
    @State static var testModeSelection = ""
    @State static var testType = ""
    
    static var previews: some View {
        Vocabulary(pronunciationTextMode:$pronunciationTextMode,pronunciationVoiceMode:$pronunciationVoiceMode, voiceSelection:$voiceSelection, timerValue:$timerValue,testModeSelection: $testModeSelection,testType: $testType)
    }
}
