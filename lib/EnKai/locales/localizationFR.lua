local addonInfo, privateVars = ...

if ( Inspect.System.Language() == "French"  ) then

	privateVars.langTexts = {	addonUpdate	= '<font color="#FF6A00">New version <font color="#FFFFFF">%s</font> of addon <font color="#FFFFFF">%s</font> available. Please update the addon.</font>',
							requiredFaction = 'Requires %s:\n%s',
							factionList = {"Friendly", "Decorated", "Honored", "Revered", "Glorified", "Venerated"},
							yes  = 'Yes',
							no = 'No',
							ok = 'Ok',
							cancel = 'Cancel',
							bop = 'Bind on Pickup',
							account = 'Account Bound',
							bound = 'Soldbound',
							boundText		= { equip = 'Bin on equip', use = "Bind on use", pickup = "Bind on pickup", account = "Account bound"},
							dps = "Damage per second: %.1f\n%d-%d Damage all %1.f seconds",
							stats		= { armor 		= "Armor", 
											block 		= "Block",
											critAttack	= "Physical Crit",
											critPower	= "Critical Power",
											critSpell	= "Spell Hit",
											deflect		= "Deflect",
											dexterity	= "Dexterity",
											dodge		= "Dodge",
											endurance	= "Endurance",
											hit			= "Hit",
											intelligence= "Intelligence",
											parry		= "Parry",
											powerAttack = "Attackpower",
											powerSpell	= "Spellpower",
											resistAir	= "Resistance Air",
											resistAll	= "Resistance All",
											resistDeath	= "Resistance Death",
											resistEarth	= "Resistance Earth",
											resistFire	= "Resistance Fire",
											resistLife	= "Resistance Life",
											resistWater	= "Resistance Water",
											strength	= "Strength",
											wisdom		= "Wisdom",
											valor		= "Valor",
											toughness	= "Toughness",
											vengeance	= "Vengeance" },				
							equip		= "Equip: %s",
							use			= "Use: %s",		
							requiredLevel = "Requires level %d",
							requiredCalling = "Calling: %s",
							callings		= { mage = "Mage", rogue = "Rogue", warrior = "Warrior", cleric = "Cleric"}		
				}
	privateVars.langTexts.items = {
		txtCape = 'Cape',
		txtStaff = 'A deux mains - bâton',
		txtTwoHand = 'A deux mains',
		txtHammer = 'Marteau',
		txtPolearm = 'Arme d\'hast',
		txtSword = 'Epée',
		txtAxe = 'Hache',
		txtMace = 'Masse',
		txtDagger = 'Dague',
		txtEssenceLesser = 'Essence inférieure',
		txtEssenceGreater = 'Essence supérieure',
		txtMainhand = 'Main principale',
		txtOneHand = 'Une main',
		txtWand = 'Baguette',
		txtGun = 'Arme à feu',
		txtBow = 'Arc',
		txtHelmet = 'Tête',
		txtPlate = 'Armure de plates',
		txtLeather = 'Cuir',
		txtChain = 'Armure de mailles',
		txtCloth = 'Etoffe',
		txtShoulders = 'Epaules',
		txtChest = 'Torse',
		txtGloves = 'Mains',
		txtBelt = 'Taille',
		txtLegs = 'Jambes',
		txtFeet = 'Pieds',
		txtRing = 'Anneau',
		txtOffhand = 'Main secondaire',
		txtNeck = 'Cou',
		txtShield = 'Bouclier',
		txtTrinket = 'Talisman',
		txtPet = 'Compagnon',
		txtCurrency = 'Monnaie',
		txtMount = 'Monture',
		txtOther = 'Autre',
		txtSynergyCrystal = 'Cristal de synergie',
		txtFocus = 'Focus planaire',
		txtRecipe = 'Recette',
		txtLure = 'Leurre',
		txtHusk = 'Gradalis',
		txtRune = 'Rune',
		txtConsumable = 'Consommable',
		txtCostume = 'Costume',
		txtTitle = 'Titre',
		txtContainer = 'Boîte',
		txtSeal = 'Sceau',
		txtDimension = 'Dimension item',
		txtItemUpgrade = 'Upgrade item',
	}
	
	privateVars.langTexts.profession = {
		txtApothecary = 'Apothicaire',
		txtArtificer = 'Artificier',
		txtRunecrafter = 'Fabricant de runes',
		txtWeaponsmith = 'Fabricant d\'armes',
		txtOutfitter = 'Tailleur',
		txtArmorsmith = 'Fabricant d\'armures',
	}
end