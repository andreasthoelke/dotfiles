

let g:js = '(function() { var nodes = document.querySelectorAll("h2"); var titles = []; for (var i = 0; i < 5; i++) { titles.push(nodes[i].innerHTML) } return titles.join(" "); })();'

let g:js = '(function() { var nodes = document.querySelectorAll("h2"); var titles = []; for (var i = 0; i < 5; i++) { titles.push(nodes[i].textContent) } return titles.join(","); })();'

let g:js = 'console.log( abc1 )'
let g:js = 'console.log("hi")'

let g:js = 'abc1 = "test"'

chrome-cli execute '(function() { var nodes = document.querySelectorAll("h2"); var titles = []; for (var i = 0; i < 5; i++) { titles.push(nodes[i].innerHTML) } return titles.join("
"); })();'

echo system('chrome-cli execute ' . shellescape(g:js))

call system('chrome-cli open http://github.com')

!chrome-cli open http://github.com
echo system('chrome-cli execute ' . shellescape(@a))


(function() {
  return document.readyState === 'complete';
})();

call timer_start(1000, function("Backer", ["one"]))

call timer_start(1000, 'TestHandler', {'repeat': 3})
let g:cnt = 0
func! TestHandler( timer )
let g:cnt = g:cnt + 1
if g:cnt > 1
call timer_stop( a:timer )
echo 'done'
endif
echo ('yes ' . g:cnt)
endfunc

silent !chrome-cli activate -t 1192
silent !chrome-cli activate -t 1182

func! Backer(foo, ...)
echo 'back: ' ++ a:foo
endfunc

could do google search with quickfix list

window.location = 'http://purescript.org';
window.location = 'http://github.com';
window.open('https://www.codexworld.com', '_blank');

Overview Installation JavaScript execution Usage Examples

Overview,Installation,JavaScript execution,Usage,Examples

chrome-cli
Overview
Installation
Homebrew
Manual
Downloads
JavaScript execution
Usage
Examples 

func! InsertHeadingTexts()
let g:headingsStartLine = line('.')
let g:headingTextAsLines = system('chrome-cli execute ' . shellescape( @a ))
call append( line('.') - 1, '' )
call append( line('.') - 2, split( g:headingTextAsLines, ',') )
exec 'normal!' ++ g:headingsStartLine ++ 'G'
endfunc
call InsertHeadingTexts()

Here, we get a list of <p> elements whose immediate parent element is a div with the class "highlighted" and which are located inside a container whose ID is "test".

  var container = document.querySelector("#test");
var matches = container.querySelectorAll("div.highlighted > p");

(function() {
  var content = document.querySelector('article');
  var headingElems = content.querySelectorAll('h1, h2, h3, h4, h5');
  var headingTexts = Array.from( headingElems ).map( el => {
    const indent = ' '.repeat( 2 * (el.tagName[1] - 1) );
    return indent + el.textContent;
  }).join(',');
  return headingTexts;
})();

