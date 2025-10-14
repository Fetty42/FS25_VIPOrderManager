-- Author: Fetty42
-- Date: 12.10.2025

VIPOrderManager.isAnimalOrdersWished= true

-- orders definition for order level 1 and own field area of 1 ha
VIPOrderManager.countOrderItemsRange = {min=3, max=5}
VIPOrderManager.quantityFactor = {min=6, max=6}
-- VIPOrderManager.quantityFactor = {min=5, max=7}
VIPOrderManager.payoutFactor = {min=4, max=6}

-- Depending on the OrderLeven, special correction factors for count, quantity and payout
VIPOrderManager.orderLevelCorrectionFactors = {}
VIPOrderManager.orderLevelCorrectionFactors[1] = {0.40, 0.60, 1.00}
VIPOrderManager.orderLevelCorrectionFactors[2] = {0.65, 0.80, 1.00}
VIPOrderManager.orderLevelCorrectionFactors[3] = {0.90, 1.00, 1.00}


-- Constants for filltype selection
VIPOrderManager.fillTypesNoPriceList = {}
VIPOrderManager.acceptOwnPlaceableProductionPointsAsSellingStation = true	-- accept own placeable production points if fill types is not also loadable at the same time


-- constants
VIPOrderManager.maxVIPOrdersCount = 4		-- Count of already calculated orders (preview)
VIPOrderManager.abortFeeInPercent = 35
VIPOrderManager.allowSumQuantitySameFT = false	-- Summarize quantity of same filetypes
VIPOrderManager.ownFieldArea = 1	-- min field area
VIPOrderManager.rangeAnimalAgeDifInMonths = {min=6, max=12}
VIPOrderManager.rangeAnimalDummyPrice = {min=500, max=800}

VIPOrderManager.limitedGroupsPercent = {} -- Max share of limited groups
-- VIPOrderManager.limitedGroupsPercent["Animals"] = 50
-- VIPOrderManager.limitedGroupsPercent["Production"] = 30

VIPOrderManager.numPrioTrysForGroup = 100

VIPOrderManager.groupNameSettings = {}
table.insert(VIPOrderManager.groupNameSettings, {groupName="Basic Crops", 					sectionOrder=1, probability=65})
table.insert(VIPOrderManager.groupNameSettings, {groupName="Windrowed, Silaged, Chopped", 	sectionOrder=2, probability=40})
table.insert(VIPOrderManager.groupNameSettings, {groupName="Animals", 						sectionOrder=3, probability=30})
table.insert(VIPOrderManager.groupNameSettings, {groupName="Productions easy", 				sectionOrder=4, probability=35})
table.insert(VIPOrderManager.groupNameSettings, {groupName="Production", 					sectionOrder=5, probability=15})


-- overwrite group name which comes from the ftConfig defaults
VIPOrderManager.defaultGroupNameOverwriting = {}
VIPOrderManager.defaultGroupNameOverwriting["FORAGE"] = "Productions easy"


