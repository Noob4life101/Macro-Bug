#Requires AutoHotkey v2.0+
LoadData() {
	global
	startKey := IniRead(iniFile, "Settings", "startKey", "p")
	resetKey := IniRead(iniFile, "Settings", "resetKey", "u")
	stopKey := IniRead(iniFile, "Settings", "stopKey", "y")
	settingsKey := IniRead(iniFile, "Settings", "settingsKey", "t")
Carrot := IniRead(iniFile, "Seeds", "Carrot", "0")

Strawberry := IniRead(iniFile, "Seeds", "Strawberry", "0")

Blueberry := IniRead(iniFile, "Seeds", "Blueberry", "0")

Orange := IniRead(iniFile, "Seeds", "Orange", "0")

Tomato := IniRead(iniFile, "Seeds", "Tomato", "0")

Corn := IniRead(iniFile, "Seeds", "Corn", "0")

Daffodil := IniRead(iniFile, "Seeds", "Daffodil", "0")

Watermelon := IniRead(iniFile, "Seeds", "Watermelon", "0")

Pumpkin := IniRead(iniFile, "Seeds", "Pumpkin", "0")

Apple := IniRead(iniFile, "Seeds", "Apple", "0")

Bamboo := IniRead(iniFile, "Seeds", "Bamboo", "0")

Coconut := IniRead(iniFile, "Seeds", "Coconut", "0")

Cactus := IniRead(iniFile, "Seeds", "Cactus", "0")

Dragon := IniRead(iniFile, "Seeds", "Dragon", "0")

Mango := IniRead(iniFile, "Seeds", "Mango", "0")

Grape := IniRead(iniFile, "Seeds", "Grape", "0")

Mushroom := IniRead(iniFile, "Seeds", "Mushroom", "0")

Pepper := IniRead(iniFile, "Seeds", "Pepper", "0")

Cacao := IniRead(iniFile, "Seeds", "Cacao", "0")

Beanstalk := IniRead(iniFile, "Seeds", "Beanstalk", "0")

EmberLily := IniRead(iniFile, "Seeds", "EmberLily", "0")

SugarApple := IniRead(iniFile, "Seeds", "SugarApple", "0")
BurningBud := IniRead(iniFile, "Seeds", "BurningBud", "0")
GiantPinecone := IniRead(iniFile, "Seeds", "GiantPinecone", "0")

SeedsValue := IniRead(iniFile, "Gears/Seeds", "Seeds", "0")

GearsValue := IniRead(iniFile, "Gears/Seeds", "Gears", "0")

ReverseOrder := IniRead(iniFile, "Settings", "ReverseOrder", "0")

InventoryKey := IniRead(iniFile, "Settings", "InventoryKey", "``")

BuyCap := IniRead(iniFile, "Settings", "BuyCap", 25)

InterfaceButton := IniRead(iniFile, "Settings", "InterfaceButton", "`\") ;") Gotta do this to fix a weird parsing bug due to the backslash
KeyDelay := IniRead(iniFile, "Settings", "KeyDelay",20)
MouseDelay := IniRead(iniFile, "Settings", "MouseDelay",20)
GlobalDelay := IniRead(iniFile, "Settings", "GlobalDelay",100)
AutoAlign := IniRead(iniFile, "Settings", "AutoAlign","1")
AutoAlignRecal := IniRead(iniFile, "Settings", "AutoAlignRecal", "5")
FailCountLimit := IniRead(iniFile, "Settings", "FailCountLimit", "10")
WrenchActive := IniRead(iniFile, "Settings", "WrenchActive","0")
WrenchSlot := IniRead(iniFile, "Settings", "WrenchSlot","2")
UIInitMode := IniRead(iniFile, "Settings", "UIInitMode","0")
IgnoreErrors := IniRead(iniFile, "Settings", "IgnoreErrors","0")
AltBuy := IniRead(iniFile, "Settings", "AltBuy","0")
MovementFactor := IniRead(iniFile, "Settings", "MovementFactor", "0")
MovementMulti := 1+(MovementFactor/100)

; === Summer Seeds ===
Cauliflower := IniRead(iniFile, "SummerSeeds", "Cauliflower", "0")

Rafflesia := IniRead(iniFile, "SummerSeeds", "Rafflesia", "0")

GreenApple := IniRead(iniFile, "SummerSeeds", "GreenApple", "0")

Avocado := IniRead(iniFile, "SummerSeeds", "Avocado", "0")

Banana := IniRead(iniFile, "SummerSeeds", "Banana", "0")

Pineapple := IniRead(iniFile, "SummerSeeds", "Pineapple", "0")

Kiwi := IniRead(iniFile, "SummerSeeds", "Kiwi", "0")

BellPepper := IniRead(iniFile, "SummerSeeds", "BellPepper", "0")

PricklyPear := IniRead(iniFile, "SummerSeeds", "PricklyPear", "0")

Loquat := IniRead(iniFile, "SummerSeeds", "Loquat", "0")

Feijoa := IniRead(iniFile, "SummerSeeds", "Feijoa", "0")

Pitcher := IniRead(iniFile, "SummerSeeds", "Pitcher", "0")

; === Gear ===
Watering := IniRead(iniFile, "Gear", "Watering", "0")

Trowel := IniRead(iniFile, "Gear", "Trowel", "0")

Recall := IniRead(iniFile, "Gear", "Recall", "0")

Basic := IniRead(iniFile, "Gear", "Basic", "0")

Advanced := IniRead(iniFile, "Gear", "Advanced", "0")
MediumToy := IniRead(iniFile, "Gear", "MediumToy", "0")
MediumTreat := IniRead(iniFile, "Gear", "MediumTreat", "0")

Godly := IniRead(iniFile, "Gear", "Godly", "0")

Magnify := IniRead(iniFile, "Gear", "Magnify", "0")

Lightning := IniRead(iniFile, "Gear", "Lightning", "0")
Mirror := IniRead(iniFile, "Gear", "Mirror", "0")

Master := IniRead(iniFile, "Gear", "Master", "0")

Cleansing := IniRead(iniFile, "Gear", "Cleansing", "0")

Favorite := IniRead(iniFile, "Gear", "Favorite", "0")

Harvest := IniRead(iniFile, "Gear", "Harvest", "0")

Friendship := IniRead(iniFile, "Gear", "Friendship", "0")
LevelupLolly := IniRead(iniFile, "Gear", "LevelupLolly", "0")

BuyAllEggsValue := IniRead(iniFile, "Eggs", "BuyAllEggs", "0")

CommonEgg := IniRead(iniFile, "Eggs", "CommonEgg", "0")

UncommonEgg := IniRead(iniFile, "Eggs", "UncommonEgg", "0")

RareEgg := IniRead(iniFile, "Eggs", "RareEgg", "0")

LegEgg := IniRead(iniFile, "Eggs", "LegEgg", "0")

MythEgg := IniRead(iniFile, "Eggs", "MythEgg", "0")

BugEgg := IniRead(iniFile, "Eggs", "BugEgg", "0")

BeeEggEgg := IniRead(iniFile, "Eggs", "BeeEgg", "0")

SummerCommonEgg := IniRead(iniFile, "Eggs", "SummerCommonEgg", "0")
SummerRareEgg := IniRead(iniFile, "Eggs", "SummerRareEgg", "0")
ParadiseEgg := IniRead(iniFile, "Eggs", "ParadiseEgg", "0")

OtherEgg := IniRead(iniFile, "Eggs", "OtherEgg", "0")


GearShopX := IniRead(iniFile, "Gearshopopencords", "x", 1058)
GearShopY := IniRead(iniFile, "Gearshopopencords", "y", 532)
xEgg := IniRead(iniFile, "Gearshopopencords", "xEgg", 1070)
yEgg := IniRead(iniFile, "Gearshopopencords", "yEgg", 501)
XBee := IniRead(iniFile, "Eventshopcoords", "xBee", 1048)
YBee := IniRead(iniFile, "Eventshopcoords", "yBee", 540)
XSum := IniRead(iniFile, "Eventshopcoords", "xSum", 1090)
YSum := IniRead(iniFile, "Eventshopcoords", "ySum", 530)
XHoney := IniRead(iniFile, "Travelershopopencoords", "xHoney", 1080)
YHoney := IniRead(iniFile, "Travelershopopencoords", "yHoney", 530)
XHoneyConvert := IniRead(iniFile, "Travelershopopencoords", "xHoneyConvert", 1080)
YHoneyConvert := IniRead(iniFile, "Travelershopopencoords", "yHoneyConvert", 570)

XPrehistoric := IniRead(iniFile, "Eventshopcoords", "xPrehistoric", 1060)
YPrehistoric := IniRead(iniFile, "Eventshopcoords", "yPrehistoric", 555)

; === TRAVELING MERCHANT ===
	SummerTravelActive := IniRead(iniFile, "travel", "SummerTravelActive", "1")
	SkyActive := IniRead(iniFile, "travel", "SkyActive", 1)
	GnomeActive := IniRead(iniFile, "travel", "GnomeActive", 1)
	SkyOpt1 := IniRead(iniFile, "travel", "SkyOpt1", 1)
	SkyOpt2 := IniRead(iniFile, "travel", "SkyOpt2", 1)
	SkyOpt3 := IniRead(iniFile, "travel", "SkyOpt3", 1)
	GnomeOpt1 := IniRead(iniFile, "travel", "GnomeOpt1", 1)
	GnomeOpt2 := IniRead(iniFile, "travel", "GnomeOpt2", 1)
	GnomeOpt3 := IniRead(iniFile, "travel", "GnomeOpt3", 1)
	GnomeOpt4 := IniRead(iniFile, "travel", "GnomeOpt4", 1)
HoneyActive := IniRead(iniFile, "travel", "HoneyActive", 0)
TravelFlowerSeed := IniRead(iniFile, "travel", "TravelFlowerSeed", 0)
TravelHoneySprinkler := IniRead(iniFile, "travel", "TravelHoneySprinkler", 0)
TravelBeeEgg := IniRead(iniFile, "travel", "TravelBeeEgg", 0)
TravelHoneyCrate := IniRead(iniFile, "travel", "TravelHoneyCrate", 0)
TravelCrafterCrate := IniRead(iniFile, "travel", "TravelCrafterCrate", 0)

; === Wait Times (user-defined in seconds) ===
SeedsWaitTime := IniRead(iniFile, "WaitTimes", "SeedsWait", 20)

GearsWaitTime := IniRead(iniFile, "WaitTimes", "GearsWait", 20)

EggsWaitTime := IniRead(iniFile, "WaitTimes", "BuyAllEggsWait", 20)

; === Crafting ===

CraftTargetA := IniRead(iniFile, "Crafting", "CraftTargetA", "None")
CraftTargetB := IniRead(iniFile, "Crafting", "CraftTargetB", "None")
CraftInstant := IniRead(iniFile, "Crafting", "CraftInstant", "0")
MakeHoney := IniRead(iniFile, "Crafting", "MakeHoney", "0")
; === Event Items === (Replace the existing section with this)
ForcePrehist := IniRead(iniFile, "ForceEvent", "ForcePrehist", "0")
PrehistShop := IniRead(iniFile, "PrehistShop", "PrehistShop", "0")
PrehistCraft := IniRead(iniFile, "PrehistShop", "PrehistCraftTarget", "0")
DinoEgg := IniRead(iniFile, "PrehistShop", "DinoEgg", "0")
DinoPet := IniRead(iniFile, "PrehistShop", "DinoPet", "Bunny")
PrehistInstantCraft := IniRead(iniFile, "PrehistShop", "PrehistInstantCraft", "0")
	
SummerShop := IniRead(iniFile, "SumShop", "SummerShop", "0")
SummerSeed := IniRead(iniFile, "SumShop", "SummerSeed", "0")
Delphinium := IniRead(iniFile, "SumShop", "Delphinium", "0")
LilyValley := IniRead(iniFile, "SumShop", "LilyValley", "0")
Traveler := IniRead(iniFile, "SumShop", "Traveler", "0")
SprayBurnt := IniRead(iniFile, "SumShop", "SprayBurnt", "0")
OasisCrate := IniRead(iniFile, "SumShop", "OasisCrate", "0")
OasisEgg := IniRead(iniFile, "SumShop", "OasisEgg", "0")
Hamster := IniRead(iniFile, "SumShop", "Hamster", "0")

BloodCrate := IniRead(iniFile, "Twiblood", "BloodCrate", "0")

NightEgg := IniRead(iniFile, "Twiblood", "NightEgg", "0")

NightSeed := IniRead(iniFile, "Twiblood", "NightSeed", "0")

BloodBanana := IniRead(iniFile, "Twiblood", "BloodBanana", "0")

MoonMelon := IniRead(iniFile, "Twiblood", "MoonMelon", "0")

StarCaller := IniRead(iniFile, "Twiblood", "StarCaller", "0")

BloodHedge := IniRead(iniFile, "Twiblood", "BloodHedge", "0")

TwilightCrate := IniRead(iniFile, "Twiblood", "TwilightCrate", "0")

MoonCat := IniRead(iniFile, "Twiblood", "MoonCat", "0")

Celestiberry := IniRead(iniFile, "Twiblood", "Celestiberry", "0")

MoonMango := IniRead(iniFile, "Twiblood", "MoonMango", "0")

BloodKiwi := IniRead(iniFile, "Twiblood", "BloodKiwi", "0")

BloodOwl := IniRead(iniFile, "Twiblood", "BloodOwl", "0")

Twiblood := IniRead(iniFile, "Twiblood", "Twiblood", "0")


BeeShop := IniRead(iniFile, "BeeShop", "BeeShop", "0")

FlowerSeed := IniRead(iniFile, "BeeShop", "FlowerSeed", "0")

Lavender := IniRead(iniFile, "BeeShop", "Lavender", "0")

Nectarshade := IniRead(iniFile, "BeeShop", "Nectarshade", "0")

Nectarine := IniRead(iniFile, "BeeShop", "Nectarine", "0")

HiveFruit := IniRead(iniFile, "BeeShop", "HiveFruit", "0")

PollenGun := IniRead(iniFile, "BeeShop", "PollenGun", "0")

NectarStaff := IniRead(iniFile, "BeeShop", "NectarStaff", "0")

HoneySprinkler := IniRead(iniFile, "BeeShop", "HoneySprinkler", "0")

BeeEgg := IniRead(iniFile, "BeeShop", "BeeEgg", "0")

BeeCrate := IniRead(iniFile, "BeeShop", "BeeCrate", "0")

HoneyComb := IniRead(iniFile, "BeeShop", "HoneyComb", "0")

BeeChair := IniRead(iniFile, "BeeShop", "BeeChair", "0")

HoneyTorch := IniRead(iniFile, "BeeShop", "HoneyTorch", "0")

HoneyWalkway := IniRead(iniFile, "BeeShop", "HoneyWalkway", "0")

ForceNight := IniRead(iniFile, "ForceEvent", "ForceNight", "0")

ForceBee := IniRead(iniFile, "ForceEvent", "ForceBee", "0")

ForceSummer := IniRead(iniFile, "ForceEvent", "ForceSummer", "0")
IgnoreWeather := IniRead(iniFile, "IgnoreWeather", "IgnoreWeather", "0")
TimerAdjustment := IniRead(iniFile, "TimerAdjustment", "TimerAdjustment", "-1")
SlowMode := IniRead(iniFile, "Settings", "SlowMode", "0")
SellHoney := IniRead(iniFile, "EventMisc", "SellHoney", "0")
AltHoney := IniRead(iniFile, "EventMisc", "AltHoney", "0")
CraftSeedPackMode := IniRead(iniFile, "EventMisc", "CraftSeedPackMode", "0")
CraftActive := 0


; === EVENT FLAGS ===
; Set to 0 if not active, set to 1 if active
EventActiveNight := 0
EventActiveBee := 0
EventActiveSummer := 0
EventActiveDino := 1
SummerActive := 0
SummerFruit := 0

SetKeyDelay(KeyDelay,10)
SetMouseDelay(MouseDelay)
; === Read screen resolution from ini and parse ===
ScreenResX := A_ScreenWidth
ScreenResY := A_ScreenHeight
MacroState := IniRead(iniFile, "Settings", "MacroState", 0)
DebugMode := IniRead(iniFile, "Settings", "DebugMode", "0")
}
