  -- Base
import XMonad
import System.IO
import qualified XMonad.StackSet as W

  -- Actions
import XMonad.Actions.CopyWindow (kill1)

  -- Data
import Data.Monoid

  -- Hooks
import XMonad.Hooks.EwmhDesktops  -- for some fullscreen events, also for xcomposite in obs.

  -- Layouts
import XMonad.Layout.ResizableTile
import XMonad.Layout.Tabbed
import XMonad.Layout.Gaps

  -- Layouts modifiers
import XMonad.Layout.LayoutModifier
import XMonad.Layout.LimitWindows (limitWindows)
import XMonad.Layout.MultiToggle (mkToggle, EOT(EOT), (??), Toggle(..))
import XMonad.Layout.MultiToggle.Instances (StdTransformers(NBFULL, NOBORDERS))
import XMonad.Layout.NoBorders
import XMonad.Layout.Renamed (renamed, Rename(Replace))
import XMonad.Layout.Spacing

  -- Prompt

  -- Utilities
import XMonad.Util.EZConfig (additionalKeysP)
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
myFocusColor = "#ffffff"

myWorkspaces :: [String]
myWorkspaces = map show [1..9]

-- Startup hooks

myStartupHook :: X ()
myStartupHook = do
  spawnOnce "$XDG_CONFIG_HOME/polybar/launch.sh &"
  spawnOnce "nitrogen --restore &"
  spawnOnce "start-pulseaudio-x11 &"
  spawnOnce "picom &"
  spawnOnce "conky &"
  spawnOnce "unclutter &"
  --spawnOnce "nm-applet &"
  spawnOnce "pa-applet &"
  spawnOnce "setxkbmap dk" -- This will be removed once we fix it in x11
  spawnOnce "xmodmap ~/.Xmodmap"

-- Manage hooks (or rules for certain windows)
myManageHook :: XMonad.Query (Data.Monoid.Endo WindowSet)
myManageHook = composeAll 
 [
    className =? "Nm-connection-editor" --> doFloat
 ]

-- Hotkeys
myKeys :: [(String, X ())]
myKeys =
  [
    -- Open my preferred terminal
    ("M-<Return>", spawn myTerminal) -- Mod + Return
    -- Kill currently selected window
  , ("M-S-q", kill1) -- Mod + Shift + q
    -- Programs
  , ("M-d", spawn "dmenu_run")
  , ("M-0", spawn "turnoff")
  -- , ("M-menu", spawn "screenshot")
    -- Layouts
  , ("M-<Tab>", sendMessage NextLayout)
  , ("M-f", toggleGaps)
  , ("M-S-f", sendMessage $ Toggle NBFULL)
    -- Window navigation
  , ("M-j", windows W.focusDown)
  , ("M-k", windows W.focusUp)
  , ("M-m", windows W.swapMaster)
  , ("M-<Space>", windows W.focusMaster)
  ]
    where 
      toggleGaps :: X ()
      toggleGaps = do
        sendMessage ToggleGaps
        toggleScreenSpacingEnabled
        toggleWindowSpacingEnabled -- Removes spacing between windows (They overlap a tiny bit though)

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
myTabConfig = def { fontName              = "xft:URWGothic-Book:regular:pixelsize=11"
                    , activeColor         = myFocusColor
                    , inactiveColor       = myNormColor
                    , activeBorderColor   = myFocusColor
                    , inactiveBorderColor = myNormColor
                    , activeTextColor     = myNormColor
                    , inactiveTextColor   = "#724372"
                  }

myLayoutHook = mkToggle (NBFULL ?? NOBORDERS ?? EOT) myDefaultLayout
                  where
                    myDefaultLayout = smartBorders wide
                                      ||| smartBorders tall
                                      ||| smartBorders tabs
