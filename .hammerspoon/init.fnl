; vi: ft=clojure
; (local {:application app :hotkey hotkey} hs)

(fn bind-with-keycode [mods key message pressedfn releasedfn repeatfn]
    (hs.hotkey.bind mods (. hs.keycodes.map key) message pressedfn releasedfn repeatfn))

(fn bind-multiple [keyspecs message pressedfn releasedfn repeatfn]
    (each [_idx keyspec (pairs keyspecs)]
          (hs.hotkey.bindSpec keyspec message pressedfn releasedfn repeatfn )))

(local hyper [:ctrl :cmd :alt])

(set hs.window.animationDuration 0)

(hs.hotkey.bind hyper :r
   "Reload config"
    (fn [] (hs.reload)))

(fn calc-x [screen-frame offset]
    (let [x screen-frame.x
          w screen-frame.w]
      (+ x (* w offset))))

(fn resize-window [win offset mult]
    (let [win-frame (win:frame)
          screen (win:screen)
          screen-frame (screen:frame)]

      (set win-frame.x (calc-x screen-frame offset))
      (set win-frame.y screen-frame.y)
      (set win-frame.w (* screen-frame.w mult))
      (set win-frame.h screen-frame.h)
      (win:setFrame win-frame)))

(fn resize-focused-window [offset mult]
    (resize-window (hs.window.focusedWindow) offset mult))

; Left third 
(hs.hotkey.bind hyper "'"
                (fn [] (resize-focused-window 0 (/ 1 3))))
; Left half 
(hs.hotkey.bind hyper :a
                (fn [] (resize-focused-window 0 (/ 1 2))))
; Left two thirds 
(hs.hotkey.bind hyper ";"
                (fn [] (resize-focused-window 0 (/ 2 3))))
; Middle third
(hs.hotkey.bind hyper ","
                (fn [] (resize-focused-window (/ 1 3) (/ 1 3))))
; Middle half
(hs.hotkey.bind hyper :o
                (fn [] (resize-focused-window (/ 1 4) (/ 1 2))))
; Right third
(hs.hotkey.bind hyper :.
                (fn [] (resize-focused-window (/ 2 3) (/ 1 3))))
; Right half
(hs.hotkey.bind hyper :e
                (fn [] (resize-focused-window (/ 1 2) (/ 1 2))))
; Right two third
(hs.hotkey.bind hyper :j
                (fn [] (resize-focused-window (/ 1 3) (/ 2 3))))

; Fullscreen
(bind-multiple [[hyper :f]
                [[:cmd :alt] :return]]
               (fn [] (resize-focused-window 0 1)))

(hs.hotkey.bind hyper :c
                hs.grid.show)

(hs.hotkey.bind hyper :s
                (fn [] (hs.grid.snap (hs.window.focusedWindow))))

(hs.hotkey.bind [:cmd :ctrl] :m
                (fn [] (hs.alert (.."Current layout: " (hs.keycodes.currentLayout)))))

(hs.hotkey.bind hyper :m
                (fn [] (let [new-layout (if (not= (hs.keycodes.currentLayout) :Dvorak) :Dvorak :ABC)]
                         (hs.alert (.."Current layout: " new-layout))
                         (hs.keycodes.setLayout new-layout)
                         (hs.reload))))

(hs.grid.setGrid "3x3")
(hs.grid.setGrid "5x4" "3440x1440")
(hs.grid.setGrid "4x3" "2560x1440")
(hs.grid.setGrid "4x4" "1440x2560")
(hs.grid.setMargins "0x0")

; (-> (hs.expose.new nil )
;     (: :toggleShow))

(set hs.grid.HINTS
  [
   [ "f1" "f2" "f3" "f4" "f5" "f6" "f7" "f8" "f9" "f10" ]
   [  "1"  "2"  "3"  "4"  "5"  "6"  "7"  "8"  "9"   "0" ]
   [  "'"  ","  "."  "P"  "Y"  "F"  "G"  "C"  "R"   "L" ]
   [  "A"  "O"  "E"  "U"  "I"  "D"  "H"  "T"  "N"   "S" ]
   [  ";"  "Q"  "J"  "K"  "X"  "B"  "M"  "W"  "V"   "Z" ]
  ]
)
; {
;  { "f1", "f2", "f3", "f4", "f5", "f6", "f7", "f8", "f9", "f10" }
;  {  "1",  "2",  "3",  "4",  "5",  "6",  "7",  "8",  "9",   "0" }
;  {  "Q",  "W",  "E",  "R",  "T",  "Y",  "U",  "I",  "O",   "P" }
;  {  "A",  "S",  "D",  "F",  "G",  "H",  "J",  "K",  "L",   ";" }
;  {  "Z",  "X",  "C",  "V",  "B",  "N",  "M",  ",",  ".",   "/" }
; }


