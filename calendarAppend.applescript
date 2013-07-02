-- get three most recent files from the desktop and run append on them

tell application "Finder"
	sort (get files of desktop) by creation date
	-- This raises an error if the folder doesn't contain any files
	set theFile to (item 1 of result) as alias
end tell