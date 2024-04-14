.model small
.stack 100h
.data 
    
    input_password db 'Please enter Your Password: $'
    tryagain db "Try Again? (1/0): $"
    key_message db  'Press any key to continue... $'
    password db 'aa1234$'
    incorrect_password db 10,13, 'Incorrect Password$'
        
    welcome db 10,13,10,13, 'WELCOME TO AHIHI RESTAURANT$'
    choose_an_opt_msg db 10,13,10,13, 'Choose an option: $'
    msg2 db 10,13,10,13, 'What Do You Want To Buy$'
    buy_food_msg db 10,13, '1. Buy food$'
    food_sold_statistic_msg db 10,13, '2. See how much food sold today$'
    wrong_input db 10,13, 'Wrong Input$'
    exit_program db 10,13,'4. Exit$'
    
    newLine db 10,13, '$' 
    
    opt1 db 10,13, '1. Banh my xuc xich - 4$'
    opt2 db 10,13, '2. Banh my xa xiu - 3$'
    opt3 db 10,13, '3. Banh my pate - 2$'
    opt4 db 10,13, '4. Banh my trung - 2$'
    opt5 db 10,13, '5. Banh my ruoc thit heo - 1$'
    opt6 db 10,13, '6. Bun tron - 5$'
    opt7 db 10,13, '7. My tron - 4$'
    opt8 db 10,13, '8. Xoi xeo - 2$'
    opt9 db 10,13, '9. Nuoc loc - 8$'

    msg_bm_xuc_xich db 10,13, 'How many banh my xuc xich do you want to buy: $'
    msg_bm_xa_xiu db 10,13, 'How many Banh my xa xiu do you want to buy: $'
    msg_bm_pate db 10,13, 'How many Banh my pate do you want to buy: $'
    msg_bm_trung db 10,13, 'How many Banh my trung do you want to buy: $'
    msg_bm_ruoc_thit_heo db 10,13, 'How many Banh my ruoc thit heo do you want to buy: $'
    msg_bun_tron db 10,13, 'How many Bun tron do you want to buy: $'
    msg_my_tron db 10,13, 'How many My tron do you want to buy: $'
    msg_xoi_xeo db 10,13, 'How many Xoi xeo do you want to buy: $'
    msg_nuoc_loc db 10,13, 'How many Nuoc loc do you want to buy: $'
    total_msg db 10,13,'Total Earned: $'

    amount_earned db 10,13,'Amount earned: $'
    amount dw 0
    amount_print db 10,13,'3. Revenue for today$'
    
    no_bm_xuc_xich_sold dw 0
    no_bm_xa_xiu_sold dw 0
    no_bm_pate_sold dw 0
    no_bm_trung_sold dw 0
    no_bm_ruoc_thit_heo_sold dw 0
    no_bun_tron_sold dw 0
    no_my_tron_sold dw 0
    no_xoi_xeo_sold dw 0
    no_nuoc_loc_sold dw 0
    
    price_panadol dw 4
    price_paracetamol dw 3
    price_cleritek dw 2    
    price_aspirin dw 2
    price_brufen dw 1
    price_surbex dw 5    
    price_arinac dw 4
    price_sinopharm dw 2
    price_pfizer dw 8
    
    panadol_print db 10,13, 'Banh my xuc xich: $'
    pfizer_print db 10,13, 'Nuoc loc: $'
    sinopharm_print db 10,13, 'Xoi xeo: $'
    arinac_print db 10,13, 'My tron: $'
    surbex_print db 10,13, 'Bun tron: $'
    aspirin_print db 10,13, 'Banh my trung: $'
    brufen_print db 10,13, 'Banh my ruoc thit heo: $'
    cleritek_print db 10,13, 'Banh my pate: $'
    paracetamol_print db 10,13, 'Banh my xa xiu: $' 
    
    x dw ?
    y dw ?
    z dw ?

.code
main proc 
    mov ax,@data
    mov ds,ax
main endp

security proc
    
pass:    
    mov ah,9
    lea dx,input_password
    int 21h
    
    mov si,0 
    mov cx,6 
