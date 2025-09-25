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
    local blockedPhrases = {
        "Get the full version of Farming Simulator here."
    }

    for _, phrase in ipairs(blockedPhrases) do
        if string.find(text, phrase, 1, true) then
            return true
        end
    end

    return false
end

InfoDialog.show = FilteredInfoDialog.show
