# Recovering password protected Excel files using Emacs

## Introduction

A while ago I received an Excel file where many of the formulas and calculations
where locked and made invisible using [password protected sheets](https://support.microsoft.com/en-au/office/require-a-password-to-open-or-modify-a-workbook-10579f0e-b2d9-4c05-b9f8-4109a6bce643).
The password was lost, making it "impossible" to view the formulas making up the
Excel file; only the resulting values. With this password-protected
functionality it is still possible to open the file without password. Also; the
values in protected cells are still updated when modifying one of the
unprotected cells its formula references to. Therefore the formulas behind the
cells should also still be unencrypted by a password.

A quick search on the internet at the time (stackoverflow, superuser, etc.) did
not get me an answer for how I could recover the file. But with a bit of
poking-around in the .xlsx file by myself I was able to disable this protection.

This post describes how I was able to find and disable this protection. As an
example for this post, I've prepared [this sheet protected Excel file](locked_example.xlsx).
This excel file has a single formula in cell A1, but the sheet protection has
been set up such that you need to provide the correct password in order to
change, or even see the formula behind, the cell.

![Password protected Excel file, where only the value from cell A1 is visible, but not the underlying formula.](locked.png)

## Exploring Excel files

After not finding a simple answer for disabling this password protection I went
looking around in the .xlsx file myself. One of the things I remembered having
read somewhere in the past was that .xlsx files are actually just .zip archives.
Therefore, we can just rename the file extention of our .xlsx file to .zip,
excract the archive, and explore its contents.

For our example file this archive mostly consists of .xml files, describing
various parts and properties in the workbook, but for larger Excel files it
could also contain various images, videos, and other embedded files. Since this
simple example file practically only consists of .xml files it is likely that
the info we're looking for is in one of those files. Normally I would edit these
in Emacs, and with that program we already have a trick up our sleeve. Emacs has
a
[build-in mode](http://www.gnu.org/software/emacs/manual/html_node/emacs/File-Archives.html)
to edit text files within archives, without the need to unarchive the file
yourself. This can be used to edit text files in regular .zip or .tar archives,
but also in files like Java .jar and Excel .xlsx files which are actually
archives with a different file extention.

So; let's open our example .xlsx file in Emacs:

```
M Filemode      Length  Date         Time      File
- ----------  --------  -----------  --------  ---------------------------------------
  -rw-rw-rw-      1276   1-Jan-1980  00:00:00  [Content_Types].xml
  -rw-rw-rw-       588   1-Jan-1980  00:00:00  _rels/.rels
  -rw-rw-rw-      2212   1-Jan-1980  00:00:00  xl/workbook.xml
  -rw-rw-rw-       690   1-Jan-1980  00:00:00  xl/_rels/workbook.xml.rels
  -rw-rw-rw-      1480   1-Jan-1980  00:00:00  xl/worksheets/sheet1.xml
  -rw-rw-rw-      8390   1-Jan-1980  00:00:00  xl/theme/theme1.xml
  -rw-rw-rw-      2313   1-Jan-1980  00:00:00  xl/styles.xml
  -rw-rw-rw-       322   1-Jan-1980  00:00:00  xl/worksheets/_rels/sheet1.xml.rels
  -rw-rw-rw-      5420   1-Jan-1980  00:00:00  xl/printerSettings/printerSettings1.bin
  -rw-rw-rw-       169   1-Jan-1980  00:00:00  xl/calcChain.xml
  -rw-rw-rw-       625   1-Jan-1980  00:00:00  docProps/core.xml
  -rw-rw-rw-       785   1-Jan-1980  00:00:00  docProps/app.xml
- ----------  --------  -----------  --------  ---------------------------------------
                 24270                         12 files
```

When opening an .xlsx file in Emacs, it is automatically opened as an explorable
.zip file. Here we see the different .xml files representing different parts of
the Excel file. In this case the example file only has one worksheet, in
`xl/worksheets/sheet1.xml`. Lets open it to see the information stored for this
sheet:

```{.xml .numberLines}
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<worksheet xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" mc:Ignorable="x14ac xr xr2 xr3" xmlns:x14ac="http://schemas.microsoft.com/office/spreadsheetml/2009/9/ac" xmlns:xr="http://schemas.microsoft.com/office/spreadsheetml/2014/revision" xmlns:xr2="http://schemas.microsoft.com/office/spreadsheetml/2015/revision2" xmlns:xr3="http://schemas.microsoft.com/office/spreadsheetml/2016/revision3" xr:uid="{2838881A-D7EE-4880-9A40-583A7BEB231B}"><dimension ref="A1"/><sheetViews><sheetView tabSelected="1" workbookViewId="0"/></sheetViews><sheetFormatPr defaultRowHeight="15" x14ac:dyDescent="0.25"/><sheetData><row r="1" spans="1:1" x14ac:dyDescent="0.25"><c r="A1" s="1"><f>6*7</f><v>42</v></c></row></sheetData><sheetProtection algorithmName="SHA-512" hashValue="1vd8mFJrCEQ1cOfXy5dZkfZ3vsb5A+FmVy7S3xvY9MDhrCvfPKDgUJtrPL1XTEvoPLaZyeQL21LWeq8fSilt4g==" saltValue="v5HhQTb+4xMaHY6/lDVUeQ==" spinCount="100000" sheet="1" formatCells="0" formatColumns="0" formatRows="0" insertColumns="0" insertRows="0" insertHyperlinks="0" deleteColumns="0" deleteRows="0" sort="0" autoFilter="0" pivotTables="0"/><pageMargins left="0.7" right="0.7" top="0.75" bottom="0.75" header="0.3" footer="0.3"/><pageSetup paperSize="9" orientation="portrait" r:id="rId1"/></worksheet>
```

Let's first fix the formatting for readability:

```{.xml .numberLines}
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<worksheet
	xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main"
	xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"
	xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" mc:Ignorable="x14ac xr xr2 xr3"
	xmlns:x14ac="http://schemas.microsoft.com/office/spreadsheetml/2009/9/ac"
	xmlns:xr="http://schemas.microsoft.com/office/spreadsheetml/2014/revision"
	xmlns:xr2="http://schemas.microsoft.com/office/spreadsheetml/2015/revision2"
	xmlns:xr3="http://schemas.microsoft.com/office/spreadsheetml/2016/revision3" xr:uid="{2838881A-D7EE-4880-9A40-583A7BEB231B}">
	<dimension ref="A1"/>
	<sheetViews>
		<sheetView tabSelected="1" workbookViewId="0"/>
	</sheetViews>
	<sheetFormatPr defaultRowHeight="15" x14ac:dyDescent="0.25"/>
	<sheetData>
		<row r="1" spans="1:1" x14ac:dyDescent="0.25">
			<c r="A1" s="1">
				<f>6*7</f>
	 			<v>42</v>
			</c>
		</row>
	</sheetData>
	<sheetProtection algorithmName="SHA-512" hashValue="1vd8mFJrCEQ1cOfXy5dZkfZ3vsb5A+FmVy7S3xvY9MDhrCvfPKDgUJtrPL1XTEvoPLaZyeQL21LWeq8fSilt4g==" saltValue="v5HhQTb+4xMaHY6/lDVUeQ==" spinCount="100000" sheet="1" formatCells="0" formatColumns="0" formatRows="0" insertColumns="0" insertRows="0" insertHyperlinks="0" deleteColumns="0" deleteRows="0" sort="0" autoFilter="0" pivotTables="0"/>
	<pageMargins left="0.7" right="0.7" top="0.75" bottom="0.75" header="0.3" footer="0.3"/>
	<pageSetup paperSize="9" orientation="portrait" r:id="rId1"/>
</worksheet>
```

We can see that, as expected, all the information from cell A1 is still in the
worksheet:

```{.xml}
<c r="A1" s="1">
    <f>6*7</f>
    <v>42</v>
</c>
```

But more importantly, we can also find the following XML tag:

```{.xml}
<sheetProtection algorithmName="SHA-512" hashValue="1vd8mFJrCEQ1cOfXy5dZkfZ3vsb5A+FmVy7S3xvY9MDhrCvfPKDgUJtrPL1XTEvoPLaZyeQL21LWeq8fSilt4g==" saltValue="v5HhQTb+4xMaHY6/lDVUeQ==" spinCount="100000" sheet="1" formatCells="0" formatColumns="0" formatRows="0" insertColumns="0" insertRows="0" insertHyperlinks="0" deleteColumns="0" deleteRows="0" sort="0" autoFilter="0" pivotTables="0"/>
```

So, what if we remove the entire `SheetProtection` tag from the xml file?

![The excel sheet is unprotected, and we can see and modify the formula of cell A1.](unlocked.png)

## Automating the password removal process

We already found one of the advantages of using a text editor like Emacs. In
this case we where able to edit a text file within an archived file without
unzipping and re-zipping the file. Otherwise (in Windows), we would need to:

1. change the file format from .xlsx file to .zip
2. unzip the file
3. modify the .xml file
4. zip the entire directory
5. change the resulting archives file format from .zip file to .xlsx

And these last parts can already lead to issues. The standard zip archiving
settings from Windows differ from the default archiving settings from an .xlsx
file, and using these causes the resulting .xlsx file to be invalid.

One of the other major advantages with Emacs is that, practically everything the
user can do, can be automated in elisp. For example: we can call `C-h k <enter>`
in the .xlsx buffer in Emacs to find the function called when trying to open the
corresponding .xml file on that line:

```
RET (translated from <return>) runs the command archive-extract (found in archive-mode-map), which is an interactive
compiled Lisp function in ‘arc-mode.el’.

It is bound to RET, e..f, <mouse-2>, <menu-bar> <immediate> <find-file>.

(archive-extract &optional OTHER-WINDOW-P EVENT)

In archive mode, extract this entry of the archive into its own buffer.

[back]
```

Using this info we can write a script to perform exactly the same actions in
Emacs as would be done manually. But emacs-lisp is also a full-fledged
programming language, so we can extend the 'macro' with loops, if/else cases,
etc..

The result of this work is the following interactive emacs-lisp function:

```{.commonlisp .numberLines}
(defun excel-remove-sheet-protection ()
  "Remove sheet protection from an Excel xlsx file."
  (interactive)
  (find-file (read-file-name "Enter xlsx file path/name: "))  ;open excel file as zip-folder
  (beginning-of-buffer)
  (while (condition-case nil              ;try to do this for all sheets
             (search-forward-regexp "xl/worksheets/sheet.*?\.xml")
           (error nil))                    ;try to move cursor to next sheet.xml
    (let ((current_xml_point (point)))    ;store the current sheet
      ;; open the sheet and remove the "sheetprotection" xml tag
      (archive-extract)
      (beginning-of-buffer)
      (while (re-search-forward "<sheetprotection.*?>" nil t)
        (replace-match ""))
      (save-buffer)
      (kill-buffer)
      (goto-char current_xml_point))))     ;put cursor at last sheet
```

When calling this function (by `M-x excel-remove-sheet-protection`), Emacs first
asks the user for a path to the .xlsx file. Emacs will then open this file, and
for each sheet in the Excel file it will open the corresponding .xml file and
remove the sheetprotection tag.

The result after calling this function is that, after a few seconds of runtime,
all the password sheet protections are removed from the Excel file.
