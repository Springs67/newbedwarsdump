-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ContentProvider = v4.ContentProvider;
local MaterialService = v4.MaterialService;
local Workspace = v4.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local getQueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 22, Name: __tostring
        return "PreloadController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 28
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 32
    -- upvalues: KnitController (copy), u2 (copy), ItemType (copy)
    KnitController.constructor(p7);
    p7.Name = "PreloadController";
    p7.itemPreloads = {};

    for _, v in u2.values(ItemType) do
        p7.itemPreloads[v] = {};
    end;
end;

function u5.KnitStart(u8) -- Line: 42
    -- upvalues: KnitController (copy), MaterialService (copy), ClientSyncEvents (copy), getItemMeta (copy)
    KnitController.KnitStart(u8);
    MaterialService.ChildAdded:Connect(function(p9) -- Line: 44
        -- upvalues: u8 (copy)
        if p9:IsA("MaterialVariant") then
            u8:preloadMaterialVariant(p9);
        end;
    end);

    for _, child in MaterialService:GetChildren() do
        if child:IsA("MaterialVariant") then
            u8:preloadMaterialVariant(child);
        end;
    end;

    ClientSyncEvents.ItemAdded:connect(function(p10) -- Line: 54
        -- upvalues: u8 (copy), getItemMeta (ref)
        local u11 = u8.itemPreloads[p10.item.Name];
        local v12 = getItemMeta(p10.item.Name);
        local block = v12.block;

        if block ~= nil then
            block = block.greedyMesh;
        end;

        if block then
            table.insert(u11, {
                imageIds = v12.block.greedyMesh.textures
            });
        end;

        if #u11 == 0 then
            return nil;
        end;

        task.spawn(function() -- Line: 72
            -- upvalues: u11 (copy), u8 (ref)
            for _, v in u11 do
                u8:runPreload(v);
            end;
        end);
    end);
end;

function u5.preloadMaterialVariant(p13, p14) -- Line: 79
    -- upvalues: u3 (copy), Workspace (copy)
    local u15 = u3("Part", {
        Name = "PreloadMaterial",
        CanCollide = false,
        CanQuery = false,
        Anchored = true,
        Size = Vector3.new(0, 0, 0),
        Material = Enum.Material.Fabric,
        MaterialVariant = p14.Name
    });
    local CurrentCamera = Workspace.CurrentCamera;

    if CurrentCamera ~= nil then
        CurrentCamera = CurrentCamera.CFrame * Vector3.new(0, 0, -80);
    end;

    u15.Position = CurrentCamera == nil and Vector3.new(0, 0, 0) or CurrentCamera;
    u15.Parent = Workspace;
    task.delay(5, function() -- Line: 101
        -- upvalues: u15 (copy)
        u15:Destroy();
    end);
end;

function u5.preloadForItemType(p16, p17, p18) -- Line: 105
    table.insert(p16.itemPreloads[p17], p18);
end;

function u5.runPreload(p19, u20) -- Line: 112
    -- upvalues: KnitClient2 (copy), getQueueMeta (copy), ContentProvider (copy), u3 (copy), GameAnimationUtil (copy)
    if u20.loadOnGameTypes then
        local v21, v22 = KnitClient2.Controllers.MatchController:getQueueTypeAsync():await();

        if v21 then
            local v23 = getQueueMeta(v22);
            local loadOnGameTypes = u20.loadOnGameTypes;

            if loadOnGameTypes ~= nil then
                loadOnGameTypes = table.find(loadOnGameTypes, v23.game) ~= nil;
            end;

            if not loadOnGameTypes then
                return nil;
            end;
        end;
    end;

    if u20.instances ~= nil then
        task.spawn(function() -- Line: 128
            -- upvalues: ContentProvider (ref), u20 (copy)
            ContentProvider:PreloadAsync(u20.instances);
        end);
    end;

    if u20.callback ~= nil then
        local callback = u20.callback;
        task.spawn(function() -- Line: 134
            -- upvalues: callback (copy)
            callback();
        end);
    end;

    if u20.sounds ~= nil then
        task.spawn(function() -- Line: 139
            -- upvalues: ContentProvider (ref), u20 (copy), u3 (ref)
            local sounds = u20.sounds;

            local function _(p24) -- Line: 142
                -- upvalues: u3 (ref)
                return u3("Sound", {
                    SoundId = p24
                });
            end;

            local v25 = table.create(#sounds);

            for i, v in sounds do
                local _ = i - 1;
                v25[i] = u3("Sound", {
                    SoundId = v
                });
            end;

            ContentProvider:PreloadAsync(v25);
        end);
    end;

    if u20.animations ~= nil then
        task.spawn(function() -- Line: 157
            -- upvalues: ContentProvider (ref), u20 (copy), GameAnimationUtil (ref)
            local animations = u20.animations;

            local function _(p26) -- Line: 160
                -- upvalues: GameAnimationUtil (ref)
                return GameAnimationUtil:getAnimation(p26);
            end;

            local v27 = table.create(#animations);

            for i, v in animations do
                local _ = i - 1;
                v27[i] = GameAnimationUtil:getAnimation(v);
            end;

            ContentProvider:PreloadAsync(v27);
        end);
    end;

    if u20.imageIds ~= nil then
        task.spawn(function() -- Line: 173
            -- upvalues: ContentProvider (ref), u20 (copy), u3 (ref)
            local imageIds = u20.imageIds;

            local function _(p28) -- Line: 176
                -- upvalues: u3 (ref)
                return u3("ImageLabel", {
                    Image = p28
                });
            end;

            local v29 = table.create(#imageIds);

            for i, v in imageIds do
                local _ = i - 1;
                v29[i] = u3("ImageLabel", {
                    Image = v
                });
            end;

            ContentProvider:PreloadAsync(v29);
        end);
    end;
end;

KnitClient.CreateController(u5.new());

return nil;