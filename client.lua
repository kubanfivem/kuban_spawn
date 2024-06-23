local QBCore = exports['qb-core']:GetCoreObject()
local Config = Config or {}

local isMenuOpen = false
local cam = nil

RegisterNetEvent('qb-spawnselector:client:openMenu', function()
    local options = {}

    for _, location in ipairs(Config.SpawnLocations) do
        local option = {
            title = location.title,
            description = location.description,
            event = "qb-spawnselector:client:selectSpawn",
            args = location.coords
        }

        if Config.EnableIcons then
            option.icon = location.icon
        end

        if Config.EnableImages then
            option.image = location.image
        end

        table.insert(options, option)
    end

    lib.registerContext({
        id = 'spawn_selector_menu',
        title = 'Spawn Selector',
        options = options,
        canClose = false 
    })

    isMenuOpen = true
    SetEntityVisible(PlayerPedId(), false, false)
    FreezeEntityPosition(PlayerPedId(), true)
    DisableAllControlActions(0)
    lib.showContext('spawn_selector_menu')

    if not DoesCamExist(cam) then
        cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
        SetCamCoord(cam, Config.CameraCoords.x, Config.CameraCoords.y, Config.CameraCoords.z)
        SetCamActive(cam, true)
        RenderScriptCams(true, true, 500, true, true)
    end

    CreateThread(function()
        while isMenuOpen do
            Wait(0)
            DisableAllControlActions(0)
            if not lib.isMenuVisible('spawn_selector_menu') then
                lib.showContext('spawn_selector_menu')
            end
        end
    end)
end)

RegisterNetEvent('qb-spawnselector:client:selectSpawn', function(coords)
    SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z, false, false, false, true)
    SetEntityVisible(PlayerPedId(), true, false)
    FreezeEntityPosition(PlayerPedId(), false)
    EnableAllControlActions(0)
    isMenuOpen = false

    if DoesCamExist(cam) then
        DestroyCam(cam, false)
        RenderScriptCams(false, true, 500, true, true)
        cam = nil
    end

    QBCore.Functions.Notify('You have spawned at your selected location.', 'success')
end)
