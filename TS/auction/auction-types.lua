local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.Clan = 0
v1[0] = "Clan"
v2.ClanIndividual = 1
v1[1] = "ClanIndividual"
local v3 = {
    [v2.Clan] = {
        ["name"] = "Clan"
    },
    [v2.ClanIndividual] = {
        ["name"] = "Personal"
    }
}
local v4 = {}
local v5 = setmetatable({}, {
    ["__index"] = v4
})
v5.BidTooLow = 0
v4[0] = "BidTooLow"
v5.PlayerSpamming = 1
v4[1] = "PlayerSpamming"
v5.InsufficientFunds = 2
v4[2] = "InsufficientFunds"
v5.AlreadyOwnsItem = 3
v4[3] = "AlreadyOwnsItem"
v5.ClanMemberUnauthorized = 4
v4[4] = "ClanMemberUnauthorized"
v5.DataStoreError = 5
v4[5] = "DataStoreError"
return {
    ["AuctionType"] = v2,
    ["AuctionTypeMeta"] = v3,
    ["BidErrorKind"] = v5
}