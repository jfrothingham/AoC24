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

; CHALLENGE PART 1

; store the running distance sum
distances = 0

for i=0, (n_elements(col1)-1) do begin
	val1 = sorted1[i]
	val2 = sorted2[i]
	valdiff = (val1 - val2)

	if (val1 - val2) LT 0 then valdiff = (val2 - val1)

	distances = distances + valdiff

endfor

print, FORMAT='(F)', distances

; CHALLENGE PART 2

; store the running similarity score sum
similarity = 0
j = 0

; it will be most efficient to work with the sorted lists
for i=0, (n_elements(sorted1)-1) do begin
	active_element = sorted1[i]
	if (i+j) GT (n_elements(sorted2)-1) then break
	print, 'active element', active_element, 'compared to', sorted2[i+j]
	while (sorted2[i+j] eq active_element) do begin
		similarity = similarity + active_element
		if (i+j) LT (n_elements(sorted2)-1) then begin 
			j = j + 1
		endif else begin
			break
		endelse
	endwhile	
endfor

print, format='(f)', similarity


return
end
