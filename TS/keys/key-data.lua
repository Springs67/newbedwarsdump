return {
    ["makeStarterKeysDataProfileData"] = function() --[[ Name: makeStarterKeysDataProfileData, Line 2 ]]
        return {
            ["keys"] = {},
            ["usedKeys"] = {}
        }
    end,
    ["makeStarterKeyProfileData"] = function() --[[ Name: makeStarterKeyProfileData, Line 8 ]]
        return {
            ["totalKeysGained"] = 0,
            ["totalKeysUsed"] = 0,
            ["keyRegenStartTime"] = nil,
            ["keys"] = {}
        }
    end
}