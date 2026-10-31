local _, CC = ...

CC.L = CC.L or {}
CC.L_native = {}

setmetatable(CC.L, {
    __index = function(_, key)
        return key
    end
})

function CC.ApplyLocale()
    if not CC.L_native then return end
    if not (BetterBlizzCCDB and BetterBlizzCCDB.forceEnglish) then
        for key, value in pairs(CC.L_native) do
            CC.L[key] = value
        end
    end
    CC.L_native = nil
end
