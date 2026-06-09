

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Players_0 = game:GetService("Players");
local l_TextService_0 = game:GetService("TextService");
local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local l_TweenService_0 = game:GetService("TweenService");
local _ = require(l_ReplicatedStorage_0.Shared.Data.Builders.TooltipBuilder);
local v8 = require(l_ReplicatedStorage_0.Shared.Utils.Stats.ItemUtil);
local v9 = require(l_ReplicatedStorage_0.Shared.Framework.Classes.Maid);
local v10 = require(l_ReplicatedStorage_0.Shared.Framework.Classes.Signal);
local v11 = require(l_ReplicatedStorage_0.Shared.Utils.AnimateColor);
local v12 = require(l_ReplicatedStorage_0.Client.Framework.Services.InputMode);
local _ = require(l_ReplicatedStorage_0.Shared.Framework.Classes.Pool);
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v15 = require(l_ReplicatedStorage_0.Shared.Constants);
local v16 = require(l_ReplicatedStorage_0.Shared.Framework.Utilities.every);
local v17 = require(l_ReplicatedStorage_0.Client.Framework.Services.LocalData);
local v18 = require(l_ReplicatedStorage_0.Shared.Data.Pets);
local v19 = require(l_ReplicatedStorage_0.Shared.Framework.Utilities.String.FormatPercent);
local v20 = require(l_ReplicatedStorage_0.Shared.Utils.IndexUtil);
local v21 = require(l_ReplicatedStorage_0.Shared.Utils.RichText);
local v22 = require(l_ReplicatedStorage_0.Shared.Framework.Utilities.String.FormatRomanNumeral);
local v23 = require(l_ReplicatedStorage_0.Shared.Utils.Stats.StatsUtil);
local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
local l_ScreenGui_0 = l_LocalPlayer_0.PlayerGui.ScreenGui;
local l_Inner_0 = l_ScreenGui_0.Tooltip.Frame.Inner;
local l_Padding_0 = l_Inner_0.Content.Padding;
local l_Accessory_0 = l_Inner_0.Content.Accessory;
local l_Label_0 = l_Inner_0.Content.Label;
local l_Bar_0 = l_Inner_0.Content.Bar;
local l_Button_0 = l_Inner_0.Content.Button;
local l_Cover_0 = l_ScreenGui_0.Tooltip.Frame.Cover;
local l_Pool_0 = l_Inner_0.Content.Pool;
local l_Template_0 = l_Pool_0.Items.Template;
local v35 = nil;
local v36 = nil;
local v37 = nil;
local v38 = nil;
local v39 = {
    _maid = v9.new(), 
    Changed = v10.new()
};
local function v83(v40, v41) --[[ Line: 73 ]] --[[ Name: makeElement ]]
    -- upvalues: l_Padding_0 (copy), l_Accessory_0 (copy), v8 (copy), l_TextService_0 (copy), l_Bar_0 (copy), l_Button_0 (copy), l_Pool_0 (copy), v17 (copy), l_TweenService_0 (copy), v11 (copy), l_Template_0 (copy), v18 (copy), v20 (copy), v23 (copy), v15 (copy), v19 (copy), v16 (copy), l_Label_0 (copy), l_ScreenGui_0 (copy)
    if v40.Type == "Padding" then
        local v42 = l_Padding_0:Clone();
        v42.Line.Visible = v40.Line ~= nil;
        v42.Size = UDim2.new(1, 0, 0, v40.Size);
        return v42;
    elseif v40.Type == "TextAccessory" then
        local v43 = l_Accessory_0:Clone();
        if typeof(v40.Accessory) == "string" then
            v43.Icon.Label.Image = v40.Accessory;
        else
            v8:UpdateIcon(v43.Icon, v40.Accessory);
        end;
        local v44 = math.ceil(v40.Size * 0.8);
        v43.Size = UDim2.new(1, 0, 0, v40.Size);
        v43.Label.TextSize = v44;
        v43.Label.Text = v40.Text;
        v43.Icon.Size = UDim2.fromOffset(v40.Size, v40.Size);
        v43.UIPadding.PaddingRight = UDim.new(0, (math.ceil(v40.Size / 2.5)));
        local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v40.Text, v44, v43.Label.Font, Vector2.new(v41.Width - 40, v44));
        v43.Label.Size = UDim2.new(0, l_l_TextService_0_TextSize_0.X, 1, 0);
        return v43;
    elseif v40.Type == "Bar" then
        local v46 = l_Bar_0:Clone();
        v46.Label.Text = v40.Text or "";
        v46.Progress.Fill.Size = UDim2.new(v40.Alpha, 0, 1, 6);
        v46.Progress.Fill.Visible = v40.Alpha > 0.01;
        return v46;
    elseif v40.Type == "Button" then
        return (l_Button_0:Clone());
    elseif v40.Type == "Pool" then
        local v47 = l_Pool_0:Clone();
        local v48 = 1;
        local l_Pool_1 = v40.Pool;
        local v50 = 0;
        for _, v52 in l_Pool_1 do
            if v8:GetRarity(v52.Item) ~= "Secret" then
                v50 = v50 + 1;
            end;
        end;
        local v53 = math.ceil(v50 / 6);
        local v54 = os.clock();
        local v55 = TweenInfo.new(0.35, Enum.EasingStyle.Linear);
        local function v75(v56) --[[ Line: 134 ]] --[[ Name: renderItemPage ]]
            -- upvalues: v17 (ref), v47 (copy), l_TweenService_0 (ref), v55 (copy), v8 (ref), v11 (ref), v48 (ref), l_Pool_1 (copy), v40 (copy), l_Template_0 (ref), v18 (ref), v20 (ref), v23 (ref), v15 (ref), v19 (ref), v54 (ref), v53 (copy)
            local v57 = v17:Get();
            if not v57 then
                return;
            else
                if v56 then
                    local v58 = v47.Items:Clone();
                    v58.Name = "Other";
                    v47.Items.Position = UDim2.fromScale(1.5, 1);
                    v58.Parent = v47;
                    l_TweenService_0:Create(v47.Items, v55, {
                        Position = UDim2.fromScale(0.5, 1)
                    }):Play();
                    l_TweenService_0:Create(v58, v55, {
                        Position = UDim2.fromScale(-1.5, 1)
                    }):Play();
                    local l_v58_0 = v58 --[[ copy: 2 -> 14 ]];
                    task.delay(v55.Time, function() --[[ Line: 147 ]]
                        -- upvalues: l_v58_0 (copy), v8 (ref), v11 (ref)
                        for _, v61 in l_v58_0:GetChildren() do
                            if v61:IsA("Frame") then
                                v8:UpdateIcon(v61.Icon);
                                v11.None(v61.Label);
                            end;
                        end;
                        l_v58_0:Destroy();
                    end);
                end;
                for _, v63 in v47.Items:GetChildren() do
                    if v63:IsA("Frame") then
                        v8:UpdateIcon(v63.Icon);
                        v11.None(v63.Label);
                        v63:Destroy();
                    end;
                end;
                local _ = v57.Discovered;
                for v65 = (v48 - 1) * 6 + 1, v48 * 6 do
                    local v66 = l_Pool_1[v65];
                    if v66 then
                        local l_v8_Rarity_0 = v8:GetRarity(v66.Item);
                        if l_v8_Rarity_0 ~= "Secret" or v40.ShowAll then
                            local v68 = l_Template_0:Clone();
                            local l_Item_0 = v66.Item;
                            if l_Item_0.Type == "Pet" then
                                local l_Name_0 = l_Item_0.Name;
                                local _ = v18[l_Name_0];
                                local v72 = v20:HasAny(v57, l_Name_0) or v40.ShowAll;
                                local v73 = not v72 and -10 or 0;
                                v68.Icon.Size = UDim2.new(1, v73, 1, v73);
                                v68.Icon.Label.ImageColor3 = v72 and Color3.new(1, 1, 1) or Color3.new();
                                v68.Amount.Visible = false;
                            elseif l_Item_0.Type == "Currency" then
                                local v74 = table.clone(l_Item_0);
                                v74.Amount = math.ceil(v74.Amount * v23:GetCurrencyMultiplier(v57, v74.Currency, true));
                                l_Item_0 = v74;
                            end;
							if l_Item_0.Type == "Pet" then
								local petData = v18[l_Item_0.Name]

								if petData and petData.Void then
									v11.Cycle(v68.Label, "Void", {
										Speed = 0.4
									})

								elseif petData and petData.Infinity then
									v11.Cycle(v68.Label, "Infinity", {
										Speed = 0.4
									})
								
								elseif petData and petData.Ultimatum then
									v11.Cycle(v68.Label, "Ultimatum", {
										Speed = 0.4
									})
								
								elseif petData and petData.Eternal then
									v11.Cycle(v68.Label, "Eternal", {
										Speed = 0.4
									})

								elseif petData and petData.Ancient then
									v11.Cycle(v68.Label, "Ancient", {
										Speed = 0.4
									})
								
								elseif petData and petData.Dev then
									v11.Cycle(v68.Label, "Dev", {
										Speed = 0.4
									})

								elseif l_v8_Rarity_0 == "Legendary" or l_v8_Rarity_0 == "Secret" then
									v11.Cycle(v68.Label, "Rainbow", {
										Speed = 0.4
									})

								else
									v68.Label.TextColor3 = v15.RarityColors[l_v8_Rarity_0]
								end
							else
								if l_v8_Rarity_0 == "Legendary" or l_v8_Rarity_0 == "Secret" then
									v11.Cycle(v68.Label, "Rainbow", {
										Speed = 0.4
									})
								else
									v68.Label.TextColor3 = v15.RarityColors[l_v8_Rarity_0]
								end
							end
                            v68.LayoutOrder = v65;
                            v68.Label.Text = v19(v66.Chance, true);
                            v68.Parent = v47.Items;
                            v8:UpdateIcon(v68.Icon, l_Item_0);
                            v8:FormatAmount(v68.Amount, l_Item_0);
                        end;
                    else
                        break;
                    end;
                end;
                v54 = os.clock();
                v47.Page.Text = ("%* / %*"):format(v48, v53);
                v47.Page.Visible = v53 > 1;
                return;
            end;
        end;
        v40.Callback = function() --[[ Line: 210 ]] --[[ Name: create ]]
            -- upvalues: v16 (ref), v53 (copy), v54 (ref), v48 (ref), v75 (copy), v47 (copy), l_Pool_1 (copy), v8 (ref), v11 (ref)
            local v76 = v16(0.25, function() --[[ Line: 211 ]]
                -- upvalues: v53 (ref), v54 (ref), v48 (ref), v75 (ref)
                if v53 > 1 and os.clock() - v54 > 2.5 then
                    v48 = v48 + 1;
                    if v53 < v48 then
                        v48 = 1;
                    end;
                    v75(true);
                end;
            end);
            local v77 = v53 > 1 and 20 or 0;
            v47.Size = UDim2.new(1, -20, 0, v77 + (#l_Pool_1 <= 3 and 70 or 150));
            v47.Items.Size = UDim2.new(1, 0, 1, v53 > 1 and -20 or 0);
            v75();
            return function() --[[ Line: 227 ]]
                -- upvalues: v47 (ref), v8 (ref), v11 (ref), v76 (copy)
                for _, v79 in v47.Items:GetChildren() do
                    if v79:IsA("Frame") then
                        v8:UpdateIcon(v79.Icon);
                        v11.None(v79.Label);
                        v79:Destroy();
                    end;
                end;
                v76:Disconnect();
            end;
        end;
        return v47;
    else
        local v80 = l_Label_0:Clone();
        v80.Text = v40.Text;
        v80.TextSize = v40.Size;
        local l_GetTextBoundsParams_0 = Instance.new("GetTextBoundsParams");
        l_GetTextBoundsParams_0.Text = v40.Text;
        l_GetTextBoundsParams_0.Font = v80.FontFace;
        l_GetTextBoundsParams_0.Size = v40.Size;
        l_GetTextBoundsParams_0.Width = v41.Width - 25;
        l_GetTextBoundsParams_0.RichText = true;
        task.defer(function() --[[ Line: 256 ]]
            -- upvalues: l_TextService_0 (ref), l_GetTextBoundsParams_0 (copy), v80 (copy)
            local l_l_TextService_0_TextBoundsAsync_0 = l_TextService_0:GetTextBoundsAsync(l_GetTextBoundsParams_0);
            v80.Size = UDim2.new(1, 0, 0, l_l_TextService_0_TextBoundsAsync_0.Y);
        end);
        v80:GetPropertyChangedSignal("TextBounds"):Connect(function() --[[ Line: 261 ]]
            -- upvalues: v80 (copy), l_ScreenGui_0 (ref)
            v80.Size = UDim2.new(1, 0, 0, v80.TextBounds.Y / l_ScreenGui_0.UIScale.Scale);
        end);
        return v80;
    end;
end;
local function v89(v84) --[[ Line: 270 ]] --[[ Name: applyStyle ]]
    -- upvalues: l_Inner_0 (copy)
    local v85 = Color3.fromHex("#1badec");
    local v86 = Color3.fromHex("#217ad9");
    local v87 = Color3.fromHex("#e1f3ff");
    local v88 = Color3.fromHex("#8ccdff");
    if v84 == "Shiny" then
        v85 = Color3.fromHex("#ecde1b");
        v86 = Color3.fromHex("#d97d20");
        v87 = Color3.fromHex("#ffffe4");
        v88 = Color3.fromHex("#f3ff74");
    elseif v84 == "Mythic" then
        v85 = Color3.fromHex("#ec20c7");
        v86 = Color3.fromHex("#8a30d9");
        v87 = Color3.fromHex("#fff7ff");
        v88 = Color3.fromHex("#e5a2ff");
    end;
    l_Inner_0.BackgroundColor3 = v87;
    l_Inner_0.Background.ImageColor3 = v88;
    l_Inner_0.Title.Background.ImageColor3 = v88;
    l_Inner_0.Title.Bottom.BackgroundColor3 = v86;
    l_Inner_0.Title.UIGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, v86), 
        ColorSequenceKeypoint.new(0.168, v86), 
        ColorSequenceKeypoint.new(1, v85)
    });
