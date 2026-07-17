-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local BlockHighlighter = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out", "client", "highlight", "block-highlighter").BlockHighlighter;
local BlockSelectorMode = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out", "client", "select", "block-selector").BlockSelectorMode;
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ContextActionService = v3.ContextActionService;
local Players = v3.Players;
local UserInputService = v3.UserInputService;
local Workspace = v3.Workspace;
local ItemViewport = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "inventory", "ui", "item-viewport").ItemViewport;
local ClientBlockEngine = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "block-engine", "client-block-engine").ClientBlockEngine;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local BuilderUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "builder", "builder-util").BuilderUtil;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 27, Name: __tostring
        return "BlockFortifier";
    end
});
u4.__index = u4;

function u4.new(...) -- Line: 32
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(u6) -- Line: 36
    -- upvalues: u1 (copy), u2 (copy), BlockHighlighter (copy), ClientBlockEngine (copy), BlockSelectorMode (copy), getItemMeta (copy), Theme (copy), Players (copy), BuilderUtil (copy), ItemViewport (copy), default (copy)
    u6.maid = u1.new();
    u6.highlightMaid = u1.new();
    u6.costGuiRef = u2.createRef();
    u6.blockHighlighter = BlockHighlighter.new(ClientBlockEngine, BlockSelectorMode.SELECT);
    u6.blockHighlighter:setAllowHighlight(function(p7, p8) -- Line: 41
        -- upvalues: u6 (copy)
        return u6:canHighlight(p7);
    end);
    u6.blockHighlighter:setOnHighlight(function(u9, p10) -- Line: 44
        -- upvalues: getItemMeta (ref), u1 (ref), u6 (copy), u2 (ref), Theme (ref), Players (ref), BuilderUtil (ref), ItemViewport (ref)
        if not u9 then
            return nil;
        end;

        local u11 = Color3.fromRGB(155, 155, 155);
        local drawBridgeSource = getItemMeta(u9.Name).drawBridgeSource;

        if drawBridgeSource ~= 0 and (drawBridgeSource == drawBridgeSource and (drawBridgeSource ~= "" and drawBridgeSource)) then
            local u12 = u1.new();
            u6.highlightMaid:GiveTask(u12);

            local function u21() -- Line: 55
                -- upvalues: u12 (copy), u9 (copy), u2 (ref), u6 (ref), u11 (ref), Theme (ref), Players (ref)
                u12:DoCleaning();
                local v13 = u9:GetAttribute("BridgeExtended");

                if v13 == nil then
                    v13 = false;
                end;

                local v14 = u9:GetAttribute("BridgeActive");

                if v14 == nil then
                    v14 = false;
                end;

                local createElement = u2.createElement;
                local v15 = {
                    [u2.Ref] = u6.costGuiRef,
                    Adornee = u9,
                    Size = UDim2.new(2, 0, 2, 0),
                    StudsOffsetWorldSpace = Vector3.new(0, 4, 0),
                    AlwaysOnTop = true
                };
                local v16 = {};
                local createElement2 = u2.createElement;
                local v17 = {
                    BackgroundTransparency = 0.7,
                    BorderSizePixel = 0,
                    Size = UDim2.new(1, 0, 1, 0)
                };
                local v18;

                if v14 then
                    v18 = u11;
                elseif v13 then
                    v18 = Theme.mcRed;
                else
                    v18 = Theme.mcGreen;
                end;

                v17.BackgroundColor3 = v18;
                v16[1] = createElement2("Frame", v17, { u2.createElement("UICorner", {
        CornerRadius = UDim.new(0.05, 0)
    }), u2.createElement("TextLabel", {
        Font = "RobotoMono",
        RichText = true,
        TextScaled = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Text = "<b>" .. (v14 and "Working " or (v13 and "Disable " or "Enable ")) .. "</b>",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Size = UDim2.fromScale(0.9, 0.4),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5)
    }) });
                local v19 = createElement("BillboardGui", v15, v16);
                u6.costHandle = u2.mount(v19, Players.LocalPlayer:WaitForChild("PlayerGui"));
                u12:GiveTask(function() -- Line: 98
                    -- upvalues: u6 (ref), u2 (ref)
                    if u6.costHandle then
                        u2.unmount(u6.costHandle);
                    end;

                    local v20 = u6.costGuiRef:getValue();

                    if v20 ~= nil then
                        v20:Destroy();
                    end;
                end);
            end;

            u21();
            u6.highlightMaid:GiveTask(u9:GetAttributeChangedSignal("BridgeActive"):Connect(function() -- Line: 109
                -- upvalues: u21 (copy)
                u21();
            end));
            u6.highlightMaid:GiveTask(u9:GetAttributeChangedSignal("BridgeExtended"):Connect(function() -- Line: 112
                -- upvalues: u21 (copy)
                u21();
            end));

            return nil;
        end;

        if not u6:hasEnoughMaterialsToUpgrade(u9.Name) then
            u11 = Theme.mcRed;
        end;

        local v22 = BuilderUtil.getFortificationCost(u9.Name);

        if v22 then
            local v23 = u2.createElement("BillboardGui", {
                [u2.Ref] = u6.costGuiRef,
                Adornee = u9,
                Size = UDim2.new(2, 0, 2, 0),
                StudsOffsetWorldSpace = Vector3.new(0, 4, 0),
                AlwaysOnTop = true
            }, { u2.createElement("Frame", {
                    BackgroundTransparency = 0.7,
                    BorderSizePixel = 0,
                    Size = UDim2.new(1, 0, 1, 0),
                    BackgroundColor3 = u11
                }, { u2.createElement("UICorner", {
                        CornerRadius = UDim.new(0.05, 0)
                    }), u2.createElement(ItemViewport, {
                        IgnoreInitialPop = true,
                        DisplayOneAmount = true,
                        ItemType = v22[1].currency,
                        Amount = v22[1].amount
                    }) }) });
            u6.costHandle = u2.mount(v23, Players.LocalPlayer:WaitForChild("PlayerGui"));
            u6.highlightMaid:GiveTask(function() -- Line: 148
                -- upvalues: u6 (ref)
                local v24 = u6.costGuiRef:getValue();

                if v24 ~= nil then
                    v24:Destroy();
                end;
            end);
        end;
    end);
    u6.blockHighlighter:setOnHighlightEnded(function() -- Line: 156
        -- upvalues: u6 (copy)
        u6.highlightMaid:DoCleaning();
    end);
    default.Client:WaitFor("BlockFortified"):andThen(function(p25) -- Line: 160
        -- upvalues: u6 (copy)
        return p25:Connect(function(p26, p27) -- Line: 161
            -- upvalues: u6 (ref)
            u6:playFortifyEffect(p26, p27);
        end);
    end);
