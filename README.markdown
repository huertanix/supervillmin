supervillmin
============
**NOTE: This is experimental, incomplete, and broken. Don't use this for srs bsns, but feel free to use it for evil.**

Supervillmin is a supervillain-friendly version of Douglas Crockford's JSMin, the JavaScript Minification Filter. During a bout of CryptoCat hacking at WSJ Transparency Weekend in New York in 2012, it was discovered that JSMin was technically not completely Free software, due to this clause:

> The Software shall be used for Good, not Evil.

This clause restricts the use of JSMin from the supervillain community, and we at the [Guild of Calamitous Intent] (http://www.venturefans.org/vbwiki/Guild_of_Calamitous_Intent) decided to build an alternative version that would be truly accessible to all. In Ruby.

Usage
-----
Simply run the `supervillmin` command and pass in the locations of the .js files you wish to combine and compress:

    ./supervillmin.rb uncompressed_script.js more_uncompressed_script.js even_more_uncompressed_script.js
This will create a combined/compressed file named `build.js` which you can then move and rename to your particular amusement.

License
-------
This script is distributed under the MIT license, a supervillain-friendly treatise.  Please see the included copy of the license for deets.
