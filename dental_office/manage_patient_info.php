<style type="text/css">
* {
    box-sizing: border-box
}

article,
aside,
details,
figcaption,
figure,
footer,
header,
hgroup,
main,
nav,
section,
summary {
    display: block
}

audio,
canvas,
video {
    display: inline-block
}

audio:not([controls]) {
    display: none;
    height: 0
}

[hidden],
template {
    display: none
}

html {
    font-family: sans-serif;
    -ms-text-size-adjust: 100%;
    -webkit-text-size-adjust: 100%
}

body {
    margin: 0
}

a {
    background: 0 0
}

a:focus {
    outline: thin dotted
}

a:active,
a:hover {
    outline: 0
}

h1 {
    font-size: 2em;
    margin: .67em 0
}

abbr[title] {
    border-bottom: 1px dotted
}

b,
strong {
    font-weight: 700
}

dfn {
    font-style: italic
}

hr {
    -moz-box-sizing: content-box;
    box-sizing: content-box;
    height: 0
}

mark {
    background: #ff0;
    color: #000
}

code,
kbd,
pre,
samp {
    font-family: monospace, serif;
    font-size: 1em
}

pre {
    white-space: pre-wrap
}

q {
    quotes: "\201C""\201D""\2018""\2019"
}

small {
    font-size: 80%
}

sub,
sup {
    font-size: 75%;
    line-height: 0;
    position: relative;
    vertical-align: baseline
}

sup {
    top: -.5em
}

sub {
    bottom: -.25em
}

img {
    border: 0;
    vertical-align: middle
}

svg:not(:root) {
    overflow: hidden
}

figure {
    margin: 0
}

fieldset {
    border: 1px solid silver;
    margin: 0 2px;
    padding: .35em .625em .75em
}

legend {
    border: 0;
    padding: 0
}

button,
input,
select,
textarea {
    font-family: inherit;
    font-size: 100%;
    margin: 0
}

button,
input {
    line-height: normal
}

button,
select {
    text-transform: none
}

button,
html input[type=button],
input[type=reset],
input[type=submit] {
    -webkit-appearance: button;
    cursor: pointer
}

button[disabled],
html input[disabled] {
    cursor: default
}

input[type=checkbox],
input[type=radio] {
    box-sizing: border-box;
    padding: 0
}

input[type=search] {
    -webkit-appearance: textfield;
    -moz-box-sizing: content-box;
    -webkit-box-sizing: content-box;
    box-sizing: content-box
}

input[type=search]::-webkit-search-cancel-button,
input[type=search]::-webkit-search-decoration {
    -webkit-appearance: none
}

button::-moz-focus-inner,
input::-moz-focus-inner {
    border: 0;
    padding: 0
}

textarea {
    overflow: auto;
    vertical-align: top
}

table {
    border-collapse: collapse;
    border-spacing: 0
}

body {
    font-family: sans-serif;
    background: #dff1ff;
}

b {
    position: relative;
    display: block;
    font-family: helvetica neue, helvetica, sans-serif;
    line-height: 1.15em;
    margin-top: -1.15em;
    top: 2.3em;
    font-size: 0.87em;
    font-weight: 400;
    letter-spacing: 0.025em;
    opacity: 0.75;
    text-align: center;
}

b span {
    font-size: 0.785em;
    font-weight: 400;
    opacity: 0.4;
}

#container {
    width: 400px;
    margin: 120px auto 0;
}

.download {
    display: inline-block;
    text-decoration: none;
    border: 2px solid #D9EDFF;
    color: #339DFF;
    font-size: 13px;
    text-align: center;
    line-height: 38px;
    border-radius: 100px;
    padding: 0 22px;
    -webkit-transition: all 0.3s;
    transition: all 0.3s;
    background: #fff;
    width: 170px;
    margin-right: 40px;
}

.download:hover {
    box-shadow: 0 2px 4px rgba(83, 100, 255, 0.45);
}

.download2 {
    display: inline-block;
    margin-right: 10px;
    background: #342d71;
    color: #fff;
    text-decoration: none;
    font-size: 13px;
    line-height: 38px;
    border-radius: 50px;
    -webkit-transition: all 0.3s;
    transition: all 0.3s;
    width: 170px;
    text-align: center;
}

.download2:hover {
    background: #fff;
    color: #339DFF;
    box-shadow: 0 4px 4px rgba(83, 100, 255, 0.32);
}
</style>

<html>
<body style="background-color: rgba(71, 147, 227, 1)";>
<center><br><br><br><br><br>
    <h2>MANAGE PATIENT INFORMATION</h2>

    <a href='add_patient.php'>
        <h2>ADD PATIENT</h2>
    </a>
    <form action='search_patient.php' method='get'>
        <input type='text' name='searchtext' class="download">
        <input type='submit' value='SEARCH' class = "download2">
    </form>
    <center>
</body>
</html>