-- groupName="<group name>"
-- isAllowed (true, false) - whether the fill type is offered 
-- minOrderLevel {(1-n)(, (1-n), (1-n))} - from which level the fill type is offered (1:default, 2:existing, 3:self owned)
-- quantityCorrectionFactor (> 0) - Factor for the correction of the quantity calculation
-- probability {(1-n)(, (1-n), (1-n))} - The probability with which this filltype is taken when selected. (1:default, 2:existing, 3:sef owned)
VIPOrderManager.ftConfigs = 
{
	-- Not Allowed
	STONE 				= {isAllowed=false, minOrderLevel={1}, quantityCorrectionFactor=1.0, probability={0}},		-- Steine
	ROUNDBALE 			= {isAllowed=false, minOrderLevel={1}, quantityCorrectionFactor=1.0, probability={0}},		-- Rundballen
	ROUNDBALE_WOOD 		= {isAllowed=false, minOrderLevel={1}, quantityCorrectionFactor=1.0, probability={0}},		-- RundballenHolz
	SQUAREBALE 			= {isAllowed=false, minOrderLevel={1}, quantityCorrectionFactor=1.0, probability={0}},		-- Quaderballen
	WATER	 			= {isAllowed=false, minOrderLevel={1}, quantityCorrectionFactor=1.0, probability={0}},		-- Wasser
	LIME				= {isAllowed=false, minOrderLevel={1}, quantityCorrectionFactor=1.0, probability={0}},		-- Kalk
	SOYBEANSTRAW		= {isAllowed=false, minOrderLevel={1}, quantityCorrectionFactor=1.0, probability={0}},		-- Sojabohnen Stroh
	EMPTYPALLET			= {isAllowed=false, minOrderLevel={1}, quantityCorrectionFactor=1.0, probability={0}},		-- leere Paletten

	-- defaults
	DEFAULT_FRUITTYPE	= {groupName="Basic Crops", isUnknown=true, isAllowed=true, minOrderLevel={3}, quantityCorrectionFactor=0.5, probability={30}},					-- for unknown fruittypes
	DEFAULT_FILLTYPE	= {groupName="Production", isUnknown=true, isAllowed=true, minOrderLevel={5,4,2}, quantityCorrectionFactor=1.0, probability={2, 5, 15}},		-- for unknown filltypes (booster possible)
	DEFAULT_ANIMALTYPE	= {groupName="Animals", isUnknown=true, isAllowed=true, minOrderLevel={4,3,2}, quantityCorrectionFactor=2.0, probability={30, 40, 50}},			-- for unknown animals (booster possible)

	-- Basic Cropss (incl. Premium Expansion)
	BARLEY 				= {groupName="Basic Crops", isAllowed=true, minOrderLevel={1}, quantityCorrectionFactor=1.0, probability={40}},		-- Gerste
	WHEAT 				= {groupName="Basic Crops", isAllowed=true, minOrderLevel={1}, quantityCorrectionFactor=1.0, probability={40}},		-- Weizen
	OAT 				= {groupName="Basic Crops", isAllowed=true, minOrderLevel={1}, quantityCorrectionFactor=1.0, probability={40}},		-- Hafer
	CANOLA 				= {groupName="Basic Crops", isAllowed=true, minOrderLevel={1}, quantityCorrectionFactor=1.0, probability={40}},		-- Raps
	SORGHUM 			= {groupName="Basic Crops", isAllowed=true, minOrderLevel={1}, quantityCorrectionFactor=1.0, probability={40}},		-- Sorghumhirse
	SOYBEAN 			= {groupName="Basic Crops", isAllowed=true, minOrderLevel={1}, quantityCorrectionFactor=1.0, probability={40}},		-- Sojabohnen
	SUNFLOWER 			= {groupName="Basic Crops", isAllowed=true, minOrderLevel={2}, quantityCorrectionFactor=1.0, probability={40}},		-- Sonnenblumen
	MAIZE 				= {groupName="Basic Crops", isAllowed=true, minOrderLevel={2}, quantityCorrectionFactor=1.0, probability={40}},		-- Mais
	SUGARBEET 			= {groupName="Basic Crops", isAllowed=true, minOrderLevel={3}, quantityCorrectionFactor=1.0, probability={30}},		-- Zuckerrüben
	POTATO 				= {groupName="Basic Crops", isAllowed=true, minOrderLevel={3}, quantityCorrectionFactor=1.0, probability={30}},		-- Kartoffeln
	OLIVE 				= {groupName="Basic Crops", isAllowed=true, minOrderLevel={4}, quantityCorrectionFactor=1.0, probability={20}},		-- Oliven
	GRAPE 				= {groupName="Basic Crops", isAllowed=true, minOrderLevel={4}, quantityCorrectionFactor=1.0, probability={20}},		-- Trauben
	COTTON 				= {groupName="Basic Crops", isAllowed=true, minOrderLevel={5}, quantityCorrectionFactor=1.0, probability={25}},		-- Baumwolle
	SUGARCANE 			= {groupName="Basic Crops", isAllowed=true, minOrderLevel={5}, quantityCorrectionFactor=1.0, probability={25}},		-- Zuckerrohr
	
	GREENBEAN 			= {groupName="Basic Crops", isAllowed=true, minOrderLevel={3}, quantityCorrectionFactor=1.0, probability={15}},		-- Buschbohnen
	RICELONGGRAIN 		= {groupName="Basic Crops", isAllowed=true, minOrderLevel={1}, quantityCorrectionFactor=1.0, probability={20}},		-- Langkornreis
	SPINACH 			= {groupName="Basic Crops", isAllowed=true, minOrderLevel={3}, quantityCorrectionFactor=1.0, probability={15}},		-- Spinat
	PEA 				= {groupName="Basic Crops", isAllowed=true, minOrderLevel={3}, quantityCorrectionFactor=1.0, probability={15}},		-- Erbsen
	RICE 				= {groupName="Basic Crops", isAllowed=true, minOrderLevel={3}, quantityCorrectionFactor=1.0, probability={20}},		-- Reis
	PARSNIP 			= {groupName="Basic Crops", isAllowed=true, minOrderLevel={3}, quantityCorrectionFactor=1.0, probability={20}},		-- Pastinaken
	BEETROOT 			= {groupName="Basic Crops", isAllowed=true, minOrderLevel={3}, quantityCorrectionFactor=1.0, probability={20}},		-- Rote Bete
	CARROT 				= {groupName="Basic Crops", isAllowed=true, minOrderLevel={3}, quantityCorrectionFactor=1.0, probability={20}},		-- Karotten

	-- standard animals (booster possible)
	ANIMALTYPE_CHICKEN	= {groupName="Animals", isAllowed=true, minOrderLevel={2,1,1}, quantityCorrectionFactor=2.0, probability={30, 40, 50}, quantityCorrectionFactorMaizePlus=1.5},
	ANIMALTYPE_SHEEP	= {groupName="Animals", isAllowed=true, minOrderLevel={3,2,1}, quantityCorrectionFactor=2.5, probability={30, 35, 50}, quantityCorrectionFactorMaizePlus=1.5},
	ANIMALTYPE_COW		= {groupName="Animals", isAllowed=true, minOrderLevel={4,3,2}, quantityCorrectionFactor=1.5, probability={20, 30, 50}, quantityCorrectionFactorMaizePlus=1.0},
	ANIMALTYPE_PIG		= {groupName="Animals", isAllowed=true, minOrderLevel={4,3,2}, quantityCorrectionFactor=3.5, probability={20, 30, 50}, quantityCorrectionFactorMaizePlus=2.5},
	ANIMALTYPE_HORSE	= {groupName="Animals", isAllowed=true, minOrderLevel={4,3,2}, quantityCorrectionFactor=0.7, probability={20, 30, 50}, quantityCorrectionFactorMaizePlus=0.7},

	-- other animals (booster possible)
	-- ANIMALTYPE_RABBIT	= {groupName="Animals", isAllowed=true, minOrderLevel={4,3,2}, quantityCorrectionFactor=1.0, probability={10, 15, 30}},		-- Hof Bergmann

	-- Animal products (booster possible)
	HONEY 				= {groupName="Productions easy", isAllowed=true, minOrderLevel={2}, quantityCorrectionFactor=0.3, probability={45}},				-- Honig
	EGG 				= {groupName="Productions easy", isAllowed=true, minOrderLevel={2,1,1}, quantityCorrectionFactor=0.7, probability={25, 35, 45}},	-- Eier
	WOOL 				= {groupName="Productions easy", isAllowed=true, minOrderLevel={3,2,1}, quantityCorrectionFactor=0.7, probability={20, 35, 45}},	-- Wolle
	GOATMILK 			= {groupName="Productions easy", isAllowed=true, minOrderLevel={4,3,2}, quantityCorrectionFactor=1.0, probability={20, 35, 45}},	-- Ziegenmilch
	MILK 				= {groupName="Productions easy", isAllowed=true, minOrderLevel={4,3,2}, quantityCorrectionFactor=1.0, probability={15, 25, 45}},	-- Milch
	BUFFALOMILK			= {groupName="Productions easy", isAllowed=true, minOrderLevel={4,3,2}, quantityCorrectionFactor=1.0, probability={15, 25, 45}},	-- Büffelmilch
	LIQUIDMANURE 		= {groupName="Productions easy", isAllowed=true, minOrderLevel={4,3,2}, quantityCorrectionFactor=0.1, probability={10, 15, 30}},	-- Gülle
	MANURE 				= {groupName="Productions easy", isAllowed=true, minOrderLevel={4,3,2}, quantityCorrectionFactor=0.1, probability={10, 15, 30}},	-- Mist

	-- Tree products
	WOOD 				= {groupName="Productions easy", isAllowed=true, minOrderLevel={2}, quantityCorrectionFactor=2.0, probability={30}},		-- Holz
	WOODCHIPS 			= {groupName="Productions easy", isAllowed=true, minOrderLevel={2}, quantityCorrectionFactor=0.8, probability={30}},		-- Hackschnitzel

	-- Greenhouse products (booster possible)
	STRAWBERRY 			= {groupName="Productions easy", isAllowed=true, minOrderLevel={3,2,1}, quantityCorrectionFactor=0.8, probability={10, 15, 20}},		-- Erdbeeren
	TOMATO 				= {groupName="Productions easy", isAllowed=true, minOrderLevel={3,2,1}, quantityCorrectionFactor=0.8, probability={10, 15, 20}},		-- Tomaten
	LETTUCE 			= {groupName="Productions easy", isAllowed=true, minOrderLevel={3,2,1}, quantityCorrectionFactor=0.8, probability={10, 15, 20}},		-- Salat
	GARLIC 				= {groupName="Productions easy", isAllowed=true, minOrderLevel={3,2,1}, quantityCorrectionFactor=0.8, probability={10, 15, 20}},		-- Knoblauch
	OYSTER 				= {groupName="Productions easy", isAllowed=true, minOrderLevel={3,2,1}, quantityCorrectionFactor=0.8, probability={10, 15, 20}},		-- Austernpilze
	ENOKI 				= {groupName="Productions easy", isAllowed=true, minOrderLevel={3,2,1}, quantityCorrectionFactor=0.8, probability={10, 15, 20}},		-- Enoki Pilze
	RICESAPLINGS 		= {groupName="Productions easy", isAllowed=true, minOrderLevel={3,2,1}, quantityCorrectionFactor=0.8, probability={10, 15, 20}},		-- Reis Setzlinge
	CHILLI 				= {groupName="Productions easy", isAllowed=true, minOrderLevel={3,2,1}, quantityCorrectionFactor=0.8, probability={10, 15, 20}},		-- Chillischoten
	NAPACABBAGE 		= {groupName="Productions easy", isAllowed=true, minOrderLevel={3,2,1}, quantityCorrectionFactor=0.8, probability={10, 15, 20}},		-- Chinakohl
	SPRING_ONION 		= {groupName="Productions easy", isAllowed=true, minOrderLevel={3,2,1}, quantityCorrectionFactor=0.8, probability={10, 15, 20}},		-- Frühlingslauch

	-- Factory products
	SEEDS				= {groupName="Productions easy", isAllowed=true, minOrderLevel={3}, quantityCorrectionFactor=1.0, probability={0, 20, 20}},		-- Samen
	DIESEL 				= {groupName="Productions easy", isAllowed=true, minOrderLevel={3}, quantityCorrectionFactor=1.0, probability={0, 20, 20}},		-- Diesel
	FORAGE 				= {groupName="Productions easy", isAllowed=true, minOrderLevel={2}, quantityCorrectionFactor=1.0, probability={20}},
	SUGARBEET_CUT		= {groupName="Productions easy", isAllowed=true, minOrderLevel={4}, quantityCorrectionFactor=0.4, probability={20}},		-- Zuckerrübenschnitzel
	POTATO_CUT			= {groupName="Productions easy", isAllowed=true, minOrderLevel={4}, quantityCorrectionFactor=0.4, probability={20}},

	-- Straw, grass and chaff
	STRAW 				= {groupName="Windrowed, Silaged, Chopped", isAllowed=true, minOrderLevel={2}, quantityCorrectionFactor=0.4, probability={20}},		-- Stroh
	GRASS_WINDROW 		= {groupName="Windrowed, Silaged, Chopped", isAllowed=true, minOrderLevel={2}, quantityCorrectionFactor=0.4, probability={20}},		-- Gras
	DRYGRASS_WINDROW 	= {groupName="Windrowed, Silaged, Chopped", isAllowed=true, minOrderLevel={2}, quantityCorrectionFactor=0.4, probability={20}},		-- Heu
	SILAGE 				= {groupName="Windrowed, Silaged, Chopped", isAllowed=true, minOrderLevel={2}, quantityCorrectionFactor=0.5, probability={30}, probabilityMaizePlus=20, quantityCorrectionFactorMaizePlus=0.3},		-- Silage
	CHAFF 				= {groupName="Windrowed, Silaged, Chopped", isAllowed=true, minOrderLevel={2}, quantityCorrectionFactor=0.4, probability={30}, probabilityMaizePlus=20, quantityCorrectionFactorMaizePlus=0.3},		-- Häckselgut

	-- MaizePlus
	-- GRASS_FERMENTED			= {groupName="Windrowed, Silaged, Chopped", isAllowed=true, minOrderLevel={3}, quantityCorrectionFactor=0.4, probability={20}},
	-- CHOPPEDMAIZE			= {groupName="Windrowed, Silaged, Chopped", isAllowed=true, minOrderLevel={3}, quantityCorrectionFactor=0.7, probability={30}},
	-- CHOPPEDMAIZE_FERMENTED	= {groupName="Windrowed, Silaged, Chopped", isAllowed=true, minOrderLevel={3}, quantityCorrectionFactor=0.7, probability={30}},
	-- CCM						= {groupName="Productions easy", isAllowed=true, minOrderLevel={3}, quantityCorrectionFactor=0.4, probability={20}},
	-- CCMRAW					= {groupName="Productions easy", isAllowed=true, minOrderLevel={3}, quantityCorrectionFactor=0.4, probability={20}},
	-- GRAINGRIST				= {groupName="Productions easy", isAllowed=true, minOrderLevel={3}, quantityCorrectionFactor=0.4, probability={20}},

	-- TerraLifePlus
	-- WINTERWHEAT 		= {groupName="Basic Crops", isAllowed=true, minOrderLevel={1}, quantityCorrectionFactor=1.0, probability={30}},
	-- WINTERBARLEY 		= {groupName="Basic Crops", isAllowed=true, minOrderLevel={1}, quantityCorrectionFactor=1.0, probability={30}},
	-- TRITICALE 			= {groupName="Basic Crops", isAllowed=true, minOrderLevel={1}, quantityCorrectionFactor=1.0, probability={30}},
	-- SPELT 				= {groupName="Basic Crops", isAllowed=true, minOrderLevel={1}, quantityCorrectionFactor=1.0, probability={30}},
	-- RYE 				= {groupName="Basic Crops", isAllowed=true, minOrderLevel={1}, quantityCorrectionFactor=1.0, probability={30}},
	-- VETCHRYE 			= {groupName="Basic Crops", isAllowed=true, minOrderLevel={1}, quantityCorrectionFactor=1.0, probability={30}},
	-- MUSTARD 			= {groupName="Basic Crops", isAllowed=true, minOrderLevel={1}, quantityCorrectionFactor=1.0, probability={30}},
	-- LINSEED 			= {groupName="Basic Crops", isAllowed=true, minOrderLevel={1}, quantityCorrectionFactor=1.0, probability={30}},
	-- SILAGEMAIZE 		= {groupName="Basic Crops", isAllowed=true, minOrderLevel={2}, quantityCorrectionFactor=1.0, probability={30}},
	-- SILAGESORGHUM 		= {groupName="Basic Crops", isAllowed=true, minOrderLevel={2}, quantityCorrectionFactor=1.0, probability={30}},
	-- STARCHPOTATO 		= {groupName="Basic Crops", isAllowed=true, minOrderLevel={3}, quantityCorrectionFactor=1.0, probability={30}},
	-- FODDERBEET 			= {groupName="Basic Crops", isAllowed=true, minOrderLevel={3}, quantityCorrectionFactor=1.0, probability={30}},
	-- FODDERCARROT 		= {groupName="Basic Crops", isAllowed=true, minOrderLevel={3}, quantityCorrectionFactor=0.6, probability={30}},
	-- ONION 				= {groupName="Basic Crops", isAllowed=true, minOrderLevel={3}, quantityCorrectionFactor=0.6, probability={30}},


	-- MaizePlus - only allowed if fruittype exists
	-- CARROT					= {isAllowed=true, minOrderLevel=3, quantityCorrectionFactor=0.4, probability=70, neededFruittype="CARROT"},
	-- CLOVER_WINDROW			= {groupName="Windrowed, Silaged, Chopped", isAllowed=true, minOrderLevel={2}, quantityCorrectionFactor=0.4, probability={20}, neededFruittype="CLOVER"},
	-- DRYCLOVER_WINDROW		= {groupName="Windrowed, Silaged, Chopped", isAllowed=true, minOrderLevel={3}, quantityCorrectionFactor=0.4, probability={20}, neededFruittype="CLOVER"},
	-- CLOVER_FERMENTED		= {groupName="Windrowed, Silaged, Chopped", isAllowed=true, minOrderLevel={3}, quantityCorrectionFactor=0.4, probability={20}, neededFruittype="CLOVER"},
	-- ALFALFA_WINDROW			= {groupName="Windrowed, Silaged, Chopped", isAllowed=true, minOrderLevel={2}, quantityCorrectionFactor=0.4, probability={20}, neededFruittype="ALFALFA"},
	-- DRYALFALFA_WINDROW		= {groupName="Windrowed, Silaged, Chopped", isAllowed=true, minOrderLevel={3}, quantityCorrectionFactor=0.4, probability={20}, neededFruittype="ALFALFA"},
	-- ALFALFA_FERMENTED		= {groupName="Windrowed, Silaged, Chopped", isAllowed=true, minOrderLevel={3}, quantityCorrectionFactor=0.4, probability={20}, neededFruittype="ALFALFA"},
	-- DRYHORSEGRASS_WINDROW	= {groupName="Windrowed, Silaged, Chopped", isAllowed=true, minOrderLevel={3}, quantityCorrectionFactor=0.4, probability={20}, neededFruittype="HORSEGRASS"},
	-- HORSEGRASS_FERMENTED	= {groupName="Windrowed, Silaged, Chopped", isAllowed=true, minOrderLevel={3}, quantityCorrectionFactor=0.4, probability={20}, neededFruittype="HORSEGRASS"},

	-- other new Filltypes
	-- LUCERNE_WINDROW			= {groupName="Windrowed, Silaged, Chopped", isAllowed=true, minOrderLevel={2}, quantityCorrectionFactor=0.4, probability={20}, neededFruittype="LUCERNE"},
	-- DRYLUCERNE_WINDROW		= {groupName="Windrowed, Silaged, Chopped", isAllowed=true, minOrderLevel={3}, quantityCorrectionFactor=0.4, probability={20}, neededFruittype="LUCERNE"},

	-- MaizePlus - not allowed because is only buyable
	-- CROP_WINDROW			= {isAllowed=false, minOrderLevel={3}, quantityCorrectionFactor=0.4, probability={0}},
	-- WETGRASS_WINDROW		= {isAllowed=false, minOrderLevel={3}, quantityCorrectionFactor=0.4, probability={0}},
	-- SEMIDRYGRASS_WINDROW	= {isAllowed=false, minOrderLevel={3}, quantityCorrectionFactor=0.4, probability={0}},
	-- BREWERSGRAIN			= {isAllowed=false, minOrderLevel={3}, quantityCorrectionFactor=0.4, probability={0}},
	-- BREWERSGRAIN_FERMENTED	= {isAllowed=false, minOrderLevel={3}, quantityCorrectionFactor=0.4, probability={0}},
	-- BEETPULP				= {isAllowed=false, minOrderLevel={3}, quantityCorrectionFactor=0.4, probability={0}},
	-- BEETPULP_FERMENTED		= {isAllowed=false, minOrderLevel={3}, quantityCorrectionFactor=0.4, probability={0}},
	-- MOLASSES				= {isAllowed=false, minOrderLevel={3}, quantityCorrectionFactor=0.4, probability={0}},
	-- CLEAREDWATER			= {isAllowed=false, minOrderLevel={3}, quantityCorrectionFactor=0.4, probability={0}},
	-- HAYPELLETS				= {isAllowed=false, minOrderLevel={3}, quantityCorrectionFactor=0.4, probability={0}},
	-- CHICKENFOOD				= {isAllowed=false, minOrderLevel={3}, quantityCorrectionFactor=0.4, probability={0}},
	-- FEEDPELLETS				= {isAllowed=false, minOrderLevel={3}, quantityCorrectionFactor=0.4, probability={0}},
	-- HORSEFOOD				= {isAllowed=false, minOrderLevel={3}, quantityCorrectionFactor=0.4, probability={0}},
	-- MINERALS				= {isAllowed=false, minOrderLevel={3}, quantityCorrectionFactor=0.4, probability={0}},
	-- PIGFOOD2				= {isAllowed=false, minOrderLevel={3}, quantityCorrectionFactor=0.4, probability={0}},
	-- POWERFOOD				= {isAllowed=false, minOrderLevel={3}, quantityCorrectionFactor=0.4, probability={0}},
	-- SHEEPFOOD				= {isAllowed=false, minOrderLevel={3}, quantityCorrectionFactor=0.4, probability={0}}
}