end;
v39.Apply = function(v90, v91, v92) --[[ Line: 301 ]] --[[ Name: Apply ]]
    -- upvalues: v38 (ref), l_Cover_0 (copy), l_TweenService_0 (copy), v37 (ref), v83 (copy), l_Inner_0 (copy), v11 (copy), v15 (copy), v8 (copy), v18 (copy), v21 (copy), v22 (copy), v89 (copy), v36 (ref), l_ScreenGui_0 (copy)
    if v38 and not v92 then
        v38:Cancel();
    end;
    if not v92 then
        l_Cover_0.Transparency = 0;
        l_Cover_0.BackgroundColor3 = Color3.new(0.129412, 0.505882, 1);
        v38 = l_TweenService_0:Create(l_Cover_0, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {
            BackgroundColor3 = Color3.new(1, 1, 1), 
            BackgroundTransparency = 1
        }):Play();
    end;
    v90._maid:Cleanup();
    v37 = v91;
    for v93, v94 in v91.Elements do
        local v95 = v83(v94, v91);
        if v95 then
            local l_Callback_0 = v94.Callback;
            if l_Callback_0 then
                local v97 = l_Callback_0(v95);
                if typeof(v97) == "function" then
                    v90._maid:Add(v97);
                end;
            end;
            v95.LayoutOrder = v93;
            v95.Parent = l_Inner_0.Content;
            v90._maid:Add(function() --[[ Line: 334 ]]
                -- upvalues: v95 (copy), v11 (ref)
                for _, v99 in v95:GetDescendants() do
                    if v99:IsA("GuiObject") then
                        v11.None(v95);
                    end;
                end;
                v95:Destroy();
            end);
        end;
    end;
    local v100 = nil;
    if v91.Title then
        local l_Info_0 = v91.Title.Info;
        local l_Item_1 = v91.Title.Item;
        local v103 = l_Info_0 and string.find(l_Info_0, "Mythic");
        if v103 then
            l_Info_0 = string.gsub(l_Info_0 or "", "Mythic ", "");
        end;
        local v104 = v15.RarityOrder[l_Info_0] or l_Info_0 == "Permanent";
        if v104 and (l_Info_0 == "Legendary" or l_Info_0 == "Permanent") then
            v100 = "Legendary";
            v11.Cycle(l_Inner_0.Title.Content.Info.SubTitle, "Rainbow", {
                Speed = 0.4
            });
        elseif l_Info_0 == "Secret" then
            v100 = "Secret";
            v11.None(l_Inner_0.Title.Content.Info.SubTitle);
            l_Inner_0.Title.Content.Info.SubTitle.TextColor3 = v15.RarityColors.Secret;
        else
            v11.None(l_Inner_0.Title.Content.Info.SubTitle);
            l_Inner_0.Title.Content.Info.SubTitle.TextColor3 = v15.RarityColors[l_Info_0] or Color3.new(1, 1, 1);
        end;
        if v103 then
            v100 = "Mythic";
        end;
		if not v104 and l_Item_1 then
			local l_v8_Rarity_1 = v8:GetRarity(l_Item_1);
			
			local petData = nil
			if l_Item_1.Type == "Pet" then
				petData = v18[l_Item_1.Name]

				if petData and petData.Void then
					v11.Shift(l_Inner_0.Title.Content.Info.Label, "Void", {
						Speed = 0.4
					})

				elseif petData and petData.Infinity then
					v11.Shift(l_Inner_0.Title.Content.Info.Label, "Infinity", {
						Speed = 0.4
					})
					
				elseif petData and petData.Ultimatum then
					v11.Shift(l_Inner_0.Title.Content.Info.Label, "Ultimatum", {
						Speed = 0.4
					})
				
				elseif petData and petData.Eternal then
					v11.Shift(l_Inner_0.Title.Content.Info.Label, "Eternal", {
						Speed = 0.4
					})
				
				elseif petData and petData.Dev then
					v11.Shift(l_Inner_0.Title.Content.Info.Label, "Dev", {
						Speed = 0.4
					})

				elseif petData and petData.Ancient then
					v11.Shift(l_Inner_0.Title.Content.Info.Label, "Ancient", {
						Speed = 0.4
					})

				elseif l_v8_Rarity_1 == "Legendary" or l_v8_Rarity_1 == "Secret" then
					v11.Cycle(l_Inner_0.Title.Content.Info.Label, "Rainbow", {
						Speed = 0.4
					})

				else
					v11.None(l_Inner_0.Title.Content.Info.Label)
					l_Inner_0.Title.Content.Info.Label.TextColor3 = v15.RarityColors[l_v8_Rarity_1]
				end
			else
				petData = v18[l_Item_1.Name]
				if l_v8_Rarity_1 == "Legendary" or l_v8_Rarity_1 == "Secret" then
					v11.Cycle(l_Inner_0.Title.Content.Info.Label, "Rainbow", {
						Speed = 0.4
					})
				elseif petData and petData.Void then
					v11.Shift(l_Inner_0.Title.Content.Info.Label, "Void", {
						Speed = 0.4
					})
				elseif petData and petData.Ultimatum then
					v11.Shift(l_Inner_0.Title.Content.Info.Label, "Ultimatum", {
						Speed = 0.4
					})
				elseif petData and petData.Eternal then
					v11.Shift(l_Inner_0.Title.Content.Info.Label, "Eternal", {
						Speed = 0.4
					})
				elseif petData and petData.Dev then
					v11.Shift(l_Inner_0.Title.Content.Info.Label, "Dev", {
						Speed = 0.4
					})
				elseif petData and petData.Infinity then
					v11.Shift(l_Inner_0.Title.Content.Info.Label, "Infinity", {
						Speed = 0.4
					})
				elseif petData and petData.Ancient then
					v11.Shift(l_Inner_0.Title.Content.Info.Label, "Ancient", {
						Speed = 0.4
					})
				else
					v11.None(l_Inner_0.Title.Content.Info.Label)
					l_Inner_0.Title.Content.Info.Label.TextColor3 = v15.RarityColors[l_v8_Rarity_1]
				end
			end
            v100 = l_v8_Rarity_1;
        else
            v11.None(l_Inner_0.Title.Content.Info.Label);
        end;
        if l_Item_1 or v91.Title.Image then
            local v106 = -100;
            if l_Item_1 and l_Item_1.Type == "Potion" then
                v106 = -90;
            end;
            if v91.Title.Image then
                v8:UpdateIcon(l_Inner_0.Title.Content.Icon);
                l_Inner_0.Title.Content.Icon.Label.Image = v91.Title.Image;
                l_Inner_0.Title.Content.Icon.Label.Visible = true;
            else
                v8:UpdateIcon(l_Inner_0.Title.Content.Icon, l_Item_1);
            end;
            l_Inner_0.Title.Content.Info.Size = UDim2.new(1, v106, 1, -15);
        else
            l_Inner_0.Title.Content.Info.Size = UDim2.new(1, -10, 1, -15);
            v8:UpdateIcon(l_Inner_0.Title.Content.Icon);
        end;
		local petData = nil
		
		if l_Item_1 and l_Item_1.Type == "Pet" then
			petData = v18[l_Item_1.Name]
			if l_Item_1.Shiny and v103 then
				v100 = "Shiny"
			elseif l_Item_1.Shiny then
				v100 = "Shiny"
			elseif v103 then
				v100 = "Mythic"
			end
		end

		if petData and petData.Void then
			l_Inner_0.Title.Content.Info.SubTitle.Text =
				(v103 and "Mythic Void" or "Void")

			v11.Shift(l_Inner_0.Title.Content.Info.SubTitle, "Void", {
				Speed = 0.5
			})

		elseif petData and petData.Infinity then
			l_Inner_0.Title.Content.Info.SubTitle.Text =
				(v103 and "Mythic Infinity" or "Infinity")

			v11.Shift(l_Inner_0.Title.Content.Info.SubTitle, "Infinity", {
				Speed = 0.5
			})
			
		elseif petData and petData.Ultimatum then
			l_Inner_0.Title.Content.Info.SubTitle.Text =
				(v103 and "Mythic Ultimatum" or "Ultimatum")

			v11.Shift(l_Inner_0.Title.Content.Info.SubTitle, "Ultimatum", {
				Speed = 0.5
			})
		
		elseif petData and petData.Eternal then
			l_Inner_0.Title.Content.Info.SubTitle.Text =
				(v103 and "Mythic Eternal" or "Eternal")
			
			v11.Shift(l_Inner_0.Title.Content.Info.SubTitle, "Eternal", {
				Speed = 0.5
			})
		
		elseif petData and petData.Dev then
			l_Inner_0.Title.Content.Info.SubTitle.Text =
				(v103 and "Mythic Dev" or "Dev")

			v11.Shift(l_Inner_0.Title.Content.Info.SubTitle, "Dev", {
				Speed = 0.5
			})

		elseif petData and petData.Ancient then
			l_Inner_0.Title.Content.Info.SubTitle.Text =
				(v103 and "Mythic Ancient" or "Ancient")

			v11.Shift(l_Inner_0.Title.Content.Info.SubTitle, "Ancient", {
				Speed = 0.5
			})

		elseif v103 then
			l_Inner_0.Title.Content.Info.SubTitle.Text =
				("Mythic%*"):format(l_Info_0 == "Secret" and " Secret" or "")

			v11.Cycle(l_Inner_0.Title.Content.Info.SubTitle, "Mythic", {
				Speed = 0.5
			})

		else
			l_Inner_0.Title.Content.Info.SubTitle.Text = l_Info_0 or ""

			if l_Info_0 == "Legendary" then
				v11.Cycle(l_Inner_0.Title.Content.Info.SubTitle, "Rainbow", {
					Speed = 0.4
				})
			elseif l_Info_0 == "Secret" then
				v11.Shift(l_Inner_0.Title.Content.Info.SubTitle, "Secret", {
					Speed = 0.4
				})
			else
				v11.None(l_Inner_0.Title.Content.Info.SubTitle)
			end
		end
        if l_Item_1 and l_Item_1.Type == "Pet" then
            local v107 = v18[l_Item_1.Name];
            if v107.Rarity == "Legendary" then
                local v108 = v107.Tier or 1;
                if v108 > 1 then
                    local l_SubTitle_0 = l_Inner_0.Title.Content.Info.SubTitle;
                    l_SubTitle_0.Text = l_SubTitle_0.Text .. (" %*"):format((v21.new():size(18)((("Tier %*"):format((v22(v108)))))));
                end;
            end;
        end;
        l_Inner_0.Title.Content.Info.Label.Text = v91.Title.Text;
    else
        v11.None(l_Inner_0.Title.Content.Info.SubTitle);
    end;
    if v100 == "Mythic" then
        v89("Mythic");
        l_Inner_0.Parent.Glow.ImageTransparency = 0;
        l_Inner_0.Parent.Glow.ImageColor3 = Color3.new(1, 1, 1);
        v11.Cycle(l_Inner_0.Parent.Glow, "Mythic", {
            Speed = 0.65
        });
    elseif v100 == "Shiny" then
        v89("Shiny");
        l_Inner_0.Parent.Glow.ImageTransparency = 0;
        l_Inner_0.Parent.Glow.ImageColor3 = Color3.new(1, 1, 1);
        v11.Shift(l_Inner_0.Parent.Glow, "PotionShiny", {
            Speed = 0.5
        });
    elseif v100 == "Legendary" then
        v89("None");
        l_Inner_0.Parent.Glow.ImageTransparency = 0;
        l_Inner_0.Parent.Glow.ImageColor3 = Color3.new(1, 1, 1);
        v11.Shift(l_Inner_0.Parent.Glow, "Rainbow", {
            Speed = 0.4
        });
    else
        if v100 == "Secret" then
            l_Inner_0.Parent.Glow.ImageTransparency = 0;
            l_Inner_0.Parent.Glow.ImageColor3 = Color3.new(1, 1, 1);
            v11.Cycle(l_Inner_0.Parent.Glow, "Secret", {
                Speed = 0.65
            });
        else
            v11.None(l_Inner_0.Parent.Glow);
            l_Inner_0.Parent.Glow.ImageColor3 = Color3.new();
            l_Inner_0.Parent.Glow.ImageTransparency = 0.5;
        end;
        v89("None");
    end;
    if not v92 then
        v36(nil);
    end;
    l_Inner_0.Title.Visible = v91.Title ~= nil;
    l_Inner_0.Parent.Size = UDim2.fromOffset(v91.Width, 1000);
    l_Inner_0.Parent.Visible = true;
    task.defer(function() --[[ Line: 478 ]]
        -- upvalues: l_Inner_0 (ref), v91 (copy), l_ScreenGui_0 (ref)
        local v110 = l_Inner_0.Title.Visible and 70 or 0;
        l_Inner_0.Content.Size = UDim2.new(1, -40, 1, -20 - v110);
        l_Inner_0.Parent.Size = UDim2.fromOffset(v91.Width, l_Inner_0.Content.UIListLayout.AbsoluteContentSize.Y / l_ScreenGui_0.UIScale.Scale + 20 + v110);
    end);
