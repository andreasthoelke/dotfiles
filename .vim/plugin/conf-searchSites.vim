
let g:searchSites =  [ {'section':'Docs'} ]

" https://www.stackage.org/lts-14.1/hoogle?q=Data.Either.fromLeft
" namespace_mainTerm should join namespace and mainTerm via a '.' if both are provided
let g:searchSites += [ {'label':'Stackage',   'baseUrl':'https://www.stackage.org/lts-14.1/'
      \, 'namespace_mainTerm':'hoogle?q='
      \}]

" TODO: use hoogle server , localhost 8080 for speed?
" https://hoogle.haskell.org/?hoogle=Data.Either.fromLeft&scope=package%3Aeither
let g:searchSites += [ {'label':'Hoogle',     'baseUrl':'https://hoogle.haskell.org/'
      \, 'namespace_mainTerm':'?hoogle='
      \}]

" https://pursuit.purescript.org/search?q=fromLeft
" Pursuit can only search for a module namespace (Data.List) *or* an identifier (e.g. fromLeft), not a combination of both
" So searching for a module has to use the 'mainTerm' field
let g:searchSites += [ {'label':'Pursuit',    'baseurl':'https://pursuit.purescript.org/search?q='
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

