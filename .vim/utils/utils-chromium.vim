
" Launching Chromium: ---------------------------------------------------------------
" Using the full path on MacOS: "/Applications/Chromium.app/Contents/MacOS/Chromium --window-size=200,500 --window-position=0,20"
" Using an alias: "chromium --window-size=800,400 --window-position=222,222"
" Dedined in "~/.zshrc" file: alias chromium="/Applications/Chromium.app/Contents/MacOS/Chromium"
" Chromium switches are listed here: https://peter.sh/experiments/chromium-command-line-switches/
" Switches are only effective when launching the first window - one needs to close the window, and then open it again, to move it?
" Using mini bar and start URL: "chromium --app=http://purescript.org --window-position=200,50 --window-size=60,60"
" Closing The Window: End the terminal session? Use "call jobstop(s:markdown_job_id)"

" Terminal win opens
command! -nargs=1 Chromium exec ':Dispatch' '/Applications/Chromium.app/Contents/MacOS/Chromium --app=' . <q-args> '--window-size=500,400 --window-position=800,20'
" With addressbar and terminal in other tab
command! -nargs=1 Chromium1 exec ':Start!' '/Applications/Chromium.app/Contents/MacOS/Chromium ' . <q-args>

" let Tid = jobstart("/Applications/Chromium.app/Contents/MacOS/Chromium http://purescript.org")

" command! -nargs=1 Chromium :let  = jobstart("pulp repl", Cbs1)
" TODO try chromium-browser --force-device-scale-factor=0.79 - but can also set this globally in Chromium app settings

let g:chromiumAppPath = "/Applications/Chromium.app/Contents/MacOS/Chromium"

func! LaunchChromium( url ) abort
  if exists('g:launchChromium_job_id')
    call jobstop( g:launchChromium_job_id )
    " echo g:launchChromium_job_id
    unlet g:launchChromium_job_id
  else
    let g:launchChromium_job_id = jobstart( g:chromiumAppPath . ' --app=' . shellescape( a:url ))
  endif
endfunc
call LaunchChromium( 'http://purescript.org' )

func! StopChromium()
  " if exists('g:launchChromium_job_id') && (g:launchChromium_job_id > 0)
  if exists('g:launchChromium_job_id')
    call jobstop( g:launchChromium_job_id )
    " echo g:launchChromium_job_id
    unlet g:launchChromium_job_id
  endif
endfunc
call StopChromium()

" Launching Chromium: ---------------------------------------------------------------




