-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local WatchCollectionTag = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local ReplicatedStorage = v2.ReplicatedStorage;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local v3 = {};
local u4 = setmetatable({}, {
    __index = v3
});
u4.NONE = "None";
v3.None = "NONE";
u4.SMALL = "Small";
v3.Small = "SMALL";
u4.MEDIUM = "Medium";
v3.Medium = "MEDIUM";
u4.LARGE = "Large";
v3.Large = "LARGE";
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 30, Name: __tostring
        return "ChestItemDisplayController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 36
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 40
    -- upvalues: KnitController (copy)
    KnitController.constructor(p7);
    p7.Name = "ChestItemDisplayController";
    p7.gameChestMap = {};
end;

function u5.KnitStart(u8) -- Line: 45
    -- upvalues: KnitController (copy), WatchCollectionTag (copy), ItemType (copy), ReplicatedStorage (copy), Players (copy)
    KnitController.KnitStart(u8);
    WatchCollectionTag("team-crate", function(p9) -- Line: 47
        -- upvalues: ItemType (ref), u8 (copy)
        if p9.Name ~= ItemType.TEAM_CRATE then
            return nil;
        end;

        local ChestFolderValue = p9:WaitForChild("ChestFolderValue", 1);

        if not ChestFolderValue then
            return nil;
        end;

        local Value = ChestFolderValue.Value;

        if not Value then
            return nil;
        end;

        u8:initChest(p9, Value);
    end);
    WatchCollectionTag("chest", function(p10) -- Line: 61
        -- upvalues: ItemType (ref), ReplicatedStorage (ref), Players (ref), u8 (copy)
        if p10.Name ~= ItemType.PERSONAL_CHEST and p10.Name ~= ItemType.OG_PERSONAL_CHEST then
            return nil;
        end;

        local Inventories = ReplicatedStorage:WaitForChild("Inventories", 1);

        if Inventories ~= nil then
            Inventories = Inventories:WaitForChild(Players.LocalPlayer.Name .. "_personal", 1);
        end;

        if not Inventories then
            return nil;
        end;

        u8:initChest(p10, Inventories);
    end);
end;

function u5.initChest(u11, u12, p13) -- Line: 76
    u11.gameChestMap[u12] = {};
    u11:updateChestDisplay(u12);

    local function _(p14) -- Line: 82
        -- upvalues: u11 (copy), u12 (copy)
        u11:watchChestDisplayItem(u12, p14);
    end;

    for i, child in p13:GetChildren() do
        local _ = i - 1;
        u11:watchChestDisplayItem(u12, child);
    end;

    p13.ChildAdded:Connect(function(p15) -- Line: 88
        -- upvalues: u11 (copy), u12 (copy)
        u11:watchChestDisplayItem(u12, p15);
    end);
    p13.ChildRemoved:Connect(function(p16) -- Line: 91
        -- upvalues: u11 (copy), u12 (copy)
        if p16:IsA("Accessory") then
            local Name = p16.Name;

            if u11:isDisplayItem(Name) then
                local v17 = u11.gameChestMap[u12];

                if not v17 then
                    return nil;
                end;

                v17[Name] = 0;
                u11:updateChestDisplay(u12);
            end;
        end;
    end);
end;

function u5.watchChestDisplayItem(u18, u19, u20) -- Line: 107
    u18:syncChestDisplayItem(u19, u20);

    if u20:IsA("Accessory") and u18:isDisplayItem(u20.Name) then
        u20:GetAttributeChangedSignal("Amount"):Connect(function() -- Line: 110
            -- upvalues: u18 (copy), u19 (copy), u20 (copy)
            u18:syncChestDisplayItem(u19, u20);
        end);
    end;
end;

function u5.syncChestDisplayItem(p21, p22, p23) -- Line: 115
    if not p23:IsA("Accessory") then
        return nil;
    end;

    if not p21:isDisplayItem(p23.Name) then
        return nil;
    end;

    local v24 = p23:GetAttribute("Amount");
    p21:setChestItems(p22, p23.Name, (math.max(0, v24 == nil and 0 or v24)));
end;

function u5.isDisplayItem(p25, p26) -- Line: 133
    -- upvalues: ItemType (copy)
    return (p26 == ItemType.IRON or p26 == ItemType.DIAMOND) and true or p26 == ItemType.EMERALD;
end;

function u5.setChestItems(p27, p28, p29, p30) -- Line: 136
    local v31 = p27.gameChestMap[p28];

    if not v31 then
        return nil;
    end;

    v31[p29] = p30;
    p27.gameChestMap[p28] = v31;
    p27:updateChestDisplay(p28);
end;

function u5.getChestItems(p32, p33) -- Line: 153
    return p32.gameChestMap[p33];
end;

