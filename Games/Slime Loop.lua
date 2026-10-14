pcall(function() il2cpp.redirect("GridManager", "Awake", "ShowWinWindow", true) end)
toast("Auto-Win Loop Started")

while true do
    local menu = il2cpp.get_object("PixelFlow.UI.MainMenuController") or il2cpp.get_object("MainMenuController")
    if not menu then
        local list = il2cpp.find_objects("PixelFlow.UI.MainMenuController", 1)
        if list and #list > 0 then menu = list[1] end
    end

    if menu then
        il2cpp.invoke("PixelFlow.UI.MainMenuController", "PlayGame", menu)
        toast("Starting Level")
    end

    sleep(5000)

    local win = il2cpp.get_object("WinWindow")
    if not win then
        local list = il2cpp.find_objects("WinWindow", 1)
        if list and #list > 0 then win = list[1] end
    end

    if win then
        il2cpp.invoke("WinWindow", "Continue", win)
        toast("Level Completed")
    else
        local winFallback = il2cpp.get_object("WinWindow")
        if winFallback then
            il2cpp.invoke("WinWindow", "OnContinueClicked", winFallback)
        end
    end

    sleep(5000)
end
