-- Author: Fetty42
-- Date: 08.12.2024
-- Version: 1.0.0.0


local isDbPrintfOn = false

local function dbPrintf(...)
	if isDbPrintfOn then
    	print(string.format(...))
	end
end

AvailableTypesDlgFrame = {}
local AvailableTypesDlgFrame_mt = Class(AvailableTypesDlgFrame, MessageDialog)

function AvailableTypesDlgFrame.new(target, custom_mt)
	dbPrintf("AvailableTypesDlgFrame:new()")
	local self = MessageDialog.new(target, custom_mt or AvailableTypesDlgFrame_mt)
	return self
end

function AvailableTypesDlgFrame:onGuiSetupFinished()
	dbPrintf("AvailableTypesDlgFrame:onGuiSetupFinished()")
	AvailableTypesDlgFrame:superClass().onGuiSetupFinished(self)
	self.typesTable:setDataSource(self)
	self.typesTable:setDelegate(self)
end

function AvailableTypesDlgFrame:onCreate()
	dbPrintf("AvailableTypesDlgFrame:onCreate()")
	AvailableTypesDlgFrame:superClass().onCreate(self)
end


function AvailableTypesDlgFrame:onOpen()
	dbPrintf("AvailableTypesDlgFrame:onOpen()")
	AvailableTypesDlgFrame:superClass().onOpen(self)
	FocusManager:setFocus(self.typesTable)

end


function AvailableTypesDlgFrame:InitData(data)
	dbPrintf("AvailableTypesDlgFrame:InitData()")

	-- Fill data structure
	self.tableData = data

	-- finilaze dialog
	self.typesTable:reloadData()

	self:setSoundSuppressed(true)
    FocusManager:setFocus(self.typesTable)
    self:setSoundSuppressed(false)

end

function AvailableTypesDlgFrame:getNumberOfSections(list)
	dbPrintf("AvailableTypesDlgFrame:getNumberOfSections()")
	return #self.tableData
end


function AvailableTypesDlgFrame:getNumberOfItemsInSection(list, section)
	dbPrintf("AvailableTypesDlgFrame:getNumberOfItemsInSection()")
	return #self.tableData[section].items
end


function AvailableTypesDlgFrame:getTitleForSectionHeader(list, section)
	dbPrintf("AvailableTypesDlgFrame:getTitleForSectionHeader()")
	return self.tableData[section].sectionTitle
end


function AvailableTypesDlgFrame:populateCellForItemInSection(list, section, index, cell)
	dbPrintf("AvailableTypesDlgFrame:populateCellForItemInSection()")
	local item = self.tableData[section].items[index]
	cell:getAttribute("ftIcon"):setImageFilename(item.hudOverlayFilename)
	cell:getAttribute("ftTitle"):setText(item.title)
	cell:getAttribute("minOrderLevel"):setText(item.minOrderLevel)
	cell:getAttribute("probability"):setText(string.format("%s %%", item.probability))
	cell:getAttribute("quantityCorrectionFactor"):setText(string.format("%.1f", item.quantityCorrectionFactor))
	cell:getAttribute("msg"):setText(item.msg)
end

-- function AvailableTypesDlgFrame:getCellTypeForItemInSection(list, section, index, cell)
-- 	dbPrintf("AvailableTypesDlgFrame:getCellTypeForItemInSection()")
-- 	return string
-- end

function AvailableTypesDlgFrame:onClose()
	dbPrintf("AvailableTypesDlgFrame:onClose()")
	AvailableTypesDlgFrame:superClass().onClose(self)

	VIPOrderManager.OrderDlg = g_gui:showDialog("OrderFrame")
end


function AvailableTypesDlgFrame:onClickClose(sender)
	dbPrintf("AvailableTypesDlgFrame:onClickClose()")
	self:close()
end

