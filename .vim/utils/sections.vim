
" Navigating and editing long sources files using markup and textobjects
"
"
"
" Code Markup
"   more visual and navigational structure
"   highlights
"   motions and textobjects

" Status quo/ Approaches:
" " <--  intuition ....... thinking - learning automating -->
  " 1. mouse scrolling and pointing
"   2. race car hjkl
"   3. text structure: w, Word, Paragraph, $, ^, targets, indention → like a monkey making clever use of branches to get
"   to the fruit in a most efficiant way. we automate this process - hardly need to conciously process the tactics.
"   4. search: 'f', easymotion, search
"   5. syntactic: substitute 2nd arg or expression is more likely to be repeatable
"   6. semantic/labeling structure
"   7. heuristic/convention based

"   typical programmers learning curve evolves from 1 to 4
"   start using w-b as a higher level/effective 'l'/'h'
"   jump to the end of the line and then back
"
"   1,2. are very low overhead/processing (you fall back to then when you are exhaused)
"   but there are no muscle memory gains/learning gains
"   no use of powerful jump back
"   3. allows these gains
"   but it still intefers requires other thinking

" navigating and editing commands/maps should be aligned to/should support your thought process
" Navigation should be aligned with the thought/metal process
" Label mode requires you to shift metal state to processing spellings/letters
" - but you should be thinking syntax, delimiter and arg- positions
" - label mode navigation seems elegant and super fast but
"   - it's actually not that fast if you consider your latency of reading a letter/label and then typing it
"   - it's implies constant shifting/ distraction from what you have just thought about - which probl was the syntax of
"   meaning of your code

" you need to prossess the structure of your function/def and break it down into expression starts
"  - try neovim highlight marking with some fns

" ─   Description        
" - Top level dev
" - Headers
" - Labels
" - Sections

" Toplevel devs, labels, headers, sections
" all have name and content
" labels are only to structur longer comments
" labels extend to the next label or empty line

" Header Content and Header Label textobjects
" Content should extend until double empty line

" Labeled Content and Label text textobjects?

" Section label and section content textobjects

" ─   Operators          
" Yank, Substitute, Change, Delete, Replace, Uppercase

" ─   Mapps          

" Object     NextStart PrevStart NextEnd PreviousEnd inside around Inside Around LabelForw LabelBack
" word       w         b         e       ge          iw     aw     Iw     Aw     \w        \b
" WORD       W         B         E       gE          iW     aW
" Line       j0        k0        j$      k$          il     al                   \j        \k
" ,('                                                i,     a'     I,     A,
" ExprInner  q         t
" ExprOuter  Q         T
" Wire       ,q        ,t
" Comma      \q        \t
"
" TypeArg
" ApFnArg
" Paragraph  c-l       c-h       ,c-l    ,c-h        ip     ap                   \c-l      \c-h
" method     ]m                  ]M
" TopLevDef  c-n       c-p       ..                  if     af
"  name
"  content
" Header
"  name (u!)
"  content
" Label
"  name
"  content
" Section
"  name (u!) x
"  content

" skip $ and = in arg jumps
"     |              |
" let (int2, gen2) = (generate gen1)
" pure ((int1, int2), gen2)
"      A|             |

" |         |         .  .      |   |    .      |     |   
" mymapM_ ∷ (Foldable t, Monad m) ⇒ (a → m b) → t a → m ()
" mymapM_ f = foldr ((>>) . f) (return ())
"             |

" |         v   |                |          |         .       |
" withExceptC ∷ MonadError e m ⇒ (e' → e) → m (Either e' a) → m a
" withExceptC f act = do
"   eith ← act
"   case eith of
"     Left err  → throwError (f err)
"     Right val → return val

" include or go into if then else case left right?
"                                     |                     .  |               .  |             .  |          .  | .
" call highlightedyank#highlight#add( 'HighlightedyankRegion', getpos(startMark), getpos(endMark), a:motionType, 500)

"       |       |      |       v     v                          |
" rt3 ∷ ReaderT String (StateT [Int] (ExceptT String Identity)) Int

" on type sigs there is level 1 and lower levels that are words or lists
"        |       .   v         v           |             |         v  v           .   . .      | .   . .
" get :: (HasRep xs, RouteM t, Monad m) => Path xs ps -> HVectElim xs (ActionCtxT ctx m ()) -> t ctx m ()


