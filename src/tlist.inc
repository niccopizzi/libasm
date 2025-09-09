%ifndef TLIST_INC
    %define TLIST_INC
    struc t_list
        .data: resq 1
        .next: resq 1
    endstruc
%endif