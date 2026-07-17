-- Decompiled with Potassium's decompiler.

return function() -- Line: 1
    local Config = require(script.Parent.Config);
    it("should accept valid configuration", function() -- Line: 4
        -- upvalues: Config (copy)
        local v1 = Config.new();
        local v2 = v1.get();
        expect(v2.elementTracing).to.equal(false);
        v1.set({
            elementTracing = true
        });
        expect(v2.elementTracing).to.equal(true);
    end);
    it("should reject invalid configuration keys", function() -- Line: 17
        -- upvalues: Config (copy)
        local u3 = Config.new();
        local success, result = pcall(function() -- Line: 22
            -- upvalues: u3 (copy)
            u3.set({
                garblegoop = true
            });
        end);
        expect(success).to.equal(false);
        expect(result:find("garblegoop")).to.be.ok();
    end);
    it("should reject invalid configuration values", function() -- Line: 34
        -- upvalues: Config (copy)
        local u4 = Config.new();
        local success, result = pcall(function() -- Line: 40
            -- upvalues: u4 (copy)
            u4.set({
                elementTracing = "Hello there!"
            });
        end);
        expect(success).to.equal(false);
        expect(result:find("elementTracing")).to.be.ok();
        expect(result:find("Hello there!")).to.be.ok();
    end);
end;