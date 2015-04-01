local addonInfo, privateVars = ...

function EnKai.ui.nkRadioButton(name, parent) 

	local labelColor = {1, 1, 1, 1}
	local elementColor = {1, 1, 1, 1}	

	local radioButton = UI.CreateFrame ('Frame', name, parent)
	local label = UI.CreateFrame ('Text', name, radioButton)
	
	local properties = {}

	function radioButton:SetValue(property, value)
		properties[property] = value
	end
	
	function radioButton:GetValue(property)
		return properties[property]
	end
	
	radioButton:SetValue("name", name)
	radioButton:SetValue("parent", parent)

	local isActive = true
	local height = 13	
	local fontsize = 13
	local checkboxWidth = 100
	local checkboxes = {}
	local optionTable
	
	radioButton:SetHeight(13)
	radioButton:SetWidth(113)
		
	label:SetPoint("CENTERLEFT", radioButton, "CENTERLEFT")
	label:SetWidth(100)
	label:SetFontSize(13)
	label:SetFontColor(labelColor[1], labelColor[2], labelColor[3], labelColor[4])
	
	EnKai.eventHandlers[name] = {}
	EnKai.events[name] = {}
	EnKai.eventHandlers[name]["radioButtonChanged"], EnKai.events[name]["radioButtonChanged"] = Utility.Event.Create(addonInfo.identifier, name .. "radioButtonChanged")
	
	function radioButton:SetSelection (newOptionTable)
	
		optionTable = newOptionTable
		local counter, object, width, valueSet = 1, label, label:GetWidth(), false
	
		for k, v in pairs (optionTable) do
			local checkbox
			if #checkboxes >= counter then
				checkbox = checkboxes[counter]
			else
				checkbox = EnKai.uiCreateFrame("nkCheckbox", name .. ".checkbox." .. counter, radioButton)
				table.insert(checkboxes, checkbox)				
			end
			
			checkbox:SetVisible(true)
			checkbox:SetLabelColor(labelColor[1], labelColor[2], labelColor[3], labelColor[4])
			checkbox:SetColor(elementColor[1], elementColor[2], elementColor[3], elementColor[4])
			checkbox:SetText(v.label)
			checkbox:SetBoxWidth(height)
			checkbox:SetBoxHeight(height)
			checkbox:AutoSizeLabel()			
			checkbox:SetActive(isActive)
			checkbox:SetPoint("CENTERLEFT", object, "CENTERRIGHT", 5, 0)
			checkbox:SetLabelInFront(false)
			
			if self:GetValue() == v.value then
				checkbox:SetChecked(true, true)
				valueSet = true
			else	
				checkbox:SetChecked(false, true)
			end 			
			
			Command.Event.Detach(EnKai.events[checkboxes[counter]:GetName()].CheckboxChanged, nil, checkboxes[counter]:GetName() .. ".CheckboxChanged")
			Command.Event.Attach(EnKai.events[checkboxes[counter]:GetName()].CheckboxChanged, function ()
				radioButton:SetSelectedValue(v.value)				
			end, checkboxes[counter]:GetName() .. ".CheckboxChanged")
			
			object = checkboxes[counter]
			counter = counter + 1
			width = width + checkboxWidth
		end
		
		if valueSet == false then
			checkboxes[1]:SetChecked(true, true)
		end
		
		radioButton:SetWidth(width)
		
		if counter <= #checkboxes then
			for idx = counter, #checkboxes, 1 do
				checkboxes[idx]:SetVisible(false)
				Command.Event.Detach(EnKai.events[checkboxes[idx]:GetName()].CheckboxChanged, nil, checkboxes[idx]:GetName() .. ".CheckboxChanged")
			end
		end
		
		if self:GetValue('value') ~= nil then radioButton:SetSelectedValue(self:GetValue('value')) end
	
	end
		
	function radioButton:SetSelectedValue(newValue)
	
		local checkText
		
		for k, v in pairs(optionTable) do
			if v.value == newValue then
				checkText = v.label
				break
			end 
		end
		
		if checkText == nil then
			EnKai.tools.error.display (addonInfo.identifier, string.format("EnKai.ui.nkRadioButton - value [%s] not part of provided option table\n%s", newValue, EnKai.tools.table.serialize (optionTable)))
			return
		end
		
		for idx = 1, #checkboxes, 1 do
			if checkboxes[idx]:GetVisible() == true then
				if checkboxes[idx]:GetText() == checkText then
					checkboxes[idx]:SetChecked(true, true)
				else
					checkboxes[idx]:SetChecked(false, true)
				end
			end
		end		
		
		self:SetValue('value', newValue)
		EnKai.eventHandlers[name]["RadiobuttonChanged"]( newValue )
		
	end	
	
	function radioButton:GetSelectedValue() return self:GetValue('value') end
	
	function radioButton:SetLabelColor(r, g, b, a) 
		labelColor = { r, g, b, a}
		label:SetFontColor (r, g, b, a) 
		for idx = 1, #checkboxes, 1 do
			checkboxes[idx]:SetLabelColor(r, g, b, a)
		end
	end
	
	function radioButton:SetColor(r, g, b, a) 
		elementColor = { r, g, b, a }
		for idx = 1, #checkboxes, 1 do
			checkboxes[idx]:SetColor(r, g, b, a)
		end
	end

	function radioButton:SetText(text) label:SetText(text) end	
	
	function radioButton:SetLabelWidth(width)
		radioButton:SetWidth(radioButton:GetWidth() - width)
		label:SetWidth(width)
	end
	
	local oSetWidth, oSetHeight = radioButton.SetWidth, radioButton.SetHeight
	
	function radioButton:SetWidth(newWidth)		
		oSetWidth(self, newWidth)
	end
	
	function radioButton:SetRadioHeight(newBoxHeight)
		for idx = 1, #checkboxes, 1 do
			checkboxes[idx]:SetBoxHeight(newBoxHeight)
			checkboxes[idx]:SetBoxWidth(newBoxHeight)
		end
	end
	
	function radioButton:SetActive(flag)
		if flag == true then
			radioButton:SetAlpha(1)
		else
			radioButton:SetAlpha(.5)
		end
		
		for idx = 1, #checkboxes, 1 do
			checkboxes[idx]:SetActive(flag)
		end
		
		isActive = flag
	end
	
	EnKai.eventHandlers[name] = {}
	EnKai.events[name] = {}
	EnKai.eventHandlers[name]["RadiobuttonChanged"], EnKai.events[name]["RadiobuttonChanged"] = Utility.Event.Create(addonInfo.identifier, name .. "RadiobuttonChanged")
	
	return radioButton
	
end