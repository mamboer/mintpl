<!DOCTYPE html>
<html>

<head>
    <!-- Standard Meta -->
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>
    <meta name="keywords" content="{{keywords|join(',')}}"/>
    <meta name="description" content="{{description}}"/>
    <meta name="author" content="{{author|raw}}"/>
    <!-- Site Properities -->
    <title>{{name}} - {{description}}</title>

    <link rel="stylesheet" type="text/css" href="css/semantic.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.js"></script>
    <script src="js/semantic.min.js"></script>
    <script src="dist/{{name}}.min.js"></script>
</head>

<body id="home">
    <div class="ui inverted black vertical segment">
        <div class="ui page grid">
            <div class="column center aligned site-header-column">
                <h1>{{name|capitalize}}.JS</h1>
                <span class="ui mini label" id="version">v{{version}}</span>
                <p class="ui medium inverted header" id="description"></p>
                <a class="ui inverted blue huge button" href="https://github.com/mamboer/{{name}}/archive/master.zip">Download</a>
                <br />
            </div>
        </div>
    </div>

    <div class="ui vertical segment">
        <div class="ui page grid">
            <div class="column center aligned">
                <div class="addthis_sharing_toolbox"></div>
                <a href="https://github.com/mamboer" class="github-button">Follow {{author|raw}}</a>
                <a data-count-api="/repos/mamboer/{{name}}#stargazers_count" data-count-href="/mamboer/{{name}}/stargazers" href="https://github.com/mamboer/{{name}}" class="github-button">Star</a>
                <a data-count-api="/repos/mamboer/{{name}}#forks_count" data-count-href="/mamboer/{{name}}/network" href="https://github.com/mamboer/{{name}}/fork" class="github-button">Fork</a>
            </div>
        </div>
    </div>

    <div class="ui vertical segment">
        <div class="ui page grid">
            <div class="column">
                <h1>Installation</h1>

                <h3>Install manually</h3>
                <p>Add the {{name}}.js to your page:</p>
                <pre><code data-language="html">&lt;script src="/path/to/{{name}}.min.js"&gt;&lt;/script&gt;</code></pre>
                <p>Or, load the {{name}}.js using your AMD loader like ```requirejs```</p>
                <pre><code data-language="javascript">define(['{{name}}'],function({{name}}){/* module logic goes here */});</code></pre>

                <h3>Install via Bower</h3>
                <pre><code data-language="shell">bower install {{name}} --save</code></pre>

            </div>
        </div>
    </div>

    <div class="ui vertical segment">
        <div class="ui page grid">
            <div class="column">
                <h1>API</h1>
                <div class="ui segment">
                    <label class="ui right ribbon label">#heredoc</label>
                    <h3 class="ui header">heredoc</h3>
                    <div class="ui info message">heredoc let you define readable inline html templates inside javascript</div>
                    <pre><code data-language="javascript">new mintpl.heredoc(function(){/*!
    <div class="mintpl"><%=name%></div>
*/});</code></pre>
                    <script>
                        var doc = new mintpl.heredoc(function(){/*!
                            <div class="mintpl"><%=name%></div>
                            <div class="himan"><%=author%></div>
                       */});
                    </script>
                    <div class="ui blue button" onclick="alert(doc.val());">Run</div>
                </div>
                <div class="ui segment" id="test">
                    <label class="ui right ribbon label">#render</label>
                    <h3 class="ui header">render</h3>
                    <pre><code data-language="javascript">mintpl.render( tplId | heredoc | heredoc function, data );</code></pre>
                    <p class="ui header">You can:</p>
                    <pre><code data-language="javascript">
 var html = mintpl.render(function(){/*!
    <div class="ui success message">
        <h3 class="ui header"><%=name%></h3>
        <p>Author: <%=author%></p>
    </div>
*/},{name:'{{name}}',author:'{{author}}'});
var dom = document.createElement('div');
dom.className = 'test';
dom.innerHTML = html;
document.getElementById('test').appendChild(dom);
               
                    </code></pre>
                    <div class="ui blue button" onclick="test(this);">Run</div>
                    <script>
                    function test(t) {
                        var html = mintpl.render(function(){/*!
                            <div class="ui success message" style="margin:10px 0">
                                <h3 class="ui header"><%=name%></h3>
                                <p>Author: <%=author%></p>
                            </div>
                        */},{name:'{{name}}',author:'{{author}}'});
                        var dom = document.createElement('div');
                        dom.className = 'test';
                        dom.innerHTML = html;
                        document.getElementById('test').insertBefore(dom,t);
                    }
                    </script>

                    <p class="ui header">Or, just pass a template id:</p>
                    <pre><code data-language="html">
 &lt;script type="text/mintpl" id="testTpl" /&gt;
    <div class="ui success message">
        <h3 class="ui header"><%=name%></h3>
        <p>Author: <%=author%></p>
    </div>
&lt;/script&gt;
                    </code></pre>
                    <pre><code data-language="javascript">
var html = mintpl.render('testTpl', {name:'{{name}}',author:'{{author}}'});
var dom = document.createElement('div');
dom.className = 'test';
dom.innerHTML = html;
document.getElementById('test').appendChild(dom);
                    </code></pre>
                    <div class="ui blue button" onclick="test1(this);">Run</div>
 
                    <script id="testTpl" type="text/mintpl">
                    <div class="ui success message" style="margin:10px 0">
                        <h3 class="ui header"><%=name%></h3>
                        <p>Author: <%=author%></p>
                    </div>
                    </script>

                    <script>
                    function test1(t){
                        var html = mintpl.render('testTpl', {name:'{{name}}',author:'{{author}}'});
                        var dom = document.createElement('div');
                        dom.className = 'test';
                        dom.innerHTML = html;
                        document.getElementById('test').insertBefore(dom,t);
                    }
                    </script>
                </div>
                
            </div>
        </div>
    </div>

    <div class="ui vertical segment">
        <div class="ui page grid">
            <div class="column">
                <h1>Build</h1>
                <p>
                  To build `{{name}}` from sources you need to install Gulp
                </p>
                <pre><code data-language="shell">$ npm install gulp -g</code></pre>
                <p>
                  Then navigate in terminal to the downloaded sources and install some required modules
                </p>
                <pre><code data-language="shell">$ npm install gulp gulp-uglify gulp-swig gulp-rename</code></pre>
                <p>
                  Then run Gulp
                </p>
                <pre><code data-language="shell">$ gulp</code></pre>
                <p>
                  You can take compressed and optimized files from <b>dist</b> folder
                </p>
            </div>
        </div>
    </div>

    <div class="ui inverted black vertical segment">
        <div class="ui page grid">
            <div class="column">
                <p>
                  Created by <a href="http://faso.me">Levin Van</a>, 2015
                  <br />
                  <br />Site built with awesome <a href="http://semantic-ui.com">Semantic UI</a>
                </p>
            </div>
        </div>
    </div>

    <script async defer id="github-bjs" src="https://buttons.github.io/buttons.js"></script>
    <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5510fb2a3e0ad455" async="async"></script>

    <link href="https://cdn.rawgit.com/ccampbell/rainbow/master/themes/solarized-dark.css" rel="stylesheet" type="text/css" />
    <script src="js/rainbow-custom.min.js" type="text/javascript"></script>
    
    <script>
    var _hmt = _hmt || [];
    (function() {
      var hm = document.createElement("script");
      hm.src = "//hm.baidu.com/hm.js?{{baiduTJCode}}";
      var s = document.getElementsByTagName("script")[0]; 
      s.parentNode.insertBefore(hm, s);
    })();
    </script>

 </body>

</html>
