local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").AnalyticsService
local v2 = {}
local u3 = { Enum.AnalyticsCustomFieldKeys.CustomField01.Name, Enum.AnalyticsCustomFieldKeys.CustomField02.Name, Enum.AnalyticsCustomFieldKeys.CustomField03.Name }
function v2.LogCustomEvent(p4, p5, p6, p7, p8, p9) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u1
    --]]
    local v10 = {}
    if p7 ~= "" and p7 then
        v10[u3[1]] = p7
    end
    if p7 ~= "" and p7 then
        v10[u3[2]] = p8
    end
    if p7 ~= "" and p7 then
        v10[u3[3]] = p9
    end
    u1:LogCustomEvent(p4, p5, p6, v10)
end
return {
    ["AnalyticsServiceUtil"] = v2
}