l1:
    mov ah,1
    int 21h
    cmp al,password[si]
    jne incorrect
    inc si
    loop l1
    call menu
incorrect:
    mov ah,9
    lea dx,incorrect_password
    int 21h
    
    mov ah,9
    lea dx,newLine
    int 21h
    
    mov ah,9
    lea dx,tryagain
    int 21h
    
    mov ah,1
    int 21h
    cmp al,'1'
    mov ah,9
    lea dx,newLine
    int 21h
    je pass
    
    jmp exit
            
security endp

menu proc
     
showmenu:
    mov ah,9
    lea dx,welcome
    int 21h 
    
    mov ah,9
    lea dx,newLine
    int 21h
    
    mov ah,9
    lea dx,buy_food_msg
    int 21h
    
    mov ah,9
    lea dx,food_sold_statistic_msg
    int 21h
    
    mov ah,9
    lea dx,amount_print
    int 21h
    
    mov ah,9
    lea dx,exit_program
    int 21h
    
    mov ah,9
    lea dx,choose_an_opt_msg
    int 21h 

    mov ah,1
    int 21h
    
    cmp al,'1'
    je buyMedicines 
    cmp al,'2'
    je foodSoldStat
    cmp al,'3'
    je showAmount
    cmp al,'4'
    je exit
    
    mov ah,9
    lea dx,newLine
    int 21h
    
    mov ah,9
    lea dx,wrong_input
    int 21h
    
    mov ah,9
    lea dx, choose_an_opt_msg
    int 21h
    jmp showmenu
    
menu endp

buyMedicines proc    
    lea dx,msg2
    mov ah,9
    int 21h
        
    lea dx,opt1
    mov ah,9
    int 21h
        
    lea dx,opt2
    mov ah,9
    int 21h
            
    lea dx,opt3
    mov ah,9
    int 21h
        
    lea dx,opt4
    mov ah,9
    int 21h
        
    lea dx,opt5
    mov ah,9
    int 21h
            
    lea dx,opt6
    mov ah,9         
    int 21h
        
    lea dx,opt7
    mov ah,9
    int 21h
        
    lea dx,opt8
    mov ah,9
    int 21h
            
    lea dx,opt9
    mov ah,9
    int 21h
    
    lea dx,choose_an_opt_msg
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    cmp al,'1'
    je panadol
    cmp al,'2'
    je paracetamol
    cmp al,'3'
    je cleritek
    cmp al,'4'
    je aspirin
    cmp al,'5'
    je brufen
    cmp al,'6'
    je surbex
    cmp al,'7'
    je arinac
    cmp al,'8'
    je sinopharm
    cmp al,'9'
    je pfizer
    
    mov ah,9
    lea dx,newLine
    int 21h
    
    mov ah,9
    lea dx,wrong_input
    int 21h
    
    mov ah,9
    lea dx, choose_an_opt_msg
    int 21h
    jmp showmenu
panadol:
    mov ah,9
    lea dx,msg_bm_xuc_xich
    int 21h
    call methodPanadol    
paracetamol:
    mov ah,9
    lea dx,msg_bm_xa_xiu
    int 21h
    call methodParacetamol
cleritek:
    mov ah,9
    lea dx,msg_bm_pate
    int 21h
    call methodParacetamol
aspirin:
    mov ah,9
    lea dx,msg_bm_trung
    int 21h
    call methodAspirin
brufen:
    mov ah,9
    lea dx,msg_bm_ruoc_thit_heo
    int 21h
    call methodBrufen
surbex:
    mov ah,9
    lea dx,msg_bun_tron
    int 21h
    call methodSurbex
arinac:
    mov ah,9
    lea dx,msg_my_tron
    int 21h
    call methodArinac
sinopharm:
    mov ah,9
    lea dx,msg_xoi_xeo
    int 21h
    call methodSinopharm
pfizer:
    mov ah,9
    lea dx,msg_nuoc_loc
    int 21h
    call methodPfizer
            
    
buyMedicines endp

methodPanadol proc
    mov x,0
    mov y,0
    mov bx,10
