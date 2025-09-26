FilteredInfoDialog = {}

function FilteredInfoDialog.show(text, callback, target, dialogType, okText, buttonAction, callbackArgs, disableOpenSound)
    if InfoDialog.INSTANCE == nil then
        return
    end

    if FilteredInfoDialog.isBlocked(text) then
        return
    end

    local dialog = InfoDialog.INSTANCE
    dialog:setCallback(callback, target, callbackArgs)
    dialog:setDialogType(Utils.getNoNil(dialogType, DialogElement.TYPE_INFO))
    dialog:setButtonTexts(okText)
    dialog:setButtonAction(buttonAction)
    dialog:setText(text)
    dialog:setDisableOpenSound(disableOpenSound)

    g_gui:showDialog("InfoDialog")
end

function FilteredInfoDialog.isBlocked(text)
    local patterns = {
        "farming",
        "sim.*",
        "Farming Sim.*",
    }

     local lowerText = string.lower(text)

    for _, pattern in ipairs(patterns) do
        if string.find(lowerText, string.lower(pattern)) then
            return true
        end
    end

    return false
end

InfoDialog.show = FilteredInfoDialog.show
