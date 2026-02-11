-- multiple-bibliographies.lua
-- Sourced from the official pandoc/lua-filters repository
local List = require 'pandoc.List'

local function resolve_doc_meta (meta)
  local bibs = meta.bibliography
  if not bibs then return meta end

  -- If bibliography is a single file, do nothing (standard behavior)
  if type(bibs) == 'string' or #bibs > 0 then return meta end

  -- If bibliography is a dictionary (key: value), transform it
  local new_bibs = List()
  for name, path in pairs(bibs) do
    new_bibs[#new_bibs + 1] = path
  end
  meta.bibliography = new_bibs
  return meta
end

return {
  { Meta = resolve_doc_meta }
}