local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local v2 = v1.ColorUtil
local v3 = v1.DeviceUtil
local v4 = v1.GameTheme
local v5 = {
    ["invTileTransparency"] = 0,
    ["nametagBackgroundTransparency"] = 0.6,
    ["topBarTopOffset"] = 4,
    ["topBarHorizontalOffset"] = 60,
    ["topBarGuiSpacing"] = 12,
    ["topBarGuiSize"] = 32,
    ["topBarGuiInset"] = 40,
    ["topBarBGTransparency"] = 0.35,
    ["promptHoldDuration"] = 0.3,
    ["backgroundPrimary"] = Color3.fromRGB(100, 103, 167),
    ["backgroundSecondary"] = Color3.fromRGB(78, 80, 130),
    ["backgroundTertiary"] = Color3.fromRGB(63, 65, 105),
    ["backgroundSuccess"] = v2.hexColor(2600544),
    ["backgroundError"] = v2.hexColor(15423319),
    ["interactionPrimary"] = v2.hexColor(3487320),
    ["textPrimary"] = v2.hexColor(12172543),
    ["textPrimaryRichText"] = v2.richTextColor(Color3.fromRGB(185, 188, 255)),
    ["textSecondary"] = v2.hexColor(13224408),
    ["textSecondaryRichText"] = v2.richTextColor(v2.hexColor(13224408)),
    ["invBackgroundPrimary"] = v2.hexColor(1909806),
    ["mcGreen"] = v2.hexColor(5635925),
    ["mcAqua"] = v2.hexColor(5636095),
    ["mcRed"] = v2.hexColor(16733525),
    ["mcYellow"] = v2.hexColor(16777045),
    ["mcPink"] = v2.hexColor(16733695),
    ["centerTopAnnouncementCardSize"] = UDim2.fromScale(0.6, 0.06),
    ["actionBarProgressBarSize"] = UDim2.fromScale(1, 0.03),
    ["actionBarButtonSize"] = UDim2.fromScale(1, 0.05),
    ["promptKeyboardKey"] = Enum.KeyCode.F,
    ["cooldownBarSize"] = UDim2.fromScale(0.75, 0.02)
}
local v6 = {}
for v7, v8 in v4 do
    v6[v7] = v8
end
for v9, v10 in v5 do
    v6[v9] = v10
end
v6.mcGray = v2.hexColor(11184810)
v6.mcDarkGray = v2.hexColor(5592405)
v6.mcGold = v2.hexColor(16689920)
v6.mcDarkBlue = v2.hexColor(170)
v6.mcBlue = v2.hexColor(5593086)
v6.mcDarkAqua = v2.hexColor(43690)
v6.mcDarkRed = v2.hexColor(11141120)
v6.buttonPrimary = v2.hexColor(6185658)
v6.backgroundTertiaryCard = Color3.fromRGB(47, 49, 80)
v6.widgetSize = UDim2.fromOffset(865, 500)
local v11
if v3.isSmallScreen() then
    v11 = Vector2.new(605.5, 600)
else
    v11 = Vector2.new(1211, 700)
end
v6.widgetScaleComponentMaxSize = v11
local v12
if v3.isSmallScreen() then
    v12 = Vector2.new(72, 72)
else
    v12 = Vector2.new(36, 36)
end
v6.widgetScaleComponentScreenPadding = v12
return {
    ["GameThemeOverrides"] = v5,
    ["Theme"] = v6
}