-- Decompiled with Potassium's decompiler.

return function() -- Line: 1
    local Component = require(script.Parent.Component);
    local ElementKind = require(script.Parent.ElementKind);
    local GlobalConfig = require(script.Parent.GlobalConfig);
    local Logging = require(script.Parent.Logging);
    local Type = require(script.Parent.Type);
    local Portal = require(script.Parent.Portal);
    local Children = require(script.Parent.PropMarkers.Children);
    local createElement = require(script.Parent.createElement);
    it("should create new primitive elements", function() -- Line: 12
        -- upvalues: createElement (copy), Type (copy), ElementKind (copy)
        local v1 = createElement("Frame");
        expect(v1).to.be.ok();
        expect(Type.of(v1)).to.equal(Type.Element);
        expect(ElementKind.of(v1)).to.equal(ElementKind.Host);
    end);
    it("should create new functional elements", function() -- Line: 20
        -- upvalues: createElement (copy), Type (copy), ElementKind (copy)
        local v2 = createElement(function() -- Line: 21
        end);
        expect(v2).to.be.ok();
        expect(Type.of(v2)).to.equal(Type.Element);
        expect(ElementKind.of(v2)).to.equal(ElementKind.Function);
    end);
    it("should create new stateful components", function() -- Line: 28
        -- upvalues: Component (copy), createElement (copy), Type (copy), ElementKind (copy)
        local v3 = createElement((Component:extend("Foo")));
        expect(v3).to.be.ok();
        expect(Type.of(v3)).to.equal(Type.Element);
        expect(ElementKind.of(v3)).to.equal(ElementKind.Stateful);
    end);
    it("should create new portal elements", function() -- Line: 38
        -- upvalues: createElement (copy), Portal (copy), Type (copy), ElementKind (copy)
        local v4 = createElement(Portal);
        expect(v4).to.be.ok();
        expect(Type.of(v4)).to.equal(Type.Element);
        expect(ElementKind.of(v4)).to.equal(ElementKind.Portal);
    end);
    it("should accept props", function() -- Line: 46
        -- upvalues: createElement (copy)
        local v5 = createElement("StringValue", {
            Value = "Foo"
        });
        expect(v5).to.be.ok();
        expect(v5.props.Value).to.equal("Foo");
    end);
    it("should accept props and children", function() -- Line: 55
        -- upvalues: createElement (copy), Children (copy)
        local v6 = createElement("IntValue");
        local v7 = createElement("StringValue", {
            Value = "Foo"
        }, {
            Child = v6
        });
        expect(v7).to.be.ok();
        expect(v7.props.Value).to.equal("Foo");
        expect(v7.props[Children]).to.be.ok();
        expect(v7.props[Children].Child).to.equal(v6);
    end);
    it("should accept children with without props", function() -- Line: 70
        -- upvalues: createElement (copy), Children (copy)
        local v8 = createElement("IntValue");
        local v9 = createElement("StringValue", nil, {
            Child = v8
        });
        expect(v9).to.be.ok();
        expect(v9.props[Children]).to.be.ok();
        expect(v9.props[Children].Child).to.equal(v8);
    end);
    it("should warn once if children is specified in two different ways", function() -- Line: 82
        -- upvalues: Logging (copy), createElement (copy), Children (copy)
        local v10 = Logging.capture(function() -- Line: 83
            -- upvalues: createElement (ref), Children (ref)
            for _ = 1, 2 do
                createElement("Frame", {
                    [Children] = {}
                }, {});
            end;
        end);
        expect(#v10.warnings).to.equal(1);
        expect(v10.warnings[1]:find("createElement")).to.be.ok();
        expect(v10.warnings[1]:find("Children")).to.be.ok();
    end);
    it("should have a `source` member if elementTracing is set", function() -- Line: 98
        -- upvalues: GlobalConfig (copy), createElement (copy)
        GlobalConfig.scoped({
            elementTracing = true
        }, function() -- Line: 103
            -- upvalues: createElement (ref)
            local v11 = createElement("StringValue");
            expect(v11.source).to.be.a("string");
        end);
    end);
end;