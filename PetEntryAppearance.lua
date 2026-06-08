

local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local _ = game:GetService("Players");
local _ = require(l_ReplicatedStorage_0.Shared.Types);
local v4 = require(l_ReplicatedStorage_0.Shared.Data.Pets);
local v5 = require(l_ReplicatedStorage_0.Shared.Utils.PetLevelUtil);
local v6 = require(l_ReplicatedStorage_0.Client.Gui.Utils.Shiny);
local v7 = require(l_ReplicatedStorage_0.Shared.Utils.AnimateColor);
local v8 = require(l_ReplicatedStorage_0.Shared.Constants);
local v9 = require(l_ReplicatedStorage_0.Shared.Utils.RichText);
local v10 = require(l_ReplicatedStorage_0.Shared.Framework.Utilities.String.FormatSuffix);
local v11 = {};
local v12 = nil;
local v13 = v9.new():size(20);
local l_v13_0 = v13 --[[ copy: 13 -> 15 ]];
v12 = function(v15) --[[ Line: 23 ]] --[[ Name: formatAmountText ]]
    -- upvalues: v9 (copy), l_v13_0 (copy), v10 (copy)
    return v9.autoStroke((("%*%*"):format(l_v13_0("x"), (v10(v15, 1000)))));
end;
v13 = function(v16) --[[ Line: 30 ]] --[[ Name: getImage ]]
    -- upvalues: v4 (copy), v8 (copy)
    local v17 = v4[v16.Name];
    local l_Normal_0 = v17.Images.Normal;
    if v16.Mythic or v16.Shiny then
        l_Normal_0 = v17.Images[("%*%*"):format(v16.Mythic and "Mythic" or "", v16.Shiny and "Shiny" or "")];
    end;
    return l_Normal_0 or v8.UnknownImage;
