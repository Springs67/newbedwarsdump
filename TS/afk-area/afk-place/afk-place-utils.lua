local v1 = {
    ["Theme"] = {
        ["font"] = Enum.Font.GothamBold,
        ["headingOneSize"] = UDim2.fromScale(1, 0.15),
        ["headingTwoSize"] = UDim2.fromScale(1, 0.075),
        ["headingThreeSize"] = UDim2.fromScale(1, 0.05)
    },
    ["Tween"] = {
        ["textTransitionTime"] = 1,
        ["textFadeInTime"] = 0.75,
        ["loadingScreenTransitionTime"] = 0.75
    },
    ["baseExperiencePerHour"] = 1200,
    ["baseAfkCoinsPerHour"] = 1200,
    ["baseAfkBedCoinsPerHour"] = 60,
    ["vipMultiplier"] = 0.15,
    ["premiumMultiplier"] = 0.15
}
return {
    ["AfkPlaceUtils"] = v1
}