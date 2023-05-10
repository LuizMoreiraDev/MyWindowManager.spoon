local obj = {}
obj.__index = obj

-- Metadata
obj.name     = 'MyWindowManager'
obj.version  = '0.1'
obj.author   = 'Luiz Claudio Moreira <luiz@luizclaudiomoreira.com>'
obj.twitter  = '@luizclaudiom'
obj.github   = '@luizclaudiomoreira'
obj.homepage = 'https://github.com/luizclaudiomoreira/MyWindowManager.spoon'
obj.license  = 'MIT - https://opensource.org/licenses/MIT'

-- Logger
obj.logger = hs.logger.new(obj.name)

-- Helper functions
local function getWindowObjects()
  return {
    win         = hs.window.focusedWindow(),
    screen      = hs.window.focusedWindow():screen(),
    winFrame    = hs.window.focusedWindow():frame(),
    screenFrame = hs.window.focusedWindow():screen():frame(),
  }
end

function obj:init()
  hs.hotkey.bindSpec({ { 'cmd', 'alt' }, '0'}, function() obj:maximize(nil, 15) end)
  hs.hotkey.bindSpec({ { 'cmd', 'alt' }, '9'}, function() obj:resize({ w = 1920, h = 1080 }) end)
  hs.hotkey.bindSpec({ { 'cmd', 'alt' }, '8'}, function() obj:resize({ w = 1712, h = 963  }) end)
  hs.hotkey.bindSpec({ { 'cmd', 'alt' }, '7'}, function() obj:resize({ w = 1600, h = 900  }) end)
  hs.hotkey.bindSpec({ { 'cmd', 'alt' }, '6'}, function() obj:resize({ w = 1472, h = 828  }) end)
end

-- Maximize focusedWindow
function obj:maximize(duration, margin)
  duration = duration or hs.window.animationDuration
  margin   = margin   or 0

  local winObjs = getWindowObjects()
  local win     = {
    w = winObjs.screenFrame.w - margin,
    h = winObjs.screenFrame.h - margin,
    x = winObjs.screenFrame.x + (margin / 2),
    y = winObjs.screenFrame.y + (margin / 2)
  }

  -- currentWin:move(newWin, currentScreen, true, duration)
  winObjs.win:move(win, winObjs.screen, true, duration)
end

-- Resize focusedWindow
function obj:resize(newSize, duration)
  duration = duration or hs.window.animationDuration

  if not newSize then
    obj.maximize(duration)
  else
    local winObjs = getWindowObjects()
    local win     = {
      w = newSize.w,
      h = newSize.h,
      x = winObjs.screenFrame.x + (winObjs.screenFrame.w - newSize.w) / 2,
      y = winObjs.screenFrame.y + (winObjs.screenFrame.h - newSize.h) / 2
    }

    winObjs.win:move(win, winObjs.screen, true, duration)
  end
end

return obj