; ; Left third 
; (hs.hotkey.bind hyper "'"
;                 (fn [] (let [win (hs.window.focusedWindow)
;                              win-frame (win:frame)
;                              screen (win:screen)
;                              screen-frame (screen:frame)]
;                          (set win-frame.x screen-frame.x)
;                          (set win-frame.y screen-frame.y)
;                          (set win-frame.w (/ screen-frame.w 3))
;                          (set win-frame.h screen-frame.h)
;                          (win:setFrame win-frame)
;                          )))
; Left half 
; (hs.hotkey.bind hyper :a
;                 (fn [] (let [win (hs.window.focusedWindow)
;                              win-frame (win:frame)
;                              screen (win:screen)
;                              screen-frame (screen:frame)]
;                          (set win-frame.x screen-frame.x)
;                          (set win-frame.y screen-frame.y)
;                          (set win-frame.w (/ screen-frame.w 2))
;                          (set win-frame.h screen-frame.h)
;                          (win:setFrame win-frame)
;                          )))
; Left two thirds 
; (hs.hotkey.bind hyper ";"
;                 (fn [] (let [win (hs.window.focusedWindow)
;                              win-frame (win:frame)
;                              screen (win:screen)
;                              screen-frame (screen:frame)]
;                          (set win-frame.x screen-frame.x)
;                          (set win-frame.y screen-frame.y)
;                          (set win-frame.w (* (/ screen-frame.w 3) 2))
;                          (set win-frame.h screen-frame.h)
;                          (win:setFrame win-frame)
;                          )))

; Middle third
; (hs.hotkey.bind hyper ","
;                 (fn [] (let [win (hs.window.focusedWindow)
;                              win-frame (win:frame)
;                              screen (win:screen)
;                              screen-frame (screen:frame)]
;                          (set win-frame.x (+ screen-frame.x (/ screen-frame.w 3)))
;                          (set win-frame.y screen-frame.y)
;                          (set win-frame.w (/ screen-frame.w 3))
;                          (set win-frame.h screen-frame.h)
;                          (win:setFrame win-frame)
;                          )))
; Middle half
; (hs.hotkey.bind hyper :o
;                 (fn [] (let [win (hs.window.focusedWindow)
;                              win-frame (win:frame)
;                              screen (win:screen)
;                              screen-frame (screen:frame)]
;                          (set win-frame.x (+ screen-frame.x (/ screen-frame.w 4)))
;                          (set win-frame.y screen-frame.y)
;                          (set win-frame.w (/ screen-frame.w 2))
;                          (set win-frame.h screen-frame.h)
;                          (win:setFrame win-frame)
;                          )))
; ; Right half
; (hs.hotkey.bind hyper :e
;                 (fn [] (let [win (hs.window.focusedWindow)
;                              win-frame (win:frame)
;                              screen (win:screen)
;                              screen-frame (screen:frame)]
;                          (set win-frame.x (+ screen-frame.x (/ screen-frame.w 2)))
;                          (set win-frame.y screen-frame.y)
;                          (set win-frame.w (/ screen-frame.w 2))
;                          (set win-frame.h screen-frame.h)
;                          (win:setFrame win-frame)
;                          )))
; Right third
; (hs.hotkey.bind hyper :.
;                 (fn [] (let [win (hs.window.focusedWindow)
;                              win-frame (win:frame)
;                              screen (win:screen)
;                              screen-frame (screen:frame)]
;                          (set win-frame.x (+ screen-frame.x (/ (* screen-frame.w 2) 3)))
;                          (set win-frame.y screen-frame.y)
;                          (set win-frame.w (/ screen-frame.w 3))
;                          (set win-frame.h screen-frame.h)
;                          (win:setFrame win-frame)
;                          )))

; Right two third
; (hs.hotkey.bind hyper :j
;                 (fn [] (let [win (hs.window.focusedWindow)
;                              win-frame (win:frame)
;                              screen (win:screen)
;                              screen-frame (screen:frame)]
;                          (set win-frame.x (+ screen-frame.x (/ screen-frame.w 3)))
;                          (set win-frame.y screen-frame.y)
;                          (set win-frame.w (* (/ screen-frame.w 3) 2))
;                          (set win-frame.h screen-frame.h)
;                          (win:setFrame win-frame)
;                          )))


; (fn do-fullscreen [] (let [win (hs.window.focusedWindow)
;                              win-frame (win:frame)
;                              screen (win:screen)
;                              screen-frame (screen:frame)]
;                          (set win-frame.x screen-frame.x)
;                          (set win-frame.y screen-frame.y)
;                          (set win-frame.w screen-frame.w)
;                          (set win-frame.h screen-frame.h)
;                          (win:setFrame win-frame)
;                          ))

(hs.hotkey.bind hyper :i
                (fn [] (hs.hints.windowHints (hs.window.focusedWindow))))
