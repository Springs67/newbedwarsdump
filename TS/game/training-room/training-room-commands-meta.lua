local u1 = {
    [0] = {
        ["commandName"] = "/resetDummies",
        ["commandDescription"] = "Resets and spawns all dummies back to their original positions"
    },
    [1] = {
        ["commandName"] = "/setSpeed [value]",
        ["commandDescription"] = "Changes all moving dummy speeds to the desired speed"
    }
}
return {
    ["getTrainingRoomCommandsMeta"] = function(p2) --[[ Name: getTrainingRoomCommandsMeta, Line 12 ]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        return u1[p2]
    end,
    ["TrainingRoomCommandsMeta"] = u1
}