--------------------------------------------------
	-- XL / XXL / XS LOGIC
	--------------------------------------------------

	local isXL = v20.XL == true
	local isXXL = v20.XXL == true
	local isXS = v20.XS == true

	local inner = v19.Inner.Button.Inner
	local icon = inner:FindFirstChild("Icon")
	

	if icon then
		--------------------------------------------------
		-- SCALE ICON
		--------------------------------------------------

		if isXXL then
			icon.Size = UDim2.fromScale(4, 4)
		elseif isXL then
			icon.Size = UDim2.fromScale(2, 2)
		elseif isXS then
			icon.Size = UDim2.fromScale(0.5, 0.5)
		else
			icon.Size = UDim2.fromScale(1, 1)
		end

		icon.Position = UDim2.fromScale(0.5, 0.5)
		icon.AnchorPoint = Vector2.new(0.5, 0.5)

		-- Crop enlarged icons
		inner.ClipsDescendants = isXL or isXXL

		--------------------------------------------------
		-- GET / CREATE BADGES
		--------------------------------------------------

		local xlBorder = inner:FindFirstChild("XLBorder")

		-- If the border is still inside Icon, move it out
		if not xlBorder then
			xlBorder = icon:FindFirstChild("XLBorder")
		end

		if xlBorder then
			xlBorder.Parent = inner

			--------------------------------------------------
			-- XL LABEL
			--------------------------------------------------

			local xlLabel = xlBorder:FindFirstChild("XL")

			if xlLabel then
				xlLabel.Text = "XL"
				xlLabel.Visible = isXL
				xlLabel.ZIndex = icon.ZIndex + 2
			end

			--------------------------------------------------
			-- XXL LABEL
			--------------------------------------------------

			local xxlLabel = inner:FindFirstChild("XXL")

			if not xxlLabel then
				xxlLabel = xlBorder:FindFirstChild("XXL")

				if xxlLabel then
					xxlLabel.Parent = inner
				end
			end

			if xxlLabel then
				xxlLabel.Text = "XXL"
				xxlLabel.Visible = isXXL
				xxlLabel.ZIndex = icon.ZIndex + 2
			end

			--------------------------------------------------
			-- XS LABEL
			--------------------------------------------------

			local xsLabel = inner:FindFirstChild("XS")

			if not xsLabel then
				xsLabel = xlBorder:FindFirstChild("XS")

				if xsLabel then
					xsLabel.Parent = inner
				end
			end

			if xsLabel then
				xsLabel.Text = "XS"
				xsLabel.Visible = isXS
				xsLabel.ZIndex = icon.ZIndex + 2
			end

			--------------------------------------------------
			-- BORDER
			--------------------------------------------------

			-- XS does NOT use the XL border
			xlBorder.Visible = isXL or isXXL

			--------------------------------------------------
			-- POSITION LABELS
			--------------------------------------------------

			local level = inner:FindFirstChild("Level")
			local levelVisible = level and level.Visible

			local labelOffset = levelVisible and -20 or 0

			if xlLabel then
				xlLabel.Position = UDim2.new(
					0,
					0,
					1,
					labelOffset
				)
			end

			if xxlLabel then
				xxlLabel.Position = UDim2.new(
					0,
					0,
					1,
					labelOffset
				)
			end

			if xsLabel then
				xsLabel.Position = UDim2.new(
					0,
					0,
					1,
					labelOffset
				)
			end
		end
	end