inputPanadol:
    mov ah,1
    int 21h
    cmp al,13
    je calculatePanadol
    sub al,30h
    xor ah,ah
    mov y,ax
    mov ax,x
    mul bx
    add ax,y
    mov x,ax
    jmp inputPanadol
        

calculatePanadol:     
    mov ax,x   
    mov z,ax     
     
    mov ah,9  
    lea dx,total_msg  
    int 21h
    mov ax,z  
    mul price_panadol  
    mov x,ax  
    add no_bm_xuc_xich_sold,ax
    add amount,ax
    call output
    jmp showmenu      
     
methodPanadol endp

methodParacetamol proc
    mov x,0
    mov y,0
    mov bx,10
inputParacetamol:
    mov ah,1
    int 21h
    cmp al,13
    je calculateParacetamol
    sub al,30h
    xor ah,ah
    mov y,ax
    mov ax,x
    mul bx
    add ax,y
    mov x,ax
    jmp inputParacetamol
        

calculateParacetamol:     
    mov ax,x   
    mov z,ax     
     
    mov ah,9  
    lea dx,total_msg  
    int 21h
    mov ax,z  
    mul price_paracetamol  
    mov x,ax  
    add no_bm_xa_xiu_sold,ax
    add amount,ax 
    call output
    jmp showmenu     
     
methodParacetamol endp

methodCleritek proc
    mov x,0
    mov y,0
    mov bx,10
inputCleritek:
    mov ah,1
    int 21h
    cmp al,13
    je calculateCleritek
    sub al,30h
    xor ah,ah
    mov y,ax
    mov ax,x
    mul bx
    add ax,y
    mov x,ax
    jmp inputCleritek
        

calculateCleritek:     
    mov ax,x   
    mov z,ax     
     
    mov ah,9  
    lea dx,total_msg  
    int 21h
    mov ax,z  
    mul price_cleritek  
    mov x,ax  
    add no_bm_pate_sold,ax
    add amount,ax
    call output
    jmp showmenu     
     
methodCleritek endp

methodAspirin proc
    mov x,0
    mov y,0
    mov bx,10
inputAspirin:
    mov ah,1
    int 21h
    cmp al,13
    je calculateAspirin
    sub al,30h
    xor ah,ah
    mov y,ax
    mov ax,x
    mul bx
    add ax,y
    mov x,ax
    jmp inputAspirin
        

calculateAspirin:     
    mov ax,x   
    mov z,ax     
     
    mov ah,9  
    lea dx,total_msg  
    int 21h
    mov ax,z  
    mul price_aspirin  
    mov x,ax  
    add no_bm_trung_sold,ax
    add amount,ax 
    call output
    jmp showmenu      
     
methodAspirin endp

methodBrufen proc
    mov x,0
    mov y,0
    mov bx,10
inputBrufen:
    mov ah,1
    int 21h
    cmp al,13
    je calculateBrufen
    sub al,30h
    xor ah,ah
    mov y,ax
    mov ax,x
    mul bx
    add ax,y
    mov x,ax
    jmp inputBrufen
        

calculateBrufen:     
    mov ax,x   
    mov z,ax     
     
    mov ah,9  
    lea dx,total_msg  
    int 21h
    mov ax,z  
    mul price_brufen  
    mov x,ax 
    add no_bm_ruoc_thit_heo_sold,ax
    add amount,ax  
    call output
    jmp showmenu      
     
methodBrufen endp

methodSurbex proc
    mov x,0
    mov y,0
    mov bx,10
inputSurbex:
    mov ah,1
    int 21h
    cmp al,13
    je calculateSurbex
    sub al,30h
    xor ah,ah
    mov y,ax
    mov ax,x
    mul bx
    add ax,y
    mov x,ax
    jmp inputSurbex
        

calculateSurbex:     
    mov ax,x   
    mov z,ax     
     
    mov ah,9  
    lea dx,total_msg  
    int 21h
    mov ax,z  
    mul price_surbex  
    mov x,ax  
    add no_bun_tron_sold,ax
    add amount,ax 
    call output
    jmp showmenu      
     
methodSurbex endp

