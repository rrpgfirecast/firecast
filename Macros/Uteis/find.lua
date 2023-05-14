local file = parameter;
if file == nil then
    write("Invalid File. ");
    return;
end;

local function DFFindBibItem(file, bibItem)
    if bibItem== nil then return nil end;
    if bibItem.nome == file then
        return bibItem.codigoInterno;
    else
        for i=1, #bibItem.filhos do
            local itemID = DFFindBibItem(file, bibItem.filhos[i]);
            if itemID ~= nil then
                return itemID;
            end
        end
    end
    return nil
end;

local itemID = DFFindBibItem(file, mesa.biblioteca);

if itemID == nil then
    write("File not found")
else
    write("firecast:/rooms/"..mesa.codigoInterno.."/library/"..itemID)
end

