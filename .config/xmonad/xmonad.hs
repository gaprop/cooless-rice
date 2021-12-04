import XMonad
import System.IO (hPutStrLn)
import qualified XMonad.StackSet as W

-- Actions
import XMonad.Actions.CopyWindow (kill1)
-- Data
import Data.Monoid

-- Hooks import XMonad.Hooks.EwmhDesktops  -- for some fullscreen events, also for xcomposite in obs.
import XMonad.Hooks.EwmhDesktops  -- for some fullscreen events, also for xcomposite in obs.
import XMonad.Hooks.Place
import XMonad.Hooks.DynamicLog (dynamicLogWithPP, wrap, xmobarPP, xmobarColor, shorten, PP(..))

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
import XMonad.Util.Run (spawnPipe)

-- main
main :: IO ()
main = do
  xmproc <- spawnPipe "xmobar $HOME/.config/xmobar/xmobarrc"
  xmonad $ ewmh def
    { startupHook        = myStartupHook
    , layoutHook         = myLayoutHook
    , manageHook         = myManageHook
    , terminal           = myTerminal
    , modMask            = myModMask
    , borderWidth        = myBorderWidth
    , normalBorderColor  = myNormColor
    , focusedBorderColor = myFocusColor
    , workspaces         = myWorkspaces
    , logHook            = dynamicLogWithPP $ xmobarPP 
      {
        -- The xmobar to output
        ppOutput        = \x -> hPutStrLn xmproc x
        -- The active workspace. A space is added between the icon and the number
      , ppCurrent       = xmobarColor "#c9af82" "" . (\(x, y) -> x ++ " " ++ y) . splitAt 1
        -- The order of the bar. Only the workspaces are shown
      , ppOrder         = \(ws:l:t:ex) -> [ws]
      }
    } `additionalKeysP` myKeys

-- Variables

myFont :: String
myFont = "xft:URWGothic-Book"

myTerminal :: String
myTerminal = "st"

myModMask :: KeyMask
myModMask = mod4Mask --Sets mod key to the super/windows key

myBorderWidth :: Dimension
myBorderWidth = 1

myBrowser :: String
myBrowser = "brave"

myEditor :: String
myEditor = myTerminal ++ " nvim"

myNormColor :: String
myNormColor = "#090611"

myFocusColor :: String
myFocusColor = "#ffffff"

myWorkspaces :: [String]
myWorkspaces = ["1<fn=1>\62601 </fn>", "2<fn=1>\63097 </fn>", "3<fn=1>\61441 </fn>"] ++ map format [4..9]
  where format = (++ "<fn=1>\61713 </fn>") . show

-- Startup hooks
myStartupHook :: X ()
myStartupHook = do
  spawnOnce "nitrogen --restore &"
  spawnOnce "picom &"
  spawnOnce "unclutter &"
  spawnOnce "pa-applet &"

-- Manage hooks (or rules for certain windows)
myManageHook :: XMonad.Query (Data.Monoid.Endo WindowSet)
myManageHook = composeAll 
 [
    className =? "Nm-connection-editor" --> doFloat
 ,  resource  =? "jn"                   --> placeHook myPlacement <+> doFloat
 ]

myPlacement = smart (0.5, 0.7)
 
-- Hotkeys
myKeys :: [(String, X ())]
myKeys =
  [
    -- Open my preferred terminal
    ("M-<Return>", spawn myTerminal) -- Mod + Return
    -- Kill currently selected window
  , ("M-S-q", kill1) -- Mod + Shift + q
    -- Layouts
  , ("M-<Tab>", sendMessage NextLayout)
  , ("M-f", toggleGaps)
  , ("M-S-f", sendMessage $ Toggle NBFULL)
    -- Window navigation
  , ("M-j", windows W.focusDown)
  , ("M-k", windows W.focusUp)
  , ("M-m", windows W.swapMaster)
  , ("M-<Space>", windows W.focusMaster)
    -- Programs
  -- , ("<XF86AudioRaiseVolume>", spawn "sound up 5")
  -- , ("<XF86AudioLowerVolume>", spawn "sound down 5")
  -- , ("<XF86AudioMute>", spawn "sound toggle")
  , ("M-d", spawn "dmenu_run")
  , ("M-0", spawn "turnoff")
  , ("M-<Print>", spawn "screenshot")
  , ("M-b", spawn "brave")
  , ("M-S-c", spawn $ myTerminal ++ " calcurse")
  , ("M-S-x", spawn $ myEditor ++ " ~/.config/xmonad/xmonad.hs")
  , ("M-S-n", spawn $ myEditor ++ " ~/.config/nvim/init.vim")
  , ("M-S-s", spawn $ myTerminal ++ " ncmpcpp")
  , ("M-S-d", spawn $ myTerminal ++ " -n jn" ++ " jn")
  , ("M-S-p", spawn $ myTerminal ++ " gtj")
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

wide        = renamed [Replace "wide"]
              $ smartBorders
              $ gaps [(U, 48), (D, 2), (R, 8), (L, 8)]
              $ limitWindows 12
              $ mySpacing 8
              $ Mirror 
              $ ResizableTall 1 (3/100) (1/2) []
tall        = renamed [Replace "tall"]
              $ smartBorders
              $ gaps [(U, 48), (D, 2), (R, 8), (L, 8)]
              $ limitWindows 12
              $ mySpacing 8
              $ ResizableTall 1 (3/100) (1/2) []
tabs        = renamed [Replace "tabs"]
              $ smartBorders
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
                    myDefaultLayout = tall
                                      ||| wide
                                      ||| tabs
