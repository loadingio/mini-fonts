# mini font

minimized version of Roboto and Rubik
 - Roboto ( 700 / 300 )
 - Rubik ( 300 )

subset via: https://everythingfonts.com/subsetter

minimized based on this script:

    require! <[fs fs-extra path yargs uglifycss @plotdb/opentype.js ttf2woff2 colors]>
    files = <[ f/Roboto-Bold-subset.ttf f/Roboto-Light-subset.ttf f/Rubik-Light-subset.ttf ]>
    du = files.map (f) ->
      b64 = ttf2woff2(fs.read-file-sync f).toString \base64
      datauri = "data:font/woff2;base64,#b64"

    css = """
    @font-face {
      font-family: 'Roboto';
      font-style: normal; font-weight: 700; font-display: swap;
      src: url('#{du.0}') format('woff2');
    }
    @font-face {
      font-family: 'Roboto';
      font-style: normal; font-weight: 300; font-display: swap;
      src: url('#{du.1}') format('woff2');
    }
    @font-face {
      font-family: 'Rubik';
      font-style: normal; font-weight: 300; font-display: swap;
      src: url('#{du.2}') format('woff2');
    }
    """
    css-min = uglifycss.process-string css
    fs.write-file-sync "f/mini-fonts.css", css
    fs.write-file-sync "f/mini-fonts.min.css", css-min

