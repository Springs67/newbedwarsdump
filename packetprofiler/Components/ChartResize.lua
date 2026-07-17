-- Decompiled with Potassium's decompiler.

local RunService = game:GetService("RunService");
local UserInputService = game:GetService("UserInputService");
local GuiService = game:GetService("GuiService");
local Packages = require(script.Parent.Parent.Modules.Packages);
local Roact = require(Packages.Directory.Roact);
local u1 = Roact.Component:extend("ChartResize");

function u1.init(u2) -- Line: 13
    -- upvalues: Roact (copy), Packages (copy), UserInputService (copy), RunService (copy), GuiService (copy)
    local v3, v4 = Roact.createBinding(UDim2.fromOffset(650, 290));
    u2.Size = v3;
    u2.SetSize = v4;

    if not Packages.IsPlugin then
        u2.Connections = {};
        local MouseIcon = UserInputService.MouseIcon;
        local u5 = nil;
        local u6 = false;
        local u7 = false;
        local u8 = {
            SizeWE = "rbxassetid://18699453492",
            SizeNS = "rbxassetid://18700045701",
            SizeAll = "rbxassetid://18700129047"
        };

        function u2.AddIcon(p9) -- Line: 29
            -- upvalues: u7 (ref), u6 (ref), MouseIcon (ref), UserInputService (ref), u8 (copy)
            if u7 or u6 == p9 then
                return;
            end;

            if u6 == false then
                MouseIcon = UserInputService.MouseIcon;
            end;

            u6 = p9;
            UserInputService.MouseIcon = u8[p9];
        end;

        function u2.RemoveIcon() -- Line: 40
            -- upvalues: u7 (ref), u6 (ref), UserInputService (ref), MouseIcon (ref)
            if u7 or not u6 then
                return;
            end;

            u6 = false;
            UserInputService.MouseIcon = MouseIcon;
        end;

        function u2.SetSizeTarget(u10) -- Line: 50
            -- upvalues: u2 (copy), RunService (ref), GuiService (ref), UserInputService (ref), u6 (ref)
            if not u10 then
                return;
            end;

            for _, v in u2.Connections do
                v:Disconnect();
            end;

            table.clear(u2.Connections);
            table.insert(u2.Connections, RunService.RenderStepped:Connect(function() -- Line: 60
                -- upvalues: GuiService (ref), UserInputService (ref), u10 (copy), u2 (ref)
                local v11 = GuiService:GetGuiInset();
                local v12 = UserInputService:GetMouseLocation();
                local v13 = u10.AbsolutePosition + v11;
                local AbsoluteSize = u10.AbsoluteSize;
                local v14 = v13.Y + AbsoluteSize.Y + 8;

                if (v12.X < v13.X - 8 or (v13.X + AbsoluteSize.X < v12.X or v12.Y < v13.Y)) and true or v14 < v12.Y then
                    u2.RemoveIcon();

                    return;
                end;

                local v15;

                if v12.Y > v14 - 8 then
                    v15 = v12.Y < v14 + 8;
                else
                    v15 = false;
                end;

                local v16;

                if v12.X < v13.X + 8 then
                    v16 = v12.X > v13.X - 8;
                else
                    v16 = false;
                end;

                if v15 or v16 then
                    u2.AddIcon(v15 and (v16 and "SizeAll" or "SizeNS") or "SizeWE");

                    return;
                end;

                u2.RemoveIcon();
            end));
            table.insert(u2.Connections, UserInputService.InputBegan:Connect(function(p17) -- Line: 87
                -- upvalues: u6 (ref), u2 (ref)
                if p17.UserInputType == Enum.UserInputType.MouseButton1 and u6 then
                    u2.StartResizing();
                end;
            end));
            table.insert(u2.Connections, UserInputService.InputEnded:Connect(function(p18) -- Line: 92
                -- upvalues: u2 (ref)
                if p18.UserInputType == Enum.UserInputType.MouseButton1 then
                    u2.StopResizing();
                end;
            end));
        end;

        function u2.StartResizing() -- Line: 99
            -- upvalues: u7 (ref), u2 (copy), UserInputService (ref), u5 (ref), RunService (ref), u6 (ref)
            if u7 then
                return;
            end;

            u7 = true;
            local u19 = u2.Size:getValue();
            local v20 = UserInputService:GetMouseLocation();
            local u21 = Vector2.new(v20.X, v20.Y);
            u5 = RunService.RenderStepped:Connect(function() -- Line: 110
                -- upvalues: UserInputService (ref), u21 (copy), u6 (ref), u19 (copy), u2 (ref)
                local v22 = UserInputService:GetMouseLocation() - u21;

                if u6 == "SizeNS" then
                    v22 = v22 * Vector2.new(0, 1);
                elseif u6 == "SizeWE" then
                    v22 = v22 * Vector2.new(1, 0);
                end;

                local v23 = UDim2.fromOffset(math.max(u19.X.Offset - v22.X, 300), (math.max(u19.Y.Offset + v22.Y, 100)));
                u2.SetSize(v23);
            end);
        end;

        function u2.StopResizing() -- Line: 126
            -- upvalues: u7 (ref), u2 (copy), u5 (ref)
            if not u7 then
                return;
            end;

            u7 = false;
            u2.RemoveIcon();
            u5:Disconnect();
            u5 = nil;
        end;
    end;
end;

function u1.render(p24) -- Line: 140
    -- upvalues: Roact (copy)
    return Roact.oneChild(p24.props[Roact.Children])({
        UISize = p24.Size,
        StartResizing = p24.StartResizing,
        StopResizing = p24.StopResizing,
        AddIcon = p24.AddIcon,
        RemoveIcon = p24.RemoveIcon,
        SetSizeTarget = p24.SetSizeTarget
    });
end;

function u1.willUnmount(p25) -- Line: 152
    if p25.StopResizing then
        p25.StopResizing();
    end;

    if p25.Connections then
        for _, v in p25.Connections do
            v:Disconnect();
        end;

        table.clear(p25.Connections);
    end;
end;

return function(p26) -- Line: 166, Name: ChartResizeInit
    -- upvalues: Roact (copy), u1 (copy)
    return Roact.createElement(u1, {}, {
        PacketChart = p26
    });
end;