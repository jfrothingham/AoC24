pro day1, infile
; script for day 1 of Advent of Code 2024. 
; intended to run in gbtidl
;
; INPUT:
;    infile - name of the file to read in, eg "input"

readcol, infile, col1, col2, /silent, /nan

print, n_elements(col1)
print, n_elements(col2)




return
end
