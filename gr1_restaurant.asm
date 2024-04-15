.model small
.stack 100h
.data 
    
    input_password db 'Please enter Your Password: $'
    tryagain db "Try Again? (1/0): $"
    key_message db  'Press any key to continue... $'
    password db '123456$'
    incorrect_password db 10,13, 'Incorrect Password$'
        
    welcome db 10,13,10,13, 'WELCOME TO AHIHI RESTAURANT$'
    choose_an_opt_msg db 10,13,10,13, 'Choose an option: $'
    msg2 db 10,13,10,13, 'What Do You Want To Buy$'
    buy_food_msg db 10,13, '1. Buy food$'
    food_sold_statistic_msg db 10,13, '2. See how much food sold today$'
    wrong_input db 10,13, 'Wrong Input$'
    exit_program db 10,13,'4. Exit$'
    
    newLine db 10,13, '$' 
    
    opt1 db 10,13, '1. Banh my xuc xich         Price: 4$'
    opt2 db 10,13, '2. Banh my xa xiu           Price: 3$'
    opt3 db 10,13, '3. Banh my pate             Price: 2$'
    opt4 db 10,13, '4. Banh my trung            Price: 2$'
    opt5 db 10,13, '5. Banh my ruoc thit heo    Price: 1$'
    opt6 db 10,13, '6. Bun tron                 Price: 5$'
    opt7 db 10,13, '7. My tron                  Price: 4$'
    opt8 db 10,13, '8. Xoi xeo                  Price: 2$'
    opt9 db 10,13, '9. Nuoc loc                 Price: 8$'

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
    
    bm_xuc_xich_price dw 4
    bm_xa_xiu_price dw 3
    bm_pate_price dw 2    
    bm_trung_price dw 2
    bm_ruoc_thit_heo_price dw 1
    bun_tron_price dw 5    
    my_tron_prices dw 4
    xoi_xeo_price dw 2
    nuoc_loc_price dw 8
    
    bm_xuc_xich_stat_print db 10,13, 'Banh my xuc xich: $'
    nuoc_loc_stat_print db 10,13, 'Nuoc loc: $'
    xoi_xeo_stat_print db 10,13, 'Xoi xeo: $'
    my_tron_stat_print db 10,13, 'My tron: $'
    bun_tron_stat_print db 10,13, 'Bun tron: $'
    bm_trung_stat_print db 10,13, 'Banh my trung: $'
    bm_ruoc_thit_heo_stat_print db 10,13, 'Banh my ruoc thit heo: $'
    bm_pate_stat_print db 10,13, 'Banh my pate: $'
    bm_xa_xiu_stat_print db 10,13, 'Banh my xa xiu: $' 
    
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
    mov cx,6    ; password length
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
    je buyFood 
    cmp al,'2'
    je foodSoldStat
    cmp al,'3'
    je showTotalRevenue
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

buyFood proc    
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
    je banh_my_xuc_xich
    cmp al,'2'
    je banh_my_xa_xiu
    cmp al,'3'
    je banh_my_pate
    cmp al,'4'
    je banh_my_trung
    cmp al,'5'
    je banh_my_ruoc_thit_heo
    cmp al,'6'
    je bun_tron 
    cmp al,'7'
    je my_tron
    cmp al,'8'
    je xoi_xeo
    cmp al,'9'
    je nuoc_loc
    
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
banh_my_xuc_xich:
    mov ah,9
    lea dx,msg_bm_xuc_xich
    int 21h
    call methodPanadol    
banh_my_xa_xiu:
    mov ah,9
    lea dx,msg_bm_xa_xiu
    int 21h
    call methodParacetamol
banh_my_pate:
    mov ah,9
    lea dx,msg_bm_pate
    int 21h
    call methodParacetamol
banh_my_trung:
    mov ah,9
    lea dx,msg_bm_trung
    int 21h
    call methodAspirin
banh_my_ruoc_thit_heo:
    mov ah,9
    lea dx,msg_bm_ruoc_thit_heo
    int 21h
    call methodBrufen
bun_tron:
    mov ah,9
    lea dx,msg_bun_tron
    int 21h
    call methodSurbex
my_tron:
    mov ah,9
    lea dx,msg_my_tron
    int 21h
    call methodArinac
xoi_xeo:
    mov ah,9
    lea dx,msg_xoi_xeo
    int 21h
    call methodSinopharm
nuoc_loc:
    mov ah,9
    lea dx,msg_nuoc_loc
    int 21h
    call methodPfizer
            
    
buyFood endp

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
    mul bm_xuc_xich_price  
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
    mul bm_xa_xiu_price  
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
    mul bm_pate_price  
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
    mul bm_trung_price  
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
    mul bm_ruoc_thit_heo_price  
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
    mul bun_tron_price  
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
    mul my_tron_prices  
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
    mul xoi_xeo_price  
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
    mul nuoc_loc_price  
    mov x,ax  
    add no_nuoc_loc_sold,ax
    add amount,ax 
    call output
    jmp showmenu     
     
     
methodPfizer endp

foodSoldStat proc
    mov ah,9
    lea dx,bm_xuc_xich_stat_print
    int 21h
    mov ax,no_bm_xuc_xich_sold 
    mov x,ax
    call output
    
    mov ah,9
    lea dx,bm_xa_xiu_stat_print
    int 21h
    mov ax,no_bm_xa_xiu_sold
    mov x,ax
    call output
    
    mov ah,9
    lea dx,bm_pate_stat_print
    int 21h
    mov ax,no_bm_pate_sold
    mov x,ax
    call output
    
    mov ah,9
    lea dx,bm_trung_stat_print
    int 21h
    mov ax,no_bm_trung_sold
    mov x,ax
    call output
    
    mov ah,9
    lea dx,bm_ruoc_thit_heo_stat_print
    int 21h
    mov ax,no_bm_ruoc_thit_heo_sold
    mov x,ax
    call output
    
    mov ah,9
    lea dx,bun_tron_stat_print
    int 21h
    mov ax,no_bun_tron_sold
    mov x,ax
    call output
    
    mov ah,9
    lea dx,my_tron_stat_print
    int 21h
    mov ax,no_my_tron_sold
    mov x,ax
    call output
    
    mov ah,9
    lea dx,xoi_xeo_stat_print
    int 21h
    mov ax,no_xoi_xeo_sold
    mov x,ax
    call output
    
    mov ah,9
    lea dx,nuoc_loc_stat_print
    int 21h
    mov ax,no_nuoc_loc_sold
    mov x,ax
    call output
    
    jmp showmenu
    

foodSoldStat endp

showTotalRevenue proc
    mov ax,amount
    mov x,ax    
    mov ah,9
    lea dx,amount_earned
    int 21h
    call output
    jmp showmenu    
showTotalRevenue endp

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