"                       |            |                 v                            v    |             |
" errorHandler status = spockAsApp $ W.buildMiddleware W.defaultSpockConfigInternal id $ baseAppHook $ errorApp status
" errorHandler status = spockAsApp  (W.buildMiddleware W.defaultSpockConfigInternal id  (baseAppHook  (errorApp status)))

" for hs function arg steps we need to skip what's inside a paran
"                   |     |           v       v        v     .            .       |
" errorApp status = mapM_ (\method -> hookAny method $ \_ -> errorAction' status) [minBound .. maxBound]

" you want to think of the argument position. aaa should take you to the third arg

"   |               |      |              |     v            .    v  v                |
" { runActionCtxT ∷ ErrorT ActionInterupt (RWST (RequestInfo ctx) () ResponseState m) a }

eins zwei May (May a) u f
drei vier

"               |         v         |            v
emailFormat ∷ ∀ form m. Monad m ⇒ F.Validation form m FormError String Email
emailFormat = F.hoistFnE_ $ map Email <<< cond (String.contains (String.Pattern "@")) InvalidEmail
"               |             |                  |^               ^                     |

 "         |                      |     |          |                          |
decode ∷ ∀ m a. LogMessages m ⇒ Now m [Aa, Bb] ⇒ (Json → Either String a) → Maybe sson a
decode _ Nothing = logError "Response mal <*> formed" <*> pure Nothing
"                    |        ^                 ^           |

" type delims and operators will rarely mix - only in type level programming
" but there may sometimes/rarely be
"    |         v       |  .      v       |
"   [Ab 'a' <> Ab 'c', Ab 'x' <> Ab 'd', Ab 'y']


partition p xs == (filter p xs, filter (not . p) xs)
" Delimiter: if a ({[ is found before →, then go the closing )]} and search next
"         |                s    |               |
(<*>) ∷ ReaderT r m (a → b) → ReaderT r m a → ReaderT r m b
ReaderT rmab <*> ReaderT rma = ReaderT $ \r → rmab r <*> rma r
"                  |             |         |    |          |


" Delimiter: when on ([{ search next after closing )]}
" [(1, 2), (8, 11, 5), (4, 5)]

" i'm ok with not skipping literal string content
" "   |          |               |
   "hello" ++ Just "ab + cd" ++ "world"
   "hello" + Just "ab, cd" + "world"
   "hello" <*> Just "ab, cd" <*> "world"
   "hello" `so` Just "ab, cd" `cd` "world"
"
"   44 `add` Just 44 `sub` 44 44 `kk` "as"
"
" "   |          |                 |
   Just 2 <*> Some 4 [3, 4] <$> More "a"
   Just 2 >>= Some 4 [3, 4]  *> More "a" >> Some b < A b
   Just 2 <*> Some 4 (3, 4) <$> More "a"
   Just 2 <>  Some 4 (3, 4 <*> 4) <$> More "a"
"   " |          |          ^     ^      |
   44 `add` Just 44 `sub` 44 44 `kk` "as"
" " This works!
"
"   " |          |                              |
   " "hello" ++ Just "ab cd" ("a" <> "b b") <> Some 4
"
" "   |                         |                 |
   Just ['w' ++ 'b', 'o'] ++ Just ['o','t'] ++ Just ['b', 'c']

   Just ['w' ++ 'b', 'o'],   Just ['o','t'],   Just ['b', 'c']


" inRange ∷ Int → (Int, Int) → Bool
" inRange val (start, end) = val >= start && val <= end
"                            |      |        |      |

" countElem ∷ Eq a ⇒ [a] → a → Int
" countElem l e = length $ filter (== e) l

" from the term function start you have these options:


" ExprInner  q         t
" ExprOuter  Q         T
" Wire       ,q        ,t
" Comma      \q        \t


" Expression/ Function start: after = X
"                mostly pt_delim = '\(=\|<\?.\?>\|\$\|→\|++\?\|>\?>.\?\)\s\zs.'
    "            new line
" Type args: coud switch to this logic when there's ∷ in the line?
"   - if theres no ∷ in the current line, search back to previous (also inner) ∷ X ..

" Function application/expression Next - Back:
" basically WORD and B motion but
"   - not search inside ([{ when cursor is at it
"   - not jump to $ - but go to inner last arg?
"   - not jump to opers <> + ++ == - but jump to next expression
"  Main/where fn args - var/binds: skipping brackets (destructuring)
"   - new lines

