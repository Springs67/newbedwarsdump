local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.NEW_PLAYER_BUNDLE = "new_player_bundle"
v1.new_player_bundle = "NEW_PLAYER_BUNDLE"
local u3 = {
    [v2.NEW_PLAYER_BUNDLE] = {
        ["autoAlertInterval"] = 43200
    }
}
return {
    ["UIAlert"] = v2,
    ["UIAlertMeta"] = u3,
    ["GetUIAlertMetadata"] = function(p4) --[[ Line: 16 ]]
        --[[
        Upvalues:
            [1] = u3
        --]]
        return u3[p4]
    end
}