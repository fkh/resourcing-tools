-- get three most recent files from the desktop (generated with screenshots)

tell application "Finder"
	set fileList to (sort (get files of desktop) by creation date)
	-- This raises an error if the folder doesn't contain any files
	set image3 to (item 1 of fileList) as alias
	set image2 to (item 2 of fileList) as alias
	set image1 to (item 3 of fileList) as alias
end tell

set image1p to POSIX path of image1
set image2p to POSIX path of image2
set image3p to POSIX path of image3


-- prepare a timestamped file name

set ds to tid(tid(short date string of (current date), "/"), "-")
set outputFile to "/Users/fkh/resourcing/Resourcing-Calendar-" & ds & ".png"

-- run the append

set theScript to Â
	"convert -append '" & image1p & "' '" & Â
	image2p & "' '" & Â
	image3p & "' " & Â
	outputFile

tell application "Terminal"
	do script theScript
end tell

-- would be nice to move it to dropbox and copy the public link too...


-- thanks to https://discussions.apple.com/message/15658846#15658846
on tid(input, delim)
	set {oldTID, my text item delimiters} to {my text item delimiters, delim}
	if class of input is list then
		set output to input as text
	else
		set output to text items of input
	end if
	set my text item delimiters to oldTID
	return output
end tid

