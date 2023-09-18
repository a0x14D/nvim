local staus_ok, bufferline = pcall(require, "bufferline")
if not staus_ok then
  return
end

bufferline.setup {}
