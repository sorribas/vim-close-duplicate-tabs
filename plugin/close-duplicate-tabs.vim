function CloseDuplicateTabs() 
	let cnt = 0
	let i = 1

	let tpbufflst = []
	let dups = []
	let tabpgbufflst = tabpagebuflist(i)
	" This is a workaround for the impossibility of 
	" list and number comparison
	while [tabpagebuflist(i)] != [0]
		if index(tpbufflst, tabpagebuflist(i)) >= 0
			call add(dups,i)
		else
			call add(tpbufflst, tabpagebuflist(i))
		endif

		let i += 1
		let cnt += 1
	endwhile

	call reverse(dups)

	for tb in dups
		exec "tabclose ".tb
	endfor

endfunction

command CloseDupTabs :call CloseDuplicateTabs()
