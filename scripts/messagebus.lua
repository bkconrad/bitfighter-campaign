-- cross-script message bus for bitfighter
if not gMessageBus then
	gMessageBus = { }
end

if not gListeners then
	gListeners = { }
end

function emit(msg, data)
	for k,fn in pairs(gListeners) do
		if fn(msg, data) then
			gListeners[k] = nil
		end
	end
end

-- fn should return true to stop listening
function listen(fn)
	table.insert(gListeners, fn)
end

return {
	listen = listen,
	emit = emit
}