end;
local function v112() --[[ Line: 487 ]] --[[ Name: update ]]
    -- upvalues: l_Inner_0 (copy), l_ScreenGui_0 (copy)
    local v111 = l_Inner_0.Title.Visible and 70 or 0;
    l_Inner_0.Content.Size = UDim2.new(1, -40, 1, -20 - v111);
    l_Inner_0.Parent.Size = UDim2.fromOffset(l_Inner_0.Parent.Size.X.Offset, l_Inner_0.Content.UIListLayout.AbsoluteContentSize.Y / l_ScreenGui_0.UIScale.Scale + 20 + v111);
end;
l_Inner_0.Title:GetPropertyChangedSignal("Visible"):Connect(v112);
l_Inner_0.Content.UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(v112);
v112 = function(v113) --[[ Line: 499 ]] --[[ Name: isOverlayActive ]]
    -- upvalues: l_ScreenGui_0 (copy)
    for _, v115 in l_ScreenGui_0:GetChildren() do
        if v115:IsA("GuiObject") and not v115:IsAncestorOf(v113) and v115.Name ~= "Tooltip" and v115.Name ~= "_overlay" and v115.Size == UDim2.fromScale(1, 1) and v115.Visible and (v115:FindFirstChild("Overlay") or v115:FindFirstChild("Frame") or v115:FindFirstChild("Cover") or v115.Name == "DailyRewards") then
            return true;
        end;
    end;
    return false;
