local _, addon = ...
local L = addon.L

-- Lua
local _G = getfenv(0)

if GetLocale() ~= "esMX" then return end

L["ANCHOR_FRAME_#"] = "Marco de anclaje #%d"
L["ANCHOR_FRAMES"] = "Marcos de anclaje"
L["ANCHOR_RESET_DESC"] = "|cffffffffShift click|r para reiniciar la posición."
L["BORDER"] = "Borde"
L["COORDS"] = "Coordenadas"
L["COPPER_THRESHOLD"] = "Límite de Cobre"
L["COPPER_THRESHOLD_DESC"] = "Cantidad mínima de Cobre con la que mostrar un Toast."
L["DEFAULT_VALUE"] = "Valor por defecto: |cffffd200%s|r"
L["DND"] = "DND"
L["FADE_OUT_DELAY"] = "Retraso de desvanecimiento"
L["FLUSH_QUEUE"] = "Limpiar cola"
L["FONTS"] = "Fuentes"
L["GROWTH_DIR"] = "Dirección de aparición"
L["GROWTH_DIR_DOWN"] = "Abajo"
L["GROWTH_DIR_LEFT"] = "Izquierda"
L["GROWTH_DIR_RIGHT"] = "Derecha"
L["GROWTH_DIR_UP"] = "Arriba"
L["ICON_BORDER"] = "Borde de icono"
L["RARITY_THRESHOLD"] = "Límite de rareza"
L["SCALE"] = "Escala"
L["SIZE"] = "Tamaño"
L["SKIN"] = "Apariencia"
L["STRATA"] = "Altura"
L["TEST"] = "Test"
L["TEST_ALL"] = "Test todo"
L["TOAST_NUM"] = "Número de toasts"
L["TOAST_TYPES"] = "Tipos de Toasts"
L["TOGGLE_ANCHORS"] = "Alternar anclajes"
L["TRACK_LOSS"] = "Mostrar pérdidas"
L["TRACK_LOSS_DESC"] = "Esta opción ignora el margen de cobre establecido."
L["TYPE_LOOT_CURRENCY"] = "Botín (Moneda)"
L["TYPE_LOOT_GOLD"] = "Botín (Oro)"
L["YOU_LOST"] = "Has perdido"
L["YOU_RECEIVED"] = "Has recibido"