" Wireframe: inner/where fns X = ..
"            case, if
"            Col 0 line, for funtion cases/patterns
" 
" Comma/ lists:
"   - find the beginning of the first elem by searching back to ([{ from the first comma found, but not further then ','


" how to navigate inside a:
"   - do
"   - if
"   - case
"   - let



" postFollowR :: Ab c -> [Char] → Handler Value
" postFollowR (Ab x) username = do
"   (Entity userId _) <- runDB $ getBy404 $ UniqueUserUsername username
"   mCurrentUserId <- maybeAuthId
"   case mCurrentUserId of
"     Nothing -> notFound
"     Just currentUserId -> do
"       let follower = UserFollower userId currentUserId
"       void $ runDB $ insertUnique follower
"       getProfilesR username


" | Request an Int within a range, reject non-complient and
" | and confirm success.
" intRangeDialog ∷ (Int, Int) → String → String → String → IO Int
" intRangeDialog (rStart, rEnd) prompt alert confirm = go 2
"   where
"     go a = do
"       print prompt
"       inSt ← getLine
"       case readMaybe inSt ∷ Maybe Int of
"         Just x | inRange x (rStart, rEnd)
"           → print (confirm <> show x) >> return x
"         _ → print alert               >> go
" -- intRangeDialog (1,3) "From 1 to 3" "Arg!" "I got: "
"
" -- | Request a non-blank string, reject non-complient and
" -- | and confirm success.
" nonBlankStringDialog ∷ String → String → String → IO String
" nonBlankStringDialog prompt alert confirm = go
"   where
"     go = do       - - so is similar to let - you edit consider the expression more than the var name? - you don't need the finger as a pointer on the name?
"       print prompt
"       inSt ← getLine
"       if notBlank inSt
"          then print confirm >> return inSt
"          else print alert   >> go
" -- nonBlankStringDialog "Please enter:" "Arg!" "Thanks!"
"
"
" --------------------------------------------------------------------------------
"
" -- | Repeatedly accum 'action' result (a) into a list,
" -- apply the list to 'eval' after each turn and stop/return 'm b' if 'p' holds.
" actionIdxLogEvalUntil ∷ ∀ a b m. Monad m
"                       ⇒ (Int → m a) -- action (receiving index)
"                       → ([a] → b)   -- eval
"                       → (b → Bool)  -- p
"                       → m b         -- return 'b' only if p holds, else cont. action
" actionIdxLogEvalUntil action eval p = go 1 []
"   where
"     go ∷ Int → [a] → m b
"     go idx xs = action idx >>= evalTestReturnOrRecurse . (: xs)
"       where
"         evalTestReturnOrRecurse ∷ [a] → m b
"         evalTestReturnOrRecurse = ifResElse eval p $ go (idx+1)
"
"
" -- | Repeatedly accum 'action' result 'a' into a list,
" -- 'eval' the list after each turn and stop/return 'm b' if 'p' holds.
" actionLogEvalUntil ∷ ∀ a b m. Monad m
"                    ⇒ m a         -- action
"                    → ([a] → b) -- eval
"                    → (b → Bool)  -- p
"                    → m b         -- return 'b' only if p holds, else cont. action
" actionLogEvalUntil action eval p = go []
"   where
"     go ∷ [a] → m b
"     go xs = action >>= evalTestReturnOrRecurse . (: xs)
"     -- accum action (in (monad-trans) 'm') val to the log (xs) and
"
"     evalTestReturnOrRecurse ∷ [a] → m b
"     evalTestReturnOrRecurse = ifResElse eval p go
"     -- eval the log, return the result of the evaluation or recurse to go action
" -- it ∷ IO String
" --    → ([String] → Int)
" --    → (Int → Bool)
" --    → IO Int
"   -- ∷ Monad m
"   -- ⇒ m a
"   -- → ([a] → b)
"   -- → (b → Bool)
"   -- → m b
" t_actionLogEvalUntil = actionLogEvalUntil (getLine ∷ IO String) -- produce strings('a')
"                                           (length . fold) -- accum and count('m b') / derive
"                                           (>10) -- pred
"
"
" actionLogEvalUntil1 ∷ ∀ a b m. Monad m
"                     ⇒ m a         -- action
"                     → ([a] → b) -- eval
"                     → (b → Bool)  -- p
"                     → m b         -- return 'b' only if p holds, else cont. action
" actionLogEvalUntil1 action eval p = go []
"   where
"     go ∷ [a] → m b
"     go xs = action >>= evalTestReturnOrRecurse . (: xs)
"     -- accum action (in (monad-trans) 'm') val to the log (xs) and
"
"     evalTestReturnOrRecurse ∷ [a] → m b
"     evalTestReturnOrRecurse = ifResElse eval p go
"     -- eval the log, return the result of the evaluation or recurse to go action
"
"
" -- | Return 'action a' if 'p' holds on the result, else run 'alt a'
" ifResElseM ∷ Monad m ⇒ (a → m b) → (b → Bool) → (a → m b) → (a → m b)
" ifResElseM action p alt a = do b ← action a
"                                if p b
"                                   then return b
"                                   else alt a
" -- ifResElseM (Just . length) (>4) (Just . (const 0)) "eins-zwei"
" t_ifResElseM1 ∷ String → IO Int
" t_ifResElseM1 inStr = ifResElseM
"                          (\accSt → length . (accSt++) <$> getLine)
"                          (>10) -- pred tests the result of eval
"                          t_ifResElseM1
"                          inStr
"
"
" -- | Return 'eval a' if 'p' holds on the result, else run 'alt a'
" ifResElse ∷ Monad m
"           ⇒ (a → b)
"           → (b → Bool)
"           → (a → m b)
"           → (a → m b)
" ifResElse eval p alt a = let res = eval a
"                              res2 = test 2 3
"                           in if p res
"                                 then return res
"                                 else alt a
" -- ifResElse length (>4) (Just . (const 0)) "eins-zwei"
" t_ifResElse1 ∷ IO Int
" t_ifResElse1 = go ""
"   where
"     go accSt = do
"       st ← (accSt++) <$> getLine
"       ifResElse length (>10) -- pred tests the result of eval
"             go -- aternative action / recurse to base action
"             st