end;
v39.OnEnter = function(v116, v117, v118) --[[ Line: 524 ]] --[[ Name: OnEnter ]]
    -- upvalues: v37 (ref), v39 (copy), v36 (ref), v112 (copy), v12 (copy), v35 (ref)
    local function v120() --[[ Line: 525 ]] --[[ Name: apply ]]
        -- upvalues: v118 (copy), v37 (ref), v39 (ref), v36 (ref), v117 (copy), v116 (copy)
        local v119 = v118();
        v37 = v119;
        if v119 then
            v39:Apply(v119);
            v39:MoveTo();
            v36(v117);
            v116.Changed:Fire(v117);
            return;
        else
            v116:Hide();
            return;
        end;
    end;
    local function v121() --[[ Line: 541 ]] --[[ Name: onEnter ]]
        -- upvalues: v112 (ref), v117 (copy), v12 (ref), v120 (copy)
        if v112(v117) then
            return;
        else
            if v12.Mode == "Keyboard" then
                v120();
            end;
            return;
        end;
    end;
    local function v122() --[[ Line: 550 ]] --[[ Name: onLeave ]]
        -- upvalues: v35 (ref), v117 (copy), v12 (ref), v116 (copy)
        if v35 == v117 and v12.Mode == "Keyboard" then
            v116:Hide();
        end;
    end;
    v117.MouseEnter:Connect(v121);
    v117.MouseLeave:Connect(v122);
    v117.Activated:Connect(function() --[[ Line: 559 ]]
        -- upvalues: v12 (ref), v35 (ref), v117 (copy), v116 (copy), v120 (copy)
        if v12.Mode == "Keyboard" then
            return;
        elseif v35 == v117 then
            v116:Hide();
            return;
        else
            v120();
            return;
        end;
    end);
