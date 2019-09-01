
" Search for documentation, help, code excepts/usages
" in the context you are in/ not break the flow

" All search params are optional - could send an empty object {} to show the search sites main page (without actually running a query)
let g:exampleSearchParams =
      \{'mainTerm':   'fmap'
      \,'identifier': '<*>'
      \,'type':       'Maybe a'
      \,'module':     'Control.Applicative'
      \,'package':    'async-2.2.1'
      \,'language':   'Haskell'
      \}
" include also ranges of packages, repos, folders on disk?

" Stages:
" 1. Gather context info
" 2. Let user edit search params
" 3. Select (a list of) search services
" 4. Map search params to services and run query
" 5. Display/ open results

" Ideas:
" Collections of pages: BrowserSearch could look for a 'pages'/'collection' key and run/open multiple results
" Search only in current package sets using: echo pyeval('getHSPackageDependencies()')

" fmap, Control.Applicative, async-2.2.1, Haskell
" fmap,,,Haskell
" fmap,,async,Haskell
" fmap  async Haskell
" Control.Applicative fmap async- Haskell

" GetLanguageByCurrentFileExtension

func! GetInputStr( userPrompt, ...)
  let initStr = a:0 == 1 ? GetVisSel() : HsCursorKeyword()
  return input( a:userPrompt, initStr )
endfunc
nnoremap <leader>tti :echoe GetInputStr('Search keyword: ')<cr>
vnoremap <leader>tti :<c-u>echoe GetInputStr('Search term: ', 'v')<cr>

func! ParseQualifiedStr( inStr ) " ■
  let items = split( a:inStr, '\.' )
  if items[-1][0] =~ '\u'
    if len( items ) == 2 " Just two items and the last one uppercase is pased as just a module
      return {'module': join( items, '.' )}
    else
      " Assume the last item is a dataconstructor for now. If an explicit is available, then revert to interpret the entire string as a module
      return {'module': join(items[:-2], '.')
            \, 'identifier': items[-1]}
    endif
  else
    " If the last item is lowercase or an infix/symbol char then parse it is identifier
    return {'module': join(items[:-2], '.')
        \, 'identifier': items[-1]}
  endif
endfunc
" echo ParseQualifiedStr( 'Control.Applicative.Monoid' )
" echo ParseQualifiedStr( 'Control.Applicative.Just' )
" echo ParseQualifiedStr( 'Control.Applicative.fmap' )
" echo ParseQualifiedStr( 'Control.Applicative.(<*>)' )
" echo ParseQualifiedStr( 'Applicative.fmap' ) ▲

" user can enter short version of params, this will be turned into a more complete 'search-props-dictionary'
func! ParseSearchParams( inStr )
  " Comma as a seperator is required when type-sigs are passed
  let inStrs = a:inStr =~ '\,' ? split(a:inStr, '\,') : split(a:inStr)

  let searchParams = {}
  for item in inStrs
    if     item =~ '\s' "    Type (only types can contains spaces!)
      call extend( searchParams, {'type': item} )

    elseif item[0] =~ '\A' " Identifier (starts with a non-alphabetic char)
      call extend( searchParams, {'identifier': item} )

    elseif item =~ '\i\.'  " Module or qualified identifier
      call extend( searchParams, ParseQualifiedStr( item ) ) " Adds 'module' and maybe 'identifier'
      let itemQualifiedBackup = copy( item )

    elseif item =~ '-' "     Package (user needs to add '-' to package name with no version)
      call extend( searchParams, {'package': item} )

    elseif item =~ 'haskell\|vim\|purescript\|markdown\|javascript' " Language
      call extend( searchParams, {'language': item} )

    elseif item[0] =~ '\u' " Identifier (a dataconstructor e.g. Just)
      call extend( searchParams, {'language': item} )

    else
      echoe "Unsupported item in ParseSearchParams: " . item
    endif
  endfor

  if input =~ '\s'
  else
  endif

  " TODO ...
  let lang = GetLanguageByCurrentFileExtension()

endfunc
" echo split( 'Control.Applicative.fmap', '\.' )

nnoremap gso :call BrowserQuery( input( 'Browser query: ', HsCursorKeyword() ) )<cr>
vnoremap gso :call BrowserQuery( input( 'Browser query: ', GetVisSel() ) )<cr>