function u5.updateChestDisplay(p34, p35) -- Line: 158
    -- upvalues: ItemType (copy), u4 (ref)
    local v36 = p34:getChestItems(p35);

    if not v36 then
        return nil;
    end;

    local v37 = v36[ItemType.IRON];
    local v38 = v36[ItemType.DIAMOND];
    local v39 = v36[ItemType.EMERALD];
    local v40 = p34:getIronGroup(v37 == nil and 0 or v37);
    local v41 = p34:getDiamondGroup(v38 == nil and 0 or v38);
    local v42 = p34:getEmeraldGroup(v39 == nil and 0 or v39);
    local CrateDisplays = p35:WaitForChild("CrateDisplays", 1);

    if not CrateDisplays then
        return nil;
    end;

    local v43;

    if v40 == u4.NONE then
        v43 = nil;
    else
        v43 = CrateDisplays:FindFirstChild("Iron" .. v40);
    end;

    local v44;

    if v41 == u4.NONE then
        v44 = nil;
    else
        v44 = CrateDisplays:FindFirstChild("Diamond" .. v41);
    end;

    local v45;

    if v42 == u4.NONE then
        v45 = nil;
    else
        v45 = CrateDisplays:FindFirstChild("Emerald" .. v42);
    end;

    local function _(p46) -- Line: 192
        if p46:IsA("BasePart") or p46:IsA("MeshPart") then
            p46.Transparency = 1;

            return;
        end;

        if p46:IsA("ParticleEmitter") then
            p46.Enabled = false;
        end;
    end;

    for i, descendant in CrateDisplays:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("BasePart") or descendant:IsA("MeshPart") then
            descendant.Transparency = 1;
        elseif descendant:IsA("ParticleEmitter") then
            descendant.Enabled = false;
        end;
    end;

    if v43 then
        local function _(p47) -- Line: 204
            if p47:IsA("BasePart") or p47:IsA("MeshPart") then
                p47.Transparency = 0;

                return;
            end;

            if p47:IsA("ParticleEmitter") then
                p47.Enabled = true;
            end;
        end;

        for i, descendant in v43:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") or descendant:IsA("MeshPart") then
                descendant.Transparency = 0;
            elseif descendant:IsA("ParticleEmitter") then
                descendant.Enabled = true;
            end;
        end;
    end;

    if v44 then
        local function _(p48) -- Line: 217
            if p48:IsA("BasePart") or p48:IsA("MeshPart") then
                p48.Transparency = 0;

                return;
            end;

            if p48:IsA("ParticleEmitter") then
                p48.Enabled = true;
            end;
        end;

        for i, descendant in v44:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") or descendant:IsA("MeshPart") then
                descendant.Transparency = 0;
            elseif descendant:IsA("ParticleEmitter") then
                descendant.Enabled = true;
            end;
        end;
    end;

    if v45 then
        local function _(p49) -- Line: 230
            if p49:IsA("BasePart") or p49:IsA("MeshPart") then
                p49.Transparency = 0;

                return;
            end;

            if p49:IsA("ParticleEmitter") then
                p49.Enabled = true;
            end;
        end;

        for i, descendant in v45:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") or descendant:IsA("MeshPart") then
                descendant.Transparency = 0;
            elseif descendant:IsA("ParticleEmitter") then
                descendant.Enabled = true;
            end;
        end;
    end;
end;

function u5.getEmeraldGroup(p50, p51) -- Line: 242
    -- upvalues: u4 (ref)
    if p51 >= 20 then
        return u4.LARGE;
    end;

    if p51 >= 5 then
        return u4.MEDIUM;
    end;

    if p51 >= 1 then
        return u4.SMALL;
    end;

    return u4.NONE;
end;

function u5.getDiamondGroup(p52, p53) -- Line: 253
    -- upvalues: u4 (ref)
    if p53 >= 20 then
        return u4.LARGE;
    end;

    if p53 >= 5 then
        return u4.MEDIUM;
    end;

    if p53 >= 1 then
        return u4.SMALL;
    end;

    return u4.NONE;
end;

function u5.getIronGroup(p54, p55) -- Line: 264
    -- upvalues: u4 (ref)
    if p55 >= 200 then
        return u4.LARGE;
    end;

    if p55 >= 30 then
        return u4.MEDIUM;
    end;

    if p55 >= 1 then
        return u4.SMALL;
    end;

    return u4.NONE;
end;

function u5.getTeamCrate(p56) -- Line: 275
    -- upvalues: Players (copy), u1 (copy)
    local u57 = Players.LocalPlayer:GetAttribute("Team");

    if u57 == 0 or (u57 ~= u57 or not u57) then
        return nil;
    end;

    local function _(p58) -- Line: 281
        -- upvalues: u57 (copy)
        return p58:GetAttribute("Team") == u57;
    end;

    for i, v in u1.keys(p56.gameChestMap) do
        local _ = i - 1;

        if v:GetAttribute("Team") == u57 == true then
            return v;
        end;
    end;

    return nil;
end;

KnitClient.CreateController(u5.new());

return nil;