if !exists("g:smartim_default")
    let g:smartim_default = "com.apple.keylayout.US"
endif

let s:imselect_path = expand('<sfile>:p:h') . "/im-select "

function! SmartIM_SelectDefault()
    if !exists("b:saved_im") || b:saved_im == g:smartim_default
        let b:saved_im = system(s:imselect_path)
    endif
    if v:shell_error
        unlet b:saved_im
    else
        let l:a = system(s:imselect_path . g:smartim_default)
    endif
endfunction

function! SmartIM_SelectSaved()
    if exists("b:saved_im")
        let l:a = system(s:imselect_path . b:saved_im)
    endif
endfunction

autocmd InsertLeave * call SmartIM_SelectDefault()
autocmd InsertEnter * call SmartIM_SelectSaved()
