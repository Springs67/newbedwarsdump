-- Decompiled with Potassium's decompiler.

return function() -- Line: 1
    local ElementUtils = require(script.Parent.ElementUtils);
    local createElement = require(script.Parent.createElement);
    local createFragment = require(script.Parent.createFragment);
    local Type = require(script.Parent.Type);
    describe("iterateElements", function() -- Line: 7
        -- upvalues: createElement (copy), ElementUtils (copy), Type (copy)
        it("should iterate once for a single child", function() -- Line: 8
            -- upvalues: createElement (ref), ElementUtils (ref)
            local v1 = createElement("TextLabel");
            local v2 = ElementUtils.iterateElements(v1);
            local v3, v4 = v2();
            expect(v3).to.equal(ElementUtils.UseParentKey);
            expect(v4).to.equal(v1);
            local v5 = v2();
            expect(v5).to.equal(nil);
        end);
        it("should iterate over tables", function() -- Line: 20
            -- upvalues: createElement (ref), ElementUtils (ref), Type (ref)
            local v6 = {
                a = createElement("TextLabel"),
                b = createElement("TextLabel")
            };
            local v7 = {};
            local v8 = 0;

            for i, v in ElementUtils.iterateElements(v6) do
                expect((typeof(i))).to.equal("string");
                expect(Type.of(v)).to.equal(Type.Element);
                v7[v] = i;
                v8 = v8 + 1;
            end;

            expect(v8).to.equal(2);
            expect(v7[v6.a]).to.equal("a");
            expect(v7[v6.b]).to.equal("b");
        end);
        it("should return a zero-element iterator for booleans", function() -- Line: 41
            -- upvalues: ElementUtils (ref)
            local v9 = ElementUtils.iterateElements(false);
            expect(v9()).to.equal(nil);
        end);
        it("should return a zero-element iterator for nil", function() -- Line: 46
            -- upvalues: ElementUtils (ref)
            local v10 = ElementUtils.iterateElements(nil);
            expect(v10()).to.equal(nil);
        end);
        it("should throw if given an illegal value", function() -- Line: 51
            -- upvalues: ElementUtils (ref)
            expect(function() -- Line: 52
                -- upvalues: ElementUtils (ref)
                ElementUtils.iterateElements(1);
            end).to.throw();
        end);
    end);
    describe("getElementByKey", function() -- Line: 58
        -- upvalues: ElementUtils (copy), createElement (copy), createFragment (copy)
        it("should return nil for booleans", function() -- Line: 59
            -- upvalues: ElementUtils (ref)
            expect(ElementUtils.getElementByKey(true, "test")).to.equal(nil);
        end);
        it("should return nil for nil", function() -- Line: 63
            -- upvalues: ElementUtils (ref)
            expect(ElementUtils.getElementByKey(nil, "test")).to.equal(nil);
        end);
        describe("single elements", function() -- Line: 67
            -- upvalues: createElement (ref), ElementUtils (ref)
            local u11 = createElement("TextLabel");
            it("should return the element if the key is UseParentKey", function() -- Line: 70
                -- upvalues: ElementUtils (ref), u11 (copy)
                expect(ElementUtils.getElementByKey(u11, ElementUtils.UseParentKey)).to.equal(u11);
            end);
            it("should return nil if the key is not UseParentKey", function() -- Line: 74
                -- upvalues: ElementUtils (ref), u11 (copy)
                expect(ElementUtils.getElementByKey(u11, "test")).to.equal(nil);
            end);
        end);
        it("should return the corresponding element from a table", function() -- Line: 79
            -- upvalues: createElement (ref), ElementUtils (ref)
            local v12 = {
                a = createElement("TextLabel"),
                b = createElement("TextLabel")
            };
            expect(ElementUtils.getElementByKey(v12, "a")).to.equal(v12.a);
            expect(ElementUtils.getElementByKey(v12, "b")).to.equal(v12.b);
        end);
        it("should return nil if the key does not exist", function() -- Line: 89
            -- upvalues: createFragment (ref), ElementUtils (ref)
            local v13 = createFragment({});
            expect(ElementUtils.getElementByKey(v13, "a")).to.equal(nil);
        end);
    end);
end;