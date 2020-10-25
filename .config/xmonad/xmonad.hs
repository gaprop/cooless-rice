  -- Base
import XMonad
import System.IO
import System.Exit (exitSuccess)
import qualified XMonad.StackSet as W

  -- Actions
import XMonad.Actions.CopyWindow (kill1, killAllOtherCopies)
import XMonad.Actions.CycleWS (moveTo, shiftTo, WSType(..), nextScreen, prevScreen)
import XMonad.Actions.GridSelect
import XMonad.Actions.MouseResize
import XMonad.Actions.Promote
import XMonad.Actions.RotSlaves (rotSlavesDown, rotAllDown)
import qualified XMonad.Actions.TreeSelect as TS
import XMonad.Actions.WindowGo (runOrRaise)
import XMonad.Actions.WithAll (sinkAll, killAll)
import qualified XMonad.Actions.Search as S

  -- Data
import Data.Char (isSpace)
import Data.Monoid
import Data.Maybe (isJust)
import Data.Tree
import qualified Data.Map as M

  -- Hooks
import XMonad.Hooks.DynamicLog (dynamicLogWithPP, wrap, xmobarPP, xmobarColor, shorten, PP(..))
import XMonad.Hooks.EwmhDesktops  -- for some fullscreen events, also for xcomposite in obs.
import XMonad.Hooks.FadeInactive
import XMonad.Hooks.ManageDocks (avoidStruts, docksEventHook, manageDocks, ToggleStruts(..))
import XMonad.Hooks.ManageHelpers (isFullscreen, doFullFloat)
import XMonad.Hooks.ServerMode
import XMonad.Hooks.SetWMName
import XMonad.Hooks.WorkspaceHistory

  -- Layouts
import XMonad.Layout.GridVariants (Grid(Grid))
import XMonad.Layout.SimplestFloat
import XMonad.Layout.Spiral
import XMonad.Layout.ResizableTile
import XMonad.Layout.Tabbed
import XMonad.Layout.ThreeColumns
import XMonad.Layout.Gaps

  -- Layouts modifiers
import XMonad.Layout.LayoutModifier
import XMonad.Layout.LimitWindows (limitWindows, increaseLimit, decreaseLimit)
import XMonad.Layout.Magnifier
import XMonad.Layout.MultiToggle (mkToggle, single, EOT(EOT), (??))
import XMonad.Layout.MultiToggle.Instances (StdTransformers(NBFULL, MIRROR, NOBORDERS))
import XMonad.Layout.NoBorders
import XMonad.Layout.Renamed (renamed, Rename(Replace))
import XMonad.Layout.ShowWName
import XMonad.Layout.Spacing
import XMonad.Layout.WindowArranger (windowArrange, WindowArrangerMsg(..))
import qualified XMonad.Layout.ToggleLayouts as T (toggleLayouts, ToggleLayout(Toggle))
import qualified XMonad.Layout.MultiToggle as MT (Toggle(..))

  -- Prompt
import XMonad.Prompt
import XMonad.Prompt.Input
import XMonad.Prompt.FuzzyMatch
import XMonad.Prompt.Man
import XMonad.Prompt.Pass
import XMonad.Prompt.Shell (shellPrompt)
import XMonad.Prompt.Ssh
import XMonad.Prompt.XMonad
import Control.Arrow (first)

  -- Utilities
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.NamedScratchpad
import XMonad.Util.Run (runProcessWithInput, safeSpawn, spawnPipe)
import XMonad.Util.SpawnOnce

main :: IO ()
main = xmonad $ ewmh def
  { startupHook        = myStartupHook
  , layoutHook         = myLayoutHook
  , manageHook         = myManageHook
  , terminal           = myTerminal
  , modMask            = myModMask
  , borderWidth        = myBorderWidth
  , normalBorderColor  = myNormColor
  , focusedBorderColor = myFocusColor
  --, workspaces         = myWorkspaces
  } `additionalKeysP` myKeys

-- Variables

myFont :: String
myFont = "xft:URWGothic-Book"

myTerminal :: String
myTerminal = "kitty"

myModMask :: KeyMask
myModMask = mod4Mask --Sets mod key to the super/windows key

myBorderWidth :: Dimension
myBorderWidth = 1

myBrowser :: String
myBrowser = "brave"

myEditor :: String
myEditor = myTerminal ++ "-e nvim"

myNormColor :: String
myNormColor = "#090611"