end;
local function v32(v19, v20, v21, v22, v23) --[[ Line: 42 ]] --[[ Name: set ]]
	v6:Remove(v19.Inner.Effect)
	local petData = v4[v20.Name]
    -- upvalues: v4 (copy), v8 (copy), v12 (ref), v5 (copy), v7 (copy), v6 (copy), l_ReplicatedStorage_0 (copy), v11 (copy)
    local _ = v4[v20.Name].Images;
    local l_Icon_0 = v19.Inner.Button.Inner.Icon;
    local v26 = v4[v20.Name];
    local l_Normal_1 = v26.Images.Normal;
    if v20.Mythic or v20.Shiny then
        l_Normal_1 = v26.Images[("%*%*"):format(v20.Mythic and "Mythic" or "", v20.Shiny and "Shiny" or "")];
    end;
    l_Icon_0.Image = l_Normal_1 or v8.UnknownImage;
    l_Icon_0 = v19.Inner.Button.Inner:FindFirstChild("Amount");
    if l_Icon_0 then
        if v20.Amount ~= nil and v21 then
            l_Icon_0.Text = v12(v20.Amount);
            l_Icon_0.Visible = true;
        else
            l_Icon_0.Visible = false;
        end;
    end;
    local l_Level_0 = v19.Inner.Button.Inner:FindFirstChild("Level");
    if l_Level_0 then
        v26 = v5:GetLevelFromPet(v20);
        l_Normal_1 = "Lvl ";
        if v23 then
            l_Normal_1 = "";
        end;
        if l_Level_0.RichText then
            l_Level_0.Visible = v26 > 1;
            l_Level_0.Text = ("<stroke color=\"#00295E\" joins=\"miter\" thickness=\"2\"><font size=\"18\"> %*</font>%*</stroke>"):format(l_Normal_1, v26);
        else
            l_Level_0.Visible = true;
            l_Level_0.Text = ("%*%*"):format(l_Normal_1, v26);
        end;
    end;
	v26 = v4[v20.Name].Rarity;
	local IsSpecial =
		v26 == "Secret"
		or v20.Ancient
		or v20.Void
		or v20.Infinity
		or v20.Eternal
		or v20.Dev
		or v20.Ultimatum
    l_Normal_1 = true;
    if v26 ~= "Legendary" then
        l_Normal_1 = v26 == "Secret";
    end;
    if v19.Inner.Button:FindFirstChild("UIStroke") then
        if v20.Mythic then
            v19.Inner.Button.UIStroke.Color = Color3.new(1, 1, 1);
            v7.Cycle(v19.Inner.Button.UIStroke, "Mythic", {
                Speed = 0.75
            });
        else
            v7.None(v19.Inner.Button.UIStroke);
            v19.Inner.Button.UIStroke.Color = Color3.fromHex("#00295e");
        end;
    end;
	-- 🔥 RESET ONCE (ONLY HERE)
	v6:Remove(v19.Inner.Effect)
	v7.None(v19.Inner.Button)
	v7.None(v19.Inner.Button.Inner)

	local button = v19.Inner.Button
	local inner = button.Inner

	-- default base reset
	button.BackgroundColor3 = Color3.new(1, 1, 1)
	inner.BackgroundColor3 = Color3.fromRGB(27, 156, 236)

	local state = nil

	if v20.Void == true or v4[v20.Name].Void then
		state = "Void"

	elseif v20.Infinity == true or v4[v20.Name].Infinity then
		state = "Infinity"

	elseif v20.Ancient == true or v4[v20.Name].Ancient then
		state = "Ancient"
		
	elseif v20.Ultimatum == true or v4[v20.Name].Ultimatum then
		state = "Ultimatum"
	
	elseif v20.Eternal == true or v4[v20.Name].Eternal then
		state = "Eternal"
	
	elseif v20.Dev == true or v4[v20.Name].Dev then
		state = "Dev"

	elseif v20.Mythic == true then
		state = "Mythic"

	elseif v20.Shiny == true then
		state = "Shiny"

	elseif v26 == "Secret" then
		state = "Secret"
	
	elseif v26 == "Legendary" then
		state = "Legendary"
	end

	-- APPLY (ONLY ONE PATH)
	v7.None(v19.Inner.Button)
	
	local now = tick()


	if state == "Void" then
		v7.Shift(v19.Inner.Button, "Void", {Speed = 0.5})

	elseif state == "Infinity" then
		v7.Shift(v19.Inner.Button, "Infinity", {Speed = 0.5})

	elseif state == "Ancient" then
		v7.Shift(v19.Inner.Button, "Ancient", {Speed = 0.5})

	elseif state == "Ultimatum" then
		v7.Shift(v19.Inner.Button, "Ultimatum", {Speed = 0.5})
		
	elseif state == "Dev" then
		v7.Shift(v19.Inner.Button, "Dev", {Speed = 0.5})
		
	elseif state == "Eternal" then
		v7.Shift(v19.Inner.Button, "Eternal", {Speed = 0.5})

	elseif state == "Mythic" then
		v7.Cycle(v19.Inner.Button, "PotionMythic", {Speed = 0.5})

	elseif state == "Shiny" then
		v7.Cycle(v19.Inner.Button, "Shiny", {Speed = 0.5})

	elseif state == "Secret" then
		v7.Shift(v19.Inner.Button, "Rainbow", {Speed = 0.5})
		
	elseif state == "Legendary" then
		v7.Shift(v19.Inner.Button, "Rainbow", {Speed = 0.5})
		
	else
		v7.None(v19.Inner.Button)
	end
		v6:Remove(v19.Inner.Effect);
		v7.None(v19.Inner.Button.Inner);
		if v20.Mythic then
			v19.Inner.Button.Inner.BackgroundColor3 = Color3.fromRGB(220, 129, 236);
		else
			v19.Inner.Button.Inner.BackgroundColor3 = Color3.fromRGB(27, 156, 236);
		end;
	local isSpecial =
		v4[v20.Name].Void
		or v4[v20.Name].Infinity
		or v4[v20.Name].Ancient
		or v4[v20.Name].Ultimatum
		or v4[v20.Name].Dev
		or v4[v20.Name].Eternal
		or v20.Mythic
		or v20.Shiny

	if not isSpecial then
		v19.Inner.Button.BackgroundColor3 =
			if v26 == "Common" then
			Color3.fromRGB(41, 205, 255)
			elseif v26 == "Secret" then
			Color3.new(1, 1, 1)
			else
			v8.RarityColors[v26]
	end
	local l_UIGradient_0 = v19.Inner.Background.UIGradient;

	if v20.Void or v4[v20.Name].Void then
		l_UIGradient_0.Color = l_ReplicatedStorage_0.Assets.Gradients.Void.Color;

	elseif v20.Infinity or v4[v20.Name].Infinity then
		l_UIGradient_0.Color = l_ReplicatedStorage_0.Assets.Gradients.Infinity.Color;

	elseif v20.Ancient or v4[v20.Name].Ancient then
		l_UIGradient_0.Color = l_ReplicatedStorage_0.Assets.Gradients.Ancient.Color;
		
	elseif v20.Ultimatum or v4[v20.Name].Ultimatum then
		l_UIGradient_0.Color = l_ReplicatedStorage_0.Assets.Gradients.Ultimatum.Color;
	
	elseif v20.Dev or v4[v20.Name].Dev then
		l_UIGradient_0.Color = l_ReplicatedStorage_0.Assets.Gradients.Dev.Color;
		
	elseif v20.Eternal or v4[v20.Name].Eternal then
		l_UIGradient_0.Color = l_ReplicatedStorage_0.Assets.Gradients.Eternal.Color;

	elseif v20.Mythic then
		l_UIGradient_0.Color = l_ReplicatedStorage_0.Assets.Gradients.Mythic.Color;
	
	elseif v20.Shiny then
		l_UIGradient_0.Color = l_ReplicatedStorage_0.Assets.Gradients.Shiny.Color;

	elseif v20.Rarity == "Secret" or v20.Rarity == "Legendary" then
		l_UIGradient_0.Color = l_ReplicatedStorage_0.Assets.Gradients.Rainbow.Color;
	else
		l_UIGradient_0.Color = ColorSequence.new(v8.RarityColors[v26] or Color3.new(1, 1, 1))
	end;
    if not l_UIGradient_0:GetAttribute("HasConnection") then
        l_UIGradient_0.Destroying:Connect(function() --[[ Line: 148 ]]
            -- upvalues: v11 (ref), l_UIGradient_0 (copy)
            v11[l_UIGradient_0] = nil;
        end);
        l_UIGradient_0:SetAttribute("HasConnection", true);
    end;
	v11[l_UIGradient_0] = true
    if v19.Inner.Button:FindFirstChildOfClass("UIStroke") then
        v19.Inner.Button.UIStroke.Color = v22 and Color3.fromRGB(39, 93, 29) or Color3.fromHex("#00295E");
    end;
    if v22 then
        v19.Inner.Background.UIGradient.Enabled = false;
        v19.Inner.Background.ImageColor3 = Color3.fromRGB(125, 255, 89);
    else
        v19.Inner.Background.ImageColor3 = Color3.new(1, 1, 1);
		v19.Inner.Background.UIGradient.Enabled = IsSpecial;
    end;
    local l_Locked_0 = v19.Inner.Button.Inner:FindFirstChild("Locked");
    if l_Locked_0 then
        l_Locked_0.Visible = v20.Locked == true;
	end;
	if v20.Shiny then
		v6:Add(v19.Inner.Effect)

		v7.Cycle(v19.Inner.Button, "Shiny", {
			Speed = 0.5
		})

		v7.Cycle(v19.Inner.Button.Inner, "ShinyLight", {
			Speed = 0.5
		})
	end;
	local l_DisplayName_0 = v19.Inner.Button.Inner:FindFirstChild("DisplayName")
	if l_DisplayName_0 then
		l_DisplayName_0.Visible = true
		local name = v20.DisplayName or v20.Name

		local size = (v26 == "Secret") and 30 or 20
		l_DisplayName_0.RichText = true
		l_DisplayName_0.Text = string.format(
			'<font size="%d"><b>%s</b></font>',
			size,
			name
		)

		v7.None(l_DisplayName_0)
		if v20.Shiny and not (v20.Void or v20.Infinity or v20.Ancient or v20.Ultimatum or v20.Dev or v20.Eternal) then
			v7.Cycle(l_DisplayName_0, "Shiny", { Speed = 0.5 })
			
		elseif v20.Void or v4[v20.Name].Void then
			v7.Shift(l_DisplayName_0, "Void", { Speed = 0.5 })

		elseif v20.Infinity or v4[v20.Name].Infinity then
			v7.Shift(l_DisplayName_0, "Infinity", { Speed = 0.5 })

		elseif v20.Ancient or v4[v20.Name].Ancient then
			v7.Shift(l_DisplayName_0, "Ancient", { Speed = 0.5 })
			
		elseif v20.Ultimatum or v4[v20.Name].Ultimatum then
			v7.Shift(l_DisplayName_0, "Ultimatum", { Speed = 0.5 })
			
		elseif v20.Eternal or v4[v20.Name].Eternal then
			v7.Shift(l_DisplayName_0, "Eternal", { Speed = 0.5 })
			
		elseif v20.Dev or v4[v20.Name].Dev then
			v7.Shift(l_DisplayName_0, "Dev", { Speed = 0.5 })
			

		elseif v26 == "Secret" or v26 == "Legendary" then
			v7.Cycle(l_DisplayName_0, "Rainbow", { Speed = 0.5 })
			
		else
			local rarityColor = v8.RarityColors[v26]

			if rarityColor then
				l_DisplayName_0.TextColor3 = rarityColor
			else
				v7.None(l_DisplayName_0)
			end
		end
	end
	

	local inner = v19.Inner.Button.Inner

	local secretLabel = inner:FindFirstChild("Secret")
	local ancientLabel = inner:FindFirstChild("Ancient")
	local voidLabel = inner:FindFirstChild("Void")
	local infinityLabel = inner:FindFirstChild("Infinity")
	local ultimatumLabel = inner:FindFirstChild("Ultimatum")
	local devLabel = inner:FindFirstChild("Dev")
	local limitedLabel = button:FindFirstChild("Limited")
	local eternalLabel = inner:FindFirstChild("Eternal")

	if limitedLabel then
		limitedLabel.Visible = petData.Limited == true
	end

	if secretLabel then
		secretLabel.Visible = false
	end

	if ancientLabel then
		ancientLabel.Visible = false
	end

	if voidLabel then
		voidLabel.Visible = false
	end

	if infinityLabel then
		infinityLabel.Visible = false
	end
	
	if ultimatumLabel then
		ultimatumLabel.Visible = false
	end
	
	if eternalLabel then
		eternalLabel.Visible = false
	end
	
	if devLabel then
		devLabel.Visible = false
	end

	if petData then
		local obj
		local gradientColor

		if v20.Infinity or petData.Infinity then
			obj = infinityLabel
			gradientColor = l_ReplicatedStorage_0.Assets.Gradients.Infinity.Color

		elseif v20.Void or petData.Void then
			obj = voidLabel
			gradientColor = l_ReplicatedStorage_0.Assets.Gradients.Void.Color

		elseif v20.Ancient or petData.Ancient then
			obj = ancientLabel
			gradientColor = l_ReplicatedStorage_0.Assets.Gradients.Ancient.Color
			
		elseif v20.Ultimatum or petData.Ultimatum then
			obj = ultimatumLabel
			gradientColor = l_ReplicatedStorage_0.Assets.Gradients.Ultimatum.Color
			
		elseif v20.Dev or petData.Dev then
			obj = devLabel
			gradientColor = l_ReplicatedStorage_0.Assets.Gradients.Dev.Color
		
		elseif v20.Eternal or petData.Eternal then
			obj = eternalLabel
			gradientColor = l_ReplicatedStorage_0.Assets.Gradients.Eternal.Color

		elseif v26 == "Secret" or petData.Rarity == "Secret" then
			obj = secretLabel
			gradientColor = l_ReplicatedStorage_0.Assets.Gradients.Secret.Color
		end

		if obj then
			obj.Visible = true

			if v20.Infinity or petData.Infinity then
				v7.Shift(obj, "Infinity", {
					Speed = 0.5
				})

			elseif v20.Void or petData.Void then
				v7.Shift(obj, "Void", {
					Speed = 0.5
				})

			elseif v20.Ancient or petData.Ancient then
				v7.Shift(obj, "Ancient", {
					Speed = 0.5
				})
			
			elseif v20.Ultimatum or petData.Ultimatum then
				v7.Shift(obj, "Ultimatum", {
				Speed = 0.5
				})
			
			elseif v20.Dev or petData.Dev then
				v7.Shift(obj, "Dev", {
				Speed = 0.5
				})
			
			elseif v20.Eternal or petData.Eternal then
				v7.Shift(obj, "Eternal", {
				Speed = 0.5
				})

			elseif v26 == "Secret" or petData.Rarity == "Secret" then
				v7.Shift(obj, "Secret", {
					Speed = 0.5
				})
				
			else
				v7.None(obj)
			end
		end	
	end
end

l_RunService_0.Heartbeat:Connect(function()
	local rotation = (os.clock() * 75) % 360

	for grad in v11 do
		if grad and grad.Parent then
			grad.Rotation = rotation
		else
			v11[grad] = nil
		end
	end
end)

return {
    set = v32, 
    animatedGradients = v11
};
