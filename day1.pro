pro day1, infile
; script for day 1 of Advent of Code 2024. 
; intended to run in gbtidl
;
; INPUT:
;    infile - name of the file to read in, eg "input"

readcol, infile, col1, col2, /silent, /nan

; confirm that both columns were stored
print, n_elements(col1)
print, n_elements(col2)

; sort the columns
sorted1 = col1[sort(col1)]
sorted2 = col2[sort(col2)]

distances = 0

for i=0, (n_elements(col1)-1) do begin
	val1 = sorted1[i]
	val2 = sorted2[i]
	valdiff = (val1 - val2)

	if (val1 - val2) LT 0 then valdiff = (val2 - val1)

	distances = distances + valdiff

endfor

print, FORMAT='(F)', distances





return
end