" Fn Wireframe:
" do, let, if, case, function, before function signature 
" → basically delimiter?
" have textobj around those


" ─   Examples          
" Another one: but now content is below
" Another: but now content is below
" and multiple lines
" Test Three:
" but now content is below
" and multiple lines

" ─   Structure         
  " words
  " arguments, parans (next argument navigation), type signature, list, string
  " lines
" paragraph / and native paragraph
" top-level def
  " folds (zj z)
  " hunks/errors/spells (s] sj?)
" labels
" headers
" sections

" how can I unify jumps to objects and end of objects with the content/around/inside reference?
" works, lines, paragraphs sort of have this
" but not vim-targets? (other textobject examples? - there is def. reuse of the patters)

" folds are sort of related to longer jumps or textobjects - can easily be created/deleted

" zj/k z]z[ are native and work well for folds
" c-l/h for paragraphs, ,c-l for end of paragraph
"   is really convienient - like scrolling
" c-n/p is a more highlevel - to navigate labels and headers
" but what if I only want headers and sections? 
" ** should have these three objects in tagbar
" There is also 'next haskell/vim top-level devinition' playing into this
" there is also next hunks and next warning/ale/gitgutter

" How to create headers, labels and sections
" how to change them?

" Another one: but now content is below
" Another: but now content is below
" and multiple lines
" Test Three:
" but now content is below
" and multiple lines

" This is but maybe. I this is longer .. it would not be a label: and that can be brief


" a section is closed when an end marker is created
"   the map/command automatically uses the header txt of the previous sectionheader
" also when a section end marker is created, fold markers are added 
" to the section start and end lines

" open section header lines may have no fold start markers
" you can add a manual fold. cursor on the header line: "zf\j.." or vis-sel

" ─   Todos              ■
" make header of commented line
" delete header (and end marker) but leave headline text to edit? then recreate?
" include optional foldmarkers
" automatically when an end line is created
" reformat section end after change of header text
" also update an end marker if exsistent ▲

" go to next/prev section header (not end header)
" go to end → text object
" go to next/prev label
" → all these consistent in mapping and implementation

" Textobjects:
" inside section header
" inside section
" around section
" inside label