methodArinac proc
    mov x,0
    mov y,0
    mov bx,10
inputArinac:
    mov ah,1
    int 21h
    cmp al,13
    je calculateArinac
    sub al,30h
    xor ah,ah
    mov y,ax
    mov ax,x
    mul bx
    add ax,y
    mov x,ax
    jmp inputArinac
        

calculateArinac:     
    mov ax,x   
    mov z,ax     
     
    mov ah,9  
    lea dx,total_msg  
    int 21h
    mov ax,z  
    mul price_arinac  
    mov x,ax  
    add no_my_tron_sold,ax
    add amount,ax
    call output
    jmp showmenu      
     
methodArinac endp

methodSinopharm proc
    mov x,0
    mov y,0
    mov bx,10
inputSinopharm:
    mov ah,1
    int 21h
    cmp al,13
    je calculateSinopharm
    sub al,30h
    xor ah,ah
    mov y,ax
    mov ax,x
    mul bx
    add ax,y
    mov x,ax
    jmp inputSinopharm

calculateSinopharm:     
    mov ax,x   
    mov z,ax     

    mov ah,9  
    lea dx,total_msg  
    int 21h
    mov ax,z  
    mul price_sinopharm  
    mov x,ax  
    add no_xoi_xeo_sold,ax 
    call output
    jmp showmenu      

methodSinopharm endp

methodPfizer proc
    mov x,0
    mov y,0
    mov bx,10
inputPfizer:
    mov ah,1
    int 21h
    cmp al,13
    je calculatePfizer
    sub al,30h
    xor ah,ah
    mov y,ax
    mov ax,x
    mul bx
    add ax,y
    mov x,ax
    jmp inputPfizer
        

calculatePfizer:     
    mov ax,x   
    mov z,ax

    mov ah,9  
    lea dx,total_msg
    int 21h
    mov ax,z  
    mul price_pfizer  
    mov x,ax  
    add no_nuoc_loc_sold,ax
    add amount,ax 
    call output
    jmp showmenu     
     
     
methodPfizer endp

foodSoldStat proc
    mov ah,9
    lea dx,panadol_print
    int 21h
    mov ax,no_bm_xuc_xich_sold 
    mov x,ax
    call output
    
    mov ah,9
    lea dx,paracetamol_print
    int 21h
    mov ax,no_bm_xa_xiu_sold
    mov x,ax
    call output
    
    mov ah,9
    lea dx,cleritek_print
    int 21h
    mov ax,no_bm_pate_sold
    mov x,ax
    call output
    
    mov ah,9
    lea dx,aspirin_print
    int 21h
    mov ax,no_bm_trung_sold
    mov x,ax
    call output
    
    mov ah,9
    lea dx,brufen_print
    int 21h
    mov ax,no_bm_ruoc_thit_heo_sold
    mov x,ax
    call output
    
    mov ah,9
    lea dx,surbex_print
    int 21h
    mov ax,no_bun_tron_sold
    mov x,ax
    call output
    
    mov ah,9
    lea dx,arinac_print
    int 21h
    mov ax,no_my_tron_sold
    mov x,ax
    call output
    
    mov ah,9
    lea dx,sinopharm_print
    int 21h
    mov ax,no_xoi_xeo_sold
    mov x,ax
    call output
    
    mov ah,9
    lea dx,pfizer_print
    int 21h
    mov ax,no_nuoc_loc_sold
    mov x,ax
    call output
    
    jmp showmenu
    

foodSoldStat endp

showAmount proc
    mov ax,amount
    mov x,ax    
    mov ah,9
    lea dx,amount_earned
    int 21h
    call output
    jmp showmenu    
showAmount endp

exit proc
    mov ah,4ch
    int 21h
exit endp

output proc
      mov bx,10
      mov ax,x
      mov cx,0
chia:
      mov dx,0
      div bx
      inc cx
      push dx 
      cmp al,0 
      je hienthi
      jmp chia 
hienthi:
      pop dx
      add dl,30h
      mov ah,2
      int 21h
      dec cx 
      cmp cx,0 
      jne hienthi 
      ret
output endp
END