end;

function u4.hasEnoughMaterialsToUpgrade(p28, p29) -- Line: 167
    -- upvalues: getItemMeta (copy), BuilderUtil (copy), InventoryUtil (copy), Players (copy)
    local drawBridgeSource = getItemMeta(p29).drawBridgeSource;

    if drawBridgeSource ~= 0 and (drawBridgeSource == drawBridgeSource and (drawBridgeSource ~= "" and drawBridgeSource)) then
        return true;
    end;

    local v30 = BuilderUtil.getFortificationCost(p29);

    if not v30 then
        return false;
    end;

    for _, v in v30 do
        if not InventoryUtil.hasEnough(Players.LocalPlayer, v.currency, v.amount) then
            return false;
        end;
    end;

    return true;
end;

function u4.playFortifyEffect(p31, p32, p33) -- Line: 184
    -- upvalues: Players (copy), BlockEngine (copy), SoundManager (copy), GameSound (copy)
    if Players.LocalPlayer:DistanceFromCharacter(BlockEngine:getWorldPosition(p33)) < 50 then
        local FORTIFY_BLOCK = GameSound.FORTIFY_BLOCK;
        local v34 = {};
        local v35;

        if Players.LocalPlayer == p32 then
            v35 = nil;
        else
            v35 = BlockEngine:getWorldPosition(p33);
        end;

        v34.position = v35;
        SoundManager:playSound(FORTIFY_BLOCK, v34);
    end;
