local _, addon = ...
local L = addon.L

-- Lua
local _G = getfenv(0)

if GetLocale() ~= "itIT" then return end

L["ANCHOR_RESET_DESC"] = "|cffffffffSHIFT clicca|r per reimpostare la posizione."
L["BORDER"] = "Bordo"
L["COORDS"] = "Coordinate"
L["COPPER_THRESHOLD"] = "Soglia rame"
L["COPPER_THRESHOLD_DESC"] = "Minimo ammontare di rame per creare un toast."
L["CURRENCY_THRESHOLD_DESC"] = "Inserisci |cffffd200-1|r per ignorare la valuta, |cffffd2000|r per disabilitare il filtro, o |cffffd200un qualsiasi numero sopra 0|r per impostare una soglia sotto la quale i toast non verranno creati."
L["DEFAULT_VALUE"] = "Valore predefinito: |cffffd200%s|r"
L["DND"] = "ND"
L["FADE_OUT_DELAY"] = "Ritardo dissolvenza in uscita"
L["FLUSH_QUEUE"] = "Azzera coda"
L["GROWTH_DIR"] = "Direzione crescita"
L["ICON_BORDER"] = "Bordo icone"
L["NEW_CURRENCY_FILTER_DESC"] = "Inserici l'ID della valuta."
L["RARITY_THRESHOLD"] = "Soglia rarità"
L["SCALE"] = "Scala"
L["TEST"] = "Prova"
L["TEST_ALL"] = "Prova tutte"
L["THRESHOLD"] = "Soglia"
L["TOAST_NUM"] = "Numero di toast"
L["TOAST_TYPES"] = "Tipi toast"
L["TOGGLE_ANCHORS"] = "Attiva / Disattiva Anchors"
L["TRACK_LOSS"] = "Ignora soglia"
L["TRACK_LOSS_DESC"] = "Con questa opzione ignori la soglia di rame."
L["TYPE_LOOT_CURRENCY"] = "Bottino (Valute)"
L["TYPE_LOOT_GOLD"] = "Bottino (Oro)"
L["YOU_LOST"] = "Hai perso"
L["YOU_RECEIVED"] = "Hai ricevuto"
