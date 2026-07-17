-- Decompiled with Potassium's decompiler.

return function() -- Line: 1
    local ReplicatedStorage = game:GetService("ReplicatedStorage");
    local assertDeepEqual = require(script.Parent.assertDeepEqual);
    local Binding = require(script.Parent.Binding);
    local Children = require(script.Parent.PropMarkers.Children);
    local Component = require(script.Parent.Component);
    local createElement = require(script.Parent.createElement);
    local createFragment = require(script.Parent.createFragment);
    local createReconciler = require(script.Parent.createReconciler);
    local createRef = require(script.Parent.createRef);
    local createSpy = require(script.Parent.createSpy);
    local GlobalConfig = require(script.Parent.GlobalConfig);
    local Portal = require(script.Parent.Portal);
    local Ref = require(script.Parent.PropMarkers.Ref);
    local Event = require(script.Parent.PropMarkers.Event);
    local RobloxRenderer = require(script.Parent.RobloxRenderer);
    local u1 = createReconciler(RobloxRenderer);
    describe("mountHostNode", function() -- Line: 22
        -- upvalues: createElement (copy), u1 (copy), RobloxRenderer (copy), Binding (copy), createRef (copy), Ref (copy), createSpy (copy), GlobalConfig (copy)
        it("should create instances with correct props", function() -- Line: 23
            -- upvalues: createElement (ref), u1 (ref), RobloxRenderer (ref)
            local Folder = Instance.new("Folder");
            local v2 = createElement("StringValue", {
                Value = "Hello!"
            });
            local v3 = u1.createVirtualNode(v2, Folder, "Some Key");
            RobloxRenderer.mountHostNode(u1, v3);
            expect(#Folder:GetChildren()).to.equal(1);
            local v4 = Folder:GetChildren()[1];
            expect(v4.ClassName).to.equal("StringValue");
            expect(v4.Value).to.equal("Hello!");
            expect(v4.Name).to.equal("Some Key");
        end);
        it("should create children with correct names and props", function() -- Line: 45
            -- upvalues: createElement (ref), u1 (ref), RobloxRenderer (ref)
            local Folder = Instance.new("Folder");
            local v5 = createElement("StringValue", {
                Value = "Hey there!"
            }, {
                ChildA = createElement("IntValue", {
                    Value = 173
                }),
                ChildB = createElement("Folder")
            });
            local v6 = u1.createVirtualNode(v5, Folder, "Some Key");
            RobloxRenderer.mountHostNode(u1, v6);
            expect(#Folder:GetChildren()).to.equal(1);
            local v7 = Folder:GetChildren()[1];
            expect(v7.ClassName).to.equal("StringValue");
            expect(v7.Value).to.equal("Hey there!");
            expect(v7.Name).to.equal("Some Key");
            expect(#v7:GetChildren()).to.equal(2);
            local ChildA = v7.ChildA;
            local ChildB = v7.ChildB;
            expect(ChildA).to.be.ok();
            expect(ChildB).to.be.ok();
            expect(ChildA.ClassName).to.equal("IntValue");
            expect(ChildA.Value).to.equal(173);
            expect(ChildB.ClassName).to.equal("Folder");
        end);
        it("should attach Bindings to Roblox properties", function() -- Line: 87
            -- upvalues: Binding (ref), createElement (ref), u1 (ref), RobloxRenderer (ref)
            local Folder = Instance.new("Folder");
            local v8, v9 = Binding.create(10);
            local v10 = createElement("IntValue", {
                Value = v8
            });
            local v11 = u1.createVirtualNode(v10, Folder, "Some Key");
            RobloxRenderer.mountHostNode(u1, v11);
            expect(#Folder:GetChildren()).to.equal(1);
            local v12 = Folder:GetChildren()[1];
            expect(v12.ClassName).to.equal("IntValue");
            expect(v12.Value).to.equal(10);
            v9(20);
            expect(v12.Value).to.equal(20);
            RobloxRenderer.unmountHostNode(u1, v11);
        end);
        it("should connect Binding refs", function() -- Line: 114
            -- upvalues: createRef (ref), createElement (ref), Ref (ref), u1 (ref), RobloxRenderer (ref)
            local Folder = Instance.new("Folder");
            local v13 = createRef();
            local v14 = createElement("Frame", {
                [Ref] = v13
            });
            local v15 = u1.createVirtualNode(v14, Folder, "Some Key");
            RobloxRenderer.mountHostNode(u1, v15);
            expect(#Folder:GetChildren()).to.equal(1);
            local v16 = Folder:GetChildren()[1];
            expect(v13.current).to.be.ok();
            expect(v13.current).to.equal(v16);
            RobloxRenderer.unmountHostNode(u1, v15);
        end);
        it("should call function refs", function() -- Line: 137
            -- upvalues: createSpy (ref), createElement (ref), Ref (ref), u1 (ref), RobloxRenderer (ref)
            local Folder = Instance.new("Folder");
            local v17 = createSpy();
            local v18 = createElement("Frame", {
                [Ref] = v17.value
            });
            local v19 = u1.createVirtualNode(v18, Folder, "Some Key");
            RobloxRenderer.mountHostNode(u1, v19);
            expect(#Folder:GetChildren()).to.equal(1);
            local v20 = Folder:GetChildren()[1];
            expect(v17.callCount).to.equal(1);
            v17:assertCalledWith(v20);
            RobloxRenderer.unmountHostNode(u1, v19);
        end);
        it("should throw if setting invalid instance properties", function() -- Line: 160
            -- upvalues: GlobalConfig (ref), createElement (ref), u1 (ref), RobloxRenderer (ref)
            GlobalConfig.scoped({
                elementTracing = true
            }, function() -- Line: 165
                -- upvalues: createElement (ref), u1 (ref), RobloxRenderer (ref)
                local Folder = Instance.new("Folder");
                local v21 = createElement("Frame", {
                    Frob = 6
                });
                local v22 = u1.createVirtualNode(v21, Folder, "Some Key");
                local success, result = pcall(RobloxRenderer.mountHostNode, u1, v22);
                assert(not success, "Expected call to fail");
                expect(result:find("Frob")).to.be.ok();
                expect(result:find("Frame")).to.be.ok();
                expect(result:find("RobloxRenderer%.spec")).to.be.ok();
            end);
        end);
    end);
    describe("updateHostNode", function() -- Line: 185
        -- upvalues: createElement (copy), u1 (copy), RobloxRenderer (copy), Binding (copy), createRef (copy), Ref (copy), createSpy (copy), GlobalConfig (copy)
        it("should update node props and children", function() -- Line: 186
            -- upvalues: createElement (ref), u1 (ref), RobloxRenderer (ref)
            local Folder = Instance.new("Folder");
            local Value = Instance.new("StringValue").Value;
            local v23 = createElement("StringValue", {
                Value = "foo"
            }, {
                ChildA = createElement("IntValue", {
                    Value = 1
                }),
                ChildB = createElement("BoolValue", {
                    Value = true
                }),
                ChildC = createElement("StringValue", {
                    Value = "test"
                }),
                ChildD = createElement("StringValue", {
                    Value = "test"
                })
            });
            local v24 = u1.createVirtualNode(v23, Folder, "updateHostNodeTest");
            RobloxRenderer.mountHostNode(u1, v24);
            local v25 = createElement("StringValue", {
                Value = "bar"
            }, {
                ChildA = createElement("StringValue", {
                    Value = "test"
                }),
                ChildB = createElement("BoolValue", {
                    Value = false
                }),
                ChildC = createElement("StringValue", {}),
                ChildE = createElement("Folder", {})
            });
            RobloxRenderer.updateHostNode(u1, v24, v25);
            local updateHostNodeTest = Folder.updateHostNodeTest;
            expect(updateHostNodeTest.ClassName).to.equal("StringValue");
            expect(updateHostNodeTest.Value).to.equal("bar");
            expect(#updateHostNodeTest:GetChildren()).to.equal(4);
            local ChildA = updateHostNodeTest.ChildA;
            expect(ChildA.ClassName).to.equal("StringValue");
            expect(ChildA.Value).to.equal("test");
            local ChildB = updateHostNodeTest.ChildB;
            expect(ChildB.ClassName).to.equal("BoolValue");
            expect(ChildB.Value).to.equal(false);
            local ChildC = updateHostNodeTest.ChildC;
            expect(ChildC.ClassName).to.equal("StringValue");
            expect(ChildC.Value).to.equal(Value);
            expect(updateHostNodeTest.ChildE.ClassName).to.equal("Folder");
        end);
        it("should update Bindings", function() -- Line: 260
            -- upvalues: Binding (ref), createElement (ref), u1 (ref), RobloxRenderer (ref)
            local Folder = Instance.new("Folder");
            local v26, v27 = Binding.create(10);
            local v28 = createElement("IntValue", {
                Value = v26
            });
            local v29 = u1.createVirtualNode(v28, Folder, "Some Key");
            RobloxRenderer.mountHostNode(u1, v29);
            local v30 = Folder:GetChildren()[1];
            expect(v30.Value).to.equal(10);
            local v31, v32 = Binding.create(99);
            local v33 = createElement("IntValue", {
                Value = v31
            });
            RobloxRenderer.updateHostNode(u1, v29, v33);
            expect(v30.Value).to.equal(99);
            v27(123);
            expect(v30.Value).to.equal(99);
            v32(123);
            expect(v30.Value).to.equal(123);
            RobloxRenderer.unmountHostNode(u1, v29);
        end);
        it("should update Binding refs", function() -- Line: 297
            -- upvalues: createRef (ref), createElement (ref), Ref (ref), u1 (ref), RobloxRenderer (ref)
            local Folder = Instance.new("Folder");
            local v34 = createRef();
            local v35 = createRef();
            local v36 = createElement("Frame", {
                [Ref] = v34
            });
            local v37 = u1.createVirtualNode(v36, Folder, "Some Key");
            RobloxRenderer.mountHostNode(u1, v37);
            expect(#Folder:GetChildren()).to.equal(1);
            local v38 = Folder:GetChildren()[1];
            expect(v34.current).to.equal(v38);
            expect(v35.current).never.to.be.ok();
            local v39 = createElement("Frame", {
                [Ref] = v35
            });
            RobloxRenderer.updateHostNode(u1, v37, v39);
            expect(v34.current).never.to.be.ok();
            expect(v35.current).to.equal(v38);
            RobloxRenderer.unmountHostNode(u1, v37);
        end);
        it("should call old function refs with nil and new function refs with a valid rbx", function() -- Line: 331
            -- upvalues: createSpy (ref), createElement (ref), Ref (ref), u1 (ref), RobloxRenderer (ref)
            local Folder = Instance.new("Folder");
            local v40 = createSpy();
            local v41 = createSpy();
            local v42 = createElement("Frame", {
                [Ref] = v40.value
            });
            local v43 = u1.createVirtualNode(v42, Folder, "Some Key");
            RobloxRenderer.mountHostNode(u1, v43);
            expect(#Folder:GetChildren()).to.equal(1);
            local v44 = Folder:GetChildren()[1];
            expect(v40.callCount).to.equal(1);
            v40:assertCalledWith(v44);
            expect(v41.callCount).to.equal(0);
            local v45 = createElement("Frame", {
                [Ref] = v41.value
            });
            RobloxRenderer.updateHostNode(u1, v43, v45);
            expect(v40.callCount).to.equal(2);
            v40:assertCalledWith(nil);
            expect(v41.callCount).to.equal(1);
            v41:assertCalledWith(v44);
            RobloxRenderer.unmountHostNode(u1, v43);
        end);
        it("should not call function refs again if they didn\'t change", function() -- Line: 368
            -- upvalues: createSpy (ref), createElement (ref), Ref (ref), u1 (ref), RobloxRenderer (ref)
            local Folder = Instance.new("Folder");
            local v46 = createSpy();
            local v47 = createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0),
                [Ref] = v46.value
            });
            local v48 = u1.createVirtualNode(v47, Folder, "Some Key");
            RobloxRenderer.mountHostNode(u1, v48);
            expect(#Folder:GetChildren()).to.equal(1);
            local v49 = Folder:GetChildren()[1];
            expect(v46.callCount).to.equal(1);
            v46:assertCalledWith(v49);
            local v50 = createElement("Frame", {
                Size = UDim2.new(0.5, 0, 0.5, 0),
                [Ref] = v46.value
            });
            RobloxRenderer.updateHostNode(u1, v48, v50);
            expect(v46.callCount).to.equal(1);
        end);
        it("should throw if setting invalid instance properties", function() -- Line: 401
            -- upvalues: GlobalConfig (ref), createElement (ref), u1 (ref), RobloxRenderer (ref)
            GlobalConfig.scoped({
                elementTracing = true
            }, function() -- Line: 406
                -- upvalues: createElement (ref), u1 (ref), RobloxRenderer (ref)
                local Folder = Instance.new("Folder");
                local v51 = createElement("Frame");
                local v52 = createElement("Frame", {
                    Frob = 6
                });
                local v53 = u1.createVirtualNode(v51, Folder, "Some Key");
                RobloxRenderer.mountHostNode(u1, v53);
                local success, result = pcall(RobloxRenderer.updateHostNode, u1, v53, v52);
                assert(not success, "Expected call to fail");
                expect(result:find("Frob")).to.be.ok();
                expect(result:find("Frame")).to.be.ok();
                expect(result:find("RobloxRenderer%.spec")).to.be.ok();
            end);
        end);
        it("should delete instances when reconciling to nil children", function() -- Line: 427
            -- upvalues: createElement (ref), u1 (ref), RobloxRenderer (ref)
            local Folder = Instance.new("Folder");
            local v54 = createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                child = createElement("Frame")
            });
            local v55 = u1.createVirtualNode(v54, Folder, "Some Key");
            RobloxRenderer.mountHostNode(u1, v55);
            expect(#Folder:GetChildren()).to.equal(1);
            local v56 = Folder:GetChildren()[1];
            expect(#v56:GetChildren()).to.equal(1);
            local v57 = createElement("Frame", {
                Size = UDim2.new(0.5, 0, 0.5, 0)
            });
            RobloxRenderer.updateHostNode(u1, v55, v57);
            expect(#v56:GetChildren()).to.equal(0);
        end);
    end);
    describe("unmountHostNode", function() -- Line: 455
        -- upvalues: createElement (copy), u1 (copy), RobloxRenderer (copy), Binding (copy), createRef (copy), Ref (copy), createSpy (copy)
        it("should delete instances from the inside-out", function() -- Line: 456
            -- upvalues: createElement (ref), u1 (ref), RobloxRenderer (ref)
            local Folder = Instance.new("Folder");
            local v58 = createElement("Folder", nil, {
                Child = createElement("Folder", nil, {
                    Grandchild = createElement("Folder")
                })
            });
            local v59 = u1.mountVirtualNode(v58, Folder, "Root");
            expect(#Folder:GetChildren()).to.equal(1);
            local v60 = Folder:GetChildren()[1];
            expect(#v60:GetChildren()).to.equal(1);
            local v61 = v60:GetChildren()[1];
            expect(#v61:GetChildren()).to.equal(1);
            local v62 = v61:GetChildren()[1];
            RobloxRenderer.unmountHostNode(u1, v59);
            expect(v62.Parent).to.equal(nil);
            expect(v61.Parent).to.equal(nil);
            expect(v60.Parent).to.equal(nil);
        end);
        it("should unsubscribe from any Bindings", function() -- Line: 484
            -- upvalues: Binding (ref), createElement (ref), u1 (ref), RobloxRenderer (ref)
            local Folder = Instance.new("Folder");
            local v63, v64 = Binding.create(10);
            local v65 = createElement("IntValue", {
                Value = v63
            });
            local v66 = u1.createVirtualNode(v65, Folder, "Some Key");
            RobloxRenderer.mountHostNode(u1, v66);
            local v67 = Folder:GetChildren()[1];
            expect(v67.Value).to.equal(10);
            RobloxRenderer.unmountHostNode(u1, v66);
            v64(56);
            expect(v67.Value).to.equal(10);
        end);
        it("should clear Binding refs", function() -- Line: 507
            -- upvalues: createRef (ref), createElement (ref), Ref (ref), u1 (ref), RobloxRenderer (ref)
            local Folder = Instance.new("Folder");
            local v68 = createRef();
            local v69 = createElement("Frame", {
                [Ref] = v68
            });
            local v70 = u1.createVirtualNode(v69, Folder, "Some Key");
            RobloxRenderer.mountHostNode(u1, v70);
            expect(v68.current).to.be.ok();
            RobloxRenderer.unmountHostNode(u1, v70);
            expect(v68.current).never.to.be.ok();
        end);
        it("should call function refs with nil", function() -- Line: 527
            -- upvalues: createSpy (ref), createElement (ref), Ref (ref), u1 (ref), RobloxRenderer (ref)
            local Folder = Instance.new("Folder");
            local v71 = createSpy();
            local v72 = createElement("Frame", {
                [Ref] = v71.value
            });
            local v73 = u1.createVirtualNode(v72, Folder, "Some Key");
            RobloxRenderer.mountHostNode(u1, v73);
            expect(v71.callCount).to.equal(1);
            RobloxRenderer.unmountHostNode(u1, v73);
            expect(v71.callCount).to.equal(2);
            v71:assertCalledWith(nil);
        end);
    end);
    describe("Portals", function() -- Line: 549
        -- upvalues: createElement (copy), Portal (copy), u1 (copy)
        it("should create and destroy instances as children of `target`", function() -- Line: 550
            -- upvalues: createElement (ref), Portal (ref), u1 (ref)
            local Folder = Instance.new("Folder");

            local function FunctionComponent(p74) -- Line: 553
                -- upvalues: createElement (ref)
                return createElement("IntValue", {
                    Value = p74.value
                });
            end;

            local v75 = createElement(Portal, {
                target = Folder
            }, {
                folderOne = createElement("Folder"),
                folderTwo = createElement("Folder"),
                intValueOne = createElement(FunctionComponent, {
                    value = 42
                })
            });
            local v76 = u1.mountVirtualNode(v75, nil, "Some Key");
            expect(#Folder:GetChildren()).to.equal(3);
            expect(Folder:FindFirstChild("folderOne")).to.be.ok();
            expect(Folder:FindFirstChild("folderTwo")).to.be.ok();
            expect(Folder:FindFirstChild("intValueOne")).to.be.ok();
            expect(Folder:FindFirstChild("intValueOne").Value).to.equal(42);
            u1.unmountVirtualNode(v76);
            expect(#Folder:GetChildren()).to.equal(0);
        end);
        it("should pass prop updates through to children", function() -- Line: 584
            -- upvalues: createElement (ref), Portal (ref), u1 (ref)
            local Folder = Instance.new("Folder");
            local v77 = createElement(Portal, {
                target = Folder
            }, {
                ChildValue = createElement("IntValue", {
                    Value = 1
                })
            });
            local v78 = createElement(Portal, {
                target = Folder
            }, {
                ChildValue = createElement("IntValue", {
                    Value = 2
                })
            });
            local v79 = u1.mountVirtualNode(v77, nil, "A Host Key");
            expect(#Folder:GetChildren()).to.equal(1);
            local ChildValue = Folder.ChildValue;
            expect(ChildValue.Value).to.equal(1);
            local v80 = u1.updateVirtualNode(v79, v78);
            expect(#Folder:GetChildren()).to.equal(1);
            local ChildValue2 = Folder.ChildValue;
            expect(ChildValue).to.equal(ChildValue2);
            expect(ChildValue2.Value).to.equal(2);
            u1.unmountVirtualNode(v80);
            expect(#Folder:GetChildren()).to.equal(0);
        end);
        it("should throw if `target` is nil", function() -- Line: 625
            -- upvalues: createElement (ref), Portal (ref), u1 (ref)
            local u81 = createElement(Portal);
            expect(function() -- Line: 631
                -- upvalues: u1 (ref), u81 (copy)
                u1.mountVirtualNode(u81, nil, "Keys for Everyone");
            end).to.throw();
        end);
        it("should throw if `target` is not a Roblox instance", function() -- Line: 636
            -- upvalues: createElement (ref), Portal (ref), u1 (ref)
            local u82 = createElement(Portal, {
                target = {}
            });
            expect(function() -- Line: 643
                -- upvalues: u1 (ref), u82 (copy)
                u1.mountVirtualNode(u82, nil, "Unleash the keys!");
            end).to.throw();
        end);
        it("should recreate instances if `target` changes in an update", function() -- Line: 648
            -- upvalues: createElement (ref), Portal (ref), u1 (ref)
            local Folder = Instance.new("Folder");
            local Folder2 = Instance.new("Folder");
            local v83 = createElement(Portal, {
                target = Folder
            }, {
                ChildValue = createElement("IntValue", {
                    Value = 1
                })
            });
            local v84 = createElement(Portal, {
                target = Folder2
            }, {
                ChildValue = createElement("IntValue", {
                    Value = 2
                })
            });
            local v85 = u1.mountVirtualNode(v83, nil, "Some Key");
            expect(#Folder:GetChildren()).to.equal(1);
            expect(#Folder2:GetChildren()).to.equal(0);
            expect(Folder.ChildValue.Value).to.equal(1);
            local v86 = u1.updateVirtualNode(v85, v84);
            expect(#Folder:GetChildren()).to.equal(0);
            expect(#Folder2:GetChildren()).to.equal(1);
            expect(Folder2.ChildValue.Value).to.equal(2);
            u1.unmountVirtualNode(v86);
            expect(#Folder:GetChildren()).to.equal(0);
            expect(#Folder2:GetChildren()).to.equal(0);
        end);
    end);
    describe("Fragments", function() -- Line: 693
        -- upvalues: createFragment (copy), createElement (copy), u1 (copy)
        it("should parent the fragment\'s elements into the fragment\'s parent", function() -- Line: 694
            -- upvalues: createFragment (ref), createElement (ref), u1 (ref)
            local Folder = Instance.new("Folder");
            local v87 = createFragment({
                key = createElement("IntValue", {
                    Value = 1
                }),
                key2 = createElement("IntValue", {
                    Value = 2
                })
            });
            local v88 = u1.mountVirtualNode(v87, Folder, "test");
            expect(Folder:FindFirstChild("key")).to.be.ok();
            expect(Folder.key.ClassName).to.equal("IntValue");
            expect(Folder.key.Value).to.equal(1);
            expect(Folder:FindFirstChild("key2")).to.be.ok();
            expect(Folder.key2.ClassName).to.equal("IntValue");
            expect(Folder.key2.Value).to.equal(2);
            u1.unmountVirtualNode(v88);
            expect(#Folder:GetChildren()).to.equal(0);
        end);
        it("should allow sibling fragment to have common keys", function() -- Line: 721
            -- upvalues: createElement (ref), createFragment (ref), u1 (ref)
            local Folder = Instance.new("Folder");
            local v90 = u1.mountVirtualNode(createElement(function(p89) -- Line: 725, Name: parent
                -- upvalues: createElement (ref), createFragment (ref)
                return createElement("IntValue", {}, {
                    fragmentA = createFragment({
                        key = createElement("StringValue", {
                            Value = "A"
                        }),
                        key2 = createElement("StringValue", {
                            Value = "B"
                        })
                    }),
                    fragmentB = createFragment({
                        key = createElement("StringValue", {
                            Value = "C"
                        }),
                        key2 = createElement("StringValue", {
                            Value = "D"
                        })
                    })
                });
            end), Folder, "Test");
            local v91 = Folder.Test:GetChildren();
            expect(#v91).to.equal(4);
            local v92 = {};

            for _, v in pairs(v91) do
                expect(v.ClassName).to.equal("StringValue");
                v92[v.Value] = 1 + (v92[v.Value] or 0);
            end;

            expect(v92.A).to.equal(1);
            expect(v92.B).to.equal(1);
            expect(v92.C).to.equal(1);
            expect(v92.D).to.equal(1);
            u1.unmountVirtualNode(v90);
            expect(#Folder:GetChildren()).to.equal(0);
        end);
        it("should render nested fragments", function() -- Line: 769
            -- upvalues: createFragment (ref), createElement (ref), u1 (ref)
            local Folder = Instance.new("Folder");
            local v93 = createFragment({
                key = createFragment({
                    TheValue = createElement("IntValue", {
                        Value = 1
                    }),
                    TheOtherValue = createElement("IntValue", {
                        Value = 2
                    })
                })
            });
            local v94 = u1.mountVirtualNode(v93, Folder, "Test");
            expect(Folder:FindFirstChild("TheValue")).to.be.ok();
            expect(Folder.TheValue.ClassName).to.equal("IntValue");
            expect(Folder.TheValue.Value).to.equal(1);
            expect(Folder:FindFirstChild("TheOtherValue")).to.be.ok();
            expect(Folder.TheOtherValue.ClassName).to.equal("IntValue");
            expect(Folder.TheOtherValue.Value).to.equal(2);
            u1.unmountVirtualNode(v94);
            expect(#Folder:GetChildren()).to.equal(0);
        end);
        it("should not add any instances if the fragment is empty", function() -- Line: 798
            -- upvalues: u1 (ref), createFragment (ref)
            local Folder = Instance.new("Folder");
            local v95 = u1.mountVirtualNode(createFragment({}), Folder, "test");
            expect(#Folder:GetChildren()).to.equal(0);
            u1.unmountVirtualNode(v95);
            expect(#Folder:GetChildren()).to.equal(0);
        end);
    end);
    describe("Context", function() -- Line: 811
        -- upvalues: Component (copy), createElement (copy), u1 (copy), assertDeepEqual (copy), Children (copy), Portal (copy)
        it("should pass context values through Roblox host nodes", function() -- Line: 812
            -- upvalues: Component (ref), createElement (ref), u1 (ref), assertDeepEqual (ref)
            local v96 = Component:extend("Consumer");
            local u97 = nil;

            function v96.init(p98) -- Line: 816
                -- upvalues: u97 (ref)
                u97 = {
                    hello = p98:__getContext("hello")
                };
            end;

            function v96.render(p99) -- Line: 822
            end;

            local v100 = createElement("Folder", nil, {
                Consumer = createElement(v96)
            });
            local v101 = {
                hello = "world"
            };
            local v102 = u1.mountVirtualNode(v100, nil, "Context Test", v101);
            expect(u97).never.to.equal(v101);
            assertDeepEqual(u97, v101);
            u1.unmountVirtualNode(v102);
        end);
        it("should pass context values through portal nodes", function() -- Line: 840
            -- upvalues: Component (ref), createElement (ref), Children (ref), Portal (ref), u1 (ref), assertDeepEqual (ref)
            local Folder = Instance.new("Folder");
            local v103 = Component:extend("Provider");

            function v103.init(p104) -- Line: 845
                p104:__addContext("foo", "bar");
            end;

            function v103.render(p105) -- Line: 849
                -- upvalues: createElement (ref), Children (ref)
                return createElement("Folder", nil, p105.props[Children]);
            end;

            local v106 = Component:extend("Consumer");
            local u107 = nil;

            function v106.init(p108) -- Line: 856
                -- upvalues: u107 (ref)
                u107 = {
                    foo = p108:__getContext("foo")
                };
            end;

            function v106.render(p109) -- Line: 862
                return nil;
            end;

            local v110 = createElement(v103, nil, {
                Portal = createElement(Portal, {
                    target = Folder
                }, {
                    Consumer = createElement(v106)
                })
            });
            u1.mountVirtualNode(v110, nil, "Some Key");
            assertDeepEqual(u107, {
                foo = "bar"
            });
        end);
    end);
    describe("Legacy context", function() -- Line: 883
        -- upvalues: Component (copy), createElement (copy), u1 (copy), assertDeepEqual (copy), Children (copy), Portal (copy)
        it("should pass context values through Roblox host nodes", function() -- Line: 884
            -- upvalues: Component (ref), createElement (ref), u1 (ref), assertDeepEqual (ref)
            local v111 = Component:extend("Consumer");
            local u112 = nil;

            function v111.init(p113) -- Line: 888
                -- upvalues: u112 (ref)
                u112 = p113._context;
            end;

            function v111.render(p114) -- Line: 892
            end;

            local v115 = createElement("Folder", nil, {
                Consumer = createElement(v111)
            });
            local v116 = {
                hello = "world"
            };
            local v117 = u1.mountVirtualNode(v115, nil, "Context Test", nil, v116);
            expect(u112).never.to.equal(v116);
            assertDeepEqual(u112, v116);
            u1.unmountVirtualNode(v117);
        end);
        it("should pass context values through portal nodes", function() -- Line: 910
            -- upvalues: Component (ref), createElement (ref), Children (ref), Portal (ref), u1 (ref), assertDeepEqual (ref)
            local Folder = Instance.new("Folder");
            local v118 = Component:extend("Provider");

            function v118.init(p119) -- Line: 915
                p119._context.foo = "bar";
            end;

            function v118.render(p120) -- Line: 919
                -- upvalues: createElement (ref), Children (ref)
                return createElement("Folder", nil, p120.props[Children]);
            end;

            local v121 = Component:extend("Consumer");
            local u122 = nil;

            function v121.init(p123) -- Line: 926
                -- upvalues: u122 (ref)
                u122 = p123._context;
            end;

            function v121.render(p124) -- Line: 930
                return nil;
            end;

            local v125 = createElement(v118, nil, {
                Portal = createElement(Portal, {
                    target = Folder
                }, {
                    Consumer = createElement(v121)
                })
            });
            u1.mountVirtualNode(v125, nil, "Some Key");
            assertDeepEqual(u122, {
                foo = "bar"
            });
        end);
    end);
    describe("Integration Tests", function() -- Line: 951
        -- upvalues: ReplicatedStorage (copy), Component (copy), createElement (copy), Event (copy), u1 (copy)
        local u126 = nil;
        beforeEach(function() -- Line: 953
            -- upvalues: u126 (ref), ReplicatedStorage (ref)
            u126 = Instance.new("Folder");
            u126.Parent = ReplicatedStorage;
        end);
        afterEach(function() -- Line: 958
            -- upvalues: u126 (ref)
            u126:Destroy();
            u126 = nil;
        end);
        it("should not allow re-entrancy in updateChildren", function() -- Line: 963
            -- upvalues: Component (ref), createElement (ref), Event (ref), u126 (ref), u1 (ref)
            local u127 = Component:extend("ChildComponent");

            function u127.init(p128) -- Line: 966
                p128:setState({
                    firstTime = true
                });
            end;

            local u129 = nil;

            function u127.render(p130) -- Line: 974
                -- upvalues: createElement (ref)
                if p130.state.firstTime then
                    return createElement("Frame");
                end;

                return createElement("TextLabel");
            end;

            function u127.didMount(u131) -- Line: 982
                -- upvalues: u129 (ref)
                u129 = coroutine.create(function() -- Line: 983
                    -- upvalues: u131 (copy)
                    u131:setState({
                        firstTime = false
                    });
                end);
            end;

            local v132 = Component:extend("ParentComponent");

            function v132.init(u133) -- Line: 992
                u133:setState({
                    count = 1
                });

                function u133.childAdded() -- Line: 997
                    -- upvalues: u133 (copy)
                    u133:setState({
                        count = u133.state.count + 1
                    });
                end;
            end;

            function v132.render(p134) -- Line: 1004
                -- upvalues: createElement (ref), Event (ref), u127 (copy)
                return createElement("Frame", {
                    [Event.ChildAdded] = p134.childAdded
                }, {
                    ChildComponent = createElement(u127, {
                        count = p134.state.count
                    })
                });
            end;

            local ScreenGui = Instance.new("ScreenGui");
            ScreenGui.Parent = u126;
            local v135 = createElement(v132);
            local v136 = u1.mountVirtualNode(v135, ScreenGui, "Some Key");
            coroutine.resume(u129);
            expect(#ScreenGui:GetChildren()).to.equal(1);
            local v137 = ScreenGui:GetChildren()[1];
            expect(#v137:GetChildren()).to.equal(1);
            u1.unmountVirtualNode(v136);
        end);
        it("should not allow re-entrancy in updateChildren even with callbacks", function() -- Line: 1033
            -- upvalues: Component (ref), createElement (ref), u126 (ref), u1 (ref)
            local u138 = Component:extend("LowestComponent");

            function u138.render(p139) -- Line: 1036
                -- upvalues: createElement (ref)
                return createElement("Frame");
            end;

            function u138.didMount(p140) -- Line: 1040
                p140.props.onDidMountCallback();
            end;

            local u141 = Component:extend("ChildComponent");

            function u141.init(p142) -- Line: 1046
                p142:setState({
                    firstTime = true
                });
            end;

            local u143 = nil;

            function u141.render(p144) -- Line: 1054
                -- upvalues: createElement (ref), u138 (copy)
                if p144.state.firstTime then
                    return createElement("Frame");
                end;

                return createElement(u138, {
                    onDidMountCallback = p144.props.onDidMountCallback
                });
            end;

            function u141.didMount(u145) -- Line: 1064
                -- upvalues: u143 (ref)
                u143 = coroutine.create(function() -- Line: 1065
                    -- upvalues: u145 (copy)
                    u145:setState({
                        firstTime = false
                    });
                end);
            end;

            local v146 = Component:extend("ParentComponent");
            local u147 = 0;

            function v146.init(u148) -- Line: 1076
                -- upvalues: u147 (ref)
                u148:setState({
                    count = 1
                });

                function u148.onDidMountCallback() -- Line: 1081
                    -- upvalues: u147 (ref), u148 (copy)
                    u147 = u147 + 1;

                    if u148.state.count < 5 then
                        u148:setState({
                            count = u148.state.count + 1
                        });
                    end;
                end;
            end;

            function v146.render(p149) -- Line: 1091
                -- upvalues: createElement (ref), u141 (copy)
                return createElement("Frame", {}, {
                    ChildComponent = createElement(u141, {
                        count = p149.state.count,
                        onDidMountCallback = p149.onDidMountCallback
                    })
                });
            end;

            local ScreenGui = Instance.new("ScreenGui");
            ScreenGui.Parent = u126;
            local v150 = createElement(v146);
            local v151 = u1.mountVirtualNode(v150, ScreenGui, "Some Key");
            coroutine.resume(u143);
            expect(#ScreenGui:GetChildren()).to.equal(1);
            local v152 = ScreenGui:GetChildren()[1];
            expect(#v152:GetChildren()).to.equal(1);
            expect(u147 <= 2).to.equal(true);
            u1.unmountVirtualNode(v151);
        end);
        it("should never call unmount twice in the case of update children re-rentrancy", function() -- Line: 1123
            -- upvalues: Component (ref), createElement (ref), u126 (ref), u1 (ref)
            local u153 = {};

            local function addUnmount(p154) -- Line: 1126
                -- upvalues: u153 (copy)
                u153[p154] = u153[p154] + 1;
            end;

            local function addInit(p155) -- Line: 1130
                -- upvalues: u153 (copy)
                u153[p155] = 0;
            end;

            local u156 = Component:extend("LowestComponent");

            function u156.init(p157) -- Line: 1135
                -- upvalues: u153 (copy)
                u153[tostring(p157)] = 0;
            end;

            function u156.render(p158) -- Line: 1139
                -- upvalues: createElement (ref)
                return createElement("Frame");
            end;

            function u156.didMount(p159) -- Line: 1143
                p159.props.onDidMountCallback();
            end;

            function u156.willUnmount(p160) -- Line: 1147
                -- upvalues: u153 (copy)
                local v161 = tostring(p160);
                u153[v161] = u153[v161] + 1;
            end;

            local u162 = Component:extend("FirstComponent");

            function u162.init(p163) -- Line: 1152
                -- upvalues: u153 (copy)
                u153[tostring(p163)] = 0;
            end;

            function u162.render(p164) -- Line: 1156
                -- upvalues: createElement (ref)
                return createElement("TextLabel");
            end;

            function u162.willUnmount(p165) -- Line: 1160
                -- upvalues: u153 (copy)
                local v166 = tostring(p165);
                u153[v166] = u153[v166] + 1;
            end;

            local u167 = Component:extend("ChildComponent");

            function u167.init(p168) -- Line: 1166
                -- upvalues: u153 (copy)
                u153[tostring(p168)] = 0;
                p168:setState({
                    firstTime = true
                });
            end;

            local u169 = nil;

            function u167.render(p170) -- Line: 1176
                -- upvalues: createElement (ref), u162 (copy), u156 (copy)
                if p170.state.firstTime then
                    return createElement(u162);
                end;

                return createElement(u156, {
                    onDidMountCallback = p170.props.onDidMountCallback
                });
            end;

            function u167.didMount(u171) -- Line: 1186
                -- upvalues: u169 (ref)
                u169 = coroutine.create(function() -- Line: 1187
                    -- upvalues: u171 (copy)
                    u171:setState({
                        firstTime = false
                    });
                end);
            end;

            function u167.willUnmount(p172) -- Line: 1194
                -- upvalues: u153 (copy)
                local v173 = tostring(p172);
                u153[v173] = u153[v173] + 1;
            end;

            local v174 = Component:extend("ParentComponent");
            local u175 = 0;

            function v174.init(u176) -- Line: 1202
                -- upvalues: u175 (ref)
                u176:setState({
                    count = 1
                });

                function u176.onDidMountCallback() -- Line: 1207
                    -- upvalues: u175 (ref), u176 (copy)
                    u175 = u175 + 1;

                    if u176.state.count < 5 then
                        u176:setState({
                            count = u176.state.count + 1
                        });
                    end;
                end;
            end;

            function v174.render(p177) -- Line: 1217
                -- upvalues: createElement (ref), u167 (copy)
                return createElement("Frame", {}, {
                    ChildComponent = createElement(u167, {
                        count = p177.state.count,
                        onDidMountCallback = p177.onDidMountCallback
                    })
                });
            end;

            local ScreenGui = Instance.new("ScreenGui");
            ScreenGui.Parent = u126;
            local v178 = createElement(v174);
            local v179 = u1.mountVirtualNode(v178, ScreenGui, "Some Key");
            coroutine.resume(u169);
            expect(#ScreenGui:GetChildren()).to.equal(1);
            local v180 = ScreenGui:GetChildren()[1];
            expect(#v180:GetChildren()).to.equal(1);
            expect(u175 <= 2).to.equal(true);
            u1.unmountVirtualNode(v179);

            for _, v in pairs(u153) do
                expect(v).to.equal(1);
            end;
        end);
        it("should never unmount a node unnecesarily in the case of re-rentry", function() -- Line: 1253
            -- upvalues: Component (ref), createElement (ref), u126 (ref), u1 (ref)
            local u181 = Component:extend("LowestComponent");

            function u181.render(p182) -- Line: 1255
                -- upvalues: createElement (ref)
                return createElement("Frame");
            end;

            function u181.didUpdate(p183, p184, p185) -- Line: 1259
                if p184.firstTime and not p183.props.firstTime then
                    p183.props.onChangedCallback();
                end;
            end;

            local u186 = Component:extend("ChildComponent");

            function u186.init(p187) -- Line: 1267
                p187:setState({
                    firstTime = true
                });
            end;

            local u188 = nil;

            function u186.render(p189) -- Line: 1275
                -- upvalues: createElement (ref), u181 (copy)
                return createElement(u181, {
                    firstTime = p189.state.firstTime,
                    onChangedCallback = p189.props.onChangedCallback
                });
            end;

            function u186.didMount(u190) -- Line: 1282
                -- upvalues: u188 (ref)
                u188 = coroutine.create(function() -- Line: 1283
                    -- upvalues: u190 (copy)
                    u190:setState({
                        firstTime = false
                    });
                end);
            end;

            local v191 = Component:extend("ParentComponent");
            local u192 = 0;

            function v191.init(u193) -- Line: 1294
                -- upvalues: u192 (ref)
                u193:setState({
                    count = 1
                });

                function u193.onChangedCallback() -- Line: 1299
                    -- upvalues: u192 (ref), u193 (copy)
                    u192 = u192 + 1;

                    if u193.state.count < 5 then
                        u193:setState({
                            count = u193.state.count + 1
                        });
                    end;
                end;
            end;

            function v191.render(p194) -- Line: 1309
                -- upvalues: createElement (ref), u186 (copy)
                return createElement("Frame", {}, {
                    ChildComponent = createElement(u186, {
                        count = p194.state.count,
                        onChangedCallback = p194.onChangedCallback
                    })
                });
            end;

            local ScreenGui = Instance.new("ScreenGui");
            ScreenGui.Parent = u126;
            local v195 = createElement(v191);
            local v196 = u1.mountVirtualNode(v195, ScreenGui, "Some Key");
            coroutine.resume(u188);
            expect(#ScreenGui:GetChildren()).to.equal(1);
            local v197 = ScreenGui:GetChildren()[1];
            expect(#v197:GetChildren()).to.equal(1);
            expect(u192).to.equal(1);
            u1.unmountVirtualNode(v196);
        end);
    end);
end;