let g:choicesTest2 = [{'label':'_Google', 'url':'http://www.google.de/search?q='}, {'section':'Local search:'}, {'label':'_In Hask dir', 'comm':'Fhask'}]
"                      ( userPromptText,      optUserPromtValue_andFirstArg,            choices,       continuationFn,          contOtherArgs,          [winPos] ... )
" call UserChoiceAction( 'Run query on site', input('Site query: ', HsCursorKeyword()), g:searchSites, function('BrowserQuery'), [{'browser':'default'}] )
nnoremap <leader>tta :call UserChoiceAction( 'Please select one: ', '', g:choicesTest1, function('TestUserChoice1'), [] )<cr>
nnoremap <leader>ttb :call UserChoiceAction( 'Search ..', expand("<cword>"), g:choicesTest2, function('TestUserChoiceSearch'), [v:true] )<cr>

" Open searchUrl + queryStr in the default browser or in Chrome
func! BrowserSearch( searchInputObj, browser, searchSiteObj )

  let queryUrl = ''

  if a:browser.browser == 'Chromium'
    call LaunchChromium( queryUrl )
  else
    exec 'silent !open ' . shellescape( queryUrl )
  endif
endfunc
" call BrowserQuery('map', {'browser':'Chromium'}, 'https://hoogle.haskell.org/?hoogle=')
" call BrowserQuery('map', {'browser':'default'}, 'https://www.stackage.org/lts-14.1/hoogle?q=')
" call BrowserQuery('map', {'browser':'Chromium'}, 'https://www.stackage.org/lts-14.1/hoogle?q=')




" ─   Config Search Sites                               ──

let g:searchSites =  [ {'section':'Docs'} ]

" https://www.stackage.org/lts-14.1/hoogle?q=Data.Either.fromLeft
" namespace_mainTerm should join namespace and mainTerm via a '.' if both are provided
let g:searchSites += [ {'label':'Stackage',   'baseUrl':'https://www.stackage.org/lts-14.1/'
      \, 'namespace_mainTerm':'hoogle?q='
      \}]

" https://hoogle.haskell.org/?hoogle=Data.Either.fromLeft&scope=package%3Aeither
let g:searchSites += [ {'label':'Hoogle',     'baseUrl':'https://hoogle.haskell.org/'
      \, 'namespace_mainTerm':'?hoogle='
      \}]

" https://pursuit.purescript.org/search?q=fromLeft
" Pursuit can only search for a module namespace (Data.List) *or* an identifier (e.g. fromLeft), not a combination of both
" So searching for a module has to use the 'mainTerm' field
let g:searchSites += [ {'label':'Pursuit',    'baseUrl':'https://pursuit.purescript.org/search?q='
      \, 'mainTerm':'search?q='
      \}]

let g:searchSites += [ {'section':'Web help/ posts'} ]

" https://www.google.de/search?q=traverse+Haskell
" This usually features Stackoverflow
let g:searchSites += [ {'label':'Google',     'baseUrl':'google.de/'
      \, 'mainTerm':'search?q='
      \, 'language':'+'
      \}]

" https://www.reddit.com/r/haskell/search/?q=Data.Either.fromLeft&restrict_sr=1
let g:searchSites += [ {'label':'Redit Haskell', 'baseUrl':'https://www.reddit.com/r/haskell/'
      \, 'mainTerm':'search/?q='
      \, 'options':'&restrict_sr=1'
      \}]

" https://github.com/search?l=&q=traverse+language%3AHaskell&type=Code
" Can then switch to 'Repos', 'Issues', 'Wikis', ..
let g:searchSites += [ {'label':'Github',     'baseUrl':'https://github.com/'
      \, 'mainTerm':'search?l=&q='
      \, 'language':'+language%3A'
      \, 'options':'&type=Code'
      \}]

" https://haskell-code-explorer.mfix.io/search/withAsync
" https://haskell-code-explorer.mfix.io/package/async-2.2.1/search/withAsync
let g:searchSites += [ {'label':'Hs Code Explorer (Hackage search + browse)'
      \, 'baseUrl':'https://haskell-code-explorer.mfix.io/'
      \, 'package':'package/'
      \, 'mainTerm':'search/'
      \}]

" https://codesearch.aelve.com/haskell/search?query=fromLeft&filter=Data.Either
let g:searchSites += [ {'label':'Aelve (Hackage code search)'
      \, 'baseUrl':'https://codesearch.aelve.com/haskell/'
      \, 'mainTerm':'search?query='
      \, 'namespace':'&filer='
      \}]



