# DBash

DBash is an attempt to make **pure bash** busybox-like toolkit.

## Implemented Tools

* `dcat` _(cat)_
* `dhead` _(head)_
* `dtail` _(tail)_
* `dwc` _(wc)_
* `dgrep` _(grep)_


## Usage and Installation

to use the toolkit, you can either:
* drop the scripts on `~/.dbash/`
* make envirement variable `$DBASH_DIR` containing the path.

Then execute `. dbash.sh` to source it.


## Some Notes

This is an educational project.

Although you might it extremely awesome (I know, I know...), it cannot be used for real day-by-day use cases.<br>
This is mainly caused by the fact that bash by definition does not handle null bytes, and therefore anything beyond plain text is poorly handled.


More on the issue [here](https://stackoverflow.com/a/19229243/1261527).