" ─   Some tests                                         ■
" call append( line('.'), 'line below')
" /\v^("|--)\s─(\^|\s)\s{2}\u.*\S\s*──$
" call search('\v^("|--)\s─(\^|\s)\s{2}\zs\u.*\S\ze\s*──$')
" call search('\v^("|--)\s─\s{3}\zs\u.*\S\ze\s*──$', 'bW')
" echo matchstr(getline (line('.') -1), '\v^("|--)\s─(\^|\s)\s{2}\zs\u.*\S\ze\s*──')
" echo matchstr(getline (line('.') -1), '[a-z]*t')
" ─^  Some tests                                         ▲


" ─   Maps                                              ──
nnoremap <leader>css :call MakeSectionHeader(0, '', 0)<cr>
nnoremap <leader>cse :call MakeSectionEndMarker()<cr>
nnoremap <leader>csr :call RefreshSectionMarkers()<cr>
" Test on these lines
" Some Headline Text


" let [sl, sc] = searchpos(a:opening, 'bcW') " search left for opening


func! SectionGoPrevHeaderLine ()
  call search('\v^("|--)\s─\s{3}\u.*', 'bW')
endfunc

" Jumps to section end marker if exists and returns 1, does not move and returns 0 otherwise
func! SectionGoMatchingEndMarker ()
  let l:winview = winsaveview()
  call SectionGoPrevHeaderLine()
  let headerText = HeadlinieTxFromLine( line('.') )
  return search('\v^("|--)\s─\^\s{2}' . headerText, 'W')
endfunc

" Go to next end marker, abort at any new section start line (nesting is not supported),
" don't rely on section name, useful for renaming sections
func! SectionGoNextEndMarker ()
  let l:winview = winsaveview()
  " Go to either next start or end marker
  call search('\v^("|--)\s─(\^|\s)\s{2}\u', 'W')
  let isEndMarker = len( matchstr(getline(line('.')), '─^') ) ? 1 : 0
  if isEndMarker " Confirm we have moved to matching end marker
    return 1
  else " Roll back
    call winrestview(l:winview)
    return 0
  endif
endfunc
" echo SectionGoNextEndMarker()


" Create Section header start or end markers
" Uses the current line text if headerText is empty string
func! MakeSectionHeader ( isEnd, headerText, addFoldMarker )
  let lineTargetLength = 64
  let sectionHeaderText = len(a:headerText) ? a:headerText : getline('.')
  normal dd
  let lineFirstPart = a:isEnd ? '" ─^  ' : '" ─   '
  let foldMarkerText = a:isEnd ? '▲▲' : '■■'
  let lineLastPart = a:addFoldMarker ? ('──' . foldMarkerText) : '──'
  let numOfFillChars = lineTargetLength - (len(lineFirstPart) + len(sectionHeaderText) + len('──'))
  let fillChars = repeat( ' ', numOfFillChars)
  let lineText = lineFirstPart . sectionHeaderText . fillChars . lineLastPart
  call append( line('.') -1, lineText )
  normal k
endfunc
" call MakeSectionHeader(0, 'Some Text', 0)
" call MakeSectionHeader(1, 'Some Text', 1)

" Create section end marker using the header text of the previous header start line
func! MakeSectionEndMarker()
  let l:winview = winsaveview()
  call SectionGoPrevHeaderLine()
  let headerText = HeadlinieTxFromLine( line('.') )
  " Just overwrite/recreate the header line adding the start foldmarker
  call MakeSectionHeader(0, headerText, 1)
  call winrestview(l:winview)
  call MakeSectionHeader(1, headerText, 1)
endfunc
" call MakeSectionEndMarker()
" ─^  Maps                                              ──
" ─^  Some more Text                                    ──

" Run this after changing the section header text. Will update and marker and realign line spacing
func! RefreshSectionMarkers()
  let l:winview = winsaveview()
  let foldMarkerToPerserve = len( matchstr(getline(line('.')), '■■') ) ? 1 : 0
  let headerText = HeadlinieTxFromLine( line('.') )
  call MakeSectionHeader(0, headerText, foldMarkerToPerserve)
  if SectionGoMatchingEndMarker()
    call MakeSectionHeader(1, headerText, 1)
  endif
  call winrestview(l:winview)
endfunc

" Extract headline text from section header line
func! HeadlinieTxFromLine( lineNum )
  return matchstr( getline(a:lineNum), '\v^("|--)\s─(\^|\s)\s{2}\zs\u.*\S\ze\s*──')
endfunc
" echo HeadlinieTxFromLine( line('.') +1 )
" ─^  Some Headline Text                                ──