end;

function u4.canHighlight(p36, p37) -- Line: 191
    -- upvalues: getItemMeta (copy), BuilderUtil (copy)
    if not p37 then
        return false;
    end;

    local drawBridgeSource = getItemMeta(p37.Name).drawBridgeSource;

    if drawBridgeSource ~= 0 and (drawBridgeSource == drawBridgeSource and (drawBridgeSource ~= "" and drawBridgeSource)) then
        return true;
    end;

    local v38;

    if p37 == nil then
        v38 = p37;
    else
        v38 = p37:GetAttribute("PlacedByUserId");
    end;

    if v38 == 0 or (v38 ~= v38 or (not v38 or v38 == 0)) then
        return false;
    end;

    local v39;

    if p37 == nil or p37:GetAttribute("Fortified") == true then
        v39 = false;
    else
        v39 = BuilderUtil.getFortificationCost(p37.Name) ~= nil;
    end;

    return v39;
end;

function u4.fortifyBlock(p40, u41) -- Line: 209
    -- upvalues: GameAnimationUtil (copy), Players (copy), AnimationType (copy), RuntimeLib (copy), default (copy)
    GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.BUILDER_HAMMER_HIT, {
        fadeInTime = 0.02,
        fadeSamePriorityTracks = false
    });
    p40:playFortifyEffect(Players.LocalPlayer, u41);
    RuntimeLib.try(function() -- Line: 215
        -- upvalues: default (ref), u41 (copy)
        default.Client:Get("FortifyBlock"):SendToServer(u41);
    end, function(p42) -- Line: 217
        warn("Failed block placement:", p42);
    end);
end;

function u4.enable(u43) -- Line: 221
    -- upvalues: UserInputService (copy), ClientBlockEngine (copy), BlockSelectorMode (copy), Workspace (copy), ContextActionService (copy)
    u43.blockHighlighter:enable();
    u43.maid:GiveTask(function() -- Line: 223
        -- upvalues: u43 (copy)
        u43.blockHighlighter:disable();
    end);
    u43.maid:GiveTask(UserInputService.TouchTapInWorld:Connect(function(p44, p45) -- Line: 227
        -- upvalues: ClientBlockEngine (ref), BlockSelectorMode (ref), Workspace (ref), u43 (copy)
        if p45 then
            return nil;
        end;

        local v46 = ClientBlockEngine:getBlockSelector():getMouseInfo(BlockSelectorMode.SELECT, {
            ray = Workspace.CurrentCamera:ViewportPointToRay(p44.X, p44.Y)
        });
        local v47;

        if v46 == nil then
            v47 = v46;
        else
            v47 = v46.target;
        end;

        if v47 then
            v47 = u43:canHighlight(v46.target.blockInstance);
        end;

        if v47 and u43:hasEnoughMaterialsToUpgrade(v46.target.blockInstance.Name) then
            u43:fortifyBlock(v46.target.blockRef.blockPosition);
        end;
    end));
    ContextActionService:BindAction("fortify-block", function(p48, p49, p50) -- Line: 249
        -- upvalues: ClientBlockEngine (ref), BlockSelectorMode (ref), u43 (copy)
        if p49 ~= Enum.UserInputState.Begin then
            return nil;
        end;

        local v51 = ClientBlockEngine:getBlockSelector():getMouseInfo(BlockSelectorMode.SELECT);
        local v52;

        if v51 == nil then
            v52 = v51;
        else
            v52 = v51.target;
        end;

        if v52 then
            v52 = u43:canHighlight(v51.target.blockInstance);
        end;

        if v52 and u43:hasEnoughMaterialsToUpgrade(v51.target.blockInstance.Name) then
            u43:fortifyBlock(v51.target.blockRef.blockPosition);
        end;
    end, false, Enum.UserInputType.MouseButton1);
    u43.maid:GiveTask(function() -- Line: 268
        -- upvalues: ContextActionService (ref)
        ContextActionService:UnbindAction("fortify-block");
    end);
end;

function u4.disable(p53) -- Line: 272
    p53.maid:DoCleaning();
end;

return {
    BlockFortifier = u4
};