end;
v39.Hide = function(v123) --[[ Line: 572 ]] --[[ Name: Hide ]]
    -- upvalues: v36 (ref), v37 (ref), l_Inner_0 (copy)
    v36(nil);
    v37 = nil;
    l_Inner_0.Parent.Visible = false;
    v123.Changed:Fire();
    v123._maid:Cleanup();
end;
v39.GetId = function(_) --[[ Line: 582 ]] --[[ Name: GetId ]]
    -- upvalues: v37 (ref)
    if v37 then
        return v37.ID;
    else
        return nil;
    end;
end;
v39.IsEnabled = function(_) --[[ Line: 586 ]] --[[ Name: IsEnabled ]]
    -- upvalues: v37 (ref)
    return v37 ~= nil;
end;
local v126 = nil;
do
    local l_v126_0 = v126;
    v36 = function(v128) --[[ Line: 595 ]] --[[ Name: setLastEnter ]]
        -- upvalues: v35 (ref), l_v126_0 (ref), v39 (copy)
        v35 = v128;
        if l_v126_0 then
            l_v126_0:Disconnect();
            l_v126_0 = nil;
        end;
        if v128 then
            l_v126_0 = v128.AncestryChanged:Connect(function(_, v130) --[[ Line: 602 ]]
                -- upvalues: v39 (ref)
                if v130 == nil then
                    v39:Hide();
                end;
            end);
        end;
    end;
