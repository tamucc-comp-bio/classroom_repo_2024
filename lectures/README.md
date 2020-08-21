# LECTURES

In this directory, you will find the lecture plans (`^lecture[0-9]+\.md`) for each class period.  These are meant to be viewed on the GitHub website, but may also be viewed on a markdown reader/editor like LaTex.  Any associated files, such as lecture slides are stored in the week-specific directories (`^Week[0-9]+_files`), but you will normally link to them through the `^lecture[0-9]+\.md` document for that week.

## Translation of the regular expression `lecture[0-9]+\.md` used above:

* the parentheses () are not part of the regular expression, they are part of the english sentence. A *_regular expression_* is like an equation, but for text rather than numbers and specifies a character pattern that can refer to many different character strings.

* `^` means "begins with"

* `lecture` means the letters that spell the word

* `[0-9]` means any number between 0 and 9

* `+` means any number of repeats of the previous character

* `\ ` is the "escape character" which give the next character an alternate meaning

* `\.` means a period.  A period without the escape character means any character, the wildcard.

* `md` means the letters md, and all lecture files end with md because they are written in markdown, which is a language for formatting text documents and is understood by GitHub, allowing one to make nicely formatting webpages, like this one.

## Markdown Language for Typesetting

You can view this document with your text editor ([`notepad++`](https://notepad-plus-plus.org/downloads/)} or [`BBedit`](https://www.barebones.com/products/textwrangler/download.html)) to see what markdown looks like. It is pretty simple and easy to pick up.
