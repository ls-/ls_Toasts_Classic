local _, addon = ...
local L = addon.L

-- Lua
local _G = getfenv(0)

if GetLocale() ~= "frFR" then return end

L["ANCHOR_FRAME_#"] = "Fenêtre d'ancrage #%d"
L["ANCHOR_FRAMES"] = "Fenêtres d'ancrage"
L["ANCHOR_RESET_DESC"] = "|cffffffffShift click|r pour réinitialiser la position."
L["BORDER"] = "Bordure"
L["CHANGELOG"] = "Liste des changements "
L["CHANGELOG_FULL"] = "Tout"
L["COORDS"] = "Coordonnées"
L["COPPER_THRESHOLD"] = "Seuil (en pièces de cuivre)"
L["COPPER_THRESHOLD_DESC"] = "Seuil minimum en pièce de cuivre permettant de générer un 'Toast'"
L["CURRENCY_THRESHOLD_DESC"] = "Entrez |cffffd200-1|r pour ignorer la devise, |cffffd2000|r pour désactiver le filtre, ou |cffffd200tout nombre supérieur à 0|r pour définir le seuil en dessous duquel aucun toast ne sera créé."
L["DEFAULT_VALUE"] = "Valeur par défaut : |cffffd200%s|r"
L["DND"] = "NPD"
L["DOWNLOADS"] = "Téléchargements"
L["FADE_OUT_DELAY"] = "Délai de disparition en fondu"
L["FLUSH_QUEUE"] = "Vider la file d'attente"
L["FONTS"] = "Polices"
L["GROWTH_DIR"] = "Sens d'affichage"
L["ICON_BORDER"] = "Bordure d'icône"
L["NEW_CURRENCY_FILTER_DESC"] = "Entrez un ID de monnaie."
L["RARITY_THRESHOLD"] = "Seuil de rareté"
L["SCALE"] = "Echelle"
L["SKIN"] = "Apparence"
L["STRATA"] = "Strate"
L["TEST"] = "Test"
L["TEST_ALL"] = "Tester tout"
L["THRESHOLD"] = "Rareté"
L["TOAST_NUM"] = "Nombre de 'Toast' simultanés"
L["TOAST_TYPES"] = "Types de 'Toast'"
L["TOGGLE_ANCHORS"] = "Basculer les Ancres"
L["TRACK_LOSS"] = "Suivre les pertes"
L["TRACK_LOSS_DESC"] = "Cette option ignore le seuil défini pour le Cuivre."
L["TYPE_LOOT_CURRENCY"] = "Butin (Breloques)"
L["TYPE_LOOT_GOLD"] = "Butin (Gold)"
L["YOU_LOST"] = "Vous avez perdu"
L["YOU_RECEIVED"] = "Vous avez reçu"