end;
l_LocalPlayer_0.PlayerGui.ChildAdded:Connect(function(v131) --[[ Line: 612 ]]
    -- upvalues: v39 (copy)
    if v131.Name == "Processing" then
        v39:Hide();
    end;
end);
v126 = l_ScreenGui_0.UIScale;
v39.MoveTo = function(_) --[[ Line: 630 ]] --[[ Name: MoveTo ]]
    -- upvalues: v126 (copy), l_UserInputService_0 (copy), l_ScreenGui_0 (copy), l_Inner_0 (copy), v12 (copy), v35 (ref), l_GuiService_0 (copy)
    local l_Scale_0 = v126.Scale;
    local v134 = l_UserInputService_0:GetMouseLocation() / l_Scale_0;
    local v135 = l_ScreenGui_0.AbsoluteSize / l_Scale_0 - Vector2.new(3, 3);
    local v136 = l_Inner_0.AbsoluteSize / l_Scale_0;
    local v137 = v134.X + 40;
    local v138 = v134.Y - 50;
    local v139 = if v12.Mode == "Keyboard" then nil else v35;
    if v139 then
        local v140 = v139.AbsolutePosition / l_Scale_0 + l_GuiService_0:GetGuiInset();
        v137 = (v140 + v139.AbsoluteSize / l_Scale_0).X + 10;
        v138 = v140.Y;
    end;
    local v141 = math.min(v137, v135.X - v136.X);
    local v142 = math.min(v138, v135.Y - v136.Y);
    local v143 = v134.Y - v142;
    if v139 then
        v143 = ((v139.AbsolutePosition + v139.AbsoluteSize / 2) / l_Scale_0 + l_GuiService_0:GetGuiInset()).Y - v142;
    end;
    v143 = math.min(math.max(v143, 30), v136.Y - 30);
    l_Inner_0.Tip.AnchorPoint = Vector2.new(1, 0.5);
    l_Inner_0.Tip.Position = UDim2.new(0, 0, 0, v143);
    l_Inner_0.Tip.Rotation = 0;
    l_Inner_0.Parent.AnchorPoint = Vector2.new(0, 0);
    l_Inner_0.Parent.Position = UDim2.fromOffset(v141, v142);
end;
l_Inner_0:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 672 ]]
    -- upvalues: v39 (copy)
    v39:MoveTo();
end);
l_RunService_0.RenderStepped:Connect(function() --[[ Line: 677 ]]
    -- upvalues: v35 (ref), v12 (copy), v39 (copy)
    if v35 and v12.Mode == "Keyboard" then
        v39:MoveTo();
    end;
end);
l_Inner_0.Parent.Visible = false;
l_Padding_0.Parent = nil;
l_Accessory_0.Parent = nil;
l_Label_0.Parent = nil;
l_Bar_0.Parent = nil;
l_Button_0.Parent = nil;
l_Pool_0.Parent = nil;
l_Template_0.Parent = nil;
return v39;