myFocusColor :: String
myFocusColor = "#962d4c"

myWorkspaces :: [String]
myWorkspaces = map show [1..9]

-- Startup hooks

myStartupHook :: X ()
myStartupHook = do
  spawnOnce "$HOME/.config/polybar/launch.sh &"
  spawnOnce "nitrogen --restore &"
  spawnOnce "start-pulseaudio-x11 &"
  spawnOnce "picom &"
  spawnOnce "conky &"
  --spawnOnce "nm-applet &"
  --spawnOnce "pa-applet &"
  --spawnOnce "xfce4-power-manager &"
  --spawnOnce "ff-theme-uril &"
  --spawnOnce "fix_xcursor &"
  --spawnOnce "exec --no-startup-id start-pulseaudio-x11" -- Might move theese somwhere else
  --spawnOnce "exec --no-startup-id pa-applet"

-- Manage hooks (or rules for certain windows)
myManageHook :: XMonad.Query (Data.Monoid.Endo WindowSet)
myManageHook = composeAll 
 [
    className =? "nm-connection-editor" --> doFloat
 ]

-- Hotkeys
myKeys :: [(String, X ())]
myKeys =
  [
    -- Desktop specific (make the audio whell work)
    ("<XF86AudioRaiseVolume>", spawn "amixer -D pulse set Master 1%+")
  , ("<XF86AudioLowerVolume>", spawn "amixer -D pulse set Master 1%-")
  , ("<XF86AudioMute>", spawn "notify-send -u low \"Audio Muted!\" && amixer -D pulse set Master 1+ toggle") -- Perhaps put into a script?
    -- Open my preferred terminal
  , ("M-<Return>", spawn myTerminal) -- Mod + Return
    -- Kill currently selected window
  , ("M-S-q", kill1) -- Mod + Shift + q
    -- Programs
  , ("M-d", spawn "dmenu_run")
    -- Layouts
  , ("M-<Tab>", sendMessage NextLayout)
    -- TODO:
    -- Window navigation
  , ("M-j", windows W.focusDown)
  , ("M-k", windows W.focusUp)
  , ("M-m", windows W.swapMaster)
  , ("M-S-m", windows W.focusMaster)
    -- 
  , ("M-0", io exitSuccess)
  ]

-- Layouts
mySpacing :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
mySpacing i = spacingRaw False (Border 0 i i i) True (Border 0 i i i) True

tall        = renamed [Replace "tall"]
              $ gaps [(U, 48), (D, 2), (R, 8), (L, 8)]
              $ limitWindows 12
              $ mySpacing 8
              $ ResizableTall 1 (3/100) (1/2) []
wide        = renamed [Replace "wide"]
              $ gaps [(U, 48), (D, 2), (R, 8), (L, 8)]
              $ limitWindows 12
              $ mySpacing 8
              $ Mirror 
              $ ResizableTall 1 (3/100) (1/2) []
tabs        = renamed [Replace "tabs"]
              $ gaps [(U, 48), (D, 2), (R, 8), (L, 8)]
              $ gaps [(U, 0), (D, 16), (R, 16), (L, 16)]
              $ tabbed shrinkText myTabConfig
                where myTabConfig = def { fontName            = "xft:URWGothic-Book:regular:pixelsize=11"
                                        , activeColor         = "#962d4c"
                                        , inactiveColor       = "#090611"
                                        , activeBorderColor   = "#962d4c"
                                        , inactiveBorderColor = "#090611"
                                        , activeTextColor     = "#b49052"
                                        , inactiveTextColor   = "#58679b"
                                        }
tabsFull    = renamed [Replace "tabs full"]
              $ tabbed shrinkText myTabConfig
                where myTabConfig = def { fontName            = "xft:URWGothic-Book:regular:pixelsize=11"
                                        , activeColor         = "#962d4c"
                                        , inactiveColor       = "#090611"
                                        , activeBorderColor   = "#962d4c"
                                        , inactiveBorderColor = "#090611"
                                        , activeTextColor     = "#b49052"
                                        , inactiveTextColor   = "#58679b"
                                        }

myLayoutHook = mkToggle (NBFULL ?? NOBORDERS ?? EOT) myDefaultLayout
                  where
                    myDefaultLayout = smartBorders wide
                                      ||| smartBorders tall
                                      ||| smartBorders tabs
                                      ||| smartBorders tabsFull
