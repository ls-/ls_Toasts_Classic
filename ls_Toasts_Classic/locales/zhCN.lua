local _, addon = ...
local L = addon.L

-- Lua
local _G = getfenv(0)

if GetLocale() ~= "zhCN" then return end

L["ANCHOR_FRAME_#"] = "锚点框架#%d"
L["ANCHOR_FRAMES"] = "锚点框架"
L["ANCHOR_RESET_DESC"] = "|cffffffffShift 点击左键|r 重置位置。"
L["BORDER"] = "边框"
L["CHANGELOG"] = "更新日志"
L["COORDS"] = "方位"
L["COPPER_THRESHOLD"] = "拾取最小值(铜)"
L["COPPER_THRESHOLD_DESC"] = "至少要多少銅才会显示拾取提示面板。"
L["CURRENCY_THRESHOLD_DESC"] = "输入 |cffffd200-1|r 可忽略货币，输入 |cffffd2000|r 可禁用筛选器，或输入 |cffffd200 大于 0|r 的任意数字可设置阈值，低于该阈值将不创建 Toast。"
L["DEFAULT_VALUE"] = "默认参数：|cffffd200%s|r"
L["DND"] = "勿扰"
L["DOWNLOADS"] = "下载"
L["FADE_OUT_DELAY"] = "淡出延迟"
L["FLUSH_QUEUE"] = "刷新分组"
L["FONTS"] = "字体"
L["GROWTH_DIR"] = "延伸方向"
L["ICON_BORDER"] = "图标边框"
L["ITEM_FILTERS_DESC"] = "这些物品会忽略战利品质量阈值。"
L["NEW_CURRENCY_FILTER_DESC"] = "输入货币 ID。"
L["NEW_ITEM_FILTER_DESC"] = "输入项目 ID。"
L["RARITY_THRESHOLD"] = "品质限定"
L["SCALE"] = "缩放"
L["SKIN"] = "皮肤"
L["STRATA"] = "层级"
L["TEST"] = "测试"
L["TEST_ALL"] = "测试全部"
L["THRESHOLD"] = "临界点"
L["TOAST_NUM"] = "提示框数量"
L["TOAST_TYPES"] = "提示框类型"
L["TOGGLE_ANCHORS"] = "移动位置"
L["TRACK_LOSS"] = "追踪损失"
L["TRACK_LOSS_DESC"] = "开启该选项后将忽略 拾取最小值 设置。"
L["TYPE_LOOT_CURRENCY"] = "拾取(货币)"
L["TYPE_LOOT_GOLD"] = "拾取(金币)"
L["YOU_LOST"] = "你损失了"
L["YOU_RECEIVED"] = "你获得了"
