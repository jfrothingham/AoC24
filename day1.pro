pro day1, infile
; script for day 1 of Advent of Code 2024. 
; intended to run in gbtidl
;
; INPUT:
;    infile - name of the file to read in, eg "input"

readcol, infile, col1, col2, /silent, /nan

; confirm that both columns were stored
print, n_elements(col1)	; 1000 elements
print, n_elements(col2)	; 1000 elements

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

print, FORMAT='(F)', distances	; answer: 1830467

; CHALLENGE PART 2

; store the running similarity score sum
similarity = 0

; it will be most efficient to work with the sorted lists
uniq1 = uniq(sorted1)
uniq2 = uniq(sorted2)

print, n_elements(uniq1) ; 1000 elements
print, n_elements(uniq2) ; 576 elements

; okay, so every single element in list 1 is unique

; for every element in list 1...
for i=0, (n_elements(sorted1)-1) do begin
	active_element = sorted1[i]
	;print, 'checking active element', active_element
	
	; count how many times it is present in list 2 and add accordingly
	inlist1 = where(sorted2 eq active_element, count)
	;print, (active_element * count)
	similarity = similarity + (active_element * count)
	;print, similarity
endfor

print, similarity ; incorrect answer: 2.66742e+07


return
end
