require! <[fs fs-extra path uglifycss ttf2woff2]>
files = <[fonts/Oxygen-Bold-subset.ttf fonts/Roboto-Bold-subset.ttf fonts/Roboto-Light-subset.ttf]>

root = path.join(__dirname, '..')

du = files.map (f) ->
  b64 = ttf2woff2(fs.read-file-sync path.join(root, f)).toString \base64
  datauri = "data:font/woff2;base64,#b64"

css = """
@font-face {
  font-family: 'Oxygen';
  font-style: normal; font-weight: 700; font-display: swap;
  src: url('#{du.0}') format('woff2');
}
@font-face {
  font-family: 'Roboto';
  font-style: normal; font-weight: 700; font-display: swap;
  src: url('#{du.1}') format('woff2');
}
@font-face {
  font-family: 'Roboto';
  font-style: normal; font-weight: 300; font-display: swap;
  src: url('#{du.2}') format('woff2');
}
"""
css-min = uglifycss.process-string css
fs.write-file-sync path.join(root, "dist/index.css"), css
fs.write-file-sync path.join(root, "dist/index.min.css"), css-min


