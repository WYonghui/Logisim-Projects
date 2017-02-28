#############################################################
#走马灯测试,测试addi,andi,sll,srl,sra,or,ori,nor,syscall  LED按走马灯方式来回显示数据
#############################################################

.text
#addi $s0,$zero,1 
#sll $s3, $s0, 31      # $s3=0x80000000
#sra $s3, $s3, 31      # $s3=0xFFFFFFFF   
#addu $s0,$zero,$zero   # $s0=0         
#addi $s2,$zero,12      #$s2=12

addiu $s6,$0,3  #走马灯计数
zmd_loop:

#addiu $s0, $s0, 1    #计算下一个走马灯的数据
#andi $s0, $s0, 15  

#######################################
#addi $t0,$0,8 
addi $t1,$0,1
left:

#sll $s3, $s3, 4   #走马灯左移
#or $s3, $s3, $s0

add $s3, $0, 255   #test subu
add    $a0,$0,$s3       # display $s3
addi   $v0,$0,34         # system call for LED display 
syscall                 # display 

add $s4, $0, 253
add    $a0,$0,$s4       # display $s3
addi   $v0,$0,34         # system call for LED display 
syscall                 # display 

subu $s3, $s3, $s4 
add    $a0,$0,$s3       # display $s3
addi   $v0,$0,34         # system call for LED display 
syscall                 # display 

add $s3, $0, 0x1234  #test lui
add    $a0,$0,$s3       # display $s3
addi   $v0,$0,34         # system call for LED display 
syscall                 # display 

lui $s3, 0x1234
add    $a0,$0,$s3       # display $s3
addi   $v0,$0,34         # system call for LED display 
syscall                 # display 

add $s3, $0, 0x12345678 #test lbu
add    $a0,$0,$s3       # display $s3
addi   $v0,$0,34         # system call for LED display 
syscall                 # display 

sw $s3, 0
lbu $s3, 0
add    $a0,$0,$s3       # display $s3
addi   $v0,$0,34         # system call for LED display 
syscall                 # display 

add $s3, $0, 0x10    #test BGEZ
add    $a0,$0,$s3       # display $s3
addi   $v0,$0,34         # system call for LED display 
syscall                 # display 

bgez $s3, above1
add    $a0,$0,0x666       # display $s3
addi   $v0,$0,34         # system call for LED display 
syscall                 # display 
j below1
above1:
add    $a0,$0,0x8888       # display $s3
addi   $v0,$0,34         # system call for LED display 
syscall                 # display 
below1:

add $s3, $0, -1    #test BGEZ
add    $a0,$0,$s3       # display $s3
addi   $v0,$0,34         # system call for LED display 
syscall                 # display 

bgez $s3, above
add    $a0,$0,0x666       # display $s3
addi   $v0,$0,34         # system call for LED display 
syscall                 # display 
j below
above:
add    $a0,$0,0x8888       # display $s3
addi   $v0,$0,34         # system call for LED display 
syscall                 # display 
below:

#sub $t0,$t0,$t1
#bne $t0,$0,left
#######################################

sub $s6,$s6,$t1
beq $s6,$0, exit
j zmd_loop

exit:

#add $t0,$0,$0
#nor $t0,$t0,$t0      #test nor  ori
#sll $t0,$t0,16
#ori $t0,$t0,0xffff

#addu   $a0,$0,$t0       # display $t0
#addi   $v0,$0,34         # system call for LED display 
#syscall                 # display 

addi   $v0,$zero,10         # system call for exit
syscall                  # we are out of here. 

