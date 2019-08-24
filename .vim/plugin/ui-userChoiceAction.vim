" ─   User Choice Menu and Action                        ■
" Any function (action!) can be supplied with a user selected last argument/value.
" The user-selected option value will be passed as the last arg to the continuation function. Only string values are
" supported for now. (the list of continuation args will be supplied to any starting args of the continuation function)
" Note: that all code that wants to use the selected value/effect needs to run in the contionuationFn. (there should be no
" code-lines after the call to UserChoiceAction().
" The forth (optional) arg can either be 'showRight' (default) or 'showBottom'
" optUserPromtValue_andFirstArg (if not empty!) will be shown in the dialog *and* be used as the first arg to the continuation
func! UserChoiceAction( userPromptText, optUserPromtValue_andFirstArg, choices, continuationFn, contOtherArgs, ... )
  let windowPos = (a:0 == 6) ? a:4 : "showRight"
  " Show the dialog
  call UserChoiceDialog_show( a:userPromptText, a:optUserPromtValue_andFirstArg, a:choices, windowPos )

  " Store continuation fn+args so the "UserChoiceAction_resume" can run it
  let g:userChoiceContinuationData = { 'fn': a:continuationFn }
  let g:userChoiceContinuationData.firstArgs = (a:optUserPromtValue_andFirstArg != '') ?
        \  [a:optUserPromtValue_andFirstArg] + a:contOtherArgs
        \:                                     a:contOtherArgs
  " Note: async - action call stack will resume with selected value at "UserChoiceAction_resume"
endfunc

"                      ( userPromptText,      optUserPromtValue_andFirstArg,            choices,       continuationFn,          contOtherArgs,          [winPos] ... )
" call UserChoiceAction( 'Run query on site', input('Site query: ', HsCursorKeyword()), g:searchSites, function('BrowserQuery'), [{'browser':'default'}] )
call UserChoiceAction( 'Please select one: ', 'Current data: 1234', g:testUserChoice, function('TestUserChoice'), [{'browser':'default'}] )

func! UserChoiceAction_resume( selOptionValue )
  call call( g:userChoiceContinuationData.fn,
        \ g:userChoiceContinuationData.firstArgs + [a:selOptionValue] )
endfunc

func! UserChoiceDialog_show( userPromptText, userPromtValue, choices, windowPos )
  call quickmenu#current(100)
  call quickmenu#reset()

  call quickmenu#header( a:userPromptText )
  if (a:userPromtValue != '')
    call quickmenu#append('# ' . a:userPromtValue, '')
  endif

  for choiceItem in a:choices
    " call quickmenu#append( choiceItem.label, FormatResumeCall( choiceItem.val ) )
    "                        | Label           | Callback                          | Helptext             | Trigger key (first char of label!)
    call quickmenu#append( choiceItem.label, FormatResumeCall( choiceItem.val ), choiceItem.val, '', 0, choiceItem.label[0] )
    " example:
    " call quickmenu#append( 'Stackage'      , 'call UserDialgResume( "www.stackage.org" )' )
  endfor

  if a:windowPos == 'showBottom'
    call quickmenu#bottom(100)
  else
    call quickmenu#toggle(100)
  endif
endfunc

func! FormatResumeCall( arg )
  return 'call UserChoiceAction_resume("' . a:arg . '")'
endfunc
" echo FormatResumeCall( 'something in here')
" exec FormatResumeCall( 'something in here')
" ─^  User Choice Menu and Action